package talent.core;
import org.w3c.dom.*;
import org.apache.commons.logging.*;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.io.*;


import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-11-13
 * @class_displayName Webpriary
 */

public class Webpriary {
	public static Log fccLog = LogFactory.getLog(Webpriary.class);

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getWebPriary
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="实体的标识节点Entity/id "
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表的名称"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表的主键"
	 */
	public synchronized static int BL_getWebPriary(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		int max = 1;
		if(Webpriary.isData(con,param1,param2)) {
			max = Webpriary.getPriaryTemp(con,param1,param2);
		}
		XmlUtil.setNodeValue(param0,String.valueOf(max));
		if(con!=null) con.close();

		return 1;
		
	}
	
	public static boolean isData(Connection cn,String tableName,String marked) {
		boolean i = false;
		String sqlstr = "select " + marked + " from " + tableName;
		Statement st = null;
		ResultSet rs = null;
		fccLog.info("###########查询表的语句为：" + sqlstr);
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			if(rs.next()) i = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
			}catch(Exception ex) {
				
			}
		}
		
		return i;
	}
	
	public static int getPriaryTemp(Connection cn,String tableName,String marked) {
		int i = 0;
		String sqlstr = "select max(" + marked + ") as AA from " + tableName;
		fccLog.info("####################得到表主键的最大值sql语句是" + sqlstr);
		Statement st = null;
		ResultSet rs = null;
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			if(rs.next()) {
				i = rs.getInt("AA");
			}
			
		}catch(Exception e) {
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
			}catch(Exception ex) {
				
			}
		}
		
		return i+1;
		
	}

	/**
	 * 更新字节
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_updateByte
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="表名"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="标识字段名称"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="字节字段名称"
	 * @bizlet_param passing="in" type="variable" value="/" name="" desc="标识字段的值"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="字节文件路径"
	 */
	public static int BL_updateByte(Document doc, BizContext param) throws Exception{
		String param0 = (String)param.getParaObjectAt(0);//表名
		String param1 = (String)param.getParaObjectAt(1);//标识字段名称
		String param2 = (String)param.getParaObjectAt(2);//字节字段名称
		String param3 = (String)param.getParaObjectAt(3);//标识字段的值
		String param4 = (String)param.getParaObjectAt(4);//字节文件路径
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		byte[] file = getFileContent(param4);
		
		String sql = "update " + param0 + " set " + param2 + "=? where " + param1 + "=" + param3;
		fccLog.info("####################byte sql语句是" + sql);
		PreparedStatement pst = null;
		
		try{
			pst = con.prepareStatement(sql);
			pst.setBytes(1,file);
			pst.executeUpdate();
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pst!=null) pst.close();
			if(con!=null) con.close();
		
		}
		
		return 1;
	}
	
	public static byte[] getFileContent(String filePath) {
		File file = null;
		FileInputStream in = null;
		BufferedInputStream bin = null;
		ByteArrayOutputStream byteOut = null;
		byte[] b = null;
		try{
			file = new File(filePath);
			in = new FileInputStream(file);
			bin = new BufferedInputStream(in);
			byte[] r = new byte[2048];
			int i = 0;
			byteOut = new ByteArrayOutputStream();
			while((i = bin.read(r))!=-1) {
				byteOut.write(r,0,i);
			}
			b = byteOut.toByteArray();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(byteOut!=null) byteOut.close();
				if(bin!=null) bin.close();
				if(in!=null) in.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return b;
	
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getDeptPriary
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="实体/主键"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表名"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="主键字段名"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="条件"
	 */
	public synchronized static int BL_getDeptPriary(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		String param3 = (String)param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		int max = 1;
		if(Webpriary.isDataOther(con,param1,param2,param3)) {
			max = Webpriary.getPriaryTempOther(con,param1,param2,param3);
		}
		XmlUtil.setNodeValue(param0,String.valueOf(max));
		if(con!=null) con.close();

		return 1;
		
		
	}
	
	
	public static int getPriaryTempOther(Connection cn,String tableName,String marked,String condition) {
		int i = 0;
		String sqlstr = "select max(" + marked + ") as AA from " + tableName + " where " + condition;
		fccLog.info("####################得到表主键的最大值sql语句是" + sqlstr);
		Statement st = null;
		ResultSet rs = null;
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			if(rs.next()) {
				i = rs.getInt("AA");
			}
			
		}catch(Exception e) {
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
			}catch(Exception ex) {
				
			}
		}
		
		return i+1;
		
	}
	
	public static boolean isDataOther(Connection cn,String tableName,String marked,String condition) {
		boolean i = false;
		String sqlstr = "select " + marked + " from " + tableName + " where " + condition;
		Statement st = null;
		ResultSet rs = null;
		fccLog.info("###########查询表的语句为：" + sqlstr);
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			if(rs.next()) i = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
			}catch(Exception ex) {
				
			}
		}
		
		return i;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_excelToTable
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="表名"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="标识字段名"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="EXCEL文件路径"
	 */
	public static int BL_excelToTable(Document doc, BizContext param) throws Exception{
		String param0 = (String)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		//System.out.println("****filename =" +param2);
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		TalentToExcel.impExcelToTable(param2,param0,param1,con);
		
		return 1;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_comonExcelToTable
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="sql语名insert into table(f1,f2...) values(?,?...)"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="excel file path"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="表名"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="标识字段名"
	 */
	public static int BL_comonExcelToTable(Document doc, BizContext param) throws Exception{
		String param0 = (String)param.getParaObjectAt(0);//sql insert
		String param1 = (String)param.getParaObjectAt(1);//file path
		String param2 = (String)param.getParaObjectAt(2);//table
		String param3 = (String)param.getParaObjectAt(3);//key
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		TalentToExcel.impCommonExcelToTable(param1,param0,param2,param3,con);
		
		return 1;
	}
	/**
	 * 新增时获取主键最大值+1 （带事务操作）
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="实体的标识节点Entity/id "
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表的名称"
	 * @bizlet_param passing="in" type="constant" value="/" name="" desc="表的主键"
	 */
	public static int BL_getWebPriaryExt(Document doc, BizContext param) throws Exception{
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		int max = 1;
		if(Webpriary.isData(con,param1,param2)) {
			max = Webpriary.getPriaryTemp(con,param1,param2);
		}
		XmlUtil.setNodeValue(param0,String.valueOf(max));
		if(con.getAutoCommit()) //如果事务是自动提交，则关闭连接
			if(con!=null) 
				con.close();

		return 1;
		
	}
}