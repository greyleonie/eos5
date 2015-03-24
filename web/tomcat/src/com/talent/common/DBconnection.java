package com.talent.common;

import java.sql.*;

public class DBconnection {
	private String driver;
	private String url;
	private String user;
	private String password;
	
	public DBconnection(){
			this.driver = "net.sourceforge.jtds.jdbc.Driver";
			this.url = "jdbc:jtds:sqlserver://192.168.0.202:1433;DatabaseName=DXPlatform";
			this.user = "platformUser";
			this.password = "1qaz2wsx3edc..";
	}
	
	public Connection getConnection() {
		Connection con = null;
		try{
			Class.forName(this.driver);
			con = DriverManager.getConnection(this.url,this.user,this.password);
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	
	}
	
	public static void main(String[] args) {
		DBconnection dbcon = new DBconnection();
		Connection con = dbcon.getConnection();
		
	}
}
