/*
 * 创建日期 2007-2-7
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import base.util.DBconnection;

/**
 * @author fcc
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class DXCardDataHander {
	private Log fccLog = LogFactory.getLog(DXCardDataHander.class);
	private String baseDate = null;
	private String checkDate = null;
	private java.util.Date logDate;
	private int noonType = -1;
	private List kqCourseList = new ArrayList();//当天，某午别下所有要考勤课集合

	public DXCardDataHander () {
		
	}
	
	public DXCardDataHander(String baseDate,String checkDate,int noonType) {
		this.baseDate = baseDate;
		this.checkDate = checkDate;
		this.noonType = noonType;
	
	}
	
	public void setLogDate(java.util.Date date) {
		this.logDate = date;
	}
	
	
	
	/**
	 * @description 处理学员旷课，即没有刷卡的情况
	 * @author 冯长春
	 * @throws Exception
	 */
	public void doProcess() throws Exception {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String courseListSql = "select c.CourseID,c.ClassID,t.ClassName,convert(nvarchar(10),c.ClassDate,126) as ClassDate,convert(nvarchar(8),c.ClassTime,108) as ClassTime,c.ClassNoon from Course c left join Class t on c.ClassID=t.ClassID where c.IsUseKQJ=1 and c.IsAdopted=1";
		courseListSql += " and convert(nvarchar(10),c.ClassDate,126)='" + baseDate + "'";
		courseListSql += " and c.ClassNoon=" + noonType;
		fccLog.info("^^^^^^^^^courseListSql:" + courseListSql);
		
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(courseListSql);
			while(rs.next()) {
				int courseID = rs.getInt("CourseID");
				int classID = rs.getInt("ClassID");
				String className = rs.getString("ClassName");
				String classDate = rs.getString("ClassDate");
				String classTime = rs.getString("ClassTime");
				int noon = rs.getInt("ClassNoon");
				DXCourse course = new DXCourse();
				course.setCourseID(courseID);
				course.setClassID(classID);
				course.setClassName(className);
				course.setClassDate(classDate);
				course.setClassTime(classTime);
				course.setNoon(noon);
				kqCourseList.add(course);
				
			}
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			rs = null;
			st = null;
			
			
			
			for(int i = 0; i < kqCourseList.size(); i++) {
				DXCourse tempCourse = (DXCourse) kqCourseList.get(i);
				int tempClassID = tempCourse.getClassID();
				String tempSql = "select s.StudentID from Student s where (IsQuit is null or  IsQuit=0) and s.ClassID=" + tempClassID + " and s.StudentID not in(select StudentID from StudentlaterLogs where wubie=" + noonType + " and convert(nvarchar(10),checkTime,126)='" + baseDate + "')";
				fccLog.info("^^^^^^^^^tempSql:" + tempSql);
				List studentIDList = new ArrayList();
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery(tempSql);
				while(rs2.next()) {
					studentIDList.add(String.valueOf(rs2.getLong("StudentID")));
				}
				if(rs2!=null) rs2.close();
				if(st2!=null) st2.close();
				rs2 = null;
				st2 = null;
				
				PreparedStatement pst = null;
				for(int j = 0; j < studentIDList.size(); j++) {
					String sID = (String) studentIDList.get(j);
					long studentIDf = Long.parseLong(sID);
					int state = 2;//旷课
					int wubie = noonType;
					int singleTime = 0;
					String createTime = tempCourse.getClassDate() + " " + tempCourse.getClassTime();
					String insertSql = "insert into StudentlaterLogs(StudentId,checkTime,state,wubie,singleTime,CreatTime) values(?,?,?,?,?,getdate())";
					pst = con.prepareStatement(insertSql);
					pst.setLong(1,studentIDf);
					pst.setString(2,checkDate);
					pst.setInt(3,state);
					pst.setInt(4,wubie);
					pst.setInt(5,singleTime);
					//pst.setString(6,createTime);
					pst.executeUpdate();
					
					//------------------------------------------------------logs------------------------------------
					threadTaskLog(tempClassID,tempCourse.getClassName(),studentIDf,tempCourse.getNoon());
					
				}
				if(pst!=null) pst.close();
				pst = null;
				

			
			}
			
		}finally{
			if(con!=null) con.close();
			con = null;
		}
		
		addKqTaskLog(baseDate,checkDate,noonType);           //添加考勤旷课执行成功日志
	}
	
	
	/**
	 * @description 旷课记录成功日志
	 * @param classID
	 * @param className
	 * @param studentID
	 * @param logDate
	 * @param noonType
	 */
	public void threadTaskLog(int classID,String className,long studentID,int noonType) {
		Connection con = null;
		PreparedStatement pst = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logDate = sdf.format(this.logDate);
		String sql = "insert into AbsenceRunLogs(classID,className,studentID,logDate,noonType) values(?,?,?,?,?)";
		try{
			con = new DBconnection().getEOSConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1,classID);
			pst.setString(2,className);
			pst.setLong(3,studentID);
			pst.setString(4,logDate);
			pst.setInt(5,noonType);
			pst.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(pst!=null) pst.close();
				if(con!=null) con.close();
				pst = null;
				con = null;
			}catch(Exception ee) {
				
			}
		}
		
		
		
	}
	
	
	/**
	 * @description 添加考勤旷课执行成功日志
	 * @param kqDate
	 * @param noonType
	 * @param count
	 */
	public void addKqTaskLog(String baseDate,String checkTime,int noonType) {
		Connection con = null;
		Statement st  = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		
		if(isCurHasCourse(baseDate,noonType)){     //判断当前是否有课程
		
			int count = this.getNoKqNumber(baseDate,noonType);   //缺勤人数
			String sql = "select * from KqTaskManage where KqDate = '"+ baseDate +"' and KqNoon = " + noonType;		
			
			try{
				con = new DBconnection().getEOSConnection();
				st = con.createStatement();
				rs = st.executeQuery(sql);
				if(!rs.next()){
					String sql2 = "insert into KqTaskManage(KqDate,KqNoon,ExeTime,IsExecute,Method,Countf) values(?,?,?,?,?,?)";
					pst = con.prepareStatement(sql2);
					pst.setString(1,baseDate);
					pst.setInt(2,noonType);
					pst.setString(3,checkTime);
					pst.setInt(4,1);
					pst.setInt(5,1);
					pst.setInt(6,count);
					pst.executeUpdate();
				}else{
					int IsExecute = rs.getInt("IsExecute");
					int TaskID = rs.getInt("TaskID");
					if(IsExecute==0){          //未完成的修改为已完成
						String sql3 = "update KqTaskManage set IsExecute=?,Method=?,Countf=? where TaskID= ?";	
						pst = con.prepareStatement(sql3);
						pst.setInt(1,1);
						pst.setInt(2,1);
						pst.setInt(3,count);
						pst.setInt(4,TaskID);
	
						pst.executeUpdate();
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				try{
					if(pst!=null) pst.close();
					if(con!=null) con.close();
					pst = null;
					con = null;
				}catch(Exception ee) {
					
				}
	
		    }
		}
	}
	
	/**
	 * 判断当前是否存在课程
	 * @param baseDate
	 * @param noonType
	 * @return
	 */
	public boolean isCurHasCourse(String baseDate,int noonType){
		boolean status = false;
		Connection con = null;
		Statement st  = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		String sql = "select count(*) from course where IsUseKQJ=1 and IsAdopted=1 " +
				"and convert(nvarchar(10),ClassTime,126)='" + baseDate + "' and ClassNoon = " + noonType;
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				status = true;		
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				rs = null;
				st = null;
				con = null;
			}catch(Exception ee) {
				
			}

	    }
		return status;
	}
		
	 /**
	  * 取得班级人数
	  * @param ClassID
	  */

	public int getStudenNumByClassID(int ClassID) {
		int count = 0;
		Connection con = null;
		Statement st  = null;
		ResultSet rs = null;
		String sql = "select count(*) from Student where (IsQuit is null or  IsQuit=0) and ClassID=" + ClassID;
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				rs = null;
				st = null;
				con = null;
			}catch(Exception ee) {
				
			}

	    }
		return count;
	}
	
	
	 /**
	  * 根据时间和午别,统计需要上课的总人数
	  * @param ClassID
	  */

	public int getStudenNumber(String kqDate,int noonType) {
		int count = 0;
		Connection con = null;
		Statement st  = null;
		ResultSet rs = null;

		String sql = "select c.CourseID,c.ClassID,t.ClassName,convert(nvarchar(10),c.ClassDate,126) as ClassDate,convert(nvarchar(8),c.ClassTime,108) as ClassTime,c.ClassNoon from Course c left join Class t on c.ClassID=t.ClassID where c.IsUseKQJ=1 and c.IsAdopted=1 "
        + "and convert(nvarchar(10),c.ClassDate,126)='"+kqDate+"' "
        + "and c.ClassNoon=" + noonType;
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int ClassID = rs.getInt("ClassID");
				count += getStudenNumByClassID(ClassID);
			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				rs = null;
				st = null;
				con = null;
			}catch(Exception ee) {
				
			}

	    }
		return count;
	}
	
	 /**
	  * 取得考勤总人数
	  * @param kqDate
	  * @param noonType
	  * @return
	  */

	public int getKqNumber(String kqDate,int noonType) {
		int count = 0;
		Connection con = null;
		Statement st  = null;
		ResultSet rs = null;
		Statement st2  = null;
		ResultSet rs2 = null;
		java.sql.Date dateKq = java.sql.Date.valueOf(kqDate);
		String sqlroom = "select ClassRoomID from course where IsAdopted=1 and IsUseKQJ=1 and convert(nvarchar(10),ClassDate,126)='" + kqDate + "' and classNoon ="+noonType;
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sqlroom);
			while(rs.next()) {
				int ClassRoomID = rs.getInt("ClassRoomID");    //取得课室

				String year = String.valueOf(dateKq.getYear());
				String month = String.valueOf(dateKq.getMonth());
				String date = String.valueOf(dateKq.getDate());
				String roomID = String.valueOf(ClassRoomID);
				String key = roomID + year + month + date + String.valueOf(noonType);
				String sql = "select count(*) from StudentkqData where realid = '"+ key +"'";
				st2 = con.createStatement();
				rs2 = st2.executeQuery(sql);
				if(rs2.next()) {
					count += rs2.getInt(1);       //取得课室考勤人数
				}	
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				rs = null;
				st = null;
				con = null;
			}catch(Exception ee) {
				
			}

	    }
			
		return count;
	}
	
	/**
	 * 取得缺勤人数
	 * @param kqDate
	 * @param noonType
	 * @return
	 */
	public int getNoKqNumber(String kqDate,int noonType) {
		int count = -1;
		try{
			count = getStudenNumber(kqDate,noonType)-getKqNumber(kqDate,noonType);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public static void main(String args[]) throws Exception {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    int noon = 0;
	    String baseDate = "2008-04-09";
		String checkTime = baseDate + " " + "12:00:00";
		Date currentTime = sdf.parse(baseDate);
		DXCardDataHander hander = new DXCardDataHander(baseDate,checkTime,noon);
		hander.setLogDate(currentTime);
		hander.doProcess();
		//System.out.println(currentTime.toString());
	}
}
