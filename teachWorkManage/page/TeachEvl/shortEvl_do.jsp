<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="org.hibernate.*,com.talent.common.HibernateSessionFactory"%>

<%
  Session dbsession = null;
  int evlID=0,isadvice = 0,age=0;
  String title="",explain="",remarks="",sex="",degree="";
 	String classID = request.getParameter("classID");
  String studentID = request.getParameter("studentID");
  String evlId = request.getParameter("evaluationID");
  
  //连接数据库
  try{
    dbsession = HibernateSessionFactory.currentSession();
	}catch (Exception e) {
		e.printStackTrace();
	}
  Connection conn = dbsession.connection();
  conn.setAutoCommit(false);

  //录入全模式评估资料
  String sql = "select EvaluationID,ItemID,OrderNO,IsNull(CourseType,'') CourseType,"
      + "IsNull(CourseType,'全部') as Course,Title,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlId + " and CourseType IS Null";
  List items = dbsession.createSQLQuery(sql).list();
  for (int i=0;i<items.size();i++) {
     Object[] item = (Object[])items.get(i);
     int itemId = ((Integer)item[1]).intValue();
     //int levlen = ((Integer)item[6]).intValue();
     //选项入库
     sql = "select LevelID from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
     List levels = dbsession.createSQLQuery(sql).list();
     for (int j=0;j<levels.size();j++) {
        int levId = ((Integer)levels.get(j)).intValue();
        String objname = "i" + i + "_l" + j;
        if (request.getParameter(objname) != null) {
              sql = "select * from AssignMark where ClassID=" + classID + " and ItemID=" + itemId + " and LevelID=" + levId + " and StudentID=" + studentID;
              List marks = dbsession.createSQLQuery(sql).list();
              if (marks != null && marks.size() > 0) {
                 Object[] mark = (Object[])marks.get(0);
                 int assignId = ((Integer)mark[0]).intValue();
                 sql = "update AssignMark set LevelID=" + levId + " where AssignID=" + assignId;
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
              } else {
                 sql = "select IsNull(Max(AssignID),0)+1 from AssignMark";
                 List ids = dbsession.createSQLQuery(sql).list();
                 int maxid = ((Integer)ids.get(0)).intValue();
                 sql = "Insert Into AssignMark (AssignID,LevelID,EvaluationID,ItemID,ClassID,StudentID) Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+studentID+")";
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
     
     //意见入库
     String suggestobj = "item"+itemId+"_suggest";
     if (request.getParameter(suggestobj) != null) {
        String suggest = request.getParameter(suggestobj);
        sql = "select AdviceID,Advice from Advice where StudentID=" + studentID + " and itemID=" + itemId;
        List advices = dbsession.createSQLQuery(sql).list();
        if (advices != null && advices.size() > 0) {
           Object[] advice = (Object[])advices.get(0);
           String aid = ((Integer)advice[0]).toString();
           sql = "update Advice set Advice='" + suggest + "' where AdviceID=" + aid;
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
        } else {
           sql = "select IsNull(Max(AdviceID),0)+1 from Advice";
           List ids = dbsession.createSQLQuery(sql).list();
           int maxid = ((Integer)ids.get(0)).intValue();
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,itemID,TargetType,Advice,StudentID) Value ("+maxid+","+evlId+","+classID+","+itemId+",0,'"+suggest+"',"+studentID+")";
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
  
  //录入专题课评估资料
  //读取该班级所有专题课
  sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,b.ItemID,"
      + "(select count(1) from EvaluateItemScore where ItemID=b.ItemID) levlen,"
      + "(select EducatingMode from EducatingMode where EducatingModeID=a.TeahchingModelID) Course,"
      + "Teachers,(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) Teacher "
      + "from Course a inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlId
      + " and CourseType IS NOT NULL) b on a.TeahchingModelID=b.coursetype "
      + "where a.IsAdopted=1 and (a.IsOutClass=0 or a.IsOutClass Is Null) and a.ClassID=" + classID;
  List courses = dbsession.createSQLQuery(sql).list();
  for (int i=0;i<courses.size();i++) {
     Object[] course = (Object[]) courses.get(i);
     String cid = ((Integer)course[0]).toString();
     String itemId = ((Integer)course[5]).toString();
     //String levlen = ((Integer)course[6]).toString();
     String tid = (String)course[8];
     
     //选项入库
     sql = "select LevelID,LevelName from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
     List levels = dbsession.createSQLQuery(sql).list();
     for (int j=0;j<levels.size();j++) {
        Object[] level = (Object[]) levels.get(j);
        String levId = ((Integer)level[0]).toString();
        String objname = "c" + i + "_l" + j;
        if (request.getParameter(objname) != null) {
              sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and ItemID=" + itemId + " and StudentID=" + studentID;
              List marks = dbsession.createSQLQuery(sql).list();
              if (marks != null && marks.size() > 0) {
                 Object[] mark = (Object[])marks.get(0);
                 int assignId = ((Integer)mark[0]).intValue();
                 sql = "update AssignMark set LevelID=" + levId + " where AssignID=" + assignId;
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
              } else {
                 sql = "select IsNull(Max(AssignID),0)+1 from AssignMark";
                 List ids = dbsession.createSQLQuery(sql).list();
                 int maxid = ((Integer)ids.get(0)).intValue();
                 sql = "Insert Into AssignMark Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+tid+","+cid+","+studentID+")";
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
     
     //意见入库
     String suggestobj = "c"+cid+"_suggest";
     if (request.getParameter(suggestobj) != null) {
        String suggest = request.getParameter(suggestobj);
        sql = "select AdviceID,Advice from Advice where StudentID=" + studentID + " and CourseID=" + cid;
        List advices = dbsession.createSQLQuery(sql).list();
        if (advices != null && advices.size() > 0) {
           Object[] advice = (Object[])advices.get(0);
           String aid = ((Integer)advice[0]).toString();
           sql = "update Advice set Advice='" + suggest + "' where AdviceID=" + aid;
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
        } else {
           sql = "select IsNull(Max(AdviceID),0)+1 from Advice";
           List ids = dbsession.createSQLQuery(sql).list();
           int maxid = ((Integer)ids.get(0)).intValue();
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,TeacherID,CourseID,TargetType,Advice,StudentID) Value ("+maxid+","+evlId+","+classID+","+tid+","+cid+",1,'"+suggest+"',"+studentID+")";
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
  
  //录入外请课评估资料
  //读取该班级所有外请课
  sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,b.ItemID,"
      + "(select count(1) from EvaluateItemScore where ItemID=b.ItemID) levlen,"
      + "(select EducatingMode from EducatingMode where EducatingModeID=a.TeahchingModelID) Course,"
      + "Teachers,(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) Teacher "
      + "from Course a inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlId
      + " and CourseType IS NOT NULL) b on a.TeahchingModelID=b.coursetype where a.IsAdopted=1 and a.ClassID=" + classID
      + " and a.IsOutClass=1";
  courses = dbsession.createSQLQuery(sql).list();
  for (int i=0;i<courses.size();i++) {
     Object[] course = (Object[]) courses.get(i);
     String cid = ((Integer)course[0]).toString();
     String itemId = ((Integer)course[5]).toString();
     //String levlen = ((Integer)course[6]).toString();
     String tid = (String)course[8];
     
     //选项入库
     sql = "select LevelID,LevelName from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
     List levels = dbsession.createSQLQuery(sql).list();
     for (int j=0;j<levels.size();j++) {
        Object[] level = (Object[]) levels.get(j);
        String levId = ((Integer)level[0]).toString();
        String objname = "e" + i + "_l" + j;
        if (request.getParameter(objname) != null) {
        System.out.println("更新对象 : " + objname + ";值:" + levId);
              sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and ItemID=" + itemId + " and StudentID=" + studentID;
              List marks = dbsession.createSQLQuery(sql).list();
              if (marks != null && marks.size() > 0) {
                 Object[] mark = (Object[])marks.get(0);
                 int assignId = ((Integer)mark[0]).intValue();
                 sql = "update AssignMark set LevelID=" + levId + " where AssignID=" + assignId;
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
              } else {
                 sql = "select IsNull(Max(AssignID),0)+1 from AssignMark";
                 List ids = dbsession.createSQLQuery(sql).list();
                 int maxid = ((Integer)ids.get(0)).intValue();
                 sql = "Insert Into AssignMark Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+tid+","+cid+","+studentID+")";
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
     
     //意见入库
     String suggestobj = "c"+cid+"_suggest";
     if (request.getParameter(suggestobj) != null) {
        String suggest = request.getParameter(suggestobj);
        sql = "select AdviceID,Advice from Advice where StudentID=" + studentID + " and CourseID=" + cid;
        List advices = dbsession.createSQLQuery(sql).list();
        if (advices != null && advices.size() > 0) {
           Object[] advice = (Object[])advices.get(0);
           String aid = ((Integer)advice[0]).toString();
           sql = "update Advice set Advice='" + suggest + "' where AdviceID=" + aid;
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
        } else {
           sql = "select IsNull(Max(AdviceID),0)+1 from Advice";
           List ids = dbsession.createSQLQuery(sql).list();
           int maxid = ((Integer)ids.get(0)).intValue();
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,TeacherID,CourseID,TargetType,Advice,StudentID) Value ("+maxid+","+evlId+","+classID+","+tid+","+cid+",1,'"+suggest+"',"+studentID+")";
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
%>
<script type="text/javascript">
<!--
window.location.href = "zlpg.jsp";
//-->
</script>