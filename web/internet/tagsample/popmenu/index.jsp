<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<html>
<head>
<title>右键快捷菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style>
<!--
.skin0 {
position:absolute;
text-align:left;
width:200px;
border:2px solid black;
background-color:menu;
font-family:Verdana;
line-height:20px;
cursor:default;
visibility:hidden;
}
.skin1 {
cursor:default;
font:menutext;
position:absolute;
text-align:left;
font-family: Arial, Helvetica, sans-serif;
font-size: 10pt;
width:120px;
background-color:menu;
border:1 solid buttonface;
visibility:hidden;
border:2 outset buttonhighlight;
}
.menuitems {
padding-left:15px;
padding-right:10px;
}
-->
</style>

</head>

<body >
<eos:popmenu>
	<eos:popmenuitem url="../testhtml/test1.htm" name="测试1"/>
	<eos:popmenuitem url="../testhtml/test2.htm" target="newwin" name="测试2"/>
	<eos:popmenuitem url="../testhtml/test3.htm" name="测试3"/>
</eos:popmenu>	


<table width="100%" border="1" cellspacing="0" cellpadding="0" oncontextmenu = "showpopup();return false">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<br><br><br>
<table width="100%" border="1" cellspacing="0" cellpadding="0" oncontextmenu = "showpopup();return false">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="popmenuresource.htm">查看源代码</a></p>
</body>
</html>
