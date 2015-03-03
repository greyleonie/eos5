/*
 * 创建日期 2007-2-7
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;
import java.util.Properties;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Types;
import java.text.*;
import java.io.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sun.rsasign.m;

import talent.core.Webpriary;

import base.util.DBconnection;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class RealTimeTransferTimer extends TimerTask {
    private static final String morningStartCardTime = " 07:45:00"; //显示上午刷卡信息时间开始,上课提前一小时

    private static final String morningEndCardTime = " 09:45:00"; //显示上午刷卡信息时间结束,上课迟后一小时

    private static final String afternoonStartCardTime = " 13:30:00"; //显示下午刷卡信息时间开始,上课提前一小时

    private static final String afternoonEndCardTime = " 15:30:00"; //显示下午刷卡信息时间结束,上课迟后一小时

    private static final String eveningStartCardTime = " 18:00:00"; //显示晚上刷卡信息时间开始,上课提前一小时

    private static final String eveningEndCardTime = " 20:00:00"; //显示晚上刷卡信息时间结束,上课迟后一小时
    
	private Log fccLog = LogFactory.getLog(TalentAware.class);
	private Properties pro = null;
	private Connection webcon = null;
	private Connection intercon = null;
	private String driver = null;//外网数据库驱动
	private String url = null;//外网数据库连接
	private String username = null;//用户名
	private String password = null;//密码
	private String expire = null;//期限
	private String serverip = null;//本地IP

	public static RealTimeTransferTimer talentAware = null;
	public String[] tables;
	
	private RealTimeTransferTimer() {
		init();
	}
	
	protected void init() {
		try{
			pro = new Properties();
			InputStream in = this.getClass().getResourceAsStream("/properties/webSiteConfing.properties");
			pro.load(in);
			
			in.close();
			
			driver = pro.getProperty("driver");
			url = pro.getProperty("url");
			username = pro.getProperty("username");
			password = pro.getProperty("password");
			expire = pro.getProperty("expire");
			serverip = pro.getProperty("serverIP");
			
			if (pro.getProperty("RealTimeTransferTables").indexOf(";")>=0)
			    tables = pro.getProperty("RealTimeTransferTables").split(";");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public static RealTimeTransferTimer getInstance() {
		if (talentAware == null)
			talentAware = new RealTimeTransferTimer();
		return talentAware;
	}
	
	
	

	public void run() {
	    Date now = new Date();
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf1.format(now); //把当前时间变格式为：yyyy-MM-dd
	    
		try{
			fccLog.info("----------------------------------------开始执行内外网数据传输定时器------------------------------------");
	        Date ms = sdf2.parse(date + morningStartCardTime);
	        Date me = sdf2.parse(date + morningEndCardTime);
	        Date as = sdf2.parse(date + afternoonStartCardTime);
	        Date ae = sdf2.parse(date + afternoonEndCardTime);
	        Date es = sdf2.parse(date + eveningStartCardTime);
	        Date ee = sdf2.parse(date + eveningEndCardTime);

            //判断本机ip，限制只在服务器运行
			//if (InetAddress.getLocalHost().getHostAddress().indexOf(serverip)>=0) {
			    
				if ( ( now.after(ms) && now.before(me) ) 
				        || ( now.after(as) && now.before(ae) ) 
				        || ( now.after(es) && now.before(ee) ) ) {
					return;
				}
			  
				
			if (tables != null)
			for (int i=0;i<tables.length;i++) {
				 Class.forName(driver);
				 webcon = DriverManager.getConnection(url, username, password);
				 intercon = new DBconnection().getEOSConnection();
				 String[] temp = tables[i].split(",");
				 String[] keys = temp[1].split(":");
				 System.out.println(temp[0] + "," + temp[1] + "," + temp[2]);
				 exData(temp[0],temp[1],keys,temp[2]);
			}
			
			//}
			
			fccLog.info("----------------------------------------结束执行内外网数据传输定时器-------------------------------------");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void exData(String table,String Key, String[] Keys,String type) {
		Statement st = null;
		ResultSet rs = null;
		Statement tmpst = null;
		ResultSet tmprs = null;
		Statement exst = null;
		Statement webst = null;
		ResultSet webrs = null;
		String delstr = "";
		String upsql = "";
		String insql = "";
		String sql = "";
		String upStr = "";
		int isFail = 0;
		
		
		try{
			if (type.indexOf("out")>=0) {
            //内网传外网
			fccLog.info("----------------------------传输"+table+"表从内网到外网-----开始----------------------------");
			sql = "select * from " + table + " where isNews=1";
			st = intercon.createStatement();
			tmpst = intercon.createStatement();
			tmprs = tmpst.executeQuery("select top 1 * from " + table);
			rs = st.executeQuery(sql);
			//读取内网表记录
			webcon.setAutoCommit(false);
			while(rs.next()) {
			    Statement checkSt = intercon.createStatement();
				int id = rs.getInt(Keys[0]);
				sql = "select * from " + table + " where " + Keys[0] + "=" + id;
			    ResultSet checkRs = checkSt.executeQuery(sql);
			    if (checkRs.next()) {
				for (int x=1;x<Keys.length;x++)
				    sql += " and " + Keys[x] + "=" + checkRs.getInt(Keys[x]);
			    }
			    webst = webcon.createStatement();
				webrs = webst.executeQuery(sql);
				//读取该表机构
				ResultSetMetaData meta=tmprs.getMetaData();
				int cols = meta.getColumnCount();
				//构造执行SQL
				upsql = "update " + table + " set ";
				insql = "insert into " + table + " values(";
				for (int i=1;i<cols+1;i++) {
					insql += "?,";
					String colName = meta.getColumnName(i);
					if (Key.indexOf(colName.trim())<0 && !"isNews".equals(colName.trim())) {
						upsql += colName + "=?,";
	 				}
				}
				upsql += "isNews=0 where " + Keys[0] + "=" + id;
                //判断外网该记录是否存在
				if (webrs.next()) {//存在则UPDATE
					int j = 1;
					PreparedStatement pst = null;
					pst = webcon.prepareStatement(upsql);
					System.out.println(upsql);
					for (int i=1;i<cols+1;i++) {
						int colType = meta.getColumnType(i);
						String colName = meta.getColumnName(i);
						if (Key.indexOf(colName.trim())<0 && !"isNews".equals(colName.trim())) {
						switch (colType) {
						   case (-7)://BIT
							   	pst.setBoolean(j,rs.getBoolean(colName));
								j++;
							    continue;
						   case (-6)://TINYINT
							   	pst.setBytes(j,rs.getBytes(colName));
								j++;
							    continue;
						   case (-5)://BIGINT
							   	pst.setLong(j,rs.getLong(colName));
								j++;
							    continue;
						   case (-4)://LONGVARBINARY
							   	pst.setBytes(j,rs.getBytes(colName));
								j++;
							    continue;
						   case (-3)://VARBINARY
							   	pst.setBytes(j,rs.getBytes(colName));
								j++;
							    continue;
						   case (-2)://BINARY
							   	pst.setBytes(j,rs.getBytes(colName));
								j++;
							    continue;
						   case (-1)://LONGVARCHAR
							   	pst.setString(j,rs.getString(colName));
								j++;
							    continue;
						   case (0)://NULL
							   	pst.setNull(j,Types.NULL);
								j++;
							    continue;
						   case (1)://CHAR
							   	pst.setString(j,rs.getString(colName));
								j++;
						        continue;
						   case (2)://NUMERIC
							   	pst.setInt(j,rs.getInt(colName));
								j++;
							    continue;
						   case (3)://DECIMAL
							   	pst.setInt(j,rs.getInt(colName));
								j++;
							    continue;
						   case (4)://INTEGER
							   	pst.setInt(j,rs.getInt(colName));
								j++;
							    continue;
						   case (5)://SMALLINT
							   	pst.setInt(j,rs.getInt(colName));
								j++;
							    continue;
						   case (6)://FLOAT
							   	pst.setFloat(j,rs.getFloat(colName));
								j++;
							    continue;
						   case (7)://REAL
							   	pst.setFloat(j,rs.getFloat(colName));
								j++;
							    continue;
						   case (8)://DOUBLE
							   	pst.setDouble(j,rs.getDouble(colName));
								j++;
							    continue;
						   case (12)://VARCHAR
							   	pst.setString(j,rs.getString(colName));
								j++;
							    continue;
						   case (91)://DATE
							    pst.setDate(j,rs.getDate(colName));
								j++;
							    continue;
						   case (93)://TIMESTAMP
							    pst.setTimestamp(j,rs.getTimestamp(colName));
								j++;
							    continue;
						   case (2004)://BLOB
						        pst.setBytes(j,rs.getBytes(colName));
							    //pst.setBlob(j,rs.getBlob(colName));
								j++;
							    continue;
						   case (2005)://CLOB
							    pst.setClob(j,rs.getClob(colName));
								j++;
							    continue;
			            }
						}
					}
					int result = 0;
					try {
					   result = pst.executeUpdate();
					   //构造UPDATE ISNEWS 语句
					   if (result > 0) {
					       upStr += id + ",";
					   }
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						continue;
					}
				} else {//不存在则INSERT
					PreparedStatement pst = null;
					insql = insql.substring(0,insql.length()-1) + ")";
					System.out.println(insql + " For ID : " + id);
					pst = webcon.prepareStatement(insql);
					for (int i=1;i<cols+1;i++) {
						String colName = meta.getColumnName(i);
						if (Keys[0].equals(colName)) {
						    if ("inout".equals(type)) {
						        pst.setInt(i,Webpriary.getPriaryTemp(webcon,table,Keys[0]));
						    } else pst.setInt(i,id);
							continue;
						}
						if (!"isNews".equals(colName.trim())) {
							upsql += colName + "=";
						    int colType = meta.getColumnType(i);
						    switch (colType) {
							   case (-7)://BIT
								   	pst.setBoolean(i,rs.getBoolean(colName));
								    continue;
							   case (-6)://TINYINT
								   	pst.setBytes(i,rs.getBytes(colName));
								    continue;
							   case (-5)://BIGINT
								   	pst.setLong(i,rs.getLong(colName));
								    continue;
							   case (-4)://LONGVARBINARY
								   	pst.setBytes(i,rs.getBytes(colName));
								    continue;
							   case (-3)://VARBINARY
								   	pst.setBytes(i,rs.getBytes(colName));
								    continue;
							   case (-2)://BINARY
								   	pst.setBytes(i,rs.getBytes(colName));
								    continue;
							   case (-1)://LONGVARCHAR
									pst.setString(i,rs.getString(colName));
									continue;
							   case (0)://NULL
								   	pst.setNull(i,Types.NULL);
								    continue;
							   case (1)://CHAR
								   	pst.setString(i,rs.getString(colName));
							        continue;
							   case (2)://NUMERIC
								   	pst.setInt(i,rs.getInt(colName));
								    continue;
							   case (3)://DECIMAL
								   	pst.setInt(i,rs.getInt(colName));
								    continue;
							   case (4)://INTEGER
								   	pst.setInt(i,rs.getInt(colName));
								    continue;
							   case (5)://SMALLINT
								   	pst.setInt(i,rs.getInt(colName));
								    continue;
							   case (6)://FLOAT
								   	pst.setFloat(i,rs.getFloat(colName));
								    continue;
							   case (7)://REAL
								   	pst.setFloat(i,rs.getFloat(colName));
								    continue;
							   case (8)://DOUBLE
								   	pst.setDouble(i,rs.getDouble(colName));
								    continue;
							   case (12)://VARCHAR
								   	pst.setString(i,rs.getString(colName));
								    continue;
							   case (91)://DATE
								    pst.setDate(i,rs.getDate(colName));
								    continue;
							   case (93)://TIMESTAMP
								    pst.setTimestamp(i,rs.getTimestamp(colName));
								    continue;
							   case (2004)://BLOB
							        pst.setBytes(i,rs.getBytes(colName));
								    //pst.setBlob(i,rs.getBlob(colName));
								    continue;
							   case (2005)://CLOB
								    pst.setClob(i,rs.getClob(colName));
								    continue;
				            }
						} else {
							pst.setBoolean(i,false);
						}
					}
					int result = 0;
					try {
					   result = pst.executeUpdate();
					   if (result > 0) upStr += id + ",";
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						continue;
					}
				}
			}
		    try {
			   if (!"".equals(upStr)) {
			       intercon.setAutoCommit(false);
			       exst = intercon.createStatement();
			       sql = "update " + table + " set isNews=0 where " + Keys[0] + " in (" + upStr.substring(0, upStr.length()-1) + ")";
			       int result = exst.executeUpdate(sql);
			       if (result > 0) {
			           intercon.commit();
			           webcon.commit();
				       intercon.setAutoCommit(true);
			           webcon.setAutoCommit(true);
			       } else webcon.rollback();
			   }
		    } catch (Exception e) {
		        intercon.rollback();
		        webcon.rollback();
		        e.printStackTrace();
		    }
			fccLog.info("----------------------------传输"+table+"表从内网到外网-----结束----------------------------");
			}

			isFail = 0;
			upStr = "";
			if (type.indexOf("in")>=0) {
			//外网传内网
			fccLog.info("----------------------------传输"+table+"表从外网到内网-----开始----------------------------");
			upsql = "";
			insql = "";
			sql = "select * from " + table + " where isNews=1";
			webst = webcon.createStatement();
			webrs = webst.executeQuery(sql);
			tmpst = webcon.createStatement();
			tmprs = tmpst.executeQuery("select top 1 * from " + table);
            //读取外网表记录
			intercon.setAutoCommit(false);
			while(webrs.next()) {
			    Statement checkSt = webcon.createStatement();
				int id = webrs.getInt(Keys[0]);
				sql = "select * from " + table + " where " + Keys[0] + "=" + id;
			    ResultSet checkRs = checkSt.executeQuery(sql);
			    if (checkRs.next()) {
				for (int x=1;x<Keys.length;x++)
				    sql += " and " + Keys[x] + "=" + checkRs.getInt(Keys[x]);
			    }
				st = intercon.createStatement();
			    rs = st.executeQuery(sql);
				ResultSetMetaData meta=tmprs.getMetaData();
				int cols = meta.getColumnCount();
				upsql = "update " + table + " set ";
				insql = "insert into " + table + " values(";
				for (int i=1;i<cols+1;i++) {
					insql += "?,";
					String colName = meta.getColumnName(i);
					if (Key.indexOf(colName.trim())<0 && !"isNews".equals(colName.trim())) {
						upsql += colName + "=?,";
	 				}
				}
				upsql += "isNews=0 where " + Keys[0] + "=" + id;
                //判断内网该记录是否存在
				if (rs.next()) {//存在则UPDATE
					int j = 1;
					PreparedStatement pst = null;
					pst = intercon.prepareStatement(upsql);
					System.out.println(upsql);
					for (int i=1;i<cols+1;i++) {
						int colType = meta.getColumnType(i);
						String colName = meta.getColumnName(i);
						if (Key.indexOf(colName.trim())<0 && !"isNews".equals(colName.trim())) {
						switch (colType) {
						   case (-7)://BIT
							   	pst.setBoolean(j,webrs.getBoolean(colName));
								j++;
							    continue;
						   case (-6)://TINYINT
							   	pst.setBytes(j,webrs.getBytes(colName));
								j++;
							    continue;
						   case (-5)://BIGINT
							   	pst.setLong(j,webrs.getLong(colName));
								j++;
							    continue;
						   case (-4)://LONGVARBINARY
							   	pst.setBytes(j,webrs.getBytes(colName));
								j++;
							    continue;
						   case (-3)://VARBINARY
							   	pst.setBytes(j,webrs.getBytes(colName));
								j++;
							    continue;
						   case (-2)://BINARY
							   	pst.setBytes(j,webrs.getBytes(colName));
								j++;
							    continue;
						   case (-1)://LONGVARCHAR
								pst.setString(j,webrs.getString(colName));
								j++;
								continue;
						   case (0)://NULL
							   	pst.setNull(j,Types.NULL);
								j++;
							    continue;
						   case (1)://CHAR
							   	pst.setString(j,webrs.getString(colName));
								j++;
						        continue;
						   case (2)://NUMERIC
							   	pst.setInt(j,webrs.getInt(colName));
								j++;
							    continue;
						   case (3)://DECIMAL
							   	pst.setInt(j,webrs.getInt(colName));
								j++;
							    continue;
						   case (4)://INTEGER
							   	pst.setInt(j,webrs.getInt(colName));
								j++;
							    continue;
						   case (5)://SMALLINT
							   	pst.setInt(j,webrs.getInt(colName));
								j++;
							    continue;
						   case (6)://FLOAT
							   	pst.setFloat(j,webrs.getFloat(colName));
								j++;
							    continue;
						   case (7)://REAL
							   	pst.setFloat(j,webrs.getFloat(colName));
								j++;
							    continue;
						   case (8)://DOUBLE
							   	pst.setDouble(j,webrs.getDouble(colName));
								j++;
							    continue;
						   case (12)://VARCHAR
							   	pst.setString(j,webrs.getString(colName));
								j++;
							    continue;
						   case (91)://DATE
							    pst.setDate(j,webrs.getDate(colName));
								j++;
							    continue;
						   case (93)://TIMESTAMP
							    pst.setTimestamp(j,webrs.getTimestamp(colName));
								j++;
							    continue;
						   case (2004)://BLOB
						        pst.setBytes(j,webrs.getBytes(colName));
							    //pst.setBlob(j,webrs.getBlob(colName));
								j++;
							    continue;
						   case (2005)://CLOB
							    pst.setClob(j,webrs.getClob(colName));
								j++;
							    continue;
			            }
						}
					}
					int result = 0;
					try {
					   result = pst.executeUpdate();
					   if (result > 0) upStr += id + ",";
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						continue;
					}
				} else {//不存在则INSERT
					PreparedStatement pst = null;
					insql = insql.substring(0,insql.length()-1) + ")";
					System.out.println(insql + " For ID : " + id);
					pst = intercon.prepareStatement(insql);
					for (int i=1;i<cols+1;i++) {
						String colName = meta.getColumnName(i);
						if (Keys[0].equals(colName)) {
						    if ("inout".equals(type)) {
						        pst.setInt(i,Webpriary.getPriaryTemp(intercon,table,Keys[0]));
						    } else pst.setInt(i,id);
							continue;
						}
						if (!"isNews".equals(colName.trim())) {
							upsql += colName + "=";
						    int colType = meta.getColumnType(i);
						    switch (colType) {
							   case (-7)://BIT
								   	pst.setBoolean(i,webrs.getBoolean(colName));
								    continue;
							   case (-6)://TINYINT
								   	pst.setBytes(i,webrs.getBytes(colName));
								    continue;
							   case (-5)://BIGINT
								   	pst.setLong(i,webrs.getLong(colName));
								    continue;
							   case (-4)://LONGVARBINARY
								   	pst.setBytes(i,webrs.getBytes(colName));
								    continue;
							   case (-3)://VARBINARY
								   	pst.setBytes(i,webrs.getBytes(colName));
								    continue;
							   case (-2)://BINARY
								   	pst.setBytes(i,webrs.getBytes(colName));
								    continue;
							   case (-1)://LONGVARCHAR
									pst.setString(i,webrs.getString(colName));
									continue;
							   case (0)://NULL
								   	pst.setNull(i,Types.NULL);
								    continue;
							   case (1)://CHAR
								   	pst.setString(i,webrs.getString(colName));
							        continue;
							   case (2)://NUMERIC
								   	pst.setInt(i,webrs.getInt(colName));
								    continue;
							   case (3)://DECIMAL
								   	pst.setInt(i,webrs.getInt(colName));
								    continue;
							   case (4)://INTEGER
								   	pst.setInt(i,webrs.getInt(colName));
								    continue;
						       case (5)://SMALLINT
								   	pst.setInt(i,webrs.getInt(colName));
								    continue;
							   case (6)://FLOAT
								   	pst.setFloat(i,webrs.getFloat(colName));
								    continue;
							   case (7)://REAL
								   	pst.setFloat(i,webrs.getFloat(colName));
								    continue;
							   case (8)://DOUBLE
								   	pst.setDouble(i,webrs.getDouble(colName));
								    continue;
							   case (12)://VARCHAR
								   	pst.setString(i,webrs.getString(colName));
								    continue;
							   case (91)://DATE
								    pst.setDate(i,webrs.getDate(colName));
								    continue;
							   case (93)://TIMESTAMP
								    pst.setTimestamp(i,webrs.getTimestamp(colName));
								    continue;
							   case (2004)://BLOB
							        pst.setBytes(i,webrs.getBytes(colName));
								    //pst.setBlob(i,webrs.getBlob(colName));
								    continue;
							   case (2005)://CLOB
								    pst.setClob(i,webrs.getClob(colName));
								    continue;
				            }
						} else {
							pst.setBoolean(i,false);
						}
					}
					int result = 0;
					try {
					   result = pst.executeUpdate();
					   if (result > 0) upStr += id + ",";
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						continue;
					}
				}
			}
			try {
			   if (!"".equals(upStr)) {
			      webcon.setAutoCommit(false);
			      exst = webcon.createStatement();
			      sql = "update " + table + " set isNews=0 where " + Keys[0] + " in (" + upStr.substring(0, upStr.length()-1) + ")";
			      int result = exst.executeUpdate(sql);
			      if (result > 0) {
			          webcon.commit();
			          intercon.commit();
				      webcon.setAutoCommit(true);
			          intercon.setAutoCommit(true);
			      } else intercon.rollback();
			   }
			} catch (Exception e) {
			    webcon.rollback();
			    intercon.rollback();
			    e.printStackTrace();
			}
			if(tmprs!=null) tmprs.close(); tmprs = null;
			if(tmpst!=null) tmpst.close(); tmpst = null;
			fccLog.info("----------------------------传输"+table+"表从外网到内网-----结束----------------------------");
		  }
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
			   if(rs!=null) rs.close(); rs = null;
			   if(st!=null) st.close(); st = null;
			   if (webrs!=null) webrs.close(); webrs=null;
			   if (webst!=null) webst.close(); webst=null;
			   if (intercon!=null) intercon.close(); intercon=null;
			   if (webcon!=null) webcon.close(); webcon=null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
