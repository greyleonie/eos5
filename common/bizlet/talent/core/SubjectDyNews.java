/*
 * 创建日期 2007-4-5
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import base.util.DBconnection;



/**
 * @author tim
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class SubjectDyNews {
	
  public static String createDyNews(){
   String table="<table border='0' width='100%' cellspacing='0' cellpadding='0'>";
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	int count=0;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date date=new Date();
	String today=sdf.format(date);
	String content="";
  	try{
  		DBconnection db = new DBconnection();
		con = db.getEOSConnection();
		String sql="select * from subjectNews where endTime>='"+today+"'";		
		st = con.createStatement();
		rs=st.executeQuery(sql);
		String url="";
		String title="";
		while(rs.next()){
			if(!rs.getString("url").equals("")){
				url=rs.getString("url").trim();
				}
			if(!rs.getString("title").equals("")){
				title=rs.getString("title").trim();
				}
			
			content+="<tr><td style=font-size:12px;color: #000000;line-height: 20px;><a href="+url+" target=_blank>*"+title+"</a></td></tr>";
			count++;
		}
		table+=content;
	table+="</table>";	
	
    }catch(Exception e){
    	System.out.println("============createDyNews============errors:"+e);
    }	
    return table;
  } 
  public static void main(String args[]){
  	SubjectDyNews.createDyNews();
  }
}
