package common.assets;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-2-7
 * @class_displayName scrapReport
 */

public class borrowReport {
	private static Log grLog = LogFactory.getLog(borrowReport.class);
	
	/**
	 * �õ��ʲ����ñ���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getCaptname
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list" name="" desc="�������ݼ���"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="�ʲ����� or ��������"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="��������"
	 */
	public static int BL_getBRname(Document doc, BizContext param)
	throws Exception{
		Node list = (Node) param.getParaObjectAt(0);
		Node name = (Node) param.getParaObjectAt(1);
		Node queryType = (Node) param.getParaObjectAt(2);
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String sql = "";
		if(queryType.getFirstChild().getNodeValue().equals("0") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select c.CAPTCODE,RETURNDATE,BORROWDATE,BORROWER,BORROWBRANCH,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_BORROW b,CAPT_BORROWDETAIL d,CAPT_CAPITALINFO c where d.ID = c.ID and d.BORROWID = b.BORROWID and c.CAPTNAME like '%"+name.getFirstChild().getNodeValue()+"%' order by b.BORROWDATE";
		
		}else if(queryType.getFirstChild().getNodeValue().equals("1") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select CAPT_CAPITALINFO.CAPTCODE,RETURNDATE,BORROWDATE,BORROWER,BORROWBRANCH,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_BORROW b,CAPT_BORROWDETAIL d,CAPT_CAPITALINFO where d.ID = CAPT_CAPITALINFO.ID and d.BORROWID = b.BORROWID and "+name.getFirstChild().getNodeValue()+" order by b.BORROWDATE";
			
		}else{ 
			sql = "select c.CAPTCODE,RETURNDATE,BORROWDATE,BORROWER,BORROWBRANCH,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_BORROW b,CAPT_BORROWDETAIL d,CAPT_CAPITALINFO c where d.ID = c.ID and d.BORROWID = b.BORROWID";
		
		}
		
		Statement st = null;
		ResultSet rs = null;
		
		try{
			st = con.createStatement();
			grLog.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@����ͳ��SQL��" + sql);
			
			rs = st.executeQuery(sql);			            
			
			while(rs.next()){
				String tempBH = rs.getString("CAPTCODE");
				String tempMC = rs.getString("CAPTNAME") == null ? "" : rs.getString("CAPTNAME");
                String tempSYBM = rs.getString("BORROWBRANCH") == null ? "" : rs.getString("BORROWBRANCH");
                Date borrowDate = rs.getDate("BORROWDATE");
                Date returnDate = rs.getDate("RETURNDATE");
                String tempPP = rs.getString("BRANDNAME") == null ? "" : rs.getString("BRANDNAME");
                String tempGG = rs.getString("SEPCIFICATION") == null ? "" : rs.getString("SEPCIFICATION");
                String tempSYR = rs.getString("BORROWER") == null ? "" : rs.getString("BORROWER");
				
				Element tempEntity = doc.createElement("Entity");
				Element sybm = doc.createElement("tempSYBM");
				Element bdate = doc.createElement("borrowDate");
				Element rdate = doc.createElement("returnDate");
				Element syr = doc.createElement("tempSYR");
				Element gg = doc.createElement("tempGG");
				Element mc = doc.createElement("tempMC");
				Element pp = doc.createElement("tempPP");
				Element bh = doc.createElement("tempBH");
				

				XmlUtil.setNodeValue(sybm,String.valueOf(tempSYBM));
				XmlUtil.setNodeValue(bdate,String.valueOf(borrowDate));
				XmlUtil.setNodeValue(rdate,String.valueOf(returnDate));
				XmlUtil.setNodeValue(syr,String.valueOf(tempSYR));
				XmlUtil.setNodeValue(gg,String.valueOf(tempGG));
				XmlUtil.setNodeValue(mc,String.valueOf(tempMC));
				XmlUtil.setNodeValue(pp,String.valueOf(tempPP));
				XmlUtil.setNodeValue(bh,String.valueOf(tempBH));

				tempEntity.appendChild(sybm);
				tempEntity.appendChild(bdate);
				tempEntity.appendChild(rdate);
				tempEntity.appendChild(syr);
				tempEntity.appendChild(gg);
				tempEntity.appendChild(mc);
				tempEntity.appendChild(pp);
				tempEntity.appendChild(bh);
				list.appendChild(tempEntity);
			}
           
			
		}
		
	catch(Exception e) {
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			
		}catch(Exception e) {
			
		}
	
    
 }
		return 1;
	}
}