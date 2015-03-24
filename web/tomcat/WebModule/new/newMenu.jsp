<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="/css/css.css" rel="stylesheet" type="text/css">
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
<script language='javascript' src='/script/validator.js'></script>
<script type="text/javascript">

function clickAction(aObject) {
	//alert("click")
	var tObject = aObject.childNodes[0];
	tObject.setAttribute("state","3");
	tObject.className = "menu32";

}
function overAction(aObject) {
	//alert("over")
	var tObject = aObject.childNodes[0];
	tObject.className = "menu33";
	tObject.setAttribute("state","0");

}

function outAction(aObject) {
	//alert("out")
	
	var tObject = aObject.childNodes[0];

	if(tObject.getAttribute("state") == "3") {
		tObject.className = "menu32";
	}else{
		tObject.setAttribute("state","0");
		tObject.className = "menu31";
	}
}
function change(aObject,num){
var tObject = aObject.childNodes[0];
	tObject.setAttribute("state","3");
	tObject.className = "menu32";
  if(num=="1"){
  document.getElementById("repNew").src="/news.do?action=classNew&cote=1";
  document.getElementById("col2").class="menu31";
  }
  else if(num=="2"){
  document.getElementById("repNew").src="/news.do?action=classNew&cote=2";
  }
  else if(num=="3"){
  document.getElementById("repNew").src="/news.do?action=classNew&cote=3";
  }
  else if(num=="4"){
  document.getElementById("repNew").src="/news.do?action=classNew&cote=4";
  }
}
</script>

<body>

  <tr>
    <td width="100%" height="19"> </td>
  </tr>
  <tr class="td1">
    <td width="100%" height="19">
   
    </td>
  </tr>
  <tr class="td1">
    <td height="8">
      <a href="#" target="main" class="menu31" ><font class="menu31" id="col1">校园新闻</font> </a>|
      <a href="#" target="main" class="menu31" id="col2" ><font class="menu31" >校院通知</font></a> | 
      <a href="#" target="main" class="menu31" ><font class="menu31" id="col3">会议公告</font></a> |     
      <a href="#" target="main" class="menu31" ><font class="menu31" id="col4">部门公告</font></a> </td>
  </tr>
 	<iframe id="repNew"  width="100%" height="100%" scrolling="[auto]" src="/news.do?action=classNew&cote=1" frameborder="x" boder="0" name="main"></iframe>
</body>
</html>