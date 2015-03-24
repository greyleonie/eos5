<script language="JavaScript">

function changeWin(){
	if(parent.mainTop.rows!="300,8,*")
	{
		parent.mainTop.rows="300,8,*";
		document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/top.gif\">";
	}
	else
	{
		parent.mainTop.rows="0,8,*";
		document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/buttom.gif\">";
	}
}
</script>
<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#EEEEEE">
<div style="BORDER-RIGHT: gray 0px solid; BORDER-LEFT: gray 1px solid; WIDTH:100%; HEIGHT:100%"> 
<table cellSpacing=0 cellPadding=0 width="100%" border=0 bgColor=#EEEEEE>
  <tr>
    <td id="menuSwitch" width="100%" align="center" valign="top" onclick=changeWin()><img src="/internet/WFCOMMON/images/top.gif" width="50" height="8">
    </td>
  </tr>
</table>
<script language="JavaScript">
parent.mainTop.rows="300,8,*";
document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/top.gif\">";
</script>
</div>
</body>