package common.assets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.*;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;
/**
 * @author tcrui
 * @version 1.0
 * @date 2006-7-26
 * @class_displayName CapitalInfo
 */

public class CapitalInfo {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>得到资产编码 资产编码 当前年月（4位）+资产类型（4位）+顺序数（4位）
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName getPrimaryKey_Cap
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="资产类型"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="要保存的字段"
	 */
	public static int getPrimaryKey_Cap(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		String captcode = null;
		
		//资产类型
		String captType = XmlUtil.getNodeValue(param0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(new Date());
		//年
		String year = date.substring(2,6);

		String sql = "select max(substring(captcode,9,12)) as captcode from CAPT_CAPITALINFO where captcode like '%" + year + captType + "%'";
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				captcode = rs.getString("captcode");
			}
			if (captcode == null)
				captcode = year + captType + "0001";
			else {
				NumberFormat nf = NumberFormat.getInstance();
				Number n = (Number) nf.parse(captcode);
				int i = n.intValue() + 1;
				DecimalFormat df = new DecimalFormat();
				df.applyPattern("0000");
				captcode = year + captType + df.format(i);
			}
			
			XmlUtil.setNodeValue(param1, captcode);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
			
		}finally{
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(con!=null) con.close();
		}

		return 1;
	}
	
	
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>得到类别编码 类别编码 顺序数（4位）
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName getPrimaryKey_Cap
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="要保存的字段"
	 */
	public static int getPrimaryKey_Type(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String typecode = "";
		
	
		String sql = "select max(typecode) as typecode from CAPT_type ";
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				typecode = rs.getString("typecode");
			}
			if (typecode == null ||"".equals(typecode))
				typecode =  "0001";
			else {
				NumberFormat nf = NumberFormat.getInstance();
				Number n = (Number) nf.parse(typecode);
				int i = n.intValue() + 1;
				DecimalFormat df = new DecimalFormat();
				df.applyPattern("0000");
				typecode = df.format(i);
			}
			
			XmlUtil.setNodeValue(param0, typecode);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
			
		}finally{
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(con!=null) con.close();
		}

		return 1;
	}


}