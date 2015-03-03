package talent.core;
import org.w3c.dom.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.crypto.EOSDigestTool;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.common.crypto.EOSCipherTool;
import com.primeton.tp.core.api.PersistenceBroker;

/**
 * @author Administrator
 * @version 1.0
 * @date 2006-2-8
 * @class_displayName TalentDigest
 */

public class TalentDigest {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName Bl_digest
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="����"
	 */
	public static int Bl_digest(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String temp = param0.getFirstChild().getNodeValue();
		EOSCipherTool eosclipher = new EOSCipherTool();
		temp = eosclipher.encrypt(temp);//����ҳ��
		//EOSDigestTool eosTool = new EOSDigestTool();
		//String result = eosTool.digest(temp);//�ټ���
		XmlUtil.setNodeValue(param0,temp);
		

		return 1;
	}
	
	public static int Bl_digestFromPage(Document doc, BizContext param)
	throws Exception {
	Node param0 = (Node) param.getParaObjectAt(0);
	String temp = param0.getFirstChild().getNodeValue();
	//EOSCipherTool eosclipher = new EOSCipherTool();
	//temp = eosclipher.encrypt(temp);//����ҳ��
	EOSDigestTool eosTool = new EOSDigestTool();
	String result = eosTool.digest(temp);//�ټ���

	XmlUtil.setNodeValue(param0,result);
	

	return 1;
}
	
	public static int Bl_digestExt(Document doc, BizContext param)
	throws Exception {
	Node param0 = (Node) param.getParaObjectAt(0);
	String temp = param0.getFirstChild().getNodeValue();
	//System.out.println(temp);
	EOSCipherTool eosclipher = new EOSCipherTool();
	temp = eosclipher.encrypt(temp);//����ҳ��
	//System.out.println(temp);
	EOSDigestTool eosTool = new EOSDigestTool();
	String result = eosTool.digest(temp);//�ټ���
	XmlUtil.setNodeValue(param0,result);
	//System.out.println(result);

	return 1;
}
	
	public static String encrypt(String srcPwd) {
		String result = "";
		try{
			EOSCipherTool eosclipher = new EOSCipherTool();
			String temp = eosclipher.encrypt(srcPwd);
			EOSDigestTool eosTool = new EOSDigestTool();
			result = eosTool.digest(temp);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	
	}
	

	/**
	 * �������ݿ������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_dataExchange
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="Դ����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="Ŀ�ı���"
	 */
	public static int BL_dataExchange(Document doc, BizContext param) throws Exception{
		String param0 = (String)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		
		String srcTable = param0;
		String eosTable = param1;
		//student
		//String selSql = "select u.UserID,u.UserTypeID,u.CardID,u.UserAccount,u.Password,u.UserName,u.Enable from users u inner join student s on u.userid=s.studentid";
		//teacher
		String selSql = "select u.UserID,u.UserTypeID,u.CardID,u.UserAccount,u.Password,u.UserName,u.Enable from users u inner join teacher t on u.userid=t.teacherid";
		Connection con = null;
		Statement st = null;
		Statement sts = null;
		ResultSet rs = null;
		List srcList = new ArrayList();
		
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(selSql);
			while(rs.next()) {
				long userId = rs.getLong("UserID");
				int userType = rs.getInt("UserTypeID");
				String cardId = rs.getString("CardID");
				String userAccount = rs.getString("UserAccount");
				String pwd = rs.getString("Password");
				pwd = encrypt(pwd);
				String userName = rs.getString("UserName");
				
				int state = (rs.getBoolean("Enable")==true?1:0);
				
				OutUser user = new OutUser(userId,userType,cardId,userAccount,pwd,userName,state);
				srcList.add(user);
			
			}
			
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			//---------------------------------------------
			
			con.setAutoCommit(false);
			sts = con.createStatement();
			
			for(int i = 0; i < srcList.size(); i++) {
				OutUser temp = (OutUser) srcList.get(i);
				String insertSql = "insert into " + eosTable + "(isLocal,operatorID,operatorName,password,status,userID,userTypeID,cardID,operatorType) values";
				insertSql += "('y'," + temp.getUserId() + ",'" + temp.getUserName() + "','" + temp.getPwd() + "'," + temp.getState() + ",'" + temp.getUserAccount() + "'," + temp.getUserType() + ",'" + temp.getCardId() + "',1)";
				sts.addBatch(insertSql);
			}
			
			sts.executeBatch();
			con.commit();
			con.setAutoCommit(true);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(sts!=null) sts.close();
				if(con!=null) con.close();
				
			}catch(Exception ee) {
				ee.printStackTrace();
			}
		
		}
		
		return 1;
	}
	/**
	 * �ѵ�У��Ա�������ŷ��䵽EOSORG_T_EmpOrgRef����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_dxorgtoeosorg
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="��У��ʦ����"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="EOS���ű�"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="EOS��Ա���ű�"
	 */
	public static int BL_dxorgtoeosorg(Document doc, BizContext param) throws Exception{
		String param0 = (String)param.getParaObjectAt(0);//��У��ʦ���� Teacher
		String param1 = (String)param.getParaObjectAt(1);//EOS���ű� EOSORG_T_Organization
		String param2 = (String)param.getParaObjectAt(2);//EOS��Ա���ű� EOSORG_T_EmpOrgRef
		
		PersistenceBroker db = param.getDBBroker();
		
		return 1;
	}
}


