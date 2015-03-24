<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="com.talent.hibernate.Eosoperator"%>
<%@page import="com.talent.common.DBconnection" %>
<%@page import="com.talent.common.TalentFunction" %>

<%
int isWebEva = 0;
Eosoperator op = (Eosoperator)session.getAttribute("user");
String studentID = "";
String unitsql = "";
ResultSet rs = null;
ResultSet unitrs = null;
ResultSet extrars = null;
try {
   if (op != null) {
      studentID = op.getOperatorId().toString();
   } else {
      response.sendRedirect("../index.jsp");
   }
} catch(Exception e) {
   e.printStackTrace();
}

//�������ݿ�
//try{
//    dbsession = HibernateSessionFactory.currentSession();
//}catch (Exception e) {
//		e.printStackTrace();
//}
DBconnection dbconn = new DBconnection();
Connection conn = dbconn.getConnection();
Statement stmt=conn.createStatement();
Statement unitstmt=conn.createStatement();
Statement extrastmt=conn.createStatement();

//��ѯ��ѧԱ���ڰ༶��Ϣ

String sql = "select a.ClassID,a.ClassTypeID,a.EndTime,a.Commission,a.IsWebEva from Class a left join student b on a.classid=b.classid where b.studentid=" + studentID;
ResultSet student = stmt.executeQuery(sql);
String classID = "",commission="";
int classType = 0;
java.util.Date endTime = null,minCourseDate = null,closeTime = null;
while (student.next()) {
   int cid = student.getInt("ClassID");
   classID = new Integer(cid).toString();
   classType = new Integer(student.getInt("ClassTypeID")).intValue();
   isWebEva = student.getInt("IsWebEva");
   endTime = student.getDate("EndTime");//��ҵʱ��
   commission=student.getString("Commission");//��ѵ��λ
}
//�����ֹ��ʼʱ��
closeTime = TalentFunction.getBeginOfWeek(endTime);
Calendar endCld = Calendar.getInstance();
endCld.setTime(closeTime);
endCld.add(Calendar.DAY_OF_MONTH,-7);
closeTime = endCld.getTime();

//��ѯ��ѧԱ���ڰ༶���ܽ�ѧ�ƻ�
if (classType == 1) {

//sql = "select datepart(week,ClassDate) week, dbo.getwstend(ClassDate) fromto from Course where ClassID="
//           + classID + " group by datepart(week,ClassDate),dbo.getwstend(ClassDate)";
sql = "select c.*,"
    + "(select min(datepart(week,e.ClassDate)) from Course e where e.ClassId="+ classID +") minWeek,"
    + "(select count(distinct courseid) amount from AssignMark where studentid="+ studentID +" and courseid in "
    + "(select b.CourseID from Course b where b.IsAdopted=1 and (b.IsOutClass is null or b.IsOutClass != 1) and "
    + "b.ClassID="+ classID +" and b.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') "
    + "and (b.ClassDate between c.bg and c.ed))) evlcount,"
    + "(select count(d.CourseID) from Course d where d.IsAdopted=1 and (d.IsOutClass is null or d.IsOutClass != 1) "
    + "and d.ClassID="+ classID +" and d.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') "
    + "and (d.ClassDate between c.bg and c.ed)) coursecount,"
    + "(select min(e.ClassDate) from Course e where e.IsAdopted=1 and (e.IsOutClass is null or e.IsOutClass != 1) and "
    + "e.ClassID="+ classID +" and e.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') and "
    + "(e.ClassDate between c.bg and c.ed)) minCourseDate from "
    + "(select datepart(week,a.ClassDate) week,dbo.getBeginOfWeek(a.ClassDate) bg, "
    + "dbo.getDeadline(a.ClassDate) ed,dbo.getwstend(a.ClassDate) fromto from Course a where a.ClassID="+ classID +" "
    + "group by datepart(week,a.ClassDate),dbo.getBeginOfWeek(a.ClassDate),dbo.getDeadline(a.ClassDate),dbo.getwstend(a.ClassDate)) c";
    
//unitsql = "select UnitID,ClassID,UnitName,UnitTitle,Department,BeginTime,EndTime,dbo.getDeadline(EndTime) wend from TeachingPlanUnit where ClassID=" + classID;
  unitsql="select UnitID,ClassID,UnitName,UnitTitle,Department,BeginTime,EndTime,dbo.getDeadline(EndTime) wend,(select count(*) from AssignMark WHERE" 
          + "(CourseID = UnitID) AND (ClassID = "+ classID +")  AND (StudentID = "+studentID+")) evlcount " 
          + "from TeachingPlanUnit where ClassID="+ classID +"";
} else {
 
sql = "select (select ClassType from ClassType where ClassTypeID=(select ClassTypeID from Class "
    + "where ClassID="+classID+")) classtype,0 week,"
    + "((select top 1 convert(varchar(10),dbo.getBeginOfWeek(ClassDate),102) from Course where ClassID="+classID+" order by ClassDate asc) + ' - ' +"
    + "(select top 1 convert(varchar(10),dbo.getDeadline(ClassDate),102) from Course where ClassID="+classID+" order by ClassDate desc)) fromto";
}

rs=stmt.executeQuery(sql);
if (!"".equals(unitsql))
   unitrs=unitstmt.executeQuery(unitsql);
%>
<head>
<title>�й�������ί��У</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />

<script language='javascript'>
<%if (request.getParameter("isSuccess")!=null && "1".equals(request.getParameter("isSuccess"))) {%>
alert("�������ύ�ɹ���");
<%}%>

<%if (request.getParameter("isSuccess")!=null && "0".equals(request.getParameter("isSuccess"))) {%>
alert("�������ύ���ɹ���");
<%}%>
 function toquery(){
     
   window.location="zlpg.jsp?openState=1";

 }
 function toquery1(){
  window.location="zlpg.jsp?openState=0";
 }
</script>
</head>

<body class="body_none">
<%
String openState=request.getParameter("openState");
if (isWebEva != 1) {
%>
<table><tr><td height="10" align="center">
<font size="4" color="red">�����ڵİ༶��֧�����������������������ú󽻸������Σ�</font>
</td></tr></table>
<%
} else {
%>
<table width="98%" height="89" border="0" align="center" cellpadding="0" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#D8D8D8">
  <tr><td colspan="2">&nbsp;<%if(openState.equals("0")){ %><font color="red">��ǰ��Ҫ��������:</font><%} %></td><td colspan="3" align="right"><%if(openState.equals("0")){ %><input type="button" id="query" value="���������ʷ" onclick="toquery()"> <%}else{ %> <input type="button" id="query1" value="��Ҫ����" onclick="toquery1()">  <%} %> </td></tr>
  <tr>
    <td width="10%" height="16" align="center" class="td">�ܴ�</td>
    <td width="24%" height="16" align="center" class="td">ʱ��</td>
    <td width="24%" height="16" align="center" class="td">������ֹ����</td>
    <td width="22%" height="16" align="center" class="td">״̬</td>
    <td width="20%" height="16" align="center" class="td">����</td>
  </tr>
<%
int i = 1,j = 1,evlCount = 0,courseCount = 0;
String beginend="",fromto = "",begin = "",end = "",deadline="",allbegin="",estatus="", lasttime="";
String status="",dealpage = "",viewpage = "";
java.util.Date now = new java.util.Date();
java.util.Date begintime = null;
java.util.Date endtime = null;
Calendar beginDate = Calendar.getInstance();
Calendar endDate = Calendar.getInstance();
Calendar lastDate = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

while (rs!=null && rs.next()) {
int weekTime = rs.getInt("week");
int minWeek = rs.getInt("minWeek");
int week = weekTime - minWeek + 1;
fromto = rs.getString("fromto");
begin = fromto.split("-")[0].trim();
end = fromto.split("-")[1].trim();
endDate.setTime(sdf.parse(end));
beginDate.setTime(sdf.parse(begin));
endDate.add(Calendar.DAY_OF_MONTH,5);
deadline = sdf.format(endDate.getTime());
evlCount = rs.getInt("evlcount");
courseCount = rs.getInt("coursecount");
minCourseDate = rs.getDate("minCourseDate");

if (i == 1) allbegin = begin;
//if (!"226".equals(classID)) {

if (now.before(closeTime)) {
   if (now.after(endDate.getTime()))
      status="��ֹ����";
   else if (now.before(beginDate.getTime()))
      status="δ��ʼ����";
   else if (evlCount==0) status="������";
   else if (evlCount>0 && evlCount<courseCount) status="����������";
   else if (evlCount==courseCount) status="��ȫ����";
}  else if (now.after(closeTime) && now.before(endTime)) {
            if (evlCount==0) status="������";
            else if (evlCount>0 && evlCount<courseCount) status="����������";
            else if (evlCount==courseCount) status="��ȫ����";
         }
         else { status="��ֹ����"; }

//} else if ("226".equals(classID) && now.before(sdf.parse("2008.09.23")) && sdf.parse(begin).after(sdf.parse("2008.09.06")) && now.after(sdf.parse(begin)) && sdf.parse(deadline).before(sdf.parse("2008.10.03"))) {
//   status="������";
//} else if ("226".equals(classID) && now.before(sdf.parse(begin)) && sdf.parse(deadline).after(now)) {
//   status="δ��ʼ����";
//} else {
//   status="��ֹ����";
//}
if (classType==1) {
     dealpage = "weekEvl.jsp";
} else {
   dealpage = "shortEvl.jsp";
}
%>
<% if(openState.equals("1")){
     if(status.equals("��ֹ����")){
%>
  <tr>
    <% if (classType==1) { %>
    <td width="10%" height="16" align="center" class="td1">��<%=week%>��</td>
    <% } else { %>
    <td width="10%" height="16" align="center" class="td1">����</td>
    <% } %>
    <td width="24%" height="16" align="center" class="td1"><%=fromto%></td>
    <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
    <td width="22%" height="16" align="center" class="td1"><%=status%></td>
    <td width="20%" height="16" align="center" class="td1">
    <%if ("��ֹ����".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=1')">�鿴</a>
    <%} else if ("������".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=1')" style="color:  #FF0000">����</a>
    <% } %>
    </td>
  </tr>
<% }}%>
<%if(openState.equals("0")){  
    if((status.equals("������") || status.equals("����������") || status.equals("��ȫ����")) && minCourseDate!=null && now.after(minCourseDate)){%>
  <tr>
    <% if (classType==1) { %>
    <td width="10%" height="16" align="center" class="td1">��<%=week%>��</td>
    <% } else { %>
    <td width="10%" height="16" align="center" class="td1">����</td>
    <% } %>
    <td width="24%" height="16" align="center" class="td1"><%=fromto%></td>
    <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
    <td width="22%" height="16" align="center" class="td1"><%=status%></td>
    <td width="20%" height="16" align="center" class="td1">
    <%if ("��ֹ����".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=0')">�鿴</a>
    <%} else if ("������".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=0')" style="color:  #FF0000">����</a>
    <%} else if (status.equals("����������")) {%>
    <a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=0')" style="color:  #0000FF">�޸�</a>
   
     <%} else if ( status.equals("��ȫ����")) {%>
    <a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=0')" >�޸�</a>
    <% } %>
    </td>
  </tr>
<% }}%>
<%
i++;
}
%>

<%
if ("�����¾�".equals(commission)) {
while (unitrs!=null && unitrs.next()) {
   int unitID = unitrs.getInt("UnitID");
   String unitName = unitrs.getString("UnitName");
   begintime = unitrs.getDate("BeginTime");
   endtime = unitrs.getDate("EndTime");
   beginend = sdf.format(begintime) + "-" + sdf.format(endtime);
   lastDate.setTime(unitrs.getDate("wend"));
   evlCount = unitrs.getInt("evlcount");
   lastDate.add(Calendar.DAY_OF_MONTH,5);
   lasttime = sdf.format(lastDate.getTime());
   if (now.before(closeTime)) {
   if (now.after(lastDate.getTime()))
      status="��ֹ����";
   else if (now.before(begintime))
      status="δ��ʼ����";
   else if(evlCount==0){
    status="������";
    }
   else if(evlCount>0){ 
      status="��ȫ����";
   }
   
   } else if (now.after(closeTime) && now.before(endTime)) { status="������"; }
   else { status="��ֹ����"; }
%>
<% if(openState.equals("1")){
     if(status.equals("��ֹ����")){
%>
<tr>
    <td width="10%" height="16" align="center" class="td1"><%=unitName %></td>
    <td width="24%" height="16" align="center" class="td1"><%=beginend%></td>
    <td width="24%" height="16" align="center" class="td1"><%=lasttime%></td>
    <td width="22%" height="16" align="center" class="td1"><%=status%></td>
    <td width="20%" height="16" align="center" class="td1">
    <%if ("��ֹ����".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('unitEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&unitID=<%=unitID%>&end=<%=lasttime%>&openState=1')">�鿴</a>
    <%} else if ("������".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('unitEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&unitID=<%=unitID%>&end=<%=lasttime%>&openState=1')" style="color:  #FF0000">����1</a>
    <% } %>
    </td>
  </tr>
<%} }%>
<%if(openState.equals("0")){  
    if(status.equals("������")|| status.equals("��ȫ����")){%>
<tr>
    <td width="10%" height="16" align="center" class="td1"><%=unitName %></td>
    <td width="24%" height="16" align="center" class="td1"><%=beginend%></td>
    <td width="24%" height="16" align="center" class="td1"><%=lasttime%></td>
    <td width="22%" height="16" align="center" class="td1"><%=status%></td>
    <td width="20%" height="16" align="center" class="td1">
    <%if ("��ֹ����".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('unitEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&unitID=<%=unitID%>&end=<%=lasttime%>&openState=0')">�鿴</a>
    <%} else if ("������".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('unitEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&unitID=<%=unitID%>&end=<%=lasttime%>&openState=0')" style="color:  #FF0000">����</a>
     <%} else if ("��ȫ����".equals(status)) {%>
    <a href="#" onmousedown="getWfLog('unitEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&unitID=<%=unitID%>&end=<%=lasttime%>&openState=0')" style="color:  #0000FF">�޸�</a>
    <% } %>
    </td>
  </tr>
<%} }%>
<%
j++;
} }%>
<%
//��ȡ��������Ϣ
  int evlID = 0;
  String title = "";
  sql = "select * from Evaluation where evaluationid in (select top 1 evaluationid from AssignMark where classid="+classID+" and evaluationid in (select evaluationid from Evaluation where period='�����' and classtype='1'))";
  ResultSet Evaluation = stmt.executeQuery(sql);
  while (Evaluation != null && Evaluation.next()) {
         evlID = Evaluation.getInt("EvaluationID");
         title = Evaluation.getString("title");
  }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='�����' and (Class like '%"+classID+"%' or Class like '%"+classID+",%' or Class like '%,"+classID+",%' or Class like '%,"+classID+"%')";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     title = Evaluation.getString("title");
  } }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='�����' order by EvaluationID desc";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     title = Evaluation.getString("title");
  } }
sql = "select a.*,"
    + "(select count(c.CourseID)  from Course c inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlID + " "
    + "and CourseType IS NOT NULL) b on c.TeahchingModelID=b.coursetype where c.IsAdopted=1 and c.ClassID="+classID+" and c.TeahchingModelID!=13"
    + "and c.TeahchingModelID!=14 and (c.Outsider IS NOT NULL and c.Outsider <> '')) coursecount,"
    + "(select count(distinct courseid) amount from AssignMark where studentid="+studentID+" and courseid in (select d.CourseID  from Course d "
    + "inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlID + " "
    + "and CourseType IS NOT NULL) b on d.TeahchingModelID=b.coursetype where d.IsAdopted=1 and d.ClassID="+classID+" and d.TeahchingModelID!=13"
    + "and d.TeahchingModelID!=14 and (d.Outsider IS NOT NULL and d.Outsider <> ''))) evlcount,"
    + "(select min(e.ClassDate)  from Course e inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlID + " "
    + "and CourseType IS NOT NULL) b on e.TeahchingModelID=b.coursetype where e.IsAdopted=1 and e.ClassID="+classID+" and e.TeahchingModelID!=13 "
    + "and e.TeahchingModelID!=14 and (e.Outsider IS NOT NULL and e.Outsider <> '')) minCourseDate "
    + "from (select '"+allbegin+"' bg,'"+end+"' ed) a";
extrars = extrastmt.executeQuery(sql);
while (extrars!=null && extrars.next()) {
evlCount = extrars.getInt("evlcount");
courseCount = extrars.getInt("coursecount");
minCourseDate = extrars.getDate("minCourseDate");
}
if (!"".equals(allbegin)) {
if (now.after(endDate.getTime()))
   estatus="��ֹ����";
else if (now.before(sdf.parse(allbegin)))
   estatus="δ��ʼ����";
else if (evlCount==0) estatus="������";
else if (evlCount>0 && evlCount<courseCount) estatus="����������";
else if (evlCount==courseCount) estatus="��ȫ����";
%>
<% if (classType==1) { %>
<% if(openState.equals("1")){
     if(estatus.equals("��ֹ����")){
%>
<tr>
  <td width="10%" height="16" align="center" class="td1">�����</td>
  <td width="24%" height="16" align="center" class="td1"><%=allbegin + " - " + end%></td>
  <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
  <td width="22%" height="16" align="center" class="td1"><%=estatus%></td>
  <td width="20%" height="16" align="center" class="td1">
    <%if ("��ֹ����".equals(estatus)) { %>
    <a href="#" onmousedown="getWfLog('extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=1')">�鿴</a>
    <%} else if ("������".equals(estatus)) {%>
    <a href="#" onmousedown="getWfLog('extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=1')" style="color:  #FF0000">����</a>
    <% } %>
  </td>
</tr>
<%}} %>
<%if(openState.equals("0")){  

    if((estatus.equals("������") || estatus.equals("����������") || estatus.equals("��ȫ����")) && minCourseDate!=null && now.after(minCourseDate)){%>
<tr>
  <td width="10%" height="16" align="center" class="td1">�����</td>
  <td width="24%" height="16" align="center" class="td1"><%=allbegin + " - " + end%></td>
  <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
  <td width="22%" height="16" align="center" class="td1"><%=estatus%></td>
  <td width="20%" height="16" align="center" class="td1">
    <%if ("��ֹ����".equals(estatus)) { %>
    <a href="#" onmousedown="getWfLog('extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=0')">�鿴</a>
    <%} else if ("������".equals(estatus)) {%>
    <a href="#" onmousedown="getWfLog('extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=0')" style="color:  #FF0000">����</a>
    <%} else if (estatus.equals("����������") ) {%>
    <a href="#" onmousedown="getWfLog('extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=0')" style="color:  #0000FF">�޸�</a>

    <%} else if (estatus.equals("��ȫ����")) {%>
    <a href="#" onmousedown="getWfLog('extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=0')" >�޸�</a>
    <% } %>
  </td>
</tr>
<%}} %>

<%
begin = fromto.split("-")[0].trim();
if(openState.equals("0") && now.after(sdf.parse(begin))){  
%>
<tr>
  <td width="10%" height="16" align="center" class="td1">��ĩ</td>
  <td width="24%" height="16" align="center" class="td1"><%=fromto%></td>
  <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
  <td width="22%" height="16" align="center" class="td1">��ĩ����</td>
  <td width="20%" height="16" align="center" class="td1">
    
    <a href="#" onmousedown="getWfLog('finalEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>&openState=0')" style="color:  #FF0000">����</a>
    
  </td>
</tr>

<% } } }%>
</table>

<%if(openState.equals("0")){  %>
<table width="98%" height="89" border="0" align="center" cellpadding="0" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#D8D8D8">
<%
sql = "select v.* from (select c.*,("
    + "select count(distinct courseid) amount from AssignMark where studentid=" + studentID + " and courseid in"
    + "(select b.CourseID from Course b where b.IsAdopted=1 and (b.IsOutClass is null or b.IsOutClass != 1) and "
    + "b.ClassID=" + classID + " and b.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') "
    + "and (b.ClassDate between c.bg and c.ed) and "
    + "exists(select e.studentid from StudentlaterLogs e where e.studentid=" + studentID
    + " and (e.state=0 or e.state=1) and "
    + "datediff(dd,e.CreatTime,b.ClassDate)=0 and datepart(hh,e.CreatTime)>=(datepart(hh,b.ClassTime)-1) and "
    + "datepart(hh,e.CreatTime)<=(datepart(hh,b.ClassTime)+1))"
    + ")) evlcount,"
    + "(select count(d.CourseID) from Course d where d.IsAdopted=1 and (d.IsOutClass is null or d.IsOutClass != 1) and d.ClassID=" + classID
    + " and d.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') "
    + "and (d.ClassDate between c.bg and c.ed) and "
    + "exists(select e.studentid from StudentlaterLogs e where e.studentid=" + studentID
    + " and (e.state=0 or e.state=1) and "
    + "datediff(dd,e.CreatTime,d.ClassDate)=0 and datepart(hh,e.CreatTime)>=(datepart(hh,d.ClassTime)-1) and "
    + "datepart(hh,e.CreatTime)<=(datepart(hh,d.ClassTime)+1))"
    + ") coursecount, "
    + "(select min(datepart(week,e.ClassDate)) from Course e where e.ClassId="+classID+") minWeek "
    + "from (select datepart(week,a.ClassDate) week,dbo.getBeginOfWeek(a.ClassDate) bg, "
    + "dbo.getDeadline(a.ClassDate) ed,dbo.getwstend(a.ClassDate) fromto from Course a where a.ClassID=" + classID + " "
    + "group by datepart(week,a.ClassDate),dbo.getBeginOfWeek(a.ClassDate),dbo.getDeadline(a.ClassDate),dbo.getwstend(a.ClassDate)) c "
    + "where getdate()>c.ed) v where v.evlcount<v.coursecount";
Statement unevlStmt=conn.createStatement();
ResultSet unevlRs = unevlStmt.executeQuery(sql);
%>
<tr class="td1" height="20"><td colspan="4"></tr>

<tr><td colspan="4">&nbsp;<font color="red">ȱ������:</font></td></tr>
  <tr>
    <td width="10%" height="16" align="center" class="td">�ܴ�</td>
    <td width="24%" height="16" align="center" class="td">ʱ��</td>
    <td width="46%" height="16" align="center" class="td">ȱ���γ�</td>
    <td width="20%" height="16" align="center" class="td">����</td>
  </tr>
<%
while (unevlRs!=null && unevlRs.next()) {
fromto = unevlRs.getString("fromto");
begin = fromto.split("-")[0].trim();
end = fromto.split("-")[1].trim();
int weekTime = unevlRs.getInt("week");
int minWeek = unevlRs.getInt("minWeek");
int week = weekTime - minWeek + 1;
if (classType==1) {
     dealpage = "weekUnEvl.jsp";
} else {
   dealpage = "shortUnEvl.jsp";
}
%>
  <tr>
    <td width="10%" height="16" align="center" class="td1">��<%=week%>��</td>
    <td width="24%" height="16" align="center" class="td1"><%=fromto%></td>
    <td width="24%" height="16" align="left" class="td1">
    <%
      int cosNo = 1;
      sql = "select distinct d.CourseId,d.CourseTitle,"
          + "case when d.Teachers is not null then (select ISNULL(operatorName,'') from EOSOperator where operatorID=convert(decimal(9),d.Teachers)) "
          + "when d.Compere is not null then (select operatorName from EOSOperator where operatorID=convert(decimal(9),d.Compere)) "
          + "when d.Outsider is not null then d.Outsider "
          + "else '' end TeacherName from Course d "
          + "where d.IsAdopted=1 and (d.IsOutClass is null or d.IsOutClass != 1) "
          + "and d.ClassID="+classID+" and d.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') "
          + "and (d.ClassDate between '"+begin+"' and '"+end+"') and "
          + "exists(select * from StudentlaterLogs e where e.studentid=" + studentID + " and (e.state=0 or e.state=1) and "
          + "datediff(dd,e.CreatTime,d.ClassDate)=0 and datepart(hh,e.CreatTime)>=(datepart(hh,d.ClassTime)-1) and "
          + "datepart(hh,e.CreatTime)<=(datepart(hh,d.ClassTime)+1)) and d.courseid not in ("
          + "select distinct courseid from AssignMark where studentid=" + studentID + " and courseid in "
          + "(select b.CourseID from Course b where b.IsAdopted=1 and (b.IsOutClass is null or b.IsOutClass != 1) and "
          + "b.ClassID="+classID+" and b.TeahchingModelID in (select EducatingModeID from EducatingMode where modeType='����' or modeType='����') "
          + "and (b.ClassDate between '"+begin+"' and '"+end+"') and "
          + "exists(select e.studentid from StudentlaterLogs e where e.studentid=" + studentID + " and (e.state=0 or e.state=1) and "
          + "datediff(dd,e.CreatTime,b.ClassDate)=0 and datepart(hh,e.CreatTime)>=(datepart(hh,b.ClassTime)-1) and "
          + "datepart(hh,e.CreatTime)<=(datepart(hh,b.ClassTime)+1))) )";
      Statement unEvlCosStmt=conn.createStatement();
      ResultSet unEvlCosRs = unEvlCosStmt.executeQuery(sql);
      while (unEvlCosRs!=null && unEvlCosRs.next()) {
         out.print("&nbsp;&nbsp;" + cosNo + "��" + unEvlCosRs.getString("CourseTitle"));
         if (!"".equals(unEvlCosRs.getString("TeacherName"))) out.print("(" + unEvlCosRs.getString("TeacherName") + ")");
         if (!unEvlCosRs.isLast()) out.println("<BR>");
         cosNo++;
      }
    %>
    </td>
    <td width="20%" height="16" align="center" class="td1"><a href="#" onmousedown="getWfLog('<%=dealpage%>?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>&openState=1')" style="color:  #FF0000">����</a></td>
  </tr>
<% } %>
</table>
<%
}
try {
   if (rs != null) rs.close();
   if (unitrs != null) unitrs.close();
   if (stmt != null) stmt.close();
   if (unitstmt != null) unitstmt.close();
} catch (Exception e) {
   e.printStackTrace();
} finally {
   conn.close();
   //dbsession.close();
}
}
%>
<script type="text/javascript" language="javascript">
var activeTr;
var newrowIndex = 100;
//������־
function getWfLog(url) {
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 250 ;
	var trCells = parentObj.cells
	
	if (activeTr != null) {
	for (var i=0;i<activeTr.cells.length;i++) {
	    activeTr.cells[i].className = "td1";
	} }
	
	activeTr = parentObj;
	
	for (var i=0;i<trCells.length;i++) {
	    trCells[i].className = "td";
	}
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//��ʱ����һ��
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="280px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}
//����������־
function divWfLogDisplay(bool){
	if (document.getElementById("tmpWLog")) {
		if (bool==1){
		   document.getElementById("tmpWLog").style.display = "";
		}
		else{
		   document.getElementById("tmpWLog").removeNode(true);
	    }
	}
}

function TR_GetX(e) {
    var l = e.offsetLeft;
    while (e = e.offsetParent) {
      l += e.offsetLeft;
    }
  
    return l;
  }
function TR_GetY(e) {
    var t = e.offsetTop;
    while (e = e.offsetParent) {
      t += e.offsetTop;
    }
   
    return t;
}

function getTdForTr(e) {
   var count = 0;
   
   for (var i=0;i<e.cells.length;i++) {
       if (e.cells[i].colspan != undefined) {
          count += e.cells[i].colspan;
       } else {
          count++;
       }
   }
   
   return count;
}
</script>
</body>
