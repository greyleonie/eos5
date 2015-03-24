<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<html>
<head><%String path=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中共广州市委党校</title>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<form method="post" >
<table width="100%" height="224" border="0" align="center" cellpadding="0" cellspacing="0">

  
  <tr>
    <td width="98%" height="10"><table width="68%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
      
	    <tr>
          <td width="8%" nowrap align="center" colspan="2" class="td"><bean:write name="msg"/></td> 	         
      </tr>
     
	   <tr>
          <td nowrap align="center" colspan="2" class="td1"> 
		    <input style="border:0;courser:hand" type="button" value="继续报名" onclick="history.go(-2)">
            <input style="border:0;courser:hand" type="button" value="关 闭" onclick="window.close()">
		</td> 	           
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="100%" height="63" class="text"></td>
  </tr>
  <tr>
    <td width="100%" height="18"></td>
  </tr>
</table></form>
</body>
</html>

