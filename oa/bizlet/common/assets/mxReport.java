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

public class mxReport {
	private static Log grLog = LogFactory.getLog(mxReport.class);
	
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
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="资产名称 or 搜索条件"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="搜索类型"
	 */
	public static int BL_getMXname(Document doc, BizContext param)
	throws Exception{
		Node list = (Node) param.getParaObjectAt(0);
		Node name = (Node) param.getParaObjectAt(1);
		Node queryType = (Node) param.getParaObjectAt(2);
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String sql = "";
		if(queryType.getFirstChild().getNodeValue().equals("0") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select CAPTCAPTID,CAPTCODE,CAPTNAME,SPECIA,BRANDNAME,STATE from CAPT_CAPITALINFO where CAPTNAME like '%"+name.getFirstChild().getNodeValue()+"%'";
		
		}else if(queryType.getFirstChild().getNodeValue().equals("1") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select CAPTCAPTID,CAPTCODE,CAPTNAME,SPECIA,BRANDNAME,STATE from CAPT_CAPITALINFO where "+name.getFirstChild().getNodeValue();
			
		}else{ 
			sql = "select CAPTID,CAPTCODE,CAPTNAME,SPECIA,BRANDNAME,STATE from CAPT_CAPITALINFO";
		
		}
		
		Statement st = null;
		ResultSet rs = null;
		
		try{
			st = con.createStatement();
			grLog.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@资产明细统计SQL：" + sql);
			
			rs = st.executeQuery(sql);			            
			
			while(rs.next()){
				String tempID = rs.getString("CAPTID");
				String tempMC = rs.getString("CAPTNAME");
                String tempBH = rs.getString("CAPTCODE");
                String tempPP = rs.getString("BRANDNAME") == null ? "": rs.getString("BRANDNAME");
                String tempGG = rs.getString("SPECIA") == null ? "": rs.getString("SPECIA");
                String tempZT = rs.getString("STATE");
				
				Element tempEntity = doc.createElement("Entity");
				Element id = doc.createElement("tempID");
				Element bh = doc.createElement("tempBH");
				Element zt = doc.createElement("tempZT");
				Element gg = doc.createElement("tempGG");
				Element mc = doc.createElement("tempMC");
				Element pp = doc.createElement("tempPP");
				
				//借用
				String sqlTemp1 = "select * from CAPT_CAPITALINFO where CAPTID=" + rs.getString("CAPTID") + " and CAPTID in (select CAPTID from CAPT_BORROWDETAIL a,CAPT_BORROW b where a.BORROWID=b.BORROWID and (RETURNDATE is null or RETURNDATE='' or (getdate() between BORROWDATE and RETURNDATE)))";
				//维修
				String sqlTemp2 = "select * from CAPT_CAPITALINFO where CAPTID=" + rs.getString("CAPTID") + " and CAPTID in (select CAPTID from CAPT_MAINTAINDETAIL a,CAPT_MAINTAIN b where a.MAINTAINID=b.MAINTAINID and (RETURNDATE is null or RETURNDATE='' or (getdate() between MAINTAINDATE and RETURNDATE)))";
				
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(sqlTemp1);
				if (rs1.next()) {
					XmlUtil.setNodeValue(zt,String.valueOf(1));
				} else {
					Statement st2 = con.createStatement();
					ResultSet rs2 = st2.executeQuery(sqlTemp2);
					if (rs2.next()) {
						XmlUtil.setNodeValue(zt,String.valueOf(2));
					} else {
						XmlUtil.setNodeValue(zt,String.valueOf(tempZT));
					}
				}
				XmlUtil.setNodeValue(id,String.valueOf(tempID));
				XmlUtil.setNodeValue(bh,String.valueOf(tempBH));
				XmlUtil.setNodeValue(gg,String.valueOf(tempGG));
				XmlUtil.setNodeValue(mc,String.valueOf(tempMC));
				XmlUtil.setNodeValue(pp,String.valueOf(tempPP));
				
				tempEntity.appendChild(id);
				tempEntity.appendChild(bh);
				tempEntity.appendChild(zt);
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