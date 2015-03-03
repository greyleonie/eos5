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

public class scrapReport {
	private static Log grLog = LogFactory.getLog(scrapReport.class);
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
	public static int BL_getCaptname(Document doc, BizContext param)
	throws Exception{
		Node list = (Node) param.getParaObjectAt(0);
		Node name = (Node) param.getParaObjectAt(1);
		Node queryType = (Node) param.getParaObjectAt(2);
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String sql = "";
		if(queryType.getFirstChild().getNodeValue().equals("0") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select c.CAPTCODE,sqbm,bfdate,e.OPERATORNAME as bmjbr,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_WRITEOFFDETAIL w,CAPT_WRITEOFF r,CAPT_CAPITALINFO c,EOSOPERATOR e where w.ID=c.ID and w.WRITEOFFID=r.WRITEOFFID and r.BMJBR=e.USERID and c.STATE=3 and c.CAPTNAME like '%"+name.getFirstChild().getNodeValue()+"%' order by r.BFDATE";
		
		}else if(queryType.getFirstChild().getNodeValue().equals("1") && name.getFirstChild().getNodeValue().length() > 0){ 
			sql = "select CAPT_CAPITALINFO.CAPTCODE,sqbm,bfdate,e.OPERATORNAME as bmjbr,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_WRITEOFFDETAIL w,CAPT_WRITEOFF r,CAPT_CAPITALINFO,EOSOPERATOR e where w.ID=CAPT_CAPITALINFO.ID and w.WRITEOFFID=r.WRITEOFFID and r.BMJBR=e.USERID and CAPT_CAPITALINFO.STATE=3 and "+name.getFirstChild().getNodeValue()+" order by r.BFDATE";
			
		}else{ 
			sql = "select c.CAPTCODE,sqbm,bfdate,e.OPERATORNAME as bmjbr,BRANDNAME,CAPTNAME,SEPCIFICATION from CAPT_WRITEOFFDETAIL w,CAPT_WRITEOFF r,CAPT_CAPITALINFO c,EOSOPERATOR e where w.ID=c.ID and w.WRITEOFFID=r.WRITEOFFID and r.BMJBR=e.USERID and c.STATE=3";
		
		}
		
		Statement st = null;
		ResultSet rs = null;
		
		try{
			st = con.createStatement();
			grLog.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@报废统计SQL：" + sql);
			
			rs = st.executeQuery(sql);			            
			
			while(rs.next()){
				String tempBH = rs.getString("CAPTCODE");
				String tempMC = rs.getString("CAPTNAME") == null ? "" : rs.getString("CAPTNAME");
                String tempBM = rs.getString("sqbm") == null ? "" : rs.getString("sqbm");
                Date tempDate = rs.getDate("bfdate");
                String tempPP = rs.getString("BRANDNAME") == null ? "" : rs.getString("BRANDNAME");
                String tempGG = rs.getString("SEPCIFICATION") == null ? "" : rs.getString("SEPCIFICATION");
                String tempJBR = rs.getString("bmjbr") == null ? "" : rs.getString("bmjbr");
				
				Element tempEntity = doc.createElement("Entity");
				Element bm = doc.createElement("tempBM");
				Element date = doc.createElement("tempDate");
				Element jbr = doc.createElement("tempJBR");
				Element gg = doc.createElement("tempGG");
				Element mc = doc.createElement("tempMC");
				Element pp = doc.createElement("tempPP");
				Element bh = doc.createElement("tempBH");
				

				XmlUtil.setNodeValue(bm,String.valueOf(tempBM));
				XmlUtil.setNodeValue(date,String.valueOf(tempDate));
				XmlUtil.setNodeValue(jbr,String.valueOf(tempJBR));
				XmlUtil.setNodeValue(gg,String.valueOf(tempGG));
				XmlUtil.setNodeValue(mc,String.valueOf(tempMC));
				XmlUtil.setNodeValue(pp,String.valueOf(tempPP));
				XmlUtil.setNodeValue(bh,String.valueOf(tempBH));

				tempEntity.appendChild(bm);
				tempEntity.appendChild(date);
				tempEntity.appendChild(jbr);
				tempEntity.appendChild(gg);
				tempEntity.appendChild(mc);
				tempEntity.appendChild(pp);
				list.appendChild(tempEntity);
				tempEntity.appendChild(bh);
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