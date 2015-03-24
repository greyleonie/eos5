<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*,com.talent.common.TalentFunction"%>
<%@page import="org.hibernate.*,com.talent.common.HibernateSessionFactory"%>
<%@page import="com.talent.hibernate.Eosoperator"%>
<%@page import="java.math.BigDecimal"%>

<%
  Session dbsession = null;
  int pageno=1,perno=10,totalno=0;
  String title="",explain="",remarks="",deadline="",sql="";
  java.util.Date now = new java.util.Date();
  Calendar endDate = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  Eosoperator op = (Eosoperator)session.getAttribute("user");
  
  String teacherID = "",teacherName="";
  String from = request.getParameter("from");
  String to = request.getParameter("to");
  
  try {
   if (op != null) {
      teacherID = op.getOperatorId().toString();
      teacherName = op.getOperatorName();
   } else {
      response.sendRedirect("../index.jsp");
   }
   } catch(Exception e) {
   e.printStackTrace();
   }


//连接数据库
  try{
    dbsession = HibernateSessionFactory.currentSession();
	}catch (Exception e) {
		e.printStackTrace();
	}
  Connection conn = dbsession.connection();
  Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  
//读取当前的评估课程
if (from == null || to == null || ("2007-01-01".equals(from) && "2007-01-01".equals(to))) {
sql = "select a.CourseID,a.CourseTitle,a.ClassDate,case when ClassNoon='0' then '上午' when ClassNoon='1' then '下午' " +
      "when ClassNoon='2' then '晚上' when ClassNoon='3' then '全天' end wubie," +
      "(select b.ClassName from Class b where b.ClassID=a.ClassID) ClassName," +
      "ISNULL((select count(distinct studentID) from AssignMark b where b.CourseID=a.CourseID),0) ballot," +
      "ISNULL((select sum(d.score) total from AssignMark c left join EvaluateItemScore d on c.LevelID=d.LevelID " + 
      "where c.ClassID=a.ClassID and c.CourseID=a.CourseID),0) total,ISNULL((select avg(convert(numeric,e.total)) norm " +
      "from (select c.CourseID,c.studentID,sum(d.score) total from AssignMark c left join EvaluateItemScore d " +
      "on c.LevelID=d.LevelID where ClassID=a.ClassID and CourseID=a.CourseID group by c.CourseID,c.studentID) e " +
      "group by e.CourseID),0) norm from Course a  where a.Teachers='" + teacherID + "' and a.IsAdopted=1 and " +
      "(a.IsOutClass is null or a.IsOutClass != 1) and a.TeahchingModelID in " + 
      "(select EducatingModeID from EducatingMode where modeType='辅导') order by norm desc,ballot desc,ClassDate desc";
System.out.println(sql);
from = "2007-01-01";
to = "2007-01-01";
} else {
sql = "select a.CourseID,a.CourseTitle,a.ClassDate,case when ClassNoon='0' then '上午' when ClassNoon='1' then '下午' " +
      "when ClassNoon='2' then '晚上' when ClassNoon='3' then '全天' end wubie," +
      "(select b.ClassName from Class b where b.ClassID=a.ClassID) ClassName," +
      "ISNULL((select count(distinct studentID) from AssignMark b where b.CourseID=a.CourseID),0) ballot," +
      "ISNULL((select sum(d.score) total from AssignMark c left join EvaluateItemScore d on c.LevelID=d.LevelID " + 
      "where c.ClassID=a.ClassID and c.CourseID=a.CourseID),0) total,ISNULL((select avg(convert(numeric,e.total)) norm " +
      "from (select c.CourseID,c.studentID,sum(d.score) total from AssignMark c left join EvaluateItemScore d " +
      "on c.LevelID=d.LevelID where ClassID=a.ClassID and CourseID=a.CourseID group by c.CourseID,c.studentID) e " +
      "group by e.CourseID),0) norm from Course a where a.Teachers='" + teacherID + "' and a.ClassDate between '" + from + 
      "' and '" + to + "' and a.IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.TeahchingModelID in " + 
      "(select EducatingModeID from EducatingMode where modeType='辅导') order by norm desc,ballot desc,ClassDate desc";
System.out.println(sql);
}

//处理分页
int curPage=1;
if (request.getParameter("currentPage")!=null)
   pageno = Integer.parseInt(request.getParameter("currentPage"));
//if (request.getParameter("pageSelect")!=null)
   //perno = Integer.parseInt(request.getParameter("pageSelect"));
totalno=dbsession.createSQLQuery(sql).list().size();	
int maxPage=(totalno-1)/perno +1;//最大页
if (pageno>=1)
   curPage=pageno;//当前页
if(pageno>maxPage) curPage=maxPage;	
if(pageno<1) curPage=1;				
Query q = dbsession.createSQLQuery(sql);
q.setFirstResult((curPage-1)*perno);
q.setMaxResults(perno); 
List courses = q.list();
%>
<head>
<title>评估结果</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language='javascript' src='/script/validator.js'></script>
<script type="text/javascript" src="/script/fcccalendar.js"></script>
<script type="text/javascript" language="javascript">
function goFirstPage() {
   pinggu.elements["currentPage"].value = 1;
   pinggu.submit();
}

function goToPage(num) {
   pinggu.elements["currentPage"].value = num;
   pinggu.submit();
}

function jumpPage() {
   pinggu.elements["currentPage"].value = pinggu.elements["pageSelect"].value;
   pinggu.submit();
}
</script>
</head>

<body class="body_none">
<form id="pinggu" action="pingGuJieGuo.jsp" method="post">
<table border="0" width="100%" cellspacing="0" cellpadding="0" height="114">
  <tr>
    <td width="100%" height="5" colspan="2"></td>
  </tr>
  <tr>
    <td width="100%" height="10" colspan="2"><p>上课时间：从
    <input type="text" name="from" value="<%=from%>" readonly="readonly" class="input" size="10">
	  <img name="beginimg" src="/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["from"],"yyyy-MM-dd")>
     到 <input type="text" name="to" value="<%=to%>" readonly="readonly" class="input" size="10">
	  <img name="endimg" src="/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["to"],"yyyy-MM-dd")>
    <input type="submit" name="a" class="button" value="查询" style="text-align: justify"></p>
    </td>
  </tr>
  <tr>
    <td width="100%" height="77" colspan="2">
      <table align="center" border="0" width="100%" bgcolor="#000000" cellpadding="1" cellspacing="1">
        <tr>
          <td bgcolor="#ffffff" align="center" width="11%" height="70">上课日期</td>
          <td bgcolor="#ffffff" align="center" width="6%" height="70">午别</td>
          <td bgcolor="#ffffff" align="center" width="20%" height="70">班级</td>
          <td bgcolor="#ffffff" align="center" width="21%" height="70">课程名称</td>
          <td bgcolor="#ffffff" align="center" width="10%" height="70">评估人数</td>
          <td bgcolor="#ffffff" align="center" width="6%" height="16">总分</td>
          <td bgcolor="#ffffff" align="center" width="9%" height="70">平均得分</td>
          <td bgcolor="#ffffff" align="center" width="35%" height="70">意见和建议</td>
        </tr>
        <%
          for (int i=0;i<courses.size();i++) {
             Object[] course = (Object[])courses.get(i);
             int cid = ((Integer)course[0]).intValue();
             title = (String)course[1];
             java.util.Date begin = ((java.util.Date)course[2]);
             String begindate = sdf.format(begin);
             String wubie = (String)course[3];
             String classname = (String)course[4];
             int ballot = ((Integer)course[5]).intValue();
             int total = ((Integer)course[6]).intValue();
             BigDecimal d = ((BigDecimal)course[7]);
             double norm = d.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        %>
        <tr valign="middle">
          <td bgcolor="#ffffff" align="center" width="11%" height="67"><%=begindate %></td>
          <td bgcolor="#ffffff" align="center" width="6%" height="67"><%=wubie %></td>
          <td bgcolor="#ffffff" width="20%" height="67"><%=classname %></td>
          <td bgcolor="#ffffff" width="21%" height="67"><%=title %></td>
          <td bgcolor="#ffffff" align="center" width="10%" height="67"><%=ballot %></td>
          <td bgcolor="#ffffff" align="center" width="6%" height="67"><%=total %></td>
          <td bgcolor="#ffffff" align="center" width="9%" height="67"><%=norm %></td>
          <td bgcolor="#ffffff" width="35%" height="67">
          <%
            String advicesql = "select a.AdviceID,a.CourseID,a.Advice from advice a right join Course b on a.CourseID=b.CourseID" + 
                               " and b.CourseID=" + cid + " where a.advice is not null and a.advice !='' order by a.CourseID,a.AdviceID";
            List advices = dbsession.createSQLQuery(advicesql).list();
            for (int j=1;j<=advices.size();j++) {
                Object[] advice = (Object[])advices.get(i);
                String content = (String)advice[2];
                content = TalentFunction.transformHtmlTags(content);
                out.println("<p>" + j + "." + TalentFunction.transformHtmlTags(content) + "</p>");
            }
          %>
          </td>
        </tr>
        <%
        }
        %>
      </table>
    </td>
  </tr>
  <tr>
  <td nowrap width="45%" height="30" align="center">
  当前第<%=curPage%>页 共<%=totalno%>记录 分<%=maxPage%>页显示
  </td>
    <td width="55%" height="18" align="center">
       <input type="hidden" name="currentPage" value="<%=curPage%>">
       <input type="hidden" name="totalCount" value="0">
       <input type="hidden" name="paginationAction" value="">
       <img src="/talent/images/First_no.gif" alt="第一页" width="18" height="13" border="0" onclick="goFirstPage();">&nbsp;&nbsp;&nbsp;
       <img src="/talent/images/Previous_no.gif" alt="上一页" width="14" height="13" border="0" onclick="goToPage(<%=curPage-1%>);">&nbsp;&nbsp;&nbsp;
       <img src="/talent/images/Next_no.gif" alt="下一页" width="14" height="13" border="0" onclick="goToPage(<%=curPage+1%>);">&nbsp;&nbsp;&nbsp;
       <img src="/talent/images/Last_no.gif" alt="最后一页" width="18" height="13" border="0" onclick="goToPage(<%=maxPage%>);">&nbsp;&nbsp;&nbsp;
       <a href="javascript:jumpPage();" oncontextmenu="return false">前往</a>
       <input type=text size='4' onlytype='int' onfocus='checkTextBoxInput()' name='pageSelect' value=''/>页
    </td>
  </tr>
</table>
</form>
</body>
