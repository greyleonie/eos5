<%@ page language="java" contentType="text/html; charset=GBK"%>
<body  bgcolor="#FFD88D">
<br><br>
<div align="center" class="text">

<%
	String info=request.getAttribute("meg").toString();
	out.print(info);
 %>

<br><br>
<input name="Submit2" type="button" class="button_02" value="¹Ø ±Õ" onClick="javascript:window.close()">
&nbsp;&nbsp;&nbsp;

</div>
</body>