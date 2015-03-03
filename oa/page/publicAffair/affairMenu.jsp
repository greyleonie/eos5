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
	<table width="80%" height="100"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">

      <tr>
        <td width="21%" ><img src="/internet/image/bj_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prAffair.workArrangeList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">工作安排</td>
		</a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>

      <tr>
        <td width="21%" ><img src="/internet/image/wlzx_05.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prAffair.noticeList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">公告通知</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>


      <tr>
        <td width="21%" ><img src="/internet/image/jcgl_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">共享文件夹</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
      </tr>

      <tr>
        <td width="21%" ><img src="/internet/image/jcgl_02.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">公共通讯录</td>
        </a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
  
      <a href="javascript:void(0)" onClick="return false">
        <td height="152" colspan="2" > </td>
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