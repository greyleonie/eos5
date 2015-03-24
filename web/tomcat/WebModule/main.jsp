<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@page import="com.talent.hibernate.Eosoperator"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中共广州市委党校</title>
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script>
function menu3(t) {
    for (var i=0; i<t.rows.length; i++)
    for (var j=0; j<t.rows[i].cells.length; j++)
    t.rows[i].cells[j].className= t.rows[i].cells[j] == event.srcElement ? 'menu32' : 'menu31';
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

function clickAction(aObject) {
	//alert("click")
	var tObject = aObject.childNodes[0];
	tObject.setAttribute("state","3");
	tObject.className = "menu32";

}

</script>
</head>

<body class="body_none">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><%@include file="common/top.jsp" %></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="FFA800">
  <tr>
    <td width="120" height="420" align="center" valign="top" bgcolor="#FFFFFF">
    <% 
    if(request.getSession().getAttribute("user")!=null){
    			Eosoperator user=(Eosoperator) request.getSession().getAttribute("user");
    			Integer operatorType=user.getOperatorType();
    			if(operatorType!=null){
    				if(operatorType.intValue()==1){
     %>
    		<%@include file="studentLeft.jsp" %>
    <%}   
    else{%>
    <%@include file="teachLeft.jsp" %>
    <%}}} %>
    </td>
    <td width="100%" valign="top" bgcolor="#FFFFFF">
    <%
    if(request.getSession().getAttribute("user")!=null){
    			Eosoperator user=(Eosoperator) request.getSession().getAttribute("user");
    			Integer operatorType=user.getOperatorType();
     if(operatorType!=null){
    				if(operatorType.intValue()==1){ %>
		<iframe  width="100%" height="100%" scrolling="[auto]" src="TeachEvl/zlpg.jsp?openState=0" frameborder="x" boder="0" name="main"></iframe>
	<%}else{ %>
		<iframe  width="100%" height="100%" scrolling="[auto]" src="news.do?action=allNew" frameborder="x" boder="0" name="main"></iframe>
		<%}}} %>
	</td>
  </tr>
</table>
<%@include file="common/bottom.jsp" %>
</body>
