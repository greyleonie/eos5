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
  String evlId = request.getParameter("evaluationID");
  String begin = request.getParameter("begin");
  String end = request.getParameter("end");

  //连接数据库
  try{
    dbsession = HibernateSessionFactory.currentSession();
	}catch (Exception e) {
		e.printStackTrace();
	}
  Connection conn = dbsession.connection();

  //读取辅导课信息
  String sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,ISNULL(a.Teachers,'') TeacherID,"
      + "(select ISNULL(operatorName,'') from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) as TeacherName "
      + "from Course a where a.IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.ClassID=" + classID + " and a.TeahchingModelID in "
      + "(select EducatingModeID from EducatingMode where modeType='辅导') "
      + "and (a.ClassDate between '"+ begin +"' and '" + end + "') order by ClassDate";
  List courses = dbsession.createSQLQuery(sql).list();
  System.out.println("辅导Course's Size:" + courses.size());
  
  sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlId + " and CourseType='辅导' order by OrderNO";
  List items = dbsession.createSQLQuery(sql).list();
  System.out.println("辅导Item's Size:" + items.size());
  
  for (int i=0;i<courses.size();i++) {
     Object[] course = (Object[]) courses.get(i);
     String cid = ((Integer)course[0]).toString();
     String tid = "";
	 if (course[5] != null)
	 {
        tid = ((String)course[5]).trim();
		if ("".equals(tid)) tid = "NULL";
	 } else {
        tid = "NULL";
	 }
     
     //选项入库
     for (int j=0;j<items.size();j++) {
        Object[] item = (Object[])items.get(j);
        int itemId = ((Integer)item[1]).intValue();
        sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
        List levels = dbsession.createSQLQuery(sql).list();
        for (int k=0;k<levels.size();k++) {
           Object[] level = (Object[]) levels.get(k);
           int levId = ((Integer)level[0]).intValue();
           String objname = "f" + i + "_i" + j + "_l" + k;
           System.out.println("+++++++"+objname+"!!"+cid+"!"+request.getParameter(objname)+"@@"+itemId);
           if (request.getParameter(objname) != null) {
              sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and ItemID=" + itemId+ " and StudentID=" + studentID;
              List marks = dbsession.createSQLQuery(sql).list();
              if (marks != null && marks.size() > 0) {
                 Object[] mark = (Object[])marks.get(0);
                 int assignId = ((Integer)mark[0]).intValue();
                 sql = "update AssignMark set LevelID=" + levId + ",isNews=1 where AssignID=" + assignId;
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
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
                 sql = "Insert Into AssignMark Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+tid+","+cid+","+studentID+",1)";
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    response.sendRedirect("zlpg.jsp?openState=0&isSuccess=0");
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
              }
           } else { System.out.println("对象为空！！！"); }
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
           sql = "update Advice set Advice='" + suggest + "',isNews=1 where AdviceID=" + aid;
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
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
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,TeacherID,CourseID,TargetType,Advice,StudentID,isNews) Values("+maxid+","+evlId+","+classID+","+tid+","+cid+",1,'"+suggest+"',"+studentID+",1)";
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
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
  
  //读取互动课信息
  sql = "select CourseID,ClassID,CourseTitle,ClassDate,ClassTime,Compere,"
      + "(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Compere)) Teacher "
      + "from Course a where IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and ClassID=" + classID + " and TeahchingModelID in "
      + "(select EducatingModeID from EducatingMode where modeType='互动') "
      + "and (ClassDate between '"+ begin +"' and '" + end + "')";
  courses = dbsession.createSQLQuery(sql).list();
  System.out.println("互动Course's Size:" + courses.size());
  
  sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlId + " and CourseType='互动' order by OrderNO";
  items = dbsession.createSQLQuery(sql).list();
  System.out.println("互动Item's Size:" + items.size());
  
  for (int i=0;i<courses.size();i++) {
     Object[] course = (Object[]) courses.get(i);
     String cid = ((Integer)course[0]).toString();
     String tid = "";
	 if (course[5] != null)
	 {
        tid = ((String)course[5]).trim();
		if ("".equals(tid)) tid = "NULL";
	 } else {
        tid = "NULL";
	 }
     
     //选项入库
     for (int j=0;j<items.size();j++) {
        Object[] item = (Object[])items.get(j);
        int itemId = ((Integer)item[1]).intValue();
        sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
        List levels = dbsession.createSQLQuery(sql).list();
        for (int k=0;k<levels.size();k++) {
           Object[] level = (Object[]) levels.get(k);
           int levId = ((Integer)level[0]).intValue();
           String objname = "h" + i + "_i" + j + "_l" + k;
           if (request.getParameter(objname) != null) {
              sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and ItemID=" + itemId + " and StudentID=" + studentID;
              List marks = dbsession.createSQLQuery(sql).list();
              if (marks != null && marks.size() > 0) {
                 Object[] mark = (Object[])marks.get(0);
                 int assignId = ((Integer)mark[0]).intValue();
                 sql = "update AssignMark set LevelID=" + levId + ",isNews=1 where AssignID=" + assignId;
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
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
                 sql = "Insert Into AssignMark Values("+maxid+","+levId+","+evlId+","+itemId+","+classID+","+tid+","+cid+","+studentID+",1)";
                 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                 System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
                    stmt.executeUpdate(sql);
                 } catch (Exception e) {
                    conn.rollback();
                    response.sendRedirect("zlpg.jsp?openState=0&isSuccess=0");
                    e.printStackTrace();
                 } finally {
                    conn.commit();
                 }
              }
           } else { System.out.println(objname + " : 对象为空！！！"); }
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
           sql = "update Advice set Advice='" + suggest + "',isNews=1 where AdviceID=" + aid;
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
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
           sql = "Insert Into Advice (AdviceID,EvaluationID,ClassID,TeacherID,CourseID,TargetType,Advice,StudentID,isNews) Values("+maxid+","+evlId+","+classID+","+tid+","+cid+",1,'"+suggest+"',"+studentID+",1)";
           Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           System.out.println(sql);
                 try {
                    conn.setAutoCommit(false);
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