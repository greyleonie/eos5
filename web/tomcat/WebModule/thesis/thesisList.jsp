<%@page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<%@page import="com.talent.common.TalentFunction"%>
<%@page import="com.talent.common.Pagination"%>
<%@page import="org.apache.struts.util.RequestUtils"%>
<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>
<body>
<html:form action="/thesis.do?action=thesisList" method="post">
<%
Pagination pagination = (Pagination)RequestUtils.lookup(pageContext, "thesisForm", "pagination", null);
int currentPage=pagination.getCurrentPage();
 %>
<table border="0" width="98%" cellspacing="0" cellpadding="0" height="152">
  <tr>
    <td width="100%" height="19"> </td>
  </tr>
  <tr class="td1">
    <td width="100%" height="19">&nbsp;&nbsp;班级：
    <html:select property="classId" onchange="toquery()">
    	<html:option value="-1"> ===请选择班级=== </html:option>
    	<html:options collection="classList" property="classId" labelProperty="className"></html:options>
    </html:select>
    
    
      状态：
      <html:select property="state" onchange="toquery()">
      	<html:option value="-1">全部</html:option>
      	<html:option value="0">待批改</html:option>
      	<html:option value="1">已批改</html:option>
      </html:select>
      </td>
  </tr>
  <tr class="td1">
    <td height="8"></td>
  </tr>
  <tr>
    <td width="100%" height="77">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
        <tr class="td">
          <td width="30%" align="center">班级</td>
          <td width="10%" align="center">姓名</td>
          <td width="38%" align="center">文章标题</td>
          <td width="15%" align="center">上传时间</td>
          <td width="7%" align="center">评分</td>
        </tr>
        <logic:iterate id="thesis" name="thesisList">
        <tr class="td1">
          <td>&nbsp;
            <bean:write property="className" name="thesis"/></td>
          <td align="center"><bean:write property="studentName" name="thesis"/></td>
          <td>&nbsp;
          <html:link href="thesis.do?action=viewThesisContent" paramName="thesis" paramProperty="thesisId" paramId="thesisId" target="_blank">
						<bean:write  property="thesisTitle" name="thesis"/>
					</html:link>
          </td>
          <td align="center"><bean:write  property="commitTime" name="thesis"/></td>
          <td align="center">
 					<bean:define id="state" property="state" name="thesis"></bean:define>
          <%
          if(state!=null&&TalentFunction.getInt(state)==1) 
          		out.println("已批改");
          	else{
          		 %>
          <a href='thesis.do?action=gradeThesis&thesisId=<bean:write  property="thesisId" name="thesis"/>&currentPage=<%=currentPage %>'>评分</a>
          
          <%} %>
          </td>
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
