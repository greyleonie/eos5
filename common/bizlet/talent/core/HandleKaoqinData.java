/*
 * 创建日期 2008-4-16
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import talent.util.DXCardDataHander;
import talent.util.TalentAware;

import base.util.DBconnection;

/**
 * @author netkidfan
 * 
 * TODO 要更改此生成的类型注释的模板，请转至 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class HandleKaoqinData extends TimerTask {
    private Log log = LogFactory.getLog(HandleKaoqinData.class);

    public static HandleKaoqinData handleKaoqinData = null;

    private static Properties pro = null;

    private static String morningstart = null;//早上开始计算时间

    private static String morningend = null;//早上结束计算时间

    private static String afternoonstart = null;//下午开始计算时间

    private static String afternoonend = null;//下午结束计算时间

    private static String nightstart = null;//晚上开始计算时间

    private static String nightend = null;//晚上结束计算时间

    private HandleKaoqinData() {
        init();
    }

    protected void init() {
        try {
            pro = new Properties();
            InputStream in = this.getClass().getResourceAsStream(
                    "/properties/database.properties");
            pro.load(in);

            in.close();

            morningstart = pro.getProperty("morningstart");
            morningend = pro.getProperty("morningend");
            afternoonstart = pro.getProperty("afternoonstart");
            afternoonend = pro.getProperty("afternoonend");
            nightstart = pro.getProperty("nightstart");
            nightend = pro.getProperty("nightend");

        } catch (Exception e) {
            System.out.println("=========HandleKaoqinData============errors:"
                    + e);
        }
    }

    public static HandleKaoqinData getInstance() {
        if (handleKaoqinData == null)
            handleKaoqinData = new HandleKaoqinData();
        return handleKaoqinData;
    }

    /*
     * （非 Javadoc）
     * 
     * @see java.util.TimerTask#run()
     */
    public void run() {
        DBconnection db = new DBconnection();
        Connection con = null;
        con = db.getEOSConnection();
        String checkTime = null;
        
        Date currentTime = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String baseDate = sdf.format(currentTime);
        SimpleDateFormat parseDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
    		Date morStart = parseDate.parse(baseDate + " " + morningstart);
    		Date morEnd = parseDate.parse(baseDate + " " + morningend);
    		Date aftStart = parseDate.parse(baseDate + " " + afternoonstart);
    		Date aftEnd = parseDate.parse(baseDate + " " + afternoonend);
    		Date nightStart = parseDate.parse(baseDate + " " + nightstart);
    		Date nightEnd = parseDate.parse(baseDate + " " + nightend);
    		
            Statement course_st = con.createStatement();
            String course_sql = "select distinct(ClassID),convert(nvarchar(10),ClassDate,126) as ClassDate,convert(nvarchar(8),ClassTime,108) as ClassTime,ClassNoon from Course where IsAdopted=1 and TeahchingModelID in (1,17) "
                              + "and datediff(dd,getdate(),ClassDate)=1 and ClassID IS NOT NULL";
            log.info("^^^^^^^^^HandleKaoqinData-->course_sql:" + course_sql);
            ResultSet course_rs = course_st.executeQuery(course_sql);
            while (course_rs.next()) {
                int classID = course_rs.getInt("ClassID");
				String classDate = course_rs.getString("ClassDate");
				String classTime = course_rs.getString("ClassTime");
				Date cDate = parseDate.parse(classDate + " " + classTime);
				int noon = course_rs.getInt("ClassNoon");
				
				if(cDate.after(morStart) && cDate.before(morEnd)) checkTime = baseDate + " " + "12:00:00";
				else if(cDate.after(aftStart) && cDate.before(aftEnd)) checkTime = baseDate + " " + "18:00:00";
				else if(cDate.after(nightStart) && cDate.before(nightEnd)) checkTime = baseDate + " " + "22:00:00";
				
				String tempSql = "select s.StudentID from Student s where (IsQuit is null or  IsQuit=0) and s.ClassID=" + classID + " and s.StudentID not in(select StudentID from StudentlaterLogs where wubie=" + noon + " and convert(nvarchar(10),checkTime,126)='" + baseDate + "')";
				log.info("^^^^^^^^^HandleKaoqinData-->tempSql:" + tempSql);
				Statement stst = con.createStatement();
				ResultSet strs = stst.executeQuery(tempSql);
				PreparedStatement pst = null;
				while(strs.next()) {
				    long studentId = strs.getLong("StudentID");
					int state = 0;//正常
					int wubie = noon;
					int singleTime = 0;
					String insertSql = "insert into StudentlaterLogs(StudentId,checkTime,state,wubie,singleTime,CreatTime) values(?,?,?,?,?,getdate())";
					pst = con.prepareStatement(insertSql);
					pst.setLong(1,studentId);
					pst.setString(2,checkTime);
					pst.setInt(3,state);
					pst.setInt(4,wubie);
					pst.setInt(5,singleTime);
					pst.executeUpdate();
				}
				if(strs!=null) strs.close();
				if(stst!=null) stst.close();
				strs = null;
				stst = null;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public boolean exist() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date();
        String date = sdf.format(today);
        boolean exist = false;
        String sql = "select top 1 * from StudentlaterLogs where ";

        return exist;
    }

}