<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="org.hibernate.*,com.talent.common.HibernateSessionFactory"%>

<%
  Session dbsession = null;
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

  //读取全模式评估项目
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
              sql = "select * from AssignMark where ClassID=" + classID + " and ItemID=" + itemId + " and StudentID=" + studentID;
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
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,itemID,TargetType,Advice,StudentID) Values("+maxid+","+evlId+","+classID+","+itemId+",0,'"+suggest+"',"+studentID+")";
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
  conn.close();
  dbsession.close();
%>

<script type="text/javascript">
<!--
window.location.href = "zlpg.jsp";
//-->
</script>