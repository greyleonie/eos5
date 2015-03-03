package DBstep;

import java.sql.*;
import java.lang.*;
import java.text.*;
import java.util.*;

import javax.xml.parsers.*;
import org.xml.sax.*;
import java.io.*;
import org.w3c.dom.*;

/**
 * <p>Title: iWebOffice�����ĵ�SQL����</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: www.goldgrid.com</p>
 * @author ����
 * @version 1.0
 */

public class iDBManager2000 {

  public String ClassString=null;
  public String ConnectionString=null;
  public String UserName=null;
  public String PassWord=null;

  public Connection Conn;
  public Statement Stmt;
  
  private String pathName = "\\jboss-3.2.5\\server\\default\\deploy\\eos4jboss";
  private String fileName = "ProductDataSource-ds.xml";
  
  public void GetDriverParameter(){
	  String hostDir = System.getProperty("user.dir");
	  pathName = hostDir + pathName;
	  //System.out.println("road is " + pathName);

	  DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	  try{
		  DocumentBuilder builder = factory.newDocumentBuilder();

		  //�����ĵ�������ø����
		  Document document = builder.parse(new File(pathName + "\\" + fileName));
		  Element datasources = document.getDocumentElement();

		  //��õ�һ��local-tx-datasource���
		  Element lds =(Element)(datasources.getElementsByTagName("local-tx-datasource").item(0));

		  ClassString = lds.getElementsByTagName("driver-class").item(0).getFirstChild().getNodeValue();
		  ConnectionString = lds.getElementsByTagName("connection-url").item(0).getFirstChild().getNodeValue();
		  UserName = lds.getElementsByTagName("connection-property").item(0).getFirstChild().getNodeValue();
		  PassWord = lds.getElementsByTagName("connection-property").item(1).getFirstChild().getNodeValue();
		  
		  //System.out.println(UserName + PassWord + ConnectionString + ClassString);
	  }
	  catch(Exception ex){
		  ex.printStackTrace();
	  }
  }

  public iDBManager2000() {
    GetDriverParameter();
    
    //For ODBC
    //ClassString="sun.jdbc.odbc.JdbcOdbcDriver";
    //ConnectionString=("jdbc:odbc:DBDemo");
    //UserName="dbdemo";
    //PassWord="dbdemo";


    //For Access Driver
    //ClassString="sun.jdbc.odbc.JdbcOdbcDriver";
    //ConnectionString=("jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb)};DBQ=C:\\dbdemo.mdb;ImplicitCommitSync=Yes;MaxBufferSize=512;MaxScanRows=128;PageTimeout=5;SafeTransactions=0;Threads=3;UserCommitSync=Yes;").replace('\\','/');

    //For SQLServer Driver
    //ClassString="com.microsoft.jdbc.sqlserver.SQLServerDriver";
    //ConnectionString="jdbc:microsoft:sqlserver://127.0.0.1:1400;DatabaseName=DBDemo;User=dbdemo;Password=dbdemo";
    //UserName="dbdemo";
    //PassWord="dbdemo";

    //For Oracle Driver
    //ClassString="oracle.jdbc.driver.OracleDriver";
    //ConnectionString="jdbc:oracle:thin:@hstation:1521:dbdemo";
    //UserName="system";
    //PassWord="manager";

    //For MySQL Driver
    //ClassString="org.gjt.mm.mysql.Driver";
    //ConnectionString="jdbc:mysql://localhost/softforum?user=...&password=...&useUnicode=true&characterEncoding=8859_1";
    //ClassString="com.mysql.jdbc.Driver";
    //ConnectionString="jdbc:mysql://localhost/dbstep?user=root&password=&useUnicode=true&characterEncoding=gb2312";

    //For Sybase Driver
    //ClassString="com.sybase.jdbc.SybDriver";
    //ConnectionString="jdbc:sybase:Tds:localhost:5007/tsdata"; //tsdataΪ������ݿ���
    //Properties sysProps = System.getProperties();
    //SysProps.put("user","userid");
    //SysProps.put("password","user_password");
    //If using Sybase then DriverManager.getConnection(ConnectionString,sysProps);
  }

  public boolean OpenConnection()
  {
   boolean mResult=true;
   try
   {
     Class.forName(ClassString);
     if ((UserName==null) && (PassWord==null))
     {
       Conn= DriverManager.getConnection(ConnectionString);
     }
     else
     {
       Conn= DriverManager.getConnection(ConnectionString,UserName,PassWord);
     }

     Stmt=Conn.createStatement();
     mResult=true;
   }
   catch(Exception e)
   {
     System.out.println(e.toString());
     mResult=false;
   }
   return (mResult);
  }

  //�ر����ݿ�����
  public void CloseConnection()
  {
   try
   {
     Stmt.close();
     Conn.close();
   }
   catch(Exception e)
   {
     System.out.println(e.toString());
   }
  }

  public String GetDateTime()
  {
   Calendar cal  = Calendar.getInstance();
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   String mDateTime=formatter.format(cal.getTime());
   return (mDateTime);
  }

  public  java.sql.Date  GetDate()
  {
    java.sql.Date mDate;
    Calendar cal  = Calendar.getInstance();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    String mDateTime=formatter.format(cal.getTime());
    return (java.sql.Date.valueOf(mDateTime));
  }

  public int GetMaxID(String vTableName,String vFieldName)
  {
   int mResult=0;
   String mSql=new String();
   mSql = "select max("+vFieldName+")+1 as MaxID from " + vTableName;
   if (OpenConnection())
   {
     try
     {
       ResultSet result=ExecuteQuery(mSql);
       if (result.next())
       {
         mResult=result.getInt("MaxID");
       }
       result.close();
     }
     catch(Exception e)
     {
       System.out.println(e.toString());
     }
     CloseConnection();
   }
   return (mResult);
 }

  public ResultSet ExecuteQuery(String SqlString)
  {
    ResultSet result=null;
    try
    {
      result=Stmt.executeQuery(SqlString);
    }
    catch(Exception e)
    {
      System.out.println(e.toString());
    }
    return (result);
  }

  public int ExecuteUpdate(String SqlString)
  {
    int result=0;
    try
    {
      result=Stmt.executeUpdate(SqlString);
    }
    catch(Exception e)
    {
      System.out.println(e.toString());
    }
    return (result);
  }
}