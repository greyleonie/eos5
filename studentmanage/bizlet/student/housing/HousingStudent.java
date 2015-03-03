package student.housing;

import org.jdom.input.*;
import org.jdom.*;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.util.DBconnection;
import talent.core.TalentFunctions;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-9-22
 * @class_displayName ArchiveAttach
 */

public class HousingStudent extends HttpServlet {
    public HousingStudent() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); //   Just puts "destroy" string in log
        //   Put your code here
    }

    /**
     * The doPost method of the servlet. <br>
     * 
     * This method is called when a form has its tag value method equals to
     * post.
     * 
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
        boolean flag = false;
        String message = "";
		String buildName = request.getParameter("buildName");
		String roomName = request.getParameter("roomName");
		DBconnection db = new DBconnection();
		try {
			//读取学员ID、学号
			Connection conn = db.getEOSConnection();
			String sql = "select e.operatorname,s.StudentID,s.StudentNO,s.ClassID,s.RoomID,s.Sex, "
                       + "r.RoomName,r.SeatNum,r.Tel as RoomTel,b.BuildingName,h.BeginTime,h.EndTime "
                       + "from eosoperator e,student s left join (Room r left join Building b on r.BuildingID=b.BuildingID) " 
                       + "on r.RoomID = s.RoomID left join HousingLogs h on h.HousingTypeID=2 and h.RoomID=r.RoomID "
                       + "and h.userid=s.studentid where e.operatorid=s.studentid and e.status=1 and "
                       + "datediff(hh,h.BeginTime,getdate())>0 and datediff(hh,h.EndTime,getdate())<=0 "
                       + "and r.RoomName like '%" + roomName + "%' and b.BuildingName like '%" + buildName + "%'";
			Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		    ResultSet srs = st.executeQuery(sql);
		    if (srs != null && srs.next()) {
		       srs.beforeFirst();
		       while (srs.next()) {
		           int noEvlTimes = 0;
		           int minweek = 0;
		           String studentId = srs.getString("StudentID");
		           String studentName = srs.getString("operatorname");
		           String classId = srs.getString("ClassID");
		           sql = "select top 1 datepart(week,ClassDate) week, dbo.getwstend(ClassDate) fromto from Course where ClassID="+classId+" "
		               + "group by datepart(week,ClassDate),dbo.getwstend(ClassDate)";
		           Statement mwst = conn.createStatement();
				   ResultSet mwrs = mwst.executeQuery(sql);
				   while (mwrs!=null && mwrs.next()) {
				       minweek = mwrs.getInt("week");
				   }
				   sql = "select count(*) times from (select datepart(week,c.ClassDate) week, dbo.getwstend(c.ClassDate) fromto from Course c "
		               + "where c.ClassID="+classId+" and dateadd(dd,5,DX.getDeadline(c.ClassDate))<getdate()  "
		               + "and not exists(select * from AssignMark a where studentID="+studentId+" and a.CourseID in  "
		               + "(select cs.CourseID from Course cs where getdate() between dateadd(dd,1,ClassDate) "
		               + "and dateadd(dd,5,DX.getDeadline(c.ClassDate)))) group by datepart(week,c.ClassDate),dbo.getwstend(c.ClassDate)) b";
				   Statement netst = conn.createStatement();
				   ResultSet netrs = netst.executeQuery(sql);
				   while (netrs!=null && netrs.next()) {
				       noEvlTimes = netrs.getInt("times");
				   }
		           sql = "select datepart(week,c.ClassDate) week, dbo.getwstend(c.ClassDate) fromto from Course c where ClassID="+classId+" "
                       + "and getdate() between dateadd(dd,1,ClassDate) and dateadd(dd,5,DX.getDeadline(c.ClassDate)) "
                       + "and not exists(select * from AssignMark a where studentID="+studentId+" and a.CourseID in "
                       + "(select cs.CourseID from Course cs where getdate() between dateadd(dd,1,ClassDate) "
                       + "and dateadd(dd,5,DX.getDeadline(c.ClassDate)))) group by datepart(week,ClassDate),dbo.getwstend(c.ClassDate)";
		           Statement evlst = conn.createStatement();
				   ResultSet evlrs = evlst.executeQuery(sql);
				   if (evlrs != null && evlrs.next()) {
				       flag = true;
				       evlrs.beforeFirst();
			           message += "尊敬的学员:" + studentName + ",你好！<br><font color='red'>你已累计有"+noEvlTimes+"次缺评记录！</font><br>请点击以下链接登录后，对";
				       while (evlrs.next()) {
				           int week = evlrs.getInt("week");
				           message += "第"+TalentFunctions.getNumForCn(week-minweek+1)+"周";
				           if (evlrs.next()) message += "、";
				       }
				       message += "等每周评估表及外请课评估表进行评估，谢谢支持！;";
				   } else 
			           message += studentName+":no evaluation;";
		       }
		       response.setContentType("text/html; charset=GB2312");
		       PrintWriter out=response.getWriter();
		       out.write(message.substring(0,message.length()-1));
		       out.close();
		    }
		    else {
		        response.setContentType("text/html; charset=GB2312");
		        PrintWriter out=response.getWriter();
		        //out.write("<html>");
		        //out.write("<body>");
		        out.write("no student");
		        //out.write("</body>");
		        //out.write("</html>");
		        out.close();
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        this.doPost(request, response);
    }

    /**
     * Initialization of the servlet. <br>
     * 
     * @throws ServletException
     *             if an error occure
     */
    public void init() throws ServletException {

    }
}