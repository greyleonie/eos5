<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@page import="com.talent.common.CommonConstants"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="/css/css.css" rel="stylesheet" type="text/css">
<title>无标题文档</title>
</head>

<body>
<div align="center" class="td1">
<br><font color="red">
<bean:write name="<%= CommonConstants.MessageStr%>"/>

</font>
</div>
</body>
</html>
