/*
 * �������� 2007-4-5
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
