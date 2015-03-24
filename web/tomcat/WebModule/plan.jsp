<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<html>

<style type="text/css">
.td {
	font-size: 12px;
	color: #000000;
	background-color: #F0F0F0;
	line-height: 22px;
}
.td1 {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.td2 {
	background-color: #E8F5FF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.text {
	font-size: 12px;
	color: #000000;
	line-height: 20px;
}
.td_title {
	background-color: #4A82D1;
	font-size: 12px;
	line-height: 26px;
	color: #FFFFFF;
}
.button_02 {
	font-size: 12px;
	color: #FFFFFF;
	background-attachment: fixed;
	background-image: url('/internet/image/button_bg.gif');
	background-repeat: no-repeat;
	background-position: center center;
	height: 18px;
	width: 54px;
	border: none;
	cursor: hand;
	line-height: 20px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="/css/css.css" rel="stylesheet" type="text/css">
<title>无标题文档</title>
</head>
<%String contextPath=request.getContextPath();
%>
<body>
<form name="form1" method="post">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="">
  <tr>
    <td width="130%" height="100%" align="center" class="td" valign="top" bgcolor="#FFFFFF">
	  <%
	  String className=(String)request.getAttribute("className");
	  java.util.ArrayList classArray=(java.util.ArrayList)request.getAttribute("classArray");	  
	  String fileName="";
	  int count=0;
	  if(classArray!=null){
	     count=classArray.size();
	  }	  
	%>
 班级名称：
 <select name="className" onChange="selectClass()">
     <%
	  for(int i=0;i<count;i++){	
		  String curClassName=(String)classArray.get(i);
	     if(className.equals(curClassName)){
	 %>
	     <option value="<%=curClassName%>" selected><%=curClassName%></option>
	 <%
	 }else{
	  %>
	   <option value="<%=curClassName%>"><%=curClassName%></option>
	  <%		
	 }
	 }%>
 </select>

	</td>
  </tr>
  
  <tr><td width="100%" align="center">
  <%
  String content=(String)request.getAttribute("content");
  if(content==null||content.equals("")){
    content="<font style=\"font-size: 12px;\">暂时没有任何数据！</font>";
  }
  out.print(content);
  %>
  </td></tr>
  </table>
  </form>
</body>
</html>
<script language="JavaScript">
function selectClass(){
  var frm=document.forms[0];
  frm.action="sign.do?action=teachPlanInfo";
  frm.submit();
}
</script>
