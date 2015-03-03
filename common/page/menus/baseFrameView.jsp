<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<frameset cols="170,6,*" frameborder="NO" border="0" framespacing="0" name="contentFrameSet">
  <frame src="common.pr.leftMenu.do?PID=<bean:write property='menuID'/>" name="leftFrame" scrolling="NO" noresize>
  <frame src="common.pr.space.do" name="spaceFrame" scrolling="NO" noresize>
  <frame src="" name="mainFrame" scrolling="auto" noresize>
  </frameset>

</frameset>
<noframes><body>
</body></noframes>