<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*" %>
<%
String classID = request.getParameter("classId");
String week = request.getParameter("week");
String begin = request.getParameter("begin");
String end = request.getParameter("end");
%>
<head>
</head>

<body>
<form>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="display:none">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;<span id="printTable">评估表回收情况</span></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="2" id="listdetail">
    <tr>
      <td height="8" id="Statistics" class="td1"> </td>
    </tr>
    <tr>
      <td class="text">   
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="11%" align="center">学员ID</td>
            <td width="11%" align="center">姓名</td>
            <td width="11%" align="center">学员ID</td>
            <td width="11%" align="center">姓名</td>
            <td width="11%" align="center">学员ID</td>
            <td width="11%" align="center">姓名</td>
          </tr>
          <%
          int i=0,j=0,total=0,yes=0,no=0;
          %>
          <logic:iterate id="weekevl" property="list[@type='evlList']">
          <%
          int type = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/state"));
          int studentID = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/studentId"));
            String state = (type>0)?"<font color='black'>已评估</font>":"<font color='red'>未评估</font>";
          if (type==0) no++; else yes++;
          if (type==1) {
          if (i % 3==0) {
               j++;
          %>
		  <tr <%if (j % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)">
		  <% } %>
            <td align="center">
               <a target="_parent" href="teachWorkManage.prTeachEvaluate.prWeekEvlIssue.do?studentID=<%=studentID%>&classID=<%=classID%>&week=<%=week%>&begin=<%=begin%>&end=<%=end%>"><bean:write id="weekevl" property="evlList/studentId"/></a>
            </td>
            <td align="center"><bean:write id="weekevl" property="evlList/operatorName"/></td>
          <% if ((i+1) % 3==0) { %></tr>
          <% } 
             i++;
             }
             total++;%>
          </logic:iterate>
        </table>
        </td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
document.all.Statistics.innerHTML = "&nbsp;&nbsp;全班总人数 ：" + <%=total%> + "人，<font color='blue'>已评估</font> ：" + <%=yes%> + "人，<font color='red'>未评估</font> ：" + <%=no%> + "人。"; 
</script>