package common.primary;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;

import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.math.BigInteger;

/**
 * @author Administrator
 * @version 1.0
 * @date 2005-10-8
 * @class_displayName TablePrimary
 */

public class TablePrimary {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_fccgetPrimary
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="实体标识节点"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表的名称"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="对应表的标识字段名称"
	 */
	public static int BL_fccgetPrimary(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		String keyvalue = TablePrimary.getPrimary(db,param1,param2);
		XmlUtil.setNodeValue(param0,keyvalue);

		return 1;
	}
	
	public static String getPrimary(PersistenceBroker db,String tableName,String tableKey){
		String key = "";
		String temp = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String like = sdf.format(date);
		String sqlstr = "select * from " + tableName + " where " + tableKey + " like '%" + like + "%' order by " + tableKey + " desc";
		System.out.println("****************************** " + sqlstr + " ***************************");
		
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			
			if(rs.next()){
				temp = rs.getString(tableKey);
				BigInteger bint = new BigInteger(temp);
				key = (bint.add(BigInteger.ONE)).toString();
				
			}else{
				key = like + "001";
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