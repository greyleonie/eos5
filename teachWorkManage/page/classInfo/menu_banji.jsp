<%@include file="/internet/common.jsp"%>

<html>
<head>

<title>广州市委党校信息一体化平台</title>

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

<body bgcolor="#D6EEFF">
<table width="170"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/internet/image/left_menu_01.gif" width="170" height="32"></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_02.gif" width="170" height="20"></td>
  </tr>
  <tr>
    <td background="/internet/image/left_menu_bg.gif">
	<table width="80%" height="300"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">
     <tr>
        <td width="21%" ><img src="/internet/image/leftMenu_1.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prClassInfoManage.classInfoList.do?PageCond=&Class/isHistoryClass/criteria/value=0" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">当前班级</td>
		</a>
      </tr>
    <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
<tr>
        <td width="21%" ><img src="/internet/image/bj_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prClassInfoManage.classInfoList.do?PageCond=&Class/isHistoryClass/criteria/value=2" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">计划班级</td>
		</a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="/internet/image/bj_02.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prClassInfoManage.classInfoList.do?PageCond=&Class/isHistoryClass/criteria/value=1" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">历年班级</td>
        </a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
		</tr>
      <tr>
        <td height="260" colspan="2" > </td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_03.gif" width="170" height="25"></td>
  </tr>
</table>
</body>
</html>
<script language="JavaScript">
	var linkObj = document.links[0];	
	//window.location.href = linkObj;
	clickAction(linkObj);
</script>