/*
 * 创建日期 2007-4-6
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package kaoqin;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import base.util.DBconnection;

/**
 * @author 陈绍栋
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class KaoqinExport {
	
	public void export(PageContext pageContext) throws Exception{
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();
		Connection con = null;
		Statement st = null;
		PreparedStatement pst=null;
		ResultSet classRs = null;
		ResultSet studentRs =null;
		ResultSet logsRs =null;
		try{
			DBconnection db = new DBconnection();
			con = db.getEOSConnection();
			st = con.createStatement();
		
			List result = new ArrayList();
		    StringBuffer cache = new StringBuffer();
		    
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    SimpleDateFormat sdftemp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String fileMark = sdf.format(Calendar.getInstance().getTime());
		    String classHql =
		        "select * from Class c where c.renShiNo is not null and c.renShiNo!=''";
	//	    String classHql =
	//	        "from Classes c where 1=1";
		    String classID = request.getParameter("classesid");
		    String startTimeString = request.getParameter("startTime");
		    String engTimeString = request.getParameter("endTime");
		    String className = "";
		    if(startTimeString == null) startTimeString = "";
		    if(engTimeString == null) engTimeString = "";
	
		    if (classID != null && !"-1".equalsIgnoreCase(classID)) {
		      classHql += " and c.classid=" + classID;
		    }
		    classRs=st.executeQuery(classHql);  //班级集合
		    st=null;
		    st=con.createStatement();
		    while(classRs.next()){
		      className = classRs.getString("className");
		      Date start = classRs.getDate("Begintime"); 
		      //String classCode = classRs.getString("classCode"); 班级代码要改为人事局编号 李志清 2009-01-04
 		      String classCode = classRs.getString("renShiNo");
		      Date end = classRs.getDate("Endtime"); 
		      String tempClassID=classRs.getString("classID");
		      String studentSql="select * from Student where classid="+tempClassID+" order by studentNO asc ,studentID asc";
		      studentRs=st.executeQuery(studentSql); //某班级的学员集合
		      st=null;
			  st=con.createStatement();
		      while(studentRs.next()){
		        int studentID = studentRs.getInt("studentID");
		        String barcode = studentRs.getString("barcode");
	
		        if(barcode!=null && !"".equalsIgnoreCase(barcode)) {
		          if("".equalsIgnoreCase(startTimeString) && "".equalsIgnoreCase(engTimeString)) {
		          }else if("".equalsIgnoreCase(startTimeString) && !"".equalsIgnoreCase(engTimeString)) {
		            end = sdftemp.parse(engTimeString + " 23:59:59");
		          }else if(!"".equalsIgnoreCase(startTimeString) && "".equalsIgnoreCase(engTimeString)) {
		            start = sdftemp.parse(startTimeString + " 01:00:00");
		          }else if(!"".equalsIgnoreCase(startTimeString) && !"".equalsIgnoreCase(engTimeString)) {
		            start = sdftemp.parse(startTimeString + " 01:00:00");
		            end = sdftemp.parse(engTimeString + " 23:59:59");
		          }
		          
		          String logsSql = "select *  from StudentLaterLogs k where k.studentId=? and k.checkTime>=? and k.checkTime<=? and ( k.state=0 or k.state =1 )";
		          pst = con.prepareStatement(logsSql);
		          pst.setInt(1,studentID);
		          pst.setString(2,startTimeString + " 00:00:00");
		          pst.setString(3,engTimeString + " 23:59:59");
		          logsRs = pst.executeQuery(); //某学员考勤记录
		          while(logsRs.next()){
		            if(barcode.equals("113108470CB4A17919")){
		                System.out.println(logsRs.getString("studentID"));
		            }
		            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		          	String checkTime = logsRs.getString("CheckTime");
		            String baseTime = logsRs.getString("CheckTime");;
		            if(checkTime!=null&&checkTime.length()>=19)
		            	checkTime = checkTime.substring(0,19);
		            if(baseTime!=null&&baseTime.length()>=10)
		            	baseTime = baseTime.substring(0,10);
		            String wb = "";
	
		            String startStr = baseTime + " 00:00:00";
		            String morning = baseTime + " 12:00:00";
		            String afternoon = baseTime + " 18:00:00";
		            String endStr = baseTime + " 23:59:59";
		            Date startDate = df.parse(startStr);
		            Date morningDate = df.parse(morning);
		            Date afternoonDate = df.parse(afternoon);
		            Date endDate = df.parse(endStr);
		            Date checkDate = df.parse(checkTime);
		            if((checkDate.after(startDate) && checkDate.before(morningDate)) || checkDate.equals(morningDate)) {
		              wb = "上午";
		            }
		            if((checkDate.after(morningDate) && checkDate.before(afternoonDate)) || checkDate.equals(afternoonDate)) {
		              wb = "下午";
		            }
	
		            if(checkDate.after(afternoonDate) && checkDate.before(endDate)) {
		              wb = "晚上";
		            }
		            int wubie = logsRs.getInt("wubie");
		            String digtal = String.valueOf(wubie+1);
	
		            String lastResult = "('" + classCode + "','" + barcode + "','" + checkTime + "','" + digtal + "','0','upload','" + baseTime + "')";
		            result.add(lastResult);
		            cache.append(lastResult + "\n");
		          }
	
	
		        }//if
	
		      }//for
	
		    }
	
		    //System.out.println("###############ok");
	
		    if(result.size() == 0) cache.append("没有你要的数据\n");
		    String filename = className + startTimeString +"至"+engTimeString+ ".data";
		    response.setContentType("text/data;charset=GBK");
		    response.setHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("GBK"),"ISO-8859-1"));
		    OutputStream out = response.getOutputStream();
		    ByteArrayOutputStream bout = new ByteArrayOutputStream();
		    bout.write(cache.toString().getBytes());
		    bout.writeTo(out);
		    out.flush();
	

		
		
	
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(logsRs!=null) logsRs.close();
				if(studentRs!=null) studentRs.close();
				if(classRs!=null) classRs.close();
				if(pst!=null) pst.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
			}catch(Exception e) {
				
			}
		}
	}

}
