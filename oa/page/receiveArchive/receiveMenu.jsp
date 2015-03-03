<%@include file="/internet/common.jsp"%>
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
        <td width="21%" ><img src="/internet/image/bj_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prReceiveArchive.receiveList.do?temptype=0" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">所有收文</td>
		</a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="/internet/image/bj_02.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prReceiveArchive.receiveList.do?temptype=1" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">待办收文</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="/internet/image/menu_img9.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prReceiveArchive.receiveList.do?temptype=2" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">已办收文</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
     
	  
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
		</tr>
      <tr>
      <a href="javascript:void(0)" onClick="return false">
        <td height="260" colspan="2" > </td>
      </a>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_03.gif" width="170" height="25"></td>
  </tr>
</table>
<script>
function firstLinkHotother(className) {
	var linkObj = document.links[0];
	if(linkObj) {
		var tdObj = linkObj.children[0];
		
		if(parent.mainframe.document.location.href!=document.links[0].href) {
			linkObj.click();
		}
		tdObj.setAttribute("state","3");
		tdObj.className = className;
	
	}
	
	
	

}
firstLinkHotother("menu32");
</script>
