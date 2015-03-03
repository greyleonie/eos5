package tools.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import base.util.DBconnection;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-11-1
 * @class_displayName DeskInfo
 */

public class DeskInfo {
	private static Connection con = null;

	//private static Statement st=null;

	public static void queryDeskInfo(HttpServletRequest request, String userId,
			String username) {
		init();
		//queryMailRecords(request,userId);//查询邮件纪录
		//queryMsgRecords(request,userId);// 查询我的消息
		//queryNotice(request,userId);// 查询公告通知
		queryArrange(request, userId);//查询工作安排

		//queryNews(request,userId);//查询校园新闻
		queryCmpsNotice(request, userId);//查询校院通知
		queryMeetNotice(request, userId);//查询会议公告
		queryDpmtNotice(request, userId);//查询部门公告

		//queryYbWorkFlowItem(request,username);
		queryDbWorkFlowItem(request, username, userId);//待办事宜

		closeCon();
	}

	public static void queryDeskInfo(HttpServletRequest request, String userId,
			String username, String op) {
		if (op.equals("all")) {
			queryDeskInfo(request, userId, username);
		} else {
			init();
			if (op.equals("arrange")) {
				queryArrange(request, userId);
			}
			if (op.equals("cmpsNotice")) {
				queryCmpsNotice(request, userId);
			}
			if (op.equals("meetNotice")) {
				queryMeetNotice(request, userId);
			}
			if (op.equals("dpmtNotice")) {
				queryDpmtNotice(request, userId);
			}
			if (op.equals("dbWorkFlow")) {
				queryDbWorkFlowItem(request, username, userId);
			}
			if (op.equals("ybWorkFlow")) {
				queryYbWorkFlowItem(request, username, userId);
			}
			if (op.equals("researchWorkFlow")) {
				queryResearchWorkFlowItem(request, username, userId);
			}
			closeCon();
		}
	}

	//查询邮件纪录
	public static void queryMailRecords(HttpServletRequest request,
			String userId) {
		String sql = "SELECT  MAILID,TITLE,SENDDATE FROM TOOL_Mail where USERACCOUNT ='"
				+ userId + "' and MAILDIRID = 0 order by SENDDATE desc";
		ResultSet mailrs = null;
		ArrayList list = new ArrayList();
		int mailRecords = 0;

		int mailId;
		String title = "";
		String sendDate = "";

		try {
			Statement mailst = con.createStatement();

			mailrs = mailst.executeQuery(sql);

			while (mailrs != null && mailrs.next()) {
				if (mailRecords < 5) {
					mailId = mailrs.getInt("MAILID");
					title = mailrs.getString("TITLE");
					sendDate = mailrs.getString("SENDDATE");

					if (title == null)
						title = "";
					if (sendDate == null)
						sendDate = "";

					if (sendDate != null && sendDate.length() > 9) {
						sendDate = sendDate.substring(0, 10);
					}

					if (title.length() > 20) {
						title = title.substring(0, 20) + "..";
					}

					MailVo mailVo = new MailVo();
					mailVo.setMailId(mailId);
					mailVo.setTitle(title);
					mailVo.setSendDate(sendDate);

					list.add(mailVo);
				}
				mailRecords++;
			}

			if (mailst != null)
				mailst.close();

			request.setAttribute("mailList", list);
			request.setAttribute("mailRecords", String.valueOf(mailRecords));

		} catch (Exception e) {
			System.out.println("****queryMailRecords**********errors:" + e);
		}
	}

	//	查询我的消息
	public static void queryMsgRecords(HttpServletRequest request, String userId) {
		String sql = "select  MSGID,MSGTITLE,SENDDATE from innerNote where MSGTYPE = '2' and RECACCOUNT ='"
				+ userId + "' order by SENDDATE desc";
		ResultSet msgrs = null;
		ArrayList list = new ArrayList();
		int noticeRecords = 0;

		int msgId = 0;
		String title = "";
		String sendDate = "";

		try {
			Statement msgst = con.createStatement();

			msgrs = msgst.executeQuery(sql);

			while (msgrs != null && msgrs.next()) {
				if (noticeRecords < 5) {
					msgId = msgrs.getInt("MSGID");
					title = msgrs.getString("MSGTITLE");
					sendDate = msgrs.getString("SENDDATE");

					if (title == null)
						title = "";
					if (sendDate == null)
						sendDate = "";

					if (sendDate != null && sendDate.length() > 9) {
						sendDate = sendDate.substring(0, 10);
					}

					if (title.length() > 20) {
						title = title.substring(0, 20) + "..";
					}

					InnerNote innerNotice = new InnerNote();
					innerNotice.setMsgId(msgId);
					innerNotice.setTitle(title);
					innerNotice.setSendDate(sendDate);

					list.add(innerNotice);
				}
				noticeRecords++;
			}
			if (msgst != null)
				msgst.close();
			request.setAttribute("innerNoticeList", list);
			request.setAttribute("innerNoticeRecords", String
					.valueOf(noticeRecords));

		} catch (Exception e) {
			System.out.println("****queryMsgRecords**********errors:" + e);
		}
	}

	//	查询公告通知
	public static void queryNotice(HttpServletRequest request, String userId) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		String sql = "select  NoticeID,Title,CreateTime from Notice where "
				+ "(ReceiveIDs like '" + userId + ",%' or ReceiveIDs like '%,"
				+ userId + ",%' or ReceiveIDs like '%," + userId
				+ "' or ReceiveIDs = '" + userId + "')" + " and ValidTime <='"
				+ date + "' and InValidTime >='" + date
				+ "'  order by ValidTime desc";

		ResultSet noticers = null;
		ArrayList list = new ArrayList();
		int noticeRecords = 0;

		int noticeId = 0;
		String title = "";
		String createDate = "";

		try {
			Statement noticest = con.createStatement();

			noticers = noticest.executeQuery(sql);
			while (noticers != null && noticers.next()) {
				if (noticeRecords < 5) {
					noticeId = noticers.getInt("NoticeID");
					title = noticers.getString("Title");
					createDate = noticers.getString("CreateTime");

					if (title == null)
						title = "";
					if (createDate == null)
						createDate = "";

					if (createDate != null && createDate.length() > 9) {
						createDate = createDate.substring(0, 10);
					}

					if (title.length() > 20) {
						title = title.substring(0, 20) + "..";
					}

					Notice notice = new Notice();
					notice.setNoticeID(noticeId);
					notice.setTitle(title);
					notice.setCteateTime(createDate);

					list.add(notice);
				}
				noticeRecords++;
			}
			if (noticest != null)
				noticest.close();

			request.setAttribute("noticeList", list);
			request
					.setAttribute("noticeRecords", String
							.valueOf(noticeRecords));
		} catch (Exception e) {
			System.out.println("****queryNotice**********errors:" + e);
		}
	}

	//	查询工作安排
	public static void queryArrange(HttpServletRequest request, String userId) {
		String sql = "select top 5  ArrangeID,TASKSUM,CALENDAR from WorkArrange  where "
				+ " (BeArrangedIDs like '"
				+ userId
				+ ",%' or BeArrangedIDs like '%,"
				+ userId
				+ ",%' or BeArrangedIDs like '%,"
				+ userId
				+ "' or BeArrangedIDs = '"
				+ userId
				+ "')  order by CALENDAR desc";

//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String now = sdf.format(Calendar.getInstance().getTime());
//		String taskSQL = "select distinct tl.taskDate,tl.taskTime+'在'+tl.classRoom+'需要'+tl.task as task from (select TaskID,PlanType,PlanID,TaskDate,TaskTime,TaskNoon,ClassRoom,Class,Course,Explain,TaskName,Task,Director,Assistant,Remarks from (select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'考勤' as TaskName,'考勤' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '考勤' right join class cla on cla.classid = c.classid where c.isadopted=1 and c.isusekqj=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'开关电脑投影' as TaskName,'开关电脑投影' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '开关电脑投影'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseCourseWare=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'使用手提' as TaskName,'使用手提' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '使用手提'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseNotebookPC=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'拍花絮' as TaskName,'拍花絮' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '拍花絮'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsTakeFeature=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'使用数码' as TaskName,'使用数码' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '使用数码'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseCamera=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'全程摄像' as TaskName,'全程摄像' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '全程摄像'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseVideo=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'使用煤体' as TaskName,'使用煤体' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '使用煤体'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseMediaPlayer=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'开关音响,提供话筒' as TaskName,'提供'+CONVERT(nvarchar, c.RadioPhones )+'个有线麦克风,'+CONVERT(nvarchar, c.WiredPhones )+'个无线麦克风' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '%麦克风'right join class cla on cla.classid = c.classid where c.isadopted=1 and ((c.RadioPhones is not null and c.RadioPhones!=0) or ( c.WiredPhones is not null and c.WiredPhones!=0)) union all select t.TaskID as TaskID,'2'as PlanType,d.RecordID as PlanID,d.RecordDate as TaskDate,CONVERT (varchar(10), d.RecordTime  , 108) as TaskTime,d.RecordNoon as TaskNoon,d.ClassRooms as ClassRoom,d.Class as Class,d.CourseTitle as Course,d.Remarks as Explain,'开关电脑投影' as TaskName,'录象' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from distanceteaching d  left join centertask t on t.plantype=2 and t.planid=d.RecordID and t.task like '录象' where d.isrecord=1 union all select t.TaskID as TaskID,'2'as PlanType,d.RecordID as PlanID,d.RecordDate as TaskDate,CONVERT (varchar(10), d.RecordTime  , 108)  as TaskTime,d.RecordNoon as TaskNoon,d.ClassRooms as ClassRoom,d.Class as Class,d.CourseTitle as Course,d.Remarks as Explain,'媒体播放' as TaskName,'播放' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from distanceteaching d  left join centertask t on t.plantype=2 and t.planid=d.RecordID and t.task like '播放' where d.isplay=1 or d.islive=1 union all select t.TaskID as TaskID,'3'as PlanType,c.PlanID as PlanID,c.PlanDate as TaskDate,CONVERT (varchar(10), c.PlanTime  , 108)  as TaskTime,c.PlanNoon as TaskNoon,c.ClassRoom as ClassRoom,c.Class as Class,c.Task as Course,c.Remarks as Explain,'党校工作' as TaskName,(SELECT businName FROM BNDICT_T_Dictionary WHERE businTypeID = 'dx_workType' and businid=c.WorkType) as Task,(select operatorname from eosoperator where operatorid=c.Director) as Director,(select operatorname from eosoperator where operatorid like SUBSTRING ( c.Assistant, 2, len(c.Assistant)-2 )) as Assistant,t.Remarks as Remarks from centerplan c  left join centertask t on t.plantype=1 and t.planid=c.PlanID and t.task like c.worktype) as task where TaskDate = '"
//				+ now
//				+ "') tl left join (select * from TaskType where isUse = 1) tt on tl.taskName=tt.taskName where tl.director=(select top 1 operatorName from eosoperator where operatorID="
//				+ userId
//				+ ") or tl.assistant=(select top 1 operatorName from eosoperator where operatorID="
//				+ userId
//				+ ") or tt.director=(select top 1 operatorName from eosoperator where operatorID="
//				+ userId
//				+ ") or tt.assistant=(select top 1 operatorName from eosoperator where operatorID="
//				+ userId + ")";

		ResultSet arrangers = null;
		ArrayList list = new ArrayList();

		int arrangeId = 0;
		String taskSum = "";
		String calendar = "";
		int arrangeRecords = 0;

		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}
			Statement arrangest = con.createStatement();

//			arrangers = arrangest.executeQuery(taskSQL);
//			while (arrangers != null && arrangers.next()) {
//				if (arrangeRecords < 5) {
//					Arrange arrange = new Arrange();
//					arrange.setArrangeId(0);
//					arrange.setTaskSum(arrangers.getString(2));
//					String tmp = arrangers.getString(1);
//					int index = tmp.indexOf(" ");
//					tmp = tmp.substring(0, index);
//					arrange.setCalendar(tmp);
//					list.add(arrange);
//				}
//			}

			arrangers = arrangest.executeQuery(sql);

			while (arrangers != null && arrangers.next()) {
				if (arrangeRecords < 5) {
					arrangeId = arrangers.getInt("ArrangeID");
					taskSum = arrangers.getString("TASKSUM");
					calendar = arrangers.getString("CALENDAR");

					if (taskSum == null)
						taskSum = "";
					if (calendar == null)
						calendar = "";

					if (calendar != null && calendar.length() > 9) {
						calendar = calendar.substring(0, 10);
					}

					if (taskSum.length() > 20) {
						taskSum = taskSum.substring(0, 20) + "..";
					}

					Arrange arrange = new Arrange();
					arrange.setArrangeId(arrangeId);
					arrange.setTaskSum(taskSum);
					arrange.setCalendar(calendar);

					list.add(arrange);
				}
				arrangeRecords++;
			}
			if (arrangest != null)
				arrangest.close();

			request.setAttribute("arrangeList", list);
			request.setAttribute("arrangeRecords", String
					.valueOf(arrangeRecords));
		} catch (Exception e) {
			System.out.println("****queryArrange**********errors:" + e);
		}
	}

	//待办事宜
	public static void queryDbWorkFlowItem(HttpServletRequest request,
			String userID, String operatorID) {

		List list = new ArrayList();
		String processDefName = "";
		String dbWorkfolwSql = "select flowID,title,convert(nvarchar(10),flowDate,126) as flowDate,type,channelID,typeFlag from ( ";
		//int i = 0;
		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}
			for (int k = 0; k < 20; k++) {
				String flowsql = "";
				switch (k) {
				case 0:
					flowsql = "select sendID as flowID,archiveTitle as title,sendDate as flowDate,participant,passParticipant,'SendArchive' as type ,'0' as channelID ,'0' as typeFlag from SendArchive ";
					processDefName = "oa.wf.sendAchive";
					break;
				case 1:
					flowsql = "select receiveID,archiveTitle,archiveDate,participant,passParticipant,'ReceiveArchive' ,'0' as channelID ,'0' as typeFlag from ReceiveArchive";
					processDefName = "oa.wf.receiveAchive";
					break;
				case 2:
					flowsql = "select PURCHASEID,'用品采购申请',PURCHASEDATE,participant,passParticipant,'COMM_PURCHASE' ,'0' as channelID ,'0' as typeFlag from COMM_PURCHASE ";
					processDefName = "oa.wf.thingsPurchase";
					break;
				case 3:
					flowsql = "select STOREOUTID,'用品领用申请',PURCHASEDATE,participant,passParticipant,'COMM_STOREOUT' ,'0' as channelID ,'0' as typeFlag from COMM_STOREOUT";
					processDefName = "oa.wf.thingsStoreOut";
					break;
				case 4:
					flowsql = "select PURCHASEID,'资产采购申请',PURCHASEDATE,participant,passParticipant,'CAPT_PURCHASE' ,'0' as channelID ,'0' as typeFlag from CAPT_PURCHASE";
					processDefName = "oa.wf.assetsPurchase";
					break;
				case 5:
					flowsql = "select WRITEOFFID,'资产报废申请',WRITEOFFDATE,participant,passParticipant,'CAPT_WRITEOFF' ,'0' as channelID ,'0' as typeFlag from CAPT_WRITEOFF";
					processDefName = "oa.wf.assetsWriteOff";
					break;
				case 6:
					flowsql = "select RequestID,'用车申请',OutTime,participant,passParticipant,'UseCarRequest' ,'0' as channelID ,'0' as typeFlag from UseCarRequest";
					processDefName = "oa.wf.useCarRequest";
					break;
				case 7:
					flowsql = "select RequestID,'费用报销',ClaimDate,participant,passParticipant,'CostClaim' ,'0' as channelID ,'0' as typeFlag from CostClaim";
					processDefName = "oa.wf.costClaim";
					break;
				case 8:
					flowsql = "select RequestID,'差旅费报销',ClaimDate,participant,passParticipant,'TravelCostClaim' ,'0' as channelID ,'0' as typeFlag from TravelCostClaim";
					processDefName = "oa.wf.travelCostClaim";
					break;
				case 9:
					flowsql = "select RequestID,'借款审批',ConsumDate,participant,passParticipant,'BorrowRequest' ,'0' as channelID ,'0' as typeFlag from BorrowRequest";
					processDefName = "oa.wf.borrowRequest";
					break;
				case 10:
					flowsql = "select RequestID,'领用支票审批',ConsumDate,participant,passParticipant,'CheckRequest' ,'0' as channelID ,'0' as typeFlag from CheckRequest";
					processDefName = "oa.wf.checkRequest";
					break;
				case 11:
					flowsql = "select APPLYID,ISNULL(TOPIC,MeetingName),APPLYDATE,participant,passParticipant,'MR_APPLY' ,'0' as channelID ,'0' as typeFlag from MR_APPLY";
					processDefName = "oa.wf.mrApply";
					break;
				case 12:
					flowsql = "select RequestID, TiTle, CreateTime, participant,passParticipant, 'OmmApply' ,'0' as channelID ,'0' as typeFlag from OMM_Request ";
					processDefName = "OMM.wf.ommApply";
					break;
				////////////////
				case 13:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchCity' ,channelID ,typeFlag from WCMMetaTableCityPaperApp ";
					processDefName = "Research.wf.wfResearchCity";
					break;
				case 14:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchCountry' ,channelID ,typeFlag from WCMMetaTablecountryPaperApp ";
					processDefName = "Research.wf.wfResearchCountry";
					break;
				case 15:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchProvince' ,channelID ,typeFlag from WCMMetaTableProvincePaperApp ";
					processDefName = "Research.wf.wfResearchProvince";
					break;
				case 16:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchDXSystem' ,channelID ,typeFlag from WCMMetaTableschoolPaperApp ";
					processDefName = "Research.wf.wfResearchDXSystem";
					break;
				case 17:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchOther' ,channelID ,typeFlag from WCMMetaTableDschoolPaperApp ";
					processDefName = "Research.wf.wfResearchOther";
					break;
				case 18:
					flowsql = "select MetaDataId, title, CrTime, participant,passParticipant, 'wfProject' ,channelID ,'proBuild' from WCMMetaTablePaperBuild ";
					processDefName = "Research.wf.wfProject";
					break;
				case 19:
					flowsql = "select MetaDataId, papertitle=isnull(papertitle,''), CrTime, participant,passParticipant, 'wfFunding' ,channelID ,typeFlag from WCMMetaTableAccountExpense ";
					processDefName = "Research.wf.wfFunding";
					break;
				}
				flowsql += " where  (participant='" + userID
						+ "' or participant like '" + userID
						+ ",%' or participant like '%," + userID
						+ ",%' or participant like '%," + userID + "') ";

				String wfprocesssql = "select processDefID from WFProcessDefine where processDefName = '"
						+ processDefName + "'";
				Statement dbst = con.createStatement();
				ResultSet dbrs = dbst.executeQuery(wfprocesssql);
				while (dbrs.next()) {
					String processDefID = dbrs.getString("processDefID");
					String wfpgentsql = "select  w.agentFrom from WFAgent w  where  w.state = 1  and w.startTime < getDate() and w.endTime >getDate() ";
					wfpgentsql += " and w.agentTo = '" + operatorID + "' ";
					wfpgentsql += "and (w.processDefID = '0' or (w.processDefID = '"
							+ processDefID
							+ "' or w.processDefID like '"
							+ processDefID
							+ ",%' or w.processDefID like '%,"
							+ processDefID
							+ ",%' or w.processDefID like '%,"
							+ processDefID + "' )) ";
					Statement dbst0 = con.createStatement();
					ResultSet dbrs0 = dbst0.executeQuery(wfpgentsql);
					while (dbrs0.next()) {
						String agentFrom = dbrs0.getString("agentFrom");
						if (agentFrom != null && !agentFrom.equals("")) {
							flowsql += " or (participant='" + agentFrom
									+ "' or participant like '" + agentFrom
									+ ",%' or participant like '%," + agentFrom
									+ ",%' or participant like '%," + agentFrom
									+ "') ";
						}
					}
					if (dbrs0 != null)
						dbrs0.close();
					if (dbst0 != null)
						dbst0.close();

				}
				if (dbrs != null)
					dbrs.close();
				if (dbst != null)
					dbst.close();
				dbWorkfolwSql += flowsql + " union ";

			}
			dbWorkfolwSql = dbWorkfolwSql.substring(0,
					dbWorkfolwSql.length() - 6);
			dbWorkfolwSql += ") WorkFlow order by flowDate desc";
			//System.out.println(">>>>>>>>>>>>>>>>>>>dbWorkfolwSql>>>>>>>>>"+
			// dbWorkfolwSql);
			Statement dbst2 = con.createStatement();
			ResultSet dbrs2 = dbst2.executeQuery(dbWorkfolwSql);

			int k = 0;

			while (dbrs2.next()) {
				k++;
				if (k <= 5) {
					WorkFlowData ybWorkFlowData = new WorkFlowData();
					String flowID = dbrs2.getString("flowID");
					String title = dbrs2.getString("title");
					String flowDate = dbrs2.getString("flowDate");
					String channelID = dbrs2.getString("channelID");
					String typeFlag = dbrs2.getString("typeFlag");
					//String participant = rs.getString("participant");
					//String passParticipant = rs.getString("passParticipant");
					String type = dbrs2.getString("type");
					ybWorkFlowData.setFlowID(flowID);
					ybWorkFlowData.setTitle(title);
					ybWorkFlowData.setFlowDate(flowDate);
					ybWorkFlowData.setChannelID(channelID);
					ybWorkFlowData.setTypeFlag(typeFlag);
					//ybWorkFlowData.setParticipant(participant);
					//ybWorkFlowData.setPassParticipant(passParticipant);
					ybWorkFlowData.setType(type);
					list.add(ybWorkFlowData);
				}
				//					if(k>=6){
				//						rs2.last();
				//						k = rs2.getRow();
				//						break;
				//					}
			}
			if (dbrs2 != null)
				dbrs2.close();
			if (dbst2 != null)
				dbst2.close();
			request.setAttribute("dbWorkFlowList", list);
			request.setAttribute("dbWorkFlowRecords", String.valueOf(k));
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	//待办事宜
	public static void queryResearchWorkFlowItem(HttpServletRequest request,
			String userID, String operatorID) {

		List list = new ArrayList();
		String processDefName = "";
		String dbWorkfolwSql = "select flowID,ltrim(rtrim(title)) as title,convert(nvarchar(10),flowDate,126) as flowDate,type,channelID,typeFlag from ( ";
		//int i = 0;
		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}
			for (int k = 0; k < 7; k++) {
				String flowsql = "";
				switch (k) {
				case 0:
					flowsql = "select MetaDataId as flowID, A_Title as title, CrTime as flowDate, participant,passParticipant, 'wfResearchCity' as type,channelID ,typeFlag from WCMMetaTableCityPaperApp ";
					processDefName = "Research.wf.wfResearchCity";
					break;
				case 1:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchCountry' ,channelID ,typeFlag from WCMMetaTablecountryPaperApp ";
					processDefName = "Research.wf.wfResearchCountry";
					break;
				case 2:
					flowsql = "select MetaDataId, A_Title, CrTime, participant,passParticipant, 'wfResearchProvince' ,channelID ,typeFlag from WCMMetaTableProvincePaperApp ";
					processDefName = "Research.wf.wfResearchProvince";
					break;
				case 3:
					flowsql = "select MetaDataId, A_Title=isnull(A_Title,''), CrTime, participant,passParticipant, 'wfResearchDXSystem' ,channelID ,typeFlag from WCMMetaTableschoolPaperApp ";
					processDefName = "Research.wf.wfResearchDXSystem";
					break;
				case 4:
					flowsql = "select MetaDataId, A_Title=isnull(A_Title,''), CrTime, participant,passParticipant, 'wfResearchOther' ,channelID ,typeFlag from WCMMetaTableDschoolPaperApp ";
					processDefName = "Research.wf.wfResearchOther";
					break;
				case 5:
					flowsql = "select MetaDataId, papername, CrTime, participant,passParticipant, 'wfProject' ,channelID ,'proBuild' from WCMMetaTablePaperBuild ";
					processDefName = "Research.wf.wfProject";
					break;
				case 6:
					flowsql = "select MetaDataId, papertitle=isnull(papertitle,''), CrTime, participant,passParticipant, 'wfFunding' ,channelID ,typeFlag from WCMMetaTableAccountExpense ";
					processDefName = "Research.wf.wfFunding";
					break;
				}
				flowsql += " where  (participant='" + userID
						+ "' or participant like '" + userID
						+ ",%' or participant like '%," + userID
						+ ",%' or participant like '%," + userID + "') ";

				String wfprocesssql = "select processDefID from WFProcessDefine where processDefName = '"
						+ processDefName + "'";
				Statement dbst = con.createStatement();
				ResultSet dbrs = dbst.executeQuery(wfprocesssql);
				while (dbrs.next()) {
					String processDefID = dbrs.getString("processDefID");
					String wfpgentsql = "select  w.agentFrom from WFAgent w  where  w.state = 1  and w.startTime < getDate() and w.endTime >getDate() ";
					wfpgentsql += " and w.agentTo = '" + operatorID + "' ";
					wfpgentsql += "and (w.processDefID = '0' or (w.processDefID = '"
							+ processDefID
							+ "' or w.processDefID like '"
							+ processDefID
							+ ",%' or w.processDefID like '%,"
							+ processDefID
							+ ",%' or w.processDefID like '%,"
							+ processDefID + "' )) ";
					Statement dbst0 = con.createStatement();
					ResultSet dbrs0 = dbst0.executeQuery(wfpgentsql);
					while (dbrs0.next()) {
						String agentFrom = dbrs0.getString("agentFrom");
						if (agentFrom != null && !agentFrom.equals("")) {
							flowsql += " or (participant='" + agentFrom
									+ "' or participant like '" + agentFrom
									+ ",%' or participant like '%," + agentFrom
									+ ",%' or participant like '%," + agentFrom
									+ "') ";
						}
					}
					if (dbrs0 != null)
						dbrs0.close();
					if (dbst0 != null)
						dbst0.close();

				}
				if (dbrs != null)
					dbrs.close();
				if (dbst != null)
					dbst.close();
				dbWorkfolwSql += flowsql + " union ";

			}
			dbWorkfolwSql = dbWorkfolwSql.substring(0,
					dbWorkfolwSql.length() - 6);
			dbWorkfolwSql += ") WorkFlow order by flowDate desc";
			//System.out.println(">>>>>>>>>>>>>>>>>>>dbWorkfolwSql>>>>>>>>>"+
			// dbWorkfolwSql);
			Statement dbst2 = con.createStatement();
			ResultSet dbrs2 = dbst2.executeQuery(dbWorkfolwSql);

			int k = 0;

			while (dbrs2.next()) {
				k++;
				//if (k <= 6) {
				WorkFlowData ybWorkFlowData = new WorkFlowData();
				String flowID = dbrs2.getString("flowID");
				String title = dbrs2.getString("title");
				String flowDate = dbrs2.getString("flowDate");
				String channelID = dbrs2.getString("channelID");
				String typeFlag = dbrs2.getString("typeFlag");
				//String participant = rs.getString("participant");
				//String passParticipant = rs.getString("passParticipant");
				String type = dbrs2.getString("type");
				ybWorkFlowData.setFlowID(flowID);
				ybWorkFlowData.setTitle(title);
				ybWorkFlowData.setFlowDate(flowDate);
				ybWorkFlowData.setChannelID(channelID);
				ybWorkFlowData.setTypeFlag(typeFlag);
				//ybWorkFlowData.setParticipant(participant);
				//ybWorkFlowData.setPassParticipant(passParticipant);
				ybWorkFlowData.setType(type);
				list.add(ybWorkFlowData);
				//}
				//					if(k>=6){
				//						rs2.last();
				//						k = rs2.getRow();
				//						break;
				//					}
			}
			if (dbrs2 != null)
				dbrs2.close();
			if (dbst2 != null)
				dbst2.close();
			request.setAttribute("researchWorkFlowList", list);
			request.setAttribute("researchWorkFlowRecords", String.valueOf(k));
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public static String getUserName(String username) {
		String sql = "select operatorName from EOSOperator where userId='"
				+ username + "'";
		ResultSet rs = null;
		String userName = null;
		try {
			Statement s = con.createStatement();
			rs = s.executeQuery(sql);
			if (rs.next()) {
				userName = rs.getString("operatorName");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userName;
	}

	//已办事宜
	public static void queryYbWorkFlowItem(HttpServletRequest request,
			String username, String userid) {
		String name = DeskInfo.getUserName(username);
		String sql = "select flowID,title,convert(nvarchar(10),flowDate,126) as flowDate,type from YBWorkFlowView where  (passParticipant like '%:"
				+ username
				+ ":%') and not  (participant='"
				+ name
				+ "' or participant like '"
				+ name
				+ ",%' or participant like '%,"
				+ name
				+ ",%' or participant like '%,"
				+ name
				+ "') order by FlowDate desc";
		ResultSet ybrs = null;
		ArrayList list = new ArrayList();

		//int i=0;
		try {
			Statement ybst = con.createStatement();
			ybrs = ybst.executeQuery(sql);
			int k = 0;

			while (ybrs != null && ybrs.next()) {
				k++;
				if (k <= 5) {
					WorkFlowData ybWorkFlowData = new WorkFlowData();
					String flowID = ybrs.getString("flowID");
					String title = ybrs.getString("title");
					String flowDate = ybrs.getString("flowDate");
					//String participant = rs.getString("participant");
					//String passParticipant = rs.getString("passParticipant");
					String type = ybrs.getString("type");
					ybWorkFlowData.setFlowID(flowID);
					ybWorkFlowData.setTitle(title);
					ybWorkFlowData.setFlowDate(flowDate);
					//ybWorkFlowData.setParticipant(participant);
					//ybWorkFlowData.setPassParticipant(passParticipant);
					ybWorkFlowData.setType(type);
					list.add(ybWorkFlowData);
				}
				//				if(k>=6){
				//					rs.last();
				//					k = rs.getRow();
				//					break;
				//				}
			}
			if (ybrs != null)
				ybrs.close();
			if (ybst != null)
				ybst.close();

			request.setAttribute("ybWorkFlowList", list);
			request.setAttribute("ybWorkFlowRecords", String.valueOf(k));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//所有日程时间
	public static void queryAllCaledar(HttpServletRequest request,
			String operatorID) {

		String sql = "select distinct convert(nvarchar(10),CALENDAR,126) as CALENDAR from Schedule where UserID = '"
				+ operatorID + "'";
		ResultSet caledars = null;
		ArrayList list = new ArrayList();

		try {
			init();
			Statement caledast = con.createStatement();
			caledars = caledast.executeQuery(sql);

			while (caledars != null && caledars.next()) {
				String calendarDate = caledars.getString("CALENDAR");
				list.add(calendarDate);
			}
			if (caledast != null)
				caledast.close();
			request.setAttribute("calendarDateList", list);

			closeCon();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//查询日程安排
	public static void queryWorkArrange(HttpServletRequest request,
			String arrangeDate, String userId) {
		//	System.out.print("******************arrangeDate:"+arrangeDate);
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);

		if (arrangeDate == null || arrangeDate.equals(""))
			arrangeDate = date;
		String sql = "select top 2 ScheduleID,TASKSUM,TASKCONTENT from Schedule where USERID = '"
				+ userId + "' and CALENDAR = '" + arrangeDate + "'";
		ResultSet workArrangers = null;

		int id = 0;
		String taskSum = "";
		String taskContent = "";
		int workArrangeRecords = 0;
		ArrayList workArrangeList = new ArrayList();

		try {
			init();
			Statement workArrangest = con.createStatement();
			workArrangers = workArrangest.executeQuery(sql);

			while (workArrangers != null && workArrangers.next()) {
				id = workArrangers.getInt("ScheduleID");
				taskSum = workArrangers.getString("TASKSUM");
				taskContent = workArrangers.getString("TASKCONTENT");

				if (taskSum == null) {
					taskSum = "";
				}
				if (taskContent == null) {
					taskContent = "";
				}
				WorkArrange workArrange = new WorkArrange();
				workArrange.setId(id);
				workArrange.setTaskSum(taskSum);
				workArrange.setTaskContent(taskContent);

				workArrangeList.add(workArrange);
				workArrangeRecords++;
			}
			if (workArrangest != null)
				workArrangest.close();
			closeCon();

			request.setAttribute("arrangeDate", arrangeDate);
			request.setAttribute("workArrangeList", workArrangeList);
			request.setAttribute("workArrangeRecords", String
					.valueOf(workArrangeRecords));

		} catch (Exception e) {

			System.out.println("****queryWorkArrange***********errors:" + e);
		}

	}

	//	查询校园新闻
	public static void queryNews(HttpServletRequest request, String userId) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		String sql = "select top 5 NewsID,Title,PublishDate from News where Columns='校园新闻' order by PublishDate desc,NewsID desc";
		String cql = "select count(*) as totle from News where Columns='校园新闻'";
		ResultSet newsrs = null;
		ResultSet totle = null;
		ArrayList list = new ArrayList();
		String newsRecords = "";
		int noticeId = 0;
		String title = "";
		String createDate = "";

		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}

			Statement newsst = con.createStatement();
			Statement newsst1 = con.createStatement();
			totle = newsst1.executeQuery(cql);
			newsrs = newsst.executeQuery(sql);

			while (totle != null && totle.next()) {
				newsRecords = totle.getString("totle");
			}
			while (newsrs != null && newsrs.next()) {
				noticeId = newsrs.getInt("NewsID");
				title = newsrs.getString("Title");
				createDate = newsrs.getString("PublishDate");

				if (title == null)
					title = "";
				if (createDate == null)
					createDate = "";

				if (createDate != null && createDate.length() > 9) {
					createDate = createDate.substring(0, 10);
				}

				if (title.length() > 20) {
					title = title.substring(0, 20) + "..";
				}

				Notice notice = new Notice();
				notice.setNoticeID(noticeId);
				notice.setTitle(title);
				notice.setCteateTime(createDate);

				list.add(notice);
			}
			if (newsst != null)
				newsst.close();

			request.setAttribute("newsList", list);
			request.setAttribute("newsRecords", newsRecords);
		} catch (Exception e) {
			System.out.println("****queryNews**********errors:" + e);
		} finally {
			closeCon();
		}
	}

	//	查询校院通知
	public static void queryCmpsNotice(HttpServletRequest request, String userId) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		String sql = "select top 13 NewsID,Title,PublishDate from News where Columns='校院通知' order by PublishDate desc,NewsID desc";
		String cql = "select count(*) as totle from News where Columns='校院通知'";
		ResultSet cmpsrs = null;
		ArrayList list = new ArrayList();
		ResultSet totle = null;
		int noticeId = 0;
		String title = "";
		String createDate = "";
		String cmpsNoticeRecords = "";
		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}
			Statement cmpsst = con.createStatement();

			cmpsrs = cmpsst.executeQuery(sql);
			Statement newsst1 = con.createStatement();
			totle = newsst1.executeQuery(cql);
			while (totle != null && totle.next()) {
				cmpsNoticeRecords = totle.getString("totle");
			}
			while (cmpsrs != null && cmpsrs.next()) {
				noticeId = cmpsrs.getInt("NewsID");
				title = cmpsrs.getString("Title");
				createDate = cmpsrs.getString("PublishDate");

				if (title == null)
					title = "";
				if (createDate == null)
					createDate = "";

				if (createDate != null && createDate.length() > 9) {
					createDate = createDate.substring(0, 10);
				}

				if (title.length() > 20) {
					title = title.substring(0, 20) + "..";
				}

				Notice notice = new Notice();
				notice.setNoticeID(noticeId);
				notice.setTitle(title);
				notice.setCteateTime(createDate);

				list.add(notice);
			}
			if (cmpsst != null)
				cmpsst.close();

			request.setAttribute("cmpsNoticeList", list);
			request.setAttribute("cmpsNoticeRecords", cmpsNoticeRecords);
		} catch (Exception e) {
			System.out.println("****queryCmpsNotice**********errors:" + e);
		} finally {
			closeCon();
		}
	}

	//	查询会议公告
	public static void queryMeetNotice(HttpServletRequest request, String userId) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		String sql = "select top 5 NewsID,Title,PublishDate from News where Columns='会议公告' order by PublishDate desc,NewsID desc";
		String cql = "select count(*) as totle from News where Columns='会议公告'";
		ResultSet meetrs = null;
		ArrayList list = new ArrayList();
		ResultSet totle = null;
		int noticeId = 0;
		String title = "";
		String createDate = "";
		String meetNoticeRecords = "";

		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}
			Statement meetst = con.createStatement();

			meetrs = meetst.executeQuery(sql);
			Statement newsst1 = con.createStatement();
			totle = newsst1.executeQuery(cql);
			while (totle != null && totle.next()) {
				meetNoticeRecords = totle.getString("totle");
			}
			while (meetrs != null && meetrs.next()) {
				noticeId = meetrs.getInt("NewsID");
				title = meetrs.getString("Title");
				createDate = meetrs.getString("PublishDate");

				if (title == null)
					title = "";
				if (createDate == null)
					createDate = "";

				if (createDate != null && createDate.length() > 9) {
					createDate = createDate.substring(0, 10);
				}

				if (title.length() > 20) {
					title = title.substring(0, 20) + "..";
				}

				Notice notice = new Notice();
				notice.setNoticeID(noticeId);
				notice.setTitle(title);
				notice.setCteateTime(createDate);

				list.add(notice);
			}
			if (meetst != null)
				meetst.close();

			request.setAttribute("meetNoticeList", list);
			request.setAttribute("meetNoticeRecords", meetNoticeRecords);
		} catch (Exception e) {
			System.out.println("****queryMeetNotice**********errors:" + e);
		} finally {
			closeCon();
		}
	}

	//	查询部门公告
	public static void queryDpmtNotice(HttpServletRequest request, String userId) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		String sql = "select top 5 NewsID,Title,PublishDate from News where Columns='部门公告' order by PublishDate desc,NewsID desc";
		String cql = "select count(*) as totle from News where Columns='部门公告'";
		ResultSet dpmtrs = null;
		ArrayList list = new ArrayList();
		int noticeRecords = 0;
		ResultSet totle = null;
		int noticeId = 0;
		String title = "";
		String createDate = "";
		String dpmtNoticeRecords = "";

		try {
			if (con.isClosed()) {
				DBconnection db = new DBconnection();
				DeskInfo.con = db.getConnection();
			}
			Statement dpmtst = con.createStatement();

			dpmtrs = dpmtst.executeQuery(sql);
			Statement newsst1 = con.createStatement();
			totle = newsst1.executeQuery(cql);
			while (totle != null && totle.next()) {
				dpmtNoticeRecords = totle.getString("totle");
			}
			while (dpmtrs != null && dpmtrs.next()) {
				noticeId = dpmtrs.getInt("NewsID");
				title = dpmtrs.getString("Title");
				createDate = dpmtrs.getString("PublishDate");

				if (title == null)
					title = "";
				if (createDate == null)
					createDate = "";

				if (createDate != null && createDate.length() > 9) {
					createDate = createDate.substring(0, 10);
				}

				if (title.length() > 20) {
					title = title.substring(0, 20) + "..";
				}

				Notice notice = new Notice();
				notice.setNoticeID(noticeId);
				notice.setTitle(title);
				notice.setCteateTime(createDate);

				list.add(notice);
			}
			if (dpmtst != null)
				dpmtst.close();

			request.setAttribute("dpmtNoticeList", list);
			request.setAttribute("dpmtNoticeRecords", dpmtNoticeRecords);
		} catch (Exception e) {
			System.out.println("****queryDpmtNotice**********errors:" + e);
		} finally {
			closeCon();
		}
	}

	//连接数据库
	public static void init() {
		try {
			DBconnection db = new DBconnection();
			DeskInfo.con = db.getConnection();
			//	DeskInfo.st=DeskInfo.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

		} catch (Exception e) {
			System.out.println("=========init============errors:" + e);
		}
	}

	//关闭数据库相关的连接
	public static void closeCon() {//关闭连接
		try {
			if (DeskInfo.con != null)
				DeskInfo.con.close();
			//	if(DeskInfo.st!=null)DeskInfo.st.close();
		} catch (Exception e) {
			System.out.println("=========closeCon============errors:" + e);
		}
	}

}