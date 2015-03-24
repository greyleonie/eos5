<%
	//response.sendRedirect("http://192.168.0.203/internet/login1.jsp?model=normal");
%>
<%@include file="/internet/common.jsp"%>
<%@ page import="com.primeton.tp.core.Constants" %>

<%
	/**
	*Add by yuanrongyu 清空session中的EOS_TREE_MENU
	*/
	if(session.getAttribute("EOS_TREE_MENU")!=null)
	{
		session.removeAttribute("EOS_TREE_MENU");
	}
	if(session.getAttribute("sessionContext")!=null){
		session.removeAttribute("sessionContext");
	}
	if(session.getAttribute("userPermissions")!=null){
		session.removeAttribute("userPermissions");
	}

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String model = request.getParameter("model");
	if( model==null ) model = "normal";

	session.setAttribute("model",model);
	String prePort = request.getParameter("port");
	if( prePort==null || "".equals(prePort) ) prePort = "null";
	if( !model.equals("normal") ) session.setAttribute("port",prePort);
	
	session.setAttribute("loginURL","/internet/login.jsp?model="+model+"&port="+prePort);
%>
<HTML><HEAD><TITLE>广州市委党校信息一体化平台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="INDEX.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.input {
	font-size: 12px;
    width:100;
	color: #000000;
	border-top: 1px solid #636562;
	border-right: 1px solid #A3A3A3;
	border-bottom: 1px solid #A3A3A3;
	border-left: 1px solid #636562;
	height: 18px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F1F1F1;
}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #3A3A39;
}
.outtable {
	border: 1px dashed #8B8C8D;
}
-->
</style>
<script language="JavaScript">
 window.onload = function(){
 var objName="250";
 var frm = document.login;
 var arrStr = document.cookie.split("; ");
  for(var i = 0;i < arrStr.length;i ++){
     var temp = arrStr[i].split("=");
     if(temp[0] == objName){
      var str= new Array();    
      str=temp[1].split(",");       
      frm.elements["EOSOperator/userID"].value=str[0];
     frm.elements["hciPasswordTypeEOSOperator/password"].value=str[1];
    //  alert(temp[1]);
      }
    } 

}
function getTotalBytes(varField) {
	if(varField == null)
		return -1;
	
	var totalCount = 0;
	for (i = 0; i< varField.value.length; i++) {
		if (varField.value.charCodeAt(i) > 127) 
			totalCount += 2;
		else
			totalCount++ ;
	}
	return totalCount;
}

function _login(){
	var frm = document.login;
	frm.target="_parent"
	if(frm.elements["EOSOperator/userID"].value.trim() =="") {
		alert("请输入用户登录名");
		frm.elements["EOSOperator/userID"].focus();
		return;
	}
	if(getTotalBytes(frm.elements["EOSOperator/userID"])>64) {
		alert("用户登录名不能超过64个字节，请重新输入！");
		return;
	}	
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value.trim() =="") {
		alert("请输入密码");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || 	frm.elements["hciPasswordTypeEOSOperator/password"].value.length > 20) {
		alert("密码长度请在6--20位之间");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	
	
	var Obj = document.getElementsByName("qualityProblemCircs");
    for(i=0;i<Obj.length;i++){if(Obj[i].checked){break}};
	if(i!=Obj.length){
	if(Obj[i].value=="1"){
	    var value2=frm.elements["hciPasswordTypeEOSOperator/password"].value;
	    var value1=frm.elements["EOSOperator/userID"].value;
	  var value=value1+","+value2;
	   var name="250";
	   var Days = 360;
       var exp  = new Date();    //new Date("December 31, 9998");
          exp.setTime(exp.getTime() + Days*24*60*60*1000);
          document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
	 }else{
	   var name="250";
	   var date = new Date();
       date.setTime(date.getTime() - 10000);
         document.cookie = name + "=a; expires=" + date.toGMTString();
	 } 
	}
	
 
   
     
    
	frm.submit();
					
}
</script>

</HEAD>
<BODY style="MARGIN: 0px;">
<form name="login" method="post" target="top" action="talent.pr.login.do" oldaction="ROLE.pr_automata.login.do" focus="EOSOperator/userID" onsubmit="javascript:return false;">
	<TABLE width="800" height="500" align="center" cellPadding=0 cellSpacing=0 background="/internet/image/body_bg.gif">
	  <TBODY>
	  <TR>
		<TD>
		  <TABLE width=650 height=380 align="center" cellPadding=0 cellSpacing=0 background=/internet/image/login_bg.gif class="outtable" style="BACKGROUND-REPEAT: no-repeat">
			<TBODY>
			<TR>
			  <TD style="PADDING-BOTTOM: 5px" vAlign=top align=right><table width="100%" height="364"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td width="36%" height="220">&nbsp;</td>
				  <td width="64%">&nbsp;</td>
				  </tr>
				<tr>
				  <td>&nbsp;</td>
				  <td valign="middle">
					<table width="75%"  border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
						<td width="29%" height="20" align="right" class="text">用户类型：</td>
						<td width="71%" height="20" align="left">
						  <select name="select" class="input">
							
							<option selected>普通用户</option>
						  </select>
						</td>
					  </tr>
					  <tr>
						<td height="20" align="right" class="text">用户名：</td>
						<td height="20" align="left"><input name="EOSOperator/userID" type="text" class="input" title="输入你的姓名"><SPAN class="text">(输入你的名字)</SPAN></td>
					  </tr>
					  <tr align="center">
						<td height="20" align="right" class="text">密　码：</td>
						<td height="20" align="left"><input name="hciPasswordTypeEOSOperator/password" type="password" class="input" title="初始密码：888888"><SPAN class="text">(初始密码：888888)</SPAN></td>
					  </tr>
					  <tr>
						<td height="20" align="right" class="text">是否保存用户：</td>
						<td height="20" align="left">   
						<input type="radio"  name="qualityProblemCircs" value="1" ><SPAN class="text">是&nbsp;</SPAN>
                         <input type="radio" name="qualityProblemCircs" value="0"><SPAN class="text">否&nbsp;</SPAN>

                       </td>
					  </tr>
					  <tr align="center">
					  
						<td height="36" colspan="2">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
							  <tr>
								<td width="61">&nbsp;</td>
								<td width="213">
								<input name="Submit2" type="submit" class="button_login" value="　　" onclick="javascript:_login();">
								&nbsp;
								<input name="Submit" type="reset" class="button_reset" value="　　"></td>
								<td width="37">&nbsp;</td>
							  </tr>
							</table>
	
						
						</td>
					  
					</tr>
					</table>
				  </td>
				  </tr>
			  </table>
			</TD>
		</TR>
	 </TABLE>
	</TR>
	</TBODY>
	</TABLE>
</form>
</BODY>
</HTML>
<script language="JavaScript">
function toFocus() {
	if(document.forms[0].elements["EOSOperator/userID"]) document.forms[0].elements["EOSOperator/userID"].focus();
}
toFocus();
</script>