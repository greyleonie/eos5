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
	<qx:talentModule moduleID="DX_OASYS_RESEARCH_KETISHENBAO">
      <tr>
        <td width="21%" ><img src="/internet/image/bj_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.ketiSbList.do?type=sb" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">课题申报</td>
		</a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
     </qx:talentModule>
     <qx:talentModule moduleID="DX_OASYS_RESEARCH_CHENGGUOSHENBAO">
      <tr>
        <td width="21%" ><img src="/internet/image/wlzx_05.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.ketiSbList.do?type=bj" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">成果申报</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_KETIPINGSHEN">
      <tr>
        <td width="21%" ><img src="/internet/image/jcgl_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.reviewList.do?type=sb" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">课题申报审核</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_CHENGGUOPINGSHEN">
      <tr>
        <td width="21%" ><img src="/internet/image/jcgl_02.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.reviewList.do?type=bj" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">成果申报审核</td>
        </a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_REPORTCOURSE">
      <tr>
        <td width="21%" ><img src="/internet/image/jcgl_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.reportCourseList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">立项课题管理</td>
        </a>
      </tr>
	  <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_REPORTRESULT">
      <tr>
        <td width="21%" ><img src="/internet/image/jcgl_02.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.reportResultList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">成果管理</td>
        </a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_OFFICEFUNDS">
      <tr>
        <td width="21%" ><img src="/internet/image/wlzx_02.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchFunds.officeFundsList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">科研处经费管理</td>
        </a>
      </tr>
            <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_GROUPFUNDS">
      <tr>
        <td width="21%" ><img src="/internet/image/wlzx_03.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchFunds.groupFundsList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">课题经费管理</td>
        </a>
      </tr>
            <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_FINANCEFUNDS">
      <tr>
        <td width="21%" ><img src="/internet/image/wlzx_01.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchFunds.financeFundsList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">财务处经费管理</td>
        </a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
      </tr>
      </qx:talentModule>
      <qx:talentModule moduleID="DX_OASYS_RESEARCH_GROUPMANAGE">
      <!--<tr>
        <td width="21%" ><img src="/internet/image/cdgl2_05.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
        <a href="oa.prResearchManage.groupList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">科研组管理</td>
        </a>
      </tr>-->
      
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
		</tr>
      <tr>
      </qx:talentModule>
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