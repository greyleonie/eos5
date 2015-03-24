<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<%@page import="com.talent.common.TalentFunction"%>
<%@page import="com.talent.common.Pagination"%>
<%@page import="org.apache.struts.util.RequestUtils"%>
<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>

<style>
.td8{
	font-size: 12px;
	font-weight:bold;
	color: #000000;
	background-color: #FFFFFF;
	line-height: 22px;
	cursor: hand;
}
.td9 {
	font-size: 12px;
	line-height: 22px;
	color: #000000;
	background-color: #FFFFFF;
	cursor: hand;
}
</style>
<body>
<html:form action="/arrange.do?action=arrangeList" method="post">
<%
Pagination pagination = (Pagination)RequestUtils.lookup(pageContext, "arrangeForm", "pagination", null);
int currentPage=pagination.getCurrentPage();
 %>
<table border="0" width="98%" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="100%" >
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
        <tr class="td">
            <td width="10%" align="center">安排日期</td>
            <td width="10%" align="center">制定人</td>
            <td width="70%" align="center">工作概要</td>

        </tr>
        <logic:iterate id="arrange" name="arrangeList">
        <tr class="<logic:equal  property="type" name="arrange" value="0">td8</logic:equal><logic:equal  property="type" name="arrange" value="1">td9</logic:equal>" onclick="viewArrange('<bean:write property="arrangeId" name="arrange" />',this)">
          <td align="center"><bean:write property="calendarDate" name="arrange" /></td>
          <td align="center"><bean:write property="userName" name="arrange" /></td>
          <td align="center"><bean:write property="tasksum" name="arrange" /></td>
        </tr>
        </logic:iterate>
      </table>    </td>
  </tr>
  <tr>
    <td width="100%" height="18">
    <app:pagelink name="arrangeForm" property="pagination"/>    </td>
  </tr>
</table>
</html:form>
</body>
<script type="text/javascript">
function viewArrange(id,obj){
  obj.className="td9"
  var frm = document.forms[0];
  frm.action="/arrange.do?action=arrangeView&arrangeID="+id;
  frm.submit();
}
	
	
</script>