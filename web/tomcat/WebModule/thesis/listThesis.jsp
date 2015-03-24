<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<%@page import="com.talent.common.TalentFunction"%>
<%@page import="com.talent.common.Pagination"%>
<%@page import="org.apache.struts.util.RequestUtils"%>
<%@page import="com.talent.common.CommonConstants"%>

<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>
<script language="javascript">
<%
if (request.getAttribute(CommonConstants.MessageStr) != null) {
out.println("alert('"+request.getAttribute(CommonConstants.MessageStr)+"')");
}
%>
</script>
<body>
<html:form action="/thesis.do?action=listThesis" method="post">
<%
Pagination pagination = (Pagination)RequestUtils.lookup(pageContext, "thesisForm", "pagination", null);
int currentPage=pagination.getCurrentPage();
 %>
<table border="0" width="98%" cellspacing="0" cellpadding="0" height="152">
  <tr>
    <td width="100%" height="77">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
        <tr class="td">
          <td width="30%" align="center">班级</td>
          <td width="10%" align="center">姓名</td>
          <td width="38%" align="center">文章标题</td>
          <td width="13%" align="center">上传时间</td>
          <logic:equal name="isBeforeDeadline" value="0"  scope="request">
          <td width="9%" align="center">状态</td>
          </logic:equal>
        </tr>
        <logic:iterate id="thesis" name="thesisList">
        <tr class="td1">
          <td>&nbsp;
            <bean:write property="className" name="thesis"/></td>
          <td align="center"><bean:write property="studentName" name="thesis"/></td>
          <td>&nbsp;
          	<logic:notEqual name="thesis" property="state" value="1">
          	<bean:write  property="thesisTitle" name="thesis"/>
          	</logic:notEqual>
          <logic:equal name="thesis" property="state" value="1">	
          <html:link href="thesis.do?action=viewThesisContent" paramName="thesis" paramProperty="thesisId" paramId="thesisId" target="_blank">
						<bean:write  property="thesisTitle" name="thesis"/>
					</html:link>
					</logic:equal>
          </td>
          <td align="center"><bean:write  property="commitTime" name="thesis" format="yyyy-MM-dd"/></td>
          
          <logic:equal name="isBeforeDeadline" value="0">
          <td align="center">
 					<logic:empty name="thesis" property="thesisTitle">
          <logic:equal name="thesis" property="state" value="1">
 					<a href="/thesis.do?action=uploadThesis"><font color="red">请上传</font></a>
 					</logic:equal>
 					<logic:notEqual name="thesis" property="state" value="1">
 					未上传
 					</logic:notEqual>
 					</logic:empty>
 					<logic:notEmpty name="thesis" property="thesisTitle">
 					<logic:equal name="thesis" property="state" value="1">
 					<a href="/thesis.do?action=uploadThesis"><font color="red">修改</font></a>
 					</logic:equal>
 					<logic:notEqual name="thesis" property="state" value="1">
 					已上传
 					</logic:notEqual>
 					</logic:notEmpty>
          </td>
          </logic:equal>
          
        </tr>
        </logic:iterate>
      </table>    </td>
  </tr>
  <tr>
    <td width="100%" height="18">
    <app:pagelink name="thesisForm" property="pagination"/>    </td>
  </tr>
</table>

</html:form>

<script type="text/javascript">
	function toquery(){
		var frm =document.forms[0];
		frm.submit();
	}
</script>
</body>
