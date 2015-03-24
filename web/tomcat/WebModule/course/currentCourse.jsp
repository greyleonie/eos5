<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<title>中共广州市委党校</title>
<%
 String path=request.getContextPath();
%>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css" />
<script src="/script/fcccalendar.js" language='javascript' type='text/javascript'></script>

<body class="body_none">
<form action="couseView.do?action=currentCourse">
<table width="98%" height="50px" border="0" align="center" cellpadding="0" cellspacing="1">
<tr><td class="text">
时间：从 <input type="text" name="from" value="" class="input" size="10" />
<img src="/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["from"],"yyyy-MM-dd")>
至 <input type="text" name="to" value="" class="input" size="10" />
<img src="/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["to"],"yyyy-MM-dd")>
</td></tr></table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
  <tr align="middle">
    <td  align="center" nowrap class="td">上课日期</td>
	<td  align="center" class="td">上课时间</td>
    <td width="12%" align="center" class="td">教室</td>
    <td width="60%" align="center" class="td">课题</td>
	<td width="15%" nowrap align="center" class="td">是否考勤</td>
  </tr>
  <%
   int count=0;
  %>
 <logic:iterate id="list" name="courseList">
  <tr>
    <td width="11%" nowrap align="left" class="td1"><bean:write name="list" property="classDate"/></td>
    <td width="8%" nowrap align="left" class="td1"><bean:write name="list" property="classTime"/></td>
    <td class="td1" nowrap><bean:write name="list" property="classRoom"/></td>
    <td align="left" class="td1"><bean:write name="list" property="courseTitle"/></td>
	<td width="8%" align="left" class="td1">
	<logic:equal name="list" property="isUseKqj" value="0">否</logic:equal>
	<logic:equal name="list" property="isUseKqj" value="1">是</logic:equal>
	</td>
  </tr>
  <%
   count++;
  %>
 </logic:iterate>
 <%
  if(count==0){
 %>
 <tr>
    <td colspan="5" nowrap align="center" class="td1">今天没有课！</td>   
  </tr>
 <%
  }	 
 %>
</table>
</form>
</body>
</html>
