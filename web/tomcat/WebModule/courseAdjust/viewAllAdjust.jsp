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
<script language='javascript' src='/script/Calendar2.js'></script>
<body>
<%String pd=(String)request.getAttribute("pd"); %>
<html:form  action="/adjust.do?action=courseAdjust" method="post" >
<%
Pagination pagination = (Pagination)RequestUtils.lookup(pageContext, "adjustForm", "pagination", null);
int currentPage=pagination.getCurrentPage();
 %>
<table border="0" width="98%" cellspacing="0" cellpadding="0" >
  <tr class="td1">
  
  <%if (pd!=null&&pd.equals("Y")){ %>
      <td align="center"><font color="#FF0000">һ������ؿγ̵���֪ͨ</font></td>
  <%}else{ %>
    <td width="80%" height="19" nowrap="nowrap">�༶��
    <html:select property="classId" onchange="toquery()" value="<%=request.getAttribute("classId").toString() %>">
    	<html:option value="-1"> ===��ѡ��༶=== </html:option>
    	<html:options collection="classList" property="classId" labelProperty="className" ></html:options>
    </html:select> ֪ͨʱ�䣺  �ӣ�<html:text  onfocus="calendar()" property="startTime"  size="10" />
    ���� <html:text  onfocus="calendar()" property="endTime"  size="10"/>
    <input type="button" value="�� ѯ" onclick="toquery()">    
      </td>
    <%} %>
  </tr>
  
  <tr class="td1">
     <%String calId=request.getAttribute("classId").toString(); 
      if(calId=="0"){%>
    <%if (pd!=null&&pd.equals("Y")){ %>
    <td height="8" align="center"> <input type="button" value="��ѯȫ��" onclick="toquery()"></td>
    <%}else{%>
      <td height="8" align="center"> <input type="button" value="�ҵĿγ̵���" onclick="toquery1()"></td>
    <%}} %>
    
  </tr>
   <tr class="td1">
    <td height="8"></td>
  </tr>
  <tr>
    <td width="100%" >
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
        <tr class="td">
            <td width="10%" align="center" style="display: none;">����</td>
            <td width="10%" align="center" style="display: none;">ʱ��</td>
            <td width="10%" align="center" style="display: none;">������</td>
            <td width="50%" align="center">��������</td>
            <td width="10%" align="center">֪ͨʱ��</td>
         
        </tr>
        <logic:iterate id="adjust" name="adjustList">
        <tr class="td1">
          <td align="center" style="display: none;"><bean:write property="tzDate" name="adjust" /></td>
          <td align="center" style="display: none;"><bean:write property="tzTime" name="adjust" /></td>
          <td align="center" style="display: none;"><bean:write property="adjusterName" name="adjust"/></td>
          <td align="left"><bean:write property="adjustContent" name="adjust"/></td>
          <td align="center"><bean:write property="tzDate" name="adjust"/></td>
       
         
        </tr>
        </logic:iterate>
      </table>    </td>
  </tr>
  <tr>
  <%if (pd==null){ %>
    <td width="100%" height="18">
      
    <app:pagelink name="adjustForm" property="pagination"/>    </td>
    <%} %>
  </tr>
</table>
</html:form>
</body>
<script type="text/javascript">
	function toquery(){
		var frm =document.forms[0];
		frm.submit();
	}
	function toquery1(){
		var frm =document.forms[0];
		frm.action="/adjust.do?action=courseAdjust&pd=Y";
		frm.submit();
	}
</script>