<%@include file="/internet/WFCOMMON/wfappbase.jsp" %>
<%@ page import="com.primeton.eos.wf.service.api.WFServiceException,com.primeton.eos.wf.service.upgrade.*"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>系统升级中</title>
</head>
<%
UpGradeManager upGradeMan=null;
try{
upGradeMan=UpGradeManagerFactory.getInstance();
}catch(WFServiceException e){
	e.printStackTrace();
}
UpGradeReport upGradeReport=upGradeMan.getUpgradeReport();
String from=upGradeReport.getFromVersion();
String to=upGradeReport.getToVersion();
int progress=upGradeReport.getProgress();
%>
<body  background="/internet/WFCOMMON/images/instancemgr.jpg">
<table>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>
<!--<jsp:useBean id="upGradeManagerFactory" scope="session" class="com.primeton.eos.wf.service.upgrade.UpGradeManagerFactory"/>-->
<table border="1" width="50%" cellspacing="0" cellpadding="4" style="border-collapse: collapse" bgcolor="#FFFFEC" height="87" align=center>
 <tr>
  <td bgcolor="#3399FF" style="font-size:12px;color:#ffffff" height=24>系统升级中...</td>
 </tr>
 <tr>
  <td style="font-size:12px;line-height:200%" align=center>系统正在从<%=from%>版本到<%=to%>版本升级处理中.请耐心等待...总进度<%=progress%>%

<SCRIPT LANGUAGE="JavaScript">
setTimeout("location='WFCOMMON.pr_upgrade.startUpgrade.do'", 3000);
</SCRIPT>
  <marquee style="border:1px solid #000000" direction="right" width="200" scrollamount="5" scrolldelay="10" bgcolor="#ECF2FF">
 <table cellspacing="1" cellpadding="0">
  <tr height=8>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  </tr></table></marquee></td>
  </tr>
<%
for(int i=0;i<upGradeReport.getReportItemSize();i++){
UpGradeReportItem upGradRepItem=upGradeReport.getReportAt(i);
String info=upGradRepItem.getInfo();
int progress_item=upGradRepItem.getProgress();
int currentState=upGradRepItem.getCurrentState();
int j=i+1;
%>
<tr align=left>
<td>
<%
if(currentState==1){
 %>
<font size="2" color="red">
<%}%>
    <%=j%>.<%=info%>...进度<%=progress_item%>%
</td>
</tr>
<%
}
%>
</table>
</td></tr>
</table>
</body>
</html>
