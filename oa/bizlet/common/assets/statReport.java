package common.assets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


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

public class statReport {
	private static Log grLog = LogFactory.getLog( statReport.class);
	
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
	public static int BL_getTJname(Document doc, BizContext param)
	throws Exception{
		Node list = (Node) param.getParaObjectAt(0);
		Node name = (Node) param.getParaObjectAt(1);
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String sql = "";
		if(name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select CAPTNAME,SEPCIFICATION,BRANDNAME,(select count(*) from CAPT_CAPITALINFO c where c.CAPTNAME like '%"+name.getFirstChild().getNodeValue()+"%' and c.SEPCIFICATION=t.SEPCIFICATION and c.BRANDNAME=t.BRANDNAME and state!='3')as c from CAPT_CAPITALINFO t";
		
		}else{ 
			sql = "select CAPTNAME,SEPCIFICATION,BRANDNAME,(select count(*) from CAPT_CAPITALINFO c where c.CAPTNAME=t.CAPTNAME and c.SEPCIFICATION=t.SEPCIFICATION and c.BRANDNAME=t.BRANDNAME and state!='3')as c from CAPT_CAPITALINFO t";
		
		}
		
		Statement st = null;
		ResultSet rs = null;
		
		try{
			st = con.createStatement();
			grLog.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@用车统计SQL：" + sql);
			
			rs = st.executeQuery(sql);			            
			
			while(rs.next()){

				String tempMC = rs.getString("CAPTNAME");
                String tempPP = rs.getString("BRANDNAME");
                String tempGG = rs.getString("SEPCIFICATION");
                String tempSL = rs.getString("C");
				
				Element tempEntity = doc.createElement("Entity");
				Element sl = doc.createElement("tempSL");
				Element gg = doc.createElement("tempGG");
				Element mc = doc.createElement("tempMC");
				Element pp = doc.createElement("tempPP");

				XmlUtil.setNodeValue(sl,String.valueOf(tempSL));				
				XmlUtil.setNodeValue(gg,String.valueOf(tempGG));
				XmlUtil.setNodeValue(mc,String.valueOf(tempMC));
				XmlUtil.setNodeValue(pp,String.valueOf(tempPP));

				tempEntity.appendChild(sl);
				tempEntity.appendChild(gg);
				tempEntity.appendChild(mc);
				tempEntity.appendChild(pp);
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