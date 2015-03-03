package common.draw;
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
 * @date 2006-1-11
 * @class_displayName sumStamper
 */

public class bmDrawReport {
	private static Log grLog = LogFactory.getLog(drawReport.class);

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getDateStamper
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list" name="" desc="返回数据集合"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="开始日期"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="结束日期"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="规格"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="品名"
	 */
	public static int BL_getBMDate(Document doc, BizContext param)
		throws Exception{
		Node list = (Node) param.getParaObjectAt(0);
		Node fromDate = (Node) param.getParaObjectAt(1);
		Node toDate = (Node) param.getParaObjectAt(2);
		Node specia = (Node) param.getParaObjectAt(3);
		Node name = (Node) param.getParaObjectAt(4);
		
		int marked = 0;
	//	if(specia.getFirstChild()!=null&&!"".equalsIgnoreCase(specia.getFirstChild().getNodeValue())) {
	//		marked = 1;
	//	}
		
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String sql = "";
		if(marked==0){
	     sql = "select b1.BRANCH,c1.commname,c1.price,c1.typename,c1.unitname,sum(a1.quantity) from COMM_STOREOUTDETAIL a1,COMM_STOREOUT b1,"+
               "(select a2.*,b2.TYPENAME,c2.UNITNAME from COMM_COMMODITYINFO a2,COMM_TYPE b2,COMM_UNIT c2 where a2.TYPEID = b2.TYPEID and a2.UNITID = c2.UNITID) c1"+
               "where a1.STOREOUTID = b1.STOREOUTID and a1.COMMID = c1.COMMID and b1.bgsflag = 1 and (s.PURCHASEDATE between to_date('"+fromDate.getFirstChild().getNodeValue()+"','yyyy-mm-dd') and to_date('"+toDate.getFirstChild().getNodeValue()+"','yyyy-mm-dd')) "+
			   "group by b1.BRANCH,c1.commname,c1.price,c1.typename,c1.unitname;";
         }
	
		Statement st = null;
		ResultSet rs = null;
		
		
		try{
			st = con.createStatement();
			grLog.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@用品领用统计SQL：" + sql);
			
			rs = st.executeQuery(sql);	
			
			while(rs.next()){
				String tempBM = rs.getString("BRANCH");
				String tempLX = rs.getString("TYPENAME");
				String tempPM = rs.getString("COMMNAME");
				String tempGG = rs.getString("SPECIA");
				String tempSL = rs.getString("QUANTITY");
				String tempDW = rs.getString("UNITNAME");
				String tempDJ = rs.getString("PRICE");			
			//	String bDate = fromDate.getFirstChild().getNodeValue();
			//	String eDate = toDate.getFirstChild().getNodeValue();
				
				Element tempEntity = doc.createElement("Entity");
				Element bm = doc.createElement("tempBM");
				Element type = doc.createElement("tempLX");
				Element pm = doc.createElement("tempPM");
				Element gg = doc.createElement("tempGG");
				Element count = doc.createElement("tempSL");
				Element dw = doc.createElement("tempDW");
				Element dj = doc.createElement("tempDJ");
				Element bDate = doc.createElement("fromDate");
				Element eDate = doc.createElement("toDate");
				
				XmlUtil.setNodeValue(bm,String.valueOf(tempBM));
				XmlUtil.setNodeValue(type,String.valueOf(tempLX));
				XmlUtil.setNodeValue(pm,String.valueOf(tempPM));
				XmlUtil.setNodeValue(count,String.valueOf(tempSL));
				XmlUtil.setNodeValue(gg,String.valueOf(tempGG));
				XmlUtil.setNodeValue(dw,String.valueOf(tempDW));
				XmlUtil.setNodeValue(dj,String.valueOf(tempDJ));
				XmlUtil.setNodeValue(bDate,fromDate.getFirstChild().getNodeValue());
				XmlUtil.setNodeValue(eDate,toDate.getFirstChild().getNodeValue());
				
				tempEntity.appendChild(bm);
				tempEntity.appendChild(type);
				tempEntity.appendChild(pm);
				tempEntity.appendChild(count);
				tempEntity.appendChild(gg);
				tempEntity.appendChild(dw);
				tempEntity.appendChild(dj);
				tempEntity.appendChild(bDate);
				tempEntity.appendChild(eDate);
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