<script language="JavaScript">
function changeWin(){
	if(parent.mainFrame.cols!="*,8,181")
	{
		parent.mainFrame.cols="*,8,181";
		document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/right.gif\">";
	}
	else
	{
		parent.mainFrame.cols="*,8,0";
		document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/left.gif\">";
	}
}
</script>
<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#EEEEEE">
<table cellSpacing=0 cellPadding=0 height="100%" width="100%" border=0 bgColor=#FFFFFF>
  <tr>
    <td id="menuSwitch" width="100%" align="center" onclick=changeWin()><img src="/internet/WFCOMMON/images/left.gif">
    </td>
  </tr>
</table>

<script language="JavaScript">
parent.mainFrame.cols="*,8,181";
document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/right.gif\">";
</script>
</body>