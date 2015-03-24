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
<%String num=request.getAttribute("cote").toString(); %>
<%
Pagination pagination = (Pagination)RequestUtils.lookup(pageContext, "newsForm", "pagination", null);
int currentPage=pagination.getCurrentPage();
 %>
 <style>


a:visited {
 TEXT-DECORATION:none;
   
}
A:hover{text-decoration:underline; color:#00FF00;}

.style1 {
	color: #990000;
	font-weight: bold;
}
</style> 
<html:form action="/news.do?action=classNew" method="post">
<table border="0" width="98%" cellspacing="0" cellpadding="0" height="152">

   <tr class="td1">
    <td width="100%" height="19" align="center">
   <%String gCoute=request.getAttribute("gCoute").toString(); %>
   <%out.print("<span class='style1'>");
   out.print(gCoute);out.print("</span>"); %>
    </td>
  </tr>
  <tr>
  
    <td width="100%" height="77">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
        <tr class="td">
          <td width="40%" align="center">标题</td>
          <td width="10%" align="center">创建时间</td>
          <td width="10%" align="center">发表人</td>
          <td width="15%" align="center">部门</td>
          
        </tr>
        <logic:iterate id="news" name="newList">
        
        <tr class="td1">
          <td>&nbsp;
             <html:link href="/news.do?action=showNew" paramName="news" paramProperty="newsId" paramId="newsId" style="text-decoration:none"> 
             
             <bean:write property="title" name="news"/>
              </html:link></td>
          <td align="center"><bean:write property="publishDate" name="news" format="yyyy-MM-dd"/></td>
          <td align="center">&nbsp;
          
						<bean:write  property="publisherName" name="news"/>
					
          </td>
          <td align="center"><bean:write  property="department" name="news"/></td>
       
        </tr>
         
        </logic:iterate>
      </table>    </td>
  </tr>

   <tr>
  
    <td width="100%" height="18">
      
    <app:pagelink name="newsForm" property="pagination"/>    </td>
    
  </tr>
</table>
<input type="hidden" name="cote" value="<%=num %>">

</html:form>

</body>
