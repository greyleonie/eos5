package talent.tool;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.mail.internet.InternetAddress;

import org.w3c.dom.*;

import talent.core.TalentFunctions;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-8
 * @class_displayName WFInformManage
 */

public class WFInformManage {

	/**
	 * ���ݽ�ʦ��ID�ó���ʦ���ֻ���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getMobileTelsByIDs
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�����ʦ�ֻ���"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�����ʦID"
	 */
	public static int BL_getMobileTelsByIDs(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		if(param1!=null){
			String ids[] = param1.split(",");
			String str ="";
			int count = 0;
			for(int i = 0 ; i<ids.length; i++ ){
				if(ids[i]!=null && ids[i].length()>0){
					if(count == 0)
						str = str + ids[i];
					else
						str = str + "," +ids[i];
					count++;
				}
			}
			String sql = "select MobileTel from Teacher where TeacherID in ("+str+")";
			Connection conn =null;
			Statement st = null;
			ResultSet rs = null ;
			String MobileTels = "";
			try{
				conn = param.getDBBroker().getConnection();
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				int i = 0 ;
				while(rs.next()){
					String tel = rs.getString("MobileTel");
					if(tel!=null && tel.trim().length()==11){
						if(i==0)
							MobileTels += tel.trim();
						else
							MobileTels += "|" + tel.trim();
						i++;
					}
				}
			}
			catch (Exception e){
				e.printStackTrace();
			}
			finally {
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(conn!=null) conn.close();
			}
			if(!MobileTels.equals(""))
				XmlUtil.setNodeValue(param0,MobileTels);
				
		}
		return 1;
	}

	/**
	 * ���ݽ�ʦ��ID�����Email
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getEmailsByIDs
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�����Ϣ·��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����IDs"
	 */
	public static int BL_getEmailsByIDs(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		if(param1!=null){
			String value = "";
			String ids[] = param1.split(",");
			String emails[] = OutMail.getUserEmail(ids);
			for(int i=0 ; i<emails.length ; i++){
				if(i==0){
					value += emails[i];
				}
				else
					value += "|" +emails[i];
			}
			XmlUtil.setNodeValue(param0,value);
		}
		
		return 1;
	}
	/**
	 * �����ʼ�
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_setEmail
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="������ID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�����ʼ���ַ"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ʼ���Ŀ"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ʼ�����"
	 */
	public static int BL_setEmail(Document doc, BizContext param) throws Exception{
		String userID = (String)param.getParaObjectAt(0);
		String emails = (String)param.getParaObjectAt(1);
		String subject = (String)param.getParaObjectAt(2);
		String content = (String)param.getParaObjectAt(3);
		Connection conn =null;
		Statement st = null;
		ResultSet rs = null ;
		String sql = "select SMTPSERVER,SMTPNAME,SMTPPWD,SHOWADDRESS,SMTPAUTH from TOOL_MAILSERVER where USERACCOUNT = '"+userID+"'";
		try{
			conn = param.getDBBroker().getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				String SMTPSERVER = TalentFunctions.getAvailStr(rs.getString("SMTPSERVER"));
				String mailhost = SMTPSERVER.substring(0,SMTPSERVER.lastIndexOf(":"));//�ʼ�������
				int port = Integer.parseInt(SMTPSERVER.substring(SMTPSERVER.lastIndexOf(":")+1));//�ʼ��˿�
				String username = TalentFunctions.getAvailStr(rs.getString("SMTPNAME")); //�û���
				String pwd = TalentFunctions.getAvailStr(rs.getString("SMTPPWD")); //����
				String SHOWADDRESS = TalentFunctions.getAvailStr(rs.getString("SHOWADDRESS"));
				InternetAddress from = new InternetAddress(SHOWADDRESS); //���͵�ַ
				String smtpAuth = TalentFunctions.getAvailStr(rs.getString("SMTPAUTH")) ;//�ʼ���֤���
				String[] arrayTempTo = emails.split("\\|");
				InternetAddress to[] = new InternetAddress[arrayTempTo.length]; //������
				for(int m = 0;m<arrayTempTo.length;m++){
					System.out.println(arrayTempTo[m]);
					to[m] = new InternetAddress(arrayTempTo[m]);
				}
				OutMail.sendMail(mailhost,port,username,pwd,from,to,null,null,subject,content,null,"gb2312",smtpAuth);
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
		finally {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(conn!=null) conn.close();
		}
		return 1;
	}
}