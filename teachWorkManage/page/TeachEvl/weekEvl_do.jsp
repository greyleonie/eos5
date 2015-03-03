<%@include file="/internet/common.jsp"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="base.util.DBconnection"%>
<%@page import="talent.core.TalentFunctions"%>

<%
  int i=0,j=0,k=0,studentID=0,times=1,status=1;
  String classID = request.getParameter("classID");
  String evlId = request.getParameter("evaluationID");
  String begin = request.getParameter("begin");
  String end = request.getParameter("end");
  String week = request.getParameter("week");
  String studentIds = "",url="";
try {

  //连接数据库
  DBconnection testdb = new DBconnection();
  Connection conn = testdb.getConnection();
  conn.setAutoCommit(false);
  
  if (!"".equals(request.getParameter("studentID"))) studentID=Integer.parseInt(request.getParameter("studentID"));
  if (request.getParameter("times") != null) times=Integer.parseInt(request.getParameter("times"));
  
  for (int time=0;time<times;time++) {
  //读取学员ID
      java.sql.Statement sstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
       String ssql = "select top 1 studentID,classid from student where classid=" + classID
                    + " and studentid not in (select distinct studentid from AssignMark where ClassID =" + classID
                    + " AND EvaluationID = " + evlId + ") order by studentid asc";
        System.out.println(ssql);
        ResultSet students = sstmt.executeQuery(ssql);
       while (students!=null & students.next()) {
            studentID = students.getInt(1);
        }
       if (studentIds.indexOf(new Integer(studentID).toString())<0) studentIds += studentID + ",";
        System.out.println("录入学员ID  ： " + studentID);
        
  if (studentID != 0) {
  //读取辅导课信息
  java.sql.Statement cstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  String sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,ISNULL(a.Teachers,'') TeacherID,"
      + "(select ISNULL(operatorName,'') from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) as TeacherName "
      + "from Course a where a.IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.ClassID=" + classID + " and a.TeahchingModelID in "
      + "(select EducatingModeID from EducatingMode where modeType='辅导') "
      + "and (a.ClassDate between '"+ begin +"' and '" + end + "')";
  ResultSet courses = cstmt.executeQuery(sql);
  while (courses != null && courses.next()) {
     int cid = courses.getInt("CourseID");
     int tid = -2;
     if (courses.getString("TeacherID") != null && !"".equals(courses.getString("TeacherID"))) tid = new Integer(courses.getString("TeacherID")).intValue();
     
     //选项入库
     j=0;
     java.sql.Statement istmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlId + " and CourseType='辅导' Order By OrderNO";
     ResultSet items = istmt.executeQuery(sql);
     while (items != null && items.next()) {
        k=0;
       int itemId = items.getInt("ItemID");
        
        java.sql.Statement lstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
        ResultSet levels = lstmt.executeQuery(sql);
       while (levels != null && levels.next()) {
          int levId = levels.getInt("LevelID");
           String objname = "f" + i + "_i" + j + "_l" + k;
           if (request.getParameter(objname) != null) {
            int marksize = 0;
              java.sql.Statement mstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
              sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and ItemID=" + itemId+ " and StudentID=" + studentID;
              ResultSet marks = mstmt.executeQuery(sql);
              if (marks != null) {
                    marks.last();
                    marksize = marks.getRow();
                    marks.beforeFirst();
                }
              if (marksize > 0) {
                 while (marks.next()) {
                    int assignId = marks.getInt("AssignID");
                       sql = "update AssignMark set LevelID=" + levId + ",isNews=1 where AssignID=" + assignId;
                       java.sql.Statement updatestmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                       System.out.println(sql);
                    try {
                          updatestmt.executeUpdate(sql);
                       } catch (Exception e) {
                          conn.rollback();
                          e.printStackTrace();
                       } finally {
                          conn.commit();
                       }
                   }
              } else {
                 java.sql.Statement mistmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 sql = "select IsNull(Max(AssignID),0)+1 as maxid from AssignMark";
                 ResultSet ids = mistmt.executeQuery(sql);
               while (ids != null && ids.next()) {
                  int maxid = ids.getInt(1);
                     sql = "Insert Into AssignMark Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+tid+","+cid+","+studentID+",1)";
                     java.sql.Statement insertstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                     System.out.println(sql);
                  try {
                        insertstmt.executeUpdate(sql);
                     } catch (Exception e) {
                        conn.rollback();
                        e.printStackTrace();
                     } finally {
                        conn.commit();
                     }
                 }
              }
           } else { System.out.println(objname + " 对象为空！！！"); }
           k++;
        }
        j++;
     }
     
     //意见入库
     String suggestobj = "c"+cid+"_suggest";
     if (request.getParameter(suggestobj) != null) {
       int advicesize = 0;
        String suggest = request.getParameter(suggestobj);
        java.sql.Statement astmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        sql = "select AdviceID,Advice from Advice where StudentID=" + studentID + " and CourseID=" + cid;
        ResultSet advices = astmt.executeQuery(sql);
        if (advices != null) {
             advices.last();
             advicesize = advices.getRow();
             advices.beforeFirst();
         }
        if (advicesize > 0) {
           while (advices.next()) {
              int aid = advices.getInt(1);
                sql = "update Advice set Advice='" + suggest + "',isNews=1 where AdviceID=" + aid;
                java.sql.Statement austmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                System.out.println(sql);
               try {
                    austmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
             }
        } else {
           sql = "select IsNull(Max(AdviceID),0)+1 as maxid from Advice";
           java.sql.Statement aiqstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           ResultSet aids = aiqstmt.executeQuery(sql);
          while (aids != null && aids.next()) {
            int maxid = aids.getInt(1);
              sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,TeacherID,CourseID,TargetType,Advice,StudentID,isNews) Values("+maxid+","+evlId+","+classID+","+tid+","+cid+",1,'"+suggest+"',"+studentID+",1)";
              java.sql.Statement aistmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
              System.out.println(sql);
               try {
                    aistmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
            }
        }
     }
     i++;
  }
  
  //读取互动课信息
  i=0;
  sql = "select CourseID,ClassID,CourseTitle,ClassDate,ClassTime,Compere,"
      + "(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Compere)) Teacher "
      + "from Course a where IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and ClassID=" + classID + " and TeahchingModelID in "
      + "(select EducatingModeID from EducatingMode where modeType='互动') "
      + "and (ClassDate between '"+ begin +"' and '" + end + "')";
  java.sql.Statement hcstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  courses = hcstmt.executeQuery(sql);
  
  
  while (courses != null && courses.next()) {
     int cid = courses.getInt("CourseID");
     int tid = -2;
     if (courses.getString("Compere") != null && !"".equals(courses.getString("Compere"))) tid = new Integer(courses.getString("Compere")).intValue();
     
     //选项入库
      j=0;
      sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
          + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
          + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
          + "from EvaluateItems a where EvaluationID = " + evlId + " and CourseType='互动' Order By OrderNO";
      java.sql.Statement histmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      ResultSet items = histmt.executeQuery(sql);
     while (items != null && items.next()) {
        k=0;
       int itemId = items.getInt("ItemID");
        java.sql.Statement hlstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
        ResultSet levels = hlstmt.executeQuery(sql);
       while (levels != null && levels.next()) {
          int levId = levels.getInt("LevelID");
           String objname = "h" + i + "_i" + j + "_l" + k;
           if (request.getParameter(objname) != null) {
              int hmarksize = 0;
                java.sql.Statement hmstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and ItemID=" + itemId + " and StudentID=" + studentID;
                ResultSet hmarks = hmstmt.executeQuery(sql);
              if (hmarks != null) {
                    hmarks.last();
                    hmarksize = hmarks.getRow();
                    hmarks.beforeFirst();
                }
              if (hmarksize > 0) {
                 while (hmarks.next()) {
                    int assignId = hmarks.getInt("AssignID");
                       sql = "update AssignMark set LevelID=" + levId + ",isNews=1 where AssignID=" + assignId;
                       java.sql.Statement haupstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                       System.out.println(sql);
                    try {
                          haupstmt.executeUpdate(sql);
                       } catch (Exception e) {
                          conn.rollback();
                          e.printStackTrace();
                       } finally {
                          conn.commit();
                       }
                    }
              } else {
                 java.sql.Statement hmistmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 sql = "select IsNull(Max(AssignID),0)+1 as maxid from AssignMark";
                 ResultSet hids = hmistmt.executeQuery(sql);
               while (hids != null && hids.next()) {
                  int maxid = hids.getInt(1);
                    sql = "Insert Into AssignMark Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+tid+","+cid+","+studentID+",1)";
                    java.sql.Statement hinsertstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    System.out.println(sql);
                  try {
                        hinsertstmt.executeUpdate(sql);
                     } catch (Exception e) {
                        conn.rollback();
                        e.printStackTrace();
                     } finally {
                        conn.commit();
                     }
                }
              }
           } else { System.out.println(objname + " : 对象为空！！！"); }
        }
     }
     
     //意见入库
     String suggestobj = "c"+cid+"_suggest";
     if (request.getParameter(suggestobj) != null) {
       int hadvicesize = 0;
        java.sql.Statement hastmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String suggest = request.getParameter(suggestobj);
        sql = "select AdviceID,Advice from Advice where StudentID=" + studentID + " and CourseID=" + cid;
        ResultSet hadvices = hastmt.executeQuery(sql);
       if (hadvices != null) {
             hadvices.last();
             hadvicesize = hadvices.getRow();
             hadvices.beforeFirst();
         }
       if (hadvicesize > 0) {
          while (hadvices.next()) { 
             int aid = hadvices.getInt(1);
               sql = "update Advice set Advice='" + suggest + "',isNews=1 where AdviceID=" + aid;
               java.sql.Statement haustmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
               System.out.println(sql);
               try {
                    haustmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
           }
        } else {
           sql = "select IsNull(Max(AdviceID),0)+1 as maxid from Advice";
           java.sql.Statement haiqstmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           ResultSet aids = haiqstmt.executeQuery(sql);
          while (aids != null && aids.next()) {
            int maxid = aids.getInt(1);
              sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,TeacherID,CourseID,TargetType,Advice,StudentID,isNews) Values("+maxid+","+evlId+","+classID+","+tid+","+cid+",1,'"+suggest+"',"+studentID+",1)";
              java.sql.Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
              System.out.println(sql);
               try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
            }
        }
     }
  }
  } else {
     break;
  }
  }//end time for
  conn.close(); }
  catch (Exception e) {
      e.printStackTrace();
      response.sendRedirect("teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do?flag=fail&classID="+classID+"&week="+week+"&begin="+begin.replace('-','.')+"&end="+end.replace('-','.'));
  }
  //System.out.println("teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do?classID="+classID+"&week="+week+"&begin="+"&begin="+"&end="+end);
  System.out.println("录入学员ID  ： " + studentIds);
  if (!"".equals(studentIds)) {
      url = "teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do?flag=success&classID="+classID+"&week="+week+"&begin="+begin.replace('-','.')+"&end="+end.replace('-','.')+"&studentIds="+studentIds.substring(0,studentIds.length()-1);
      response.sendRedirect(url);
  } else {
      url = "teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do?flag=success&classID="+classID+"&week="+week+"&begin="+begin.replace('-','.')+"&end="+end.replace('-','.')+"&studentIds=";
      response.sendRedirect(url);
  }
%>
<script type="text/javascript">
<!--
//window.location.href = "teachWorkManage.prTeachEvaluate.prTeachEvlIssue.do?ClassID="+<%=classID%>;
//window.location.href = "http://localhost:9090/internet/teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do?classID="+<%=classID%>+"&week="+<%=week%>+"&begin="+<%=begin%>+"&end="+<%=end%>;
//window.history.go(-1);
//-->
</script>