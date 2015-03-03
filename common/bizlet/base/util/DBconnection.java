/*
 * 创建日期 2006-11-3
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import java.util.AbstractMap;
import java.util.Properties;
import java.io.*;
import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import talent.util.TalentHand;

import com.primeton.tp.core.config.EOSConfigManager;

/**
 * @author fcc
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class DBconnection {
	
	private Properties pro;
	private String driver;
	private String url;
	private String user;
	private String password;
	private InitialContext ctx;
	Connection con = null;
	DataSource ds=null;
	private Log fccLog = LogFactory.getLog(DBconnection.class);
	
	public DBconnection(){
		pro = new Properties();
		try{
		    ctx=new InitialContext();
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}
	
	public DBconnection(String propertisPath){
		pro = new Properties();
		try{
			InputStream in = this.getClass().getResourceAsStream(propertisPath);
			
			BufferedInputStream bIn = new BufferedInputStream(in);
			pro.load(bIn);
			
			driver = pro.getProperty("driver","com.microsoft.sqlserver.jdbc.SQLServerDriver");
			url = pro.getProperty("url","dbc:sqlserver://192.168.0.202:1433;DatabaseName=DXPlatform");
			user = pro.getProperty("username","PlatformUser");
			password = pro.getProperty("password","1qaz2wsx3edc..");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}
	
	public DBconnection(Properties p){
		pro = p;
		try{
			driver = pro.getProperty("driver","com.microsoft.sqlserver.jdbc.SQLServerDriver");
			url = pro.getProperty("url","dbc:sqlserver://192.168.0.202:1433;DatabaseName=DXPlatform");
			user = pro.getProperty("username","PlatformUser");
			password = pro.getProperty("password","1qaz2wsx3edc..");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}
	
	public Connection getConnection() {
		
		try{	  
		    ds=(DataSource)ctx.lookup("java:/ProductDataSource");		    
		    con=ds.getConnection();	
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	
	}
	
	
	
	public Connection getEOSConnection() {
		Connection con = null;
		
		AbstractMap config = EOSConfigManager.getGroupValues("global", "DBConnect");
		String jdbcDriver = (String)config.get("jdbcdriver");
        String dburl = (String)config.get("jdbcurl");
        String username = (String)config.get("username");
        String password = (String)config.get("password");
        
        try{
        	Class.forName(jdbcDriver);
        	con = DriverManager.getConnection(dburl, username, password);
        	//fccLog.info("^^^^^^hi,hi,fcclzy_talent,database's connection is acquired and EOS config is right^^^^^^");
        	
        }catch(Exception e) {
        	fccLog.info("^^^^^^no,no,fcclzy_talent,database's connection is not acquired and EOS config has error^^^^^^");
        
        }
		
		return con;
	
	}
	
	

}
