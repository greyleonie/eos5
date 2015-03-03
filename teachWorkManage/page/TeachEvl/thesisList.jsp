<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<link href="/css/css.css" rel="stylesheet" type="text/css">

<body>
<html:form action="/thesis.do?action=thesisList" method="post">
<table border="0" width="90%" cellspacing="0" cellpadding="0" height="114">
  <tr>
    <td width="100%" height="19"></td>
  </tr>
  <tr>
    <td width="100%" height="19">班级：
    <html:select property="classId">
    	<html:option value="-1"> ===请选择班级=== </html:option>
    	<html:options collection="classList" property="classId" labelProperty="className"></html:options>
    </html:select>
    
    
      状态：<select size="1" name="D1">
        <option>全部</option>
        <option selected>待批改</option>
        <option>已批改</option>
      </select></td>
  </tr>
  <tr>
    <td width="100%" height="77">
      <table border="1" width="100%">
        <tr>
          <td width="20%">班级</td>
          <td width="11%">姓名</td>
          <td width="36%">文章标题</td>
          <td width="19%">上传时间</td>
          <td width="7%">评分</td>
        </tr>
        <logic:iterate id="thesis" name="thesisList">
        <tr>
          <td width="20%">第二十二期局级领导干部进修班</td>
          <td width="11%"><bean:write property="studentName" name="thesis"/></td>
          <td width="36%"><a href="http://"><bean:write  property="thesisTitle" name="thesis"/></a></td>
          <td width="19%"></td>
          <td width="7%"><a href="http://">评分</a></td>
        </tr>
        </logic:iterate>
      </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="18">
    <app:pagelink name="thesisForm" property="pagination"/>
    </td>
  </tr>
</table>

</html:form>
</body>