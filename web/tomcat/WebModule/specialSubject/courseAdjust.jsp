<%@ page language="java" contentType="text/html; charset=GBK"%>
<title>中共广州市委党校</title>
<%
String path=request.getContextPath();
int count=0;
int size=0;
java.util.ArrayList list=(java.util.ArrayList)request.getAttribute("courseAdjust");
if(list!=null){
  size=list.size();
}


%>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css" />

<body class="body_none">
<table width="98%" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" class="text_red">课程调整通知(只显示最新的50条通知)</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
  <tr align="middle">
    <td  align="center" class="td">调整时间</td>
	<td  align="center" class="td">发布时间</td>
    <td width="10%" align="center" class="td">班级</td>
    <td width="71%" align="center" class="td">调整内容</td>
  </tr><%
  for(int i=0;i<list.size();i++){
  com.talent.web.form.CourseAdjustForm form=(com.talent.web.form.CourseAdjustForm)list.get(i); 
  String adjustTime=form.getAdjustTime();
  String noticeTime=form.getNoticeTime();
  String className=form.getClassName();
  String adjustContent=form.getAdjustContent();
  %><tr >
    <td width="11%" nowrap align="left" class="td1"><%=adjustTime%></td>
    <td width="8%" nowrap align="left" class="td1"><%=noticeTime%></td>
    <td class="td1" nowrap><%=className%></td>
    <td align="left" class="td1"><%=adjustContent%></td>
  </tr>
  <%
   count++;
   }  
    if(count==0){
	%>
	  <tr >
    <td align="center" class="td1" colspan="4">没有通知！</td>
	</tr>
	<%
	}
  %>
</table>
</body>
</html>
