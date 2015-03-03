package common.primary;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-11-1
 * @class_displayName TableOtherPrimary
 */

public class TableOtherPrimary {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_othergetPrimary
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="实体标识节点"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表的名称"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="对应表的标识字段名称"
	 */
	public static int BL_othergetPrimary(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		String keyvalue = TableOtherPrimary.getOtherPrimary(db,param1,param2);
		XmlUtil.setNodeValue(param0,keyvalue);
		
		return 1;
	}
	
	public static String getOtherPrimary(PersistenceBroker db,String tableName,String tableKey){
		String key = "";
		int temp = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String like = sdf.format(date);
		String sqlstr = "select max(" + tableKey +  ")+1 as aa from " + tableName;
		System.out.println("****************************** " + sqlstr + " ***************************");
		
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			
			if(rs.next()){
				temp = rs.getInt("aa");
				
				
				key = String.valueOf(temp);
				
			}else{
				key =  "1";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return key;
	}
}