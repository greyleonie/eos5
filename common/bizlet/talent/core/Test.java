/*
 * �������� 2008-3-11
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import base.util.DBconnection;



/**
 * @author csd
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class Test {
  public static void main(String args[]){
      try{
          String coder="";
          String sql = "select  TYPECODE from CAPT_TYPE"; 
          Connection con = null;
  		Statement st = null;
  		ResultSet rs = null;
  		Statement st1 = null;
  		ResultSet rs1 = null;
  		String year="";
  		String captcode="";
  		
  		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  		con = DriverManager.getConnection("jdbc:sqlserver://192.168.0.202:1433;DatabaseName=DXPlatform","PlatformUser","1qaz2wsx3edc..");
  		
  	
		
  			st = con.createStatement();
  			rs = st.executeQuery(sql);
  	while(rs.next()){
  	   String sql1 = "select  TYPECODE from CAPT_CAPITALINFO"; 
  	    coder="0905"+rs.getString("TYPECODE")+"0001";
  	    System.out.println(coder);
  	}
  }catch(Exception e){
  System.out.println("==========error:"+e);    
  }
  }
}
