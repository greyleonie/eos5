<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<html>

<head>
 <title>时间控件</title>
</head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/createTime.js"></SCRIPT>
<body>
	<eos:time initTime="11:22:33" displayName="timeCtrl" name="txtTime"/>
<input type="Button" value="测试时间控件" onclick="alert(document.all.txtTime.value)">
</body>
</html>