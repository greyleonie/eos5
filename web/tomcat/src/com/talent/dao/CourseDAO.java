package com.talent.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;

import javax.xml.parsers.ParserConfigurationException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

import com.talent.dao.student.StudentDAO;
import com.talent.hibernate.Eosoperator;

//查询教师或者学生当天的课程
public class CourseDAO extends BaseDAO {

	public Element currentDateCourse(Document document, Eosoperator user, String year, String month)  throws ParserConfigurationException {
		Integer userType = null;
		Element courseList = null;
		String userId = "11";
		if (user != null) {
			userType = user.getUserTypeId();
			userId = user.getOperatorId().toString();
		}

		try {
			courseList = getMonthList(document,userId,userType,year,month);
			
		} catch (Exception e) { e.printStackTrace(); }

		return courseList;
	}

	public Element getMonthList(Document doc, String userid, Integer userType,String year, String month) throws Exception {
		Element calendarList = doc.createElement("calendarList");// 存储本月每天的日程安排
		// String param1 = (String)param.getParaObjectAt(1);//用户财号指安排谁的日程;
		// String param2 = (String)param.getParaObjectAt(1);//日程安排人指登录人;
		// String param3 = (String)param.getParaObjectAt(2);//年
		// String param4 = (String)param.getParaObjectAt(3);//月

		// Node param5 = (Node)param.getParaObjectAt(5);//所有当前登录用户所有安排人
		// Node param6 = (Node)param.getParaObjectAt(6);//查询当前用户所有的浏览权限人
		Calendar ca = Calendar.getInstance();
		if (year != null && month != null && !"".equalsIgnoreCase(year)
				&& !"".equalsIgnoreCase(month)
				&& !"null".equalsIgnoreCase(year)
				&& !"null".equalsIgnoreCase(month))
			ca.set(Integer.parseInt(year), Integer.parseInt(month) - 1, 1);// 通到条件得到年、月从第一天开始;
		else {
			ca.set(ca.get(Calendar.YEAR), ca.get(Calendar.MONTH), 1);// 当前月

		}
		// if("".equalsIgnoreCase(userid)||"null".equalsIgnoreCase(userid))//假如日程安排人为空默认为当前登录用户;
		// param1=param2;

		int maxdays = ca.getActualMaximum(Calendar.DAY_OF_MONTH);// 得到当前月的最大天数;
		System.out.println(maxdays);
		System.out.println(ca.get(4));// 得到当前周数;
		for (int i = 0; i < maxdays; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//Date weekdate = new Date(ca.getTime().getTime());
			String curTime = sdf.format(ca.getTime());
			Element day = doc.createElement("day");

			setTOOLS_CALENDARARRANGE(userid, userType, curTime, doc, day);// 查询安排的日程;

			calendarList.appendChild(day);
			ca.add(Calendar.DAY_OF_MONTH, 1);

		}
		// setArrangerMan(db,param2,param5,doc);//取所有日程安排权限的人;
		// setViewMan(db,param2,param6,doc);//取所有浏览权限的人;
		return calendarList;

	}

	private void setTOOLS_CALENDARARRANGE(String userId, Integer userType,
			String calendar, Document doc, Node day) throws Exception {
		Session session = null;
		//Date date = new Date();
	int typeRemark = 0;
		//String today = sdf.format(date);
		String sql = "select c.classDate,c.classTime,c.classNoon,c.courseTitle,c1.roomName from Course c,Room c1 where c.classRoomId=c1.roomId and "
				+ "datediff(dd,c.classDate,'" + calendar +"')=0 and ";

		if (userType != null && userType.equals("")) {
			typeRemark = userType.intValue();
		}
		if (typeRemark == 0) {// 如果是老师
			sql += " c.teachers='" + userId + "' or c.tutors='" + userId
					+ "' or c.tutors like '%," + userId
					+ ",%' or c.tutors like '%," + userId + "%'"
					+ " or c.attenders='" + userId
					+ "' or c.attenders like '%," + userId + ",%'"
					+ " or c.attenders like '%," + userId
					+ "%' or c.conventioneers='" + userId + "'"
					+ " or c.conventioneers like '%," + userId
					+ ",%' or c.conventioneers like '%," + userId + "%' group by c.classDate,c.classTime,c.classNoon,c.courseTitle,c1.roomName";
		} else {
			StudentDAO stuDao = new StudentDAO();
			Integer classId = stuDao.getClassIdByUserId(new Integer(userId));
			String strClassId = "";
			if (classId != null)
				strClassId = classId.toString();
			System.out.println("===========================classId:" + strClassId);
			sql += " c.classId='" + strClassId + "' group by c.classDate,c.classTime,c.classNoon,c.courseTitle,c1.roomName";
		}
		
		try {
			session = this.beginTransaction();
			Query q = session.createQuery(sql);
			
			System.out.println(q.list().size());
			Iterator itr = q.iterate();
			Text textseg;
			String cDate = "";
			String cTime = "";
			while (itr.hasNext()) {
				Element calendarCourse = doc.createElement("calendarCourse");
				Object[] object = (Object[]) itr.next();
				// CourseForm form=new CourseForm();
				cDate = object[0].toString();
				Element classDate = doc.createElement("classDate");
				textseg=doc.createTextNode(cDate);
				classDate.appendChild(textseg);
				cTime = object[1].toString();
				if (cDate.length() > 9) {
					cDate = cDate.substring(0, 10);
				}
				if (cTime.length() > 10) {
					cTime = cTime.substring(10, cTime.length());
				}
				Element classTime = doc.createElement("classTime");
				textseg=doc.createTextNode(cTime);
				classTime.appendChild(textseg);
				
				String cNoon = object[2].toString();
				if ("0".equals(cNoon)) {
					cNoon = "上午";
				} else if ("1".equals(cNoon)) {
					cNoon = "下午";
				} else if ("2".equals(cNoon)) {
					cNoon = "晚上";
				} else if ("3".equals(cNoon)) {
					cNoon = "全天";
				}
				
				Element classNoon = doc.createElement("classNoon");
				textseg=doc.createTextNode(cNoon);
				classNoon.appendChild(textseg);
				
				Element courseTitle = doc.createElement("courseTitle");
				textseg=doc.createTextNode(object[3].toString());
				courseTitle.appendChild(textseg);
				
				Element courseRoom = doc.createElement("courseRoom");
				textseg=doc.createTextNode(object[4].toString());
				courseRoom.appendChild(textseg);
				
				//新添加的节点
				//Element courseId = doc.createElement("courseId");
				//textseg=doc.createTextNode(object[5].toString());
				//courseId.appendChild(textseg);
				//System.out.println(textseg);
				
				calendarCourse.appendChild(classDate);
				calendarCourse.appendChild(classTime);
				calendarCourse.appendChild(classNoon);
				calendarCourse.appendChild(courseTitle);
				calendarCourse.appendChild(courseRoom);
				
				//calendarCourse.appendChild(courseId);
				
				day.appendChild(calendarCourse);
				// form.setClassTime(classTime);
				// form.setClassRoom(object[2].toString());
				// form.setCourseTitle(object[3].toString());
				// form.setIsUseKqj(((Integer)object[4]).intValue());
				// list.add(form);
			}

		} catch (Exception e) {
			System.out
					.println("==============currentDateCourse============errors:"
							+ e);
		}

		/***********************************************************************
		 * List dayList = new ArrayList(); String sqlstr = "select
		 * ScheduleID,convert(varchar(10),CALENDAR,102) ca,USERID,TASKSUM" +
		 * ",TASKCONTENT,ISREMIND,convert(varchar(16),AWOKETIME,120) awoke from
		 * Schedule where USERID="+param1+" and
		 * datediff(dd,CALENDAR,'"+calendar+"')=0 order by AWOKETIME ";
		 * System.out.println(sqlstr); Connection con = null; Statement st =
		 * null; ResultSet rs = null; try{ con = db.getConnection(); st =
		 * con.createStatement(); rs = st.executeQuery(sqlstr);
		 * 
		 * while(rs.next()){ Element TOOLS_CALENDARARRANGE =
		 * doc.createElement("TOOLS_CALENDARARRANGE"); Element ScheduleID =
		 * doc.createElement("ScheduleID");
		 * ScheduleID.setNodeValue(rs.getString("ScheduleID"));
		 * //XmlUtil.setNodeValue(ScheduleID,rs.getString("ScheduleID"));//序号;
		 * Element CALENDAR = doc.createElement("CALENDAR");
		 * //XmlUtil.setNodeValue(CALENDAR,rs.getString("ca"));//日期; Element
		 * USERID = doc.createElement("USERID");
		 * //XmlUtil.setNodeValue(USERID,rs.getString("USERID"));//用户财号; Element
		 * TASKSUM = doc.createElement("TASKSUM");
		 * //XmlUtil.setNodeValue(TASKSUM,rs.getString("TASKSUM"));//内容摘要;
		 * Element TASKCONTENT = doc.createElement("TASKCONTENT");
		 * //XmlUtil.setNodeValue(TASKCONTENT,rs.getString("TASKCONTENT"));//内容;
		 * Element AWOKETIME = doc.createElement("AWOKETIME");
		 * //XmlUtil.setNodeValue(AWOKETIME,rs.getString("awoke"));//提醒时间;
		 * TOOLS_CALENDARARRANGE.appendChild(ScheduleID);
		 * TOOLS_CALENDARARRANGE.appendChild(CALENDAR);
		 * TOOLS_CALENDARARRANGE.appendChild(USERID);
		 * TOOLS_CALENDARARRANGE.appendChild(TASKSUM);
		 * TOOLS_CALENDARARRANGE.appendChild(TASKCONTENT);
		 * TOOLS_CALENDARARRANGE.appendChild(AWOKETIME);
		 * day.appendChild(TOOLS_CALENDARARRANGE);
		 * 
		 * }//while
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * }catch(Exception ex){ ex.printStackTrace(); }finally{ if(rs!=null)
		 * rs.close(); if(st!=null) st.close(); if(con!=null) con.close();
		 *  }
		 **********************************************************************/

	}
}
