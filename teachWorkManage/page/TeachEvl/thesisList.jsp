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
    <td width="100%" height="19">�༶��
    <html:select property="classId">
    	<html:option value="-1"> ===��ѡ��༶=== </html:option>
    	<html:options collection="classList" property="classId" labelProperty="className"></html:options>
    </html:select>
    
    
      ״̬��<select size="1" name="D1">
        <option>ȫ��</option>
        <option selected>������</option>
        <option>������</option>
      </select></td>
  </tr>
  <tr>
    <td width="100%" height="77">
      <table border="1" width="100%">
        <tr>
          <td width="20%">�༶</td>
          <td width="11%">����</td>
          <td width="36%">���±���</td>
          <td width="19%">�ϴ�ʱ��</td>
          <td width="7%">����</td>
        </tr>
        <logic:iterate id="thesis" name="thesisList">
        <tr>
          <td width="20%">�ڶ�ʮ���ھּ��쵼�ɲ����ް�</td>
          <td width="11%"><bean:write property="studentName" name="thesis"/></td>
          <td width="36%"><a href="http://"><bean:write  property="thesisTitle" name="thesis"/></a></td>
          <td width="19%"></td>
          <td width="7%"><a href="http://">����</a></td>
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