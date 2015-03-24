<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="org.hibernate.*,com.talent.common.HibernateSessionFactory"%>

<head>
<title>中共广州市委党校</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>

<%
  Session dbsession = null;
  String classID = request.getParameter("classID");
  String studentID = request.getParameter("studentID");
  String unitID = request.getParameter("unitID");
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
              sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + unitID + " and EvaluationID=" + evlId + " and ItemID=" + itemId + " and StudentID=" + studentID;
              List marks = dbsession.createSQLQuery(sql).list();
              if (marks != null && marks.size() > 0) {
                 Object[] mark = (Object[])marks.get(0);
                 int assignId = ((Integer)mark[0]).intValue();
                 sql = "update AssignMark set LevelID=" + levId + ",isNews=1 where AssignID=" + assignId;
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    response.sendRedirect("zlpg.jsp?openState=0&isSuccess=0");
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
              } else {
                 sql = "select IsNull(Max(AssignID),0)+1 from AssignMark";
                 List ids = dbsession.createSQLQuery(sql).list();
                 int maxid = ((Integer)ids.get(0)).intValue();
                 sql = "Insert Into AssignMark (AssignID,LevelID,EvaluationID,ItemID,ClassID,CourseID,StudentID,isNews) Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+unitID+","+studentID+",1)";
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    response.sendRedirect("zlpg.jsp?openState=0&isSuccess=0");
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
        sql = "select AdviceID,Advice from Advice where TargetType=2 and StudentID=" + studentID + " and CourseID=" + unitID + " and itemID=" + itemId;
        List advices = dbsession.createSQLQuery(sql).list();
        if (advices != null && advices.size() > 0) {
           Object[] advice = (Object[])advices.get(0);
           String aid = ((Integer)advice[0]).toString();
           sql = "update Advice set Advice='" + suggest + "',isNews=1 where AdviceID=" + aid;
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    response.sendRedirect("zlpg.jsp?openState=0&isSuccess=0");
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
        } else {
           sql = "select IsNull(Max(AdviceID),0)+1 from Advice";
           List ids = dbsession.createSQLQuery(sql).list();
           int maxid = ((Integer)ids.get(0)).intValue();
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,itemID,CourseID,TargetType,Advice,StudentID,isNews) Values("+maxid+","+evlId+","+classID+","+itemId+","+unitID+",2,'"+suggest+"',"+studentID+",1)";
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    response.sendRedirect("zlpg.jsp?openState=0&isSuccess=0");
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
<!--
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="60%" border="0" align="center" height="22%" cellspacing="1" bgcolor="#333333">
  <tr> 
    <td bgcolor="#FFFFFF"> <table border="0" width="99%" height="100%" bgcolor="white">
        <tr> 
          <td class="text" width="13%" align="center" valign="middle" bgcolor="white"><img src="../image/mailok.gif" border="0"></td>
          <td class="text" width="36%" valign="middle">评估记录保存成功！</td>
          <td class="text" width="51%" align="center" valign="middle"><a href="zlpg.jsp?openState=0">返回教学质量评估</a></td>
        </tr>
      </table></td>
  </tr>
</table>  -->
<script type="text/javascript">
<!--
window.parent.location.href = "zlpg.jsp?openState=0&isSuccess=1";
//-->
</script>