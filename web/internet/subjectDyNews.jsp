<%@ page language="java" contentType="text/html; charset=GBK"%>
<%
talent.core.SubjectDyNews subjectDyNews=new talent.core.SubjectDyNews();
String content="";
content=subjectDyNews.createDyNews();
%>
gg=""
gg=gg+"<\script language=\"javascript\">function openw(url){window.open(url,'','');}</\script>"
gg=gg+"<table border='0' width='100%' cellspacing='0' cellpadding='0'>"
gg=gg+"<%=content%>"
document.write (gg);



