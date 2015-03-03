<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%
String fid=request.getParameter("pid");
String subaction = request.getParameter("subaction"); 
String leftid = request.getParameter("leftid"); 
String subid = request.getParameter("subid"); 
 %>
 
<frameset cols="170,6,*" frameborder="NO" border="0" framespacing="0" name="contentFrameSet">
  <frame src="oa.prDesk.leftFrame.do?PID=<%=fid%>&leftid=<%=leftid %>&subid=<%=subid %>&subaction=<%=subaction%>" name="leftFrame" scrolling="NO" noresize>
  <frame src="common.pr.space.do" name="spaceFrame" scrolling="NO" noresize>
  <frame src="" name="mainFrame" scrolling="auto" noresize>
  
  
  </frameset>

</frameset>
<noframes><body>
</body></noframes>