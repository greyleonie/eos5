<%@include file="/internet/common.jsp"%>
<%@ page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="base.util.DBconnection"%>

<%
try {
DBconnection testdb = new DBconnection();
Connection conn = null;
String unitsql = "",sql = "",classID = "",studentID = "";
int classType = 0;
ResultSet rs=null;
ResultSet unitrs=null;
String opID= base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
String userID= base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userID");
String orgName= base.util.TalentContext.getValue(pageContext,null,"SessionEntity/orgName");
if (userID == null) {
    response.sendRedirect("talent.pr.login.do");
}
//if (orgName.indexOf("办公室")<0) response.sendRedirect("teachWorkManage.prTeachEvaluate.prTeachEvlNoPower.do");

//连接数据库
conn = testdb.getConnection();
java.sql.Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
java.sql.Statement unitstmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

//查询班级信息
if (request.getParameter("ClassID") != null) {
classID = request.getParameter("ClassID");
sql = "select ClassTypeID from Class where ClassID=" + classID;
ResultSet classes = stmt.executeQuery(sql);
while (classes.next()) {
   classType = new Integer(classes.getInt("ClassTypeID")).intValue();
   System.out.println("ClassTypeID====================" + classType + "==========================");
}

//查询该班级的周教学计划
if (classType == 1) {
sql = "select datepart(week,ClassDate) week, dbo.getwstend(ClassDate) fromto from Course where ClassID="
           + classID + " group by datepart(week,ClassDate),dbo.getwstend(ClassDate)";
//unitsql = "select UnitID,ClassID,UnitName,UnitTitle,Department,BeginTime,EndTime,DX.getDeadline(EndTime) wend from TeachingPlanUnit where ClassID=" + classID;
} else sql = "";
//else {
//sql = "select (select ClassType from ClassType where ClassTypeID=(select ClassTypeID from Class "
//    + "where ClassID="+classID+")) classtype,0 week,"
//    + "((select top 1 convert(varchar(10),DX.getBeginOfWeek(ClassDate),102) from Course where ClassID="+classID+" order by ClassDate asc) + ' - ' +"
//    + "(select top 1 convert(varchar(10),DX.getDeadline(ClassDate),102) from Course where ClassID="+classID+" order by ClassDate desc)) fromto";
//}
System.out.println(sql);
if (!"".equals(sql))
   rs=stmt.executeQuery(sql);
if (!"".equals(unitsql))
   unitrs=unitstmt.executeQuery(unitsql);
}
%>
<head>
<title>中共广州市委党校</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_none">
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;<span id="printTable">批量评估</span></td>
          </tr>
      </table></td>
    </tr>
</table>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">班级： 
          <SELECT name="ClassID" id="ClassID" onchange="document.forms[0].submit();">
          <option value="-1">--请选择班级--</option>
          <logic:iterate id="class" property="list[@type='studentclass']">
          <%
            String classno = base.util.TalentContext.getValue(pageContext,null,"ClassID");
            String classid = base.util.TalentContext.getValue(pageContext,"class","Class/ClassID");
            String classtypeid = base.util.TalentContext.getValue(pageContext,"class","Class/ClassTypeID");
          if (classid.equals(classno)) {
          %>
          <option value="<bean:write id="class" property="Class/ClassID"/>" classTypeId="<%=classtypeid%>" selected><bean:write id="class" property="Class/ClassName"/></option>
          <% } else { %>
          <option value="<bean:write id="class" property="Class/ClassID"/>" classTypeId="<%=classtypeid%>"><bean:write id="class" property="Class/ClassName"/></option>
          <% } %>
          </logic:iterate>
          </SELECT>
          <input name="B32" type="submit" class="button_02" value="查 询">
            <input name="B34" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
            <input name="B3" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input type="hidden" name="queryaction">
          </td>
        </tr>
        <tr>
          <td height="30" class="text">
          </td>
        </tr>
      </table> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
  <tr align="center" class="td_title">
    <td width="10%" height="16" align="center" class="td">周次</td>
    <td width="24%" height="16" align="center" class="td">时间</td>
    <td width="24%" height="16" align="center" class="td">评估截止日期</td>
    <td width="22%" height="16" align="center" class="td">评估人数</td>
    <td width="20%" height="16" align="center" class="td">操作</td>
  </tr>
<%
int i = 1,j = 1;
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
fromto = rs.getString("fromto");
begin = fromto.split("-")[0].trim();
end = fromto.split("-")[1].trim();
endDate.setTime(sdf.parse(end));
beginDate.setTime(sdf.parse(begin));
endDate.add(Calendar.DAY_OF_MONTH,5);
deadline = sdf.format(endDate.getTime());

if (i == 1) allbegin = begin;
if (now.after(endDate.getTime()))
   status="已评估";
else if (now.before(beginDate.getTime()))
   status="未评估";
else status="待评估";

if (classType==1) {
     dealpage = "teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do";
} else {
   dealpage = "shortEvl.jsp";
}
int ballot = 0;
java.sql.Statement sstmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
String ssql = "select count(distinct studentID) scount from AssignMark where classid=" + classID 
            + " and courseid in (select courseid from Course where classid=" + classID 
            + " and IsAdopted=1 and (IsOutClass is null or IsOutClass != 1) " 
            + " and ClassDate between '" + begin + "' and '" + end + "')";
ResultSet scount = sstmt.executeQuery(ssql);
while (scount != null &&  scount.next()){
    ballot = scount.getInt(1);
}
%>
  <tr <%if (i % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)">
    <% if (classType==1) { %>
    <td width="10%" height="16" align="center" class="td1">第<%=i%>周</td>
    <% } else { %>
    <td width="10%" height="16" align="center" class="td1">所有</td>
    <% } %>
    <td width="24%" height="16" align="center" class="td1"><%=fromto%></td>
    <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
    <td width="22%" height="16" align="center" title="点击查看评估情况" class="td1"><a href="#" onmousedown="getEvlDetail('<%=i%>','1','<%=begin%>','<%=end%>')"><%=ballot%></a></td>
    <td width="20%" height="16" align="center" class="td1">
    <a href="<%=dealpage%>?classID=<%=classID%>&week=<%=i%>&begin=<%=begin%>&end=<%=end%>">评估</a>
    </td>
  </tr>
<%
i++;
}
%>

<%
while (unitrs!=null && unitrs.next()) {
   int unitID = unitrs.getInt("UnitID");
   begintime = unitrs.getDate("BeginTime");
   endtime = unitrs.getDate("EndTime");
   beginend = sdf.format(begintime) + "-" + sdf.format(endtime);
   lastDate.setTime(unitrs.getDate("wend"));
   lastDate.add(Calendar.DAY_OF_MONTH,5);
   lasttime = sdf.format(lastDate.getTime());
   if (now.after(lastDate.getTime()))
      status="已评估";
   else if (now.before(begintime))
      status="未评估";
   else status="待评估";
%>
<tr <%if (j % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)">
    <td width="10%" height="16" align="center" class="td1">第<%=j%>单元</td>
    <td width="24%" height="16" align="center" class="td1"><%=beginend%></td>
    <td width="24%" height="16" align="center" class="td1"><%=lasttime%></td>
    <td width="22%" height="16" align="center" class="td1"><%=status%></td>
    <td width="20%" height="16" align="center" class="td1">
    <a href="unitEvl.jsp?classID=<%=classID%>&unitID=<%=unitID%>&end=<%=lasttime%>">评估</a>
    </td>
  </tr>
<%
j++;
}%>
<%
if (now.after(endDate.getTime()))
   estatus="已评估";
else if (!"".equals(allbegin) && now.before(sdf.parse(allbegin)))
   estatus="未评估";
else estatus="待评估"; 
%>
<% if (classType==1) { %>
<!--<tr>
  <td width="10%" height="16" align="center" class="td1">外请课</td>
  <td width="24%" height="16" align="center" class="td1"><%=allbegin + " - " + end%></td>
  <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
  <td width="22%" height="16" align="center" class="td1"><%=estatus%></td>
  <td width="20%" height="16" align="center" class="td1">
    <%if ("已评估".equals(estatus)) { %>
    <a href="extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>">查看</a>
    <%} else if ("待评估".equals(estatus)) {%>
    <a href="extraEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>">评估</a>
    <% } %>
  </td>
</tr>
<tr>
  <td width="10%" height="16" align="center" class="td1">期末</td>
  <td width="24%" height="16" align="center" class="td1"><%=fromto%></td>
  <td width="24%" height="16" align="center" class="td1"><%=deadline%></td>
  <td width="22%" height="16" align="center" class="td1"><%=estatus%></td>
  <td width="20%" height="16" align="center" class="td1">
    <%if ("已评估".equals(estatus)) { %>
    <a href="finalEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>">查看</a>
    <%} else if ("待评估".equals(estatus)) {%>
    <a href="finalEvl.jsp?studentID=<%=studentID%>&classID=<%=classID%>&begin=<%=begin%>&end=<%=end%>">评估</a>
    <% } %>
  </td>
</tr>-->
<% } %>
</table>
</td>
    </tr>
    <tr>
      <td class="text">&nbsp;      </td>
    </tr>
</table>
</form>
<% } catch (Exception e) { e.printStackTrace(); } %>
</body>
<script type="text/javascript">
function getEvlDetail(week,type,begin,end) {
	var current = new Date();
	var refresh = current.getTime();
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 250 ;
	var frm = document.forms[0];
      var classId = frm.elements("ClassID").options[frm.elements("ClassID").selectedIndex].value;
      var className = frm.elements("ClassID").options[frm.elements("ClassID").selectedIndex].text;
      var classTypeId = frm.elements("ClassID").options[frm.elements("ClassID").selectedIndex].getAttribute("classTypeId");
      if (type == '3') {
         path = "teachWorkManage.prTeachEvaluate.prQueryHasEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=外请课&begin="+begin+"&end="+end;
      } else if (type == '4') {
         path = "teachWorkManage.prTeachEvaluate.prQueryHasEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=期末&begin="+begin+"&end="+end;
      } else if (type == '5') {
         path = "teachWorkManage.prTeachEvaluate.prQueryHasEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=每周&begin="+begin+"&end="+end;
      } else if (type == '1'){
         path = "teachWorkManage.prTeachEvaluate.prQueryHasEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=每周&begin="+begin+"&end="+end;
      }else if (type == '2') {
         path = "teachWorkManage.prTeachEvaluate.prQueryHasEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=单元&begin="+begin+"&end="+end;
      }
      path += "&week=" + week;
	  path += "&refresh=" + refresh;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//临时插入一行
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+path+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="280px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}
</script>