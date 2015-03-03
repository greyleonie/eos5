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
import java.sql.CallableStatement;
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
public class DeleteLogTimer extends TimerTask {
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
	private String serverip = null;//服务器IP

	public static DeleteLogTimer talentAware = null;
	public String[] tables;
	
	private DeleteLogTimer() {
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
			
			if (pro.getProperty("DeleteTables").indexOf(";")>=0)
			   tables = pro.getProperty("DeleteTables").split(";");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public static DeleteLogTimer getInstance() {
		if (talentAware == null)
			talentAware = new DeleteLogTimer();
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
			
//			判断本机ip，限制只在服务器运行
			if (InetAddress.getLocalHost().getHostAddress().indexOf(serverip)>=0) {
			    
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
				 System.out.println(temp[0] + "," + temp[1] + "," + temp[2]);
				 delData(temp[0],temp[1],temp[2]);
			}
			}
			
			fccLog.info("----------------------------------------结束执行内外网数据传输定时器-------------------------------------");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void delData(String table,String PrimaryKey,String type) {
		Statement st = null;
		ResultSet rs = null;
		Statement webst = null;
		ResultSet webrs = null;
		String sql = "";
		
		try{
			if (type.indexOf("out")>=0) {
            //内网删外网
			String tableTmp = table;
			fccLog.info("----------------------------删除外网"+table+"表数据-----开始----------------------------");
			if (tableTmp.indexOf(".")>=0) tableTmp = tableTmp.substring(tableTmp.indexOf(".")+1);
			sql = "select * from DX.DeleteLog where TableName='" + tableTmp + "'";
			st = intercon.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int logid = rs.getInt("LogID");
				String id = rs.getString("PrimaryID");
				sql = "select * from " + table + " where " + PrimaryKey + "=" + id;
				Statement queryst = webcon.createStatement();
				ResultSet queryrs = queryst.executeQuery(sql);
				
				if (queryrs!=null && queryrs.next()) {
				   webcon.setAutoCommit(false);
				   webst = webcon.createStatement();
				   sql = "delete from " + table + " where " + PrimaryKey + "=" + id;
				   int rows = 0;
				   try {
				       rows = webst.executeUpdate(sql); 
				       webcon.commit();
					   if (rows > 0) {
						  fccLog.info("----------------------------删除"+table+"表数据ID"+id+"----------------------------");
						  sql = "delete from DX.DeleteLog where LogID=" + logid;
						  intercon.setAutoCommit(false);
						  Statement tmpst = intercon.createStatement();
						  tmpst.executeUpdate(sql);
						  intercon.commit();
					   }
				       
				   } catch (Exception e) {
				   	   e.printStackTrace();
				   	   continue;
				   }
			    } else {
			    	try {
			    	   fccLog.info("----------------------------删除"+table+"表数据ID"+id+"----------------------------");
					   sql = "delete from DX.DeleteLog where LogID=" + logid;
					   intercon.setAutoCommit(false);
					   Statement tmpst = intercon.createStatement();
					   tmpst.executeUpdate(sql);
				       intercon.commit();
			    	} catch (Exception e) {
			    		e.printStackTrace();
			    		continue;
			    	}
			    }
			}
			fccLog.info("----------------------------删除外网"+table+"表数据-----结束----------------------------");
			}

			if (type.indexOf("in")>=0) {
			//外网删内网
			String tableTmp = table;
			fccLog.info("----------------------------删除内网"+table+"表数据-----开始----------------------------");
			if (tableTmp.indexOf(".")>=0) tableTmp = tableTmp.substring(tableTmp.indexOf(".")+1);
			sql = "select * from DX.DeleteLog where TableName='" + tableTmp + "'";
			webst = webcon.createStatement();
			webrs = webst.executeQuery(sql);
			
			while(webrs.next()) {
				int logid = webrs.getInt("LogID");
				String id = webrs.getString("PrimaryID");
				sql = "select * from " + table + " where " + PrimaryKey + "=" + id;
				Statement queryst = intercon.createStatement();
				ResultSet queryrs = queryst.executeQuery(sql);
				
				if (queryrs!=null && queryrs.next()) {
				   intercon.setAutoCommit(false);
				   sql = "delete from " + table + " where " + PrimaryKey + "=" + id;
				   st = intercon.createStatement();
				   int rows = 0;
				   try {
				      rows = st.executeUpdate(sql);
				      intercon.commit();
				      if (rows > 0) {
					     fccLog.info("----------------------------删除"+table+"表数据ID"+id+"----------------------------");
					     sql = "delete from DX.DeleteLog where LogID=" + logid;
					     webcon.setAutoCommit(false);
					     Statement tmpst = webcon.createStatement();
					     tmpst.executeUpdate(sql);
					     webcon.commit();
				      }
				   } catch (Exception e) {
				   	   e.printStackTrace();
				   	   continue;
				   } 
				} else {
					try {
					  fccLog.info("----------------------------删除"+table+"表数据ID"+id+"----------------------------");
					  sql = "delete from DX.DeleteLog where LogID=" + logid;
					  Statement tmpst = webcon.createStatement();
					  tmpst.executeUpdate(sql);
					} catch (Exception e) {
						e.printStackTrace();
						continue;
					}
				}
			}
			fccLog.info("----------------------------删除内网"+table+"表数据-----结束----------------------------");
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
