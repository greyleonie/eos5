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

public class repairReport {
	private static Log grLog = LogFactory.getLog(repairReport.class);
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getCaptname
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list" name="" desc="返回数据集合"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="资产名称"
	 */
	public static int BL_getZCname(Document doc, BizContext param)
	throws Exception{
		Node list = (Node) param.getParaObjectAt(0);
		Node name = (Node) param.getParaObjectAt(1);
		Node queryType = (Node) param.getParaObjectAt(2);
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String sql = "";
		if(queryType.getFirstChild().getNodeValue().equals("0") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select c.CAPTCODE,v.VINDNAME,MAINTAINDATE,MAINTAINER,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_MAINTAIN m,CAPT_MAINTAINDETAIL d,CAPT_CAPITALINFO c,CAPT_VINDICATOR v where d.ID = c.ID and d.MAINTAINID = m.MAINTAINID and m.VINDCODE = v.VINDCODE and c.CAPTNAME like '%"+name.getFirstChild().getNodeValue()+"%' order by m.MAINTAINDATE";
		
		}else if(queryType.getFirstChild().getNodeValue().equals("1") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select CAPT_CAPITALINFO.CAPTCODE,v.VINDNAME,MAINTAINDATE,MAINTAINER,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_MAINTAIN m,CAPT_MAINTAINDETAIL d,CAPT_CAPITALINFO,CAPT_VINDICATOR v where d.ID = CAPT_CAPITALINFO.ID and d.MAINTAINID = m.MAINTAINID and m.VINDCODE = v.VINDCODE and "+name.getFirstChild().getNodeValue()+" order by m.MAINTAINDATE";
			
		}else{ 
			sql = "select c.CAPTCODE,v.VINDNAME,MAINTAINDATE,MAINTAINER,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_MAINTAIN m,CAPT_MAINTAINDETAIL d,CAPT_CAPITALINFO c,CAPT_VINDICATOR v where d.ID = c.ID and d.MAINTAINID = m.MAINTAINID and m.VINDCODE = v.VINDCODE";
		
		}
		
		Statement st = null;
		ResultSet rs = null;
		
		try{
			st = con.createStatement();
			grLog.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@维修统计SQL：" + sql);
			
			rs = st.executeQuery(sql);			            
			
			while(rs.next()){
				String tempBH = rs.getString("CAPTCODE");
				String tempMC = rs.getString("CAPTNAME") == null ? "" : rs.getString("CAPTNAME");
                String tempDW = rs.getString("VINDNAME") == null ? "" : rs.getString("VINDNAME");
                Date tempDate = rs.getDate("MAINTAINDATE") ;
                String tempPP = rs.getString("BRANDNAME") == null ? "" : rs.getString("BRANDNAME");
                String tempGG = rs.getString("SEPCIFICATION") == null ? "" : rs.getString("SEPCIFICATION");
                String tempWXR = rs.getString("MAINTAINER") == null ? "" : rs.getString("MAINTAINER");
				
				Element tempEntity = doc.createElement("Entity");
				Element dw = doc.createElement("tempDW");
				Element date = doc.createElement("tempDate");
				Element wxr = doc.createElement("tempWXR");
				Element gg = doc.createElement("tempGG");
				Element mc = doc.createElement("tempMC");
				Element pp = doc.createElement("tempPP");
				Element bh = doc.createElement("tempBH");
				

				XmlUtil.setNodeValue(dw,String.valueOf(tempDW));
				XmlUtil.setNodeValue(date,String.valueOf(tempDate));
				XmlUtil.setNodeValue(wxr,String.valueOf(tempWXR));
				XmlUtil.setNodeValue(gg,String.valueOf(tempGG));
				XmlUtil.setNodeValue(mc,String.valueOf(tempMC));
				XmlUtil.setNodeValue(pp,String.valueOf(tempPP));
				XmlUtil.setNodeValue(bh,String.valueOf(tempBH));

				tempEntity.appendChild(dw);
				tempEntity.appendChild(date);
				tempEntity.appendChild(wxr);
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