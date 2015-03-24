<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>

<script language="JavaScript">

function changeWin(){
	if(parent.mainTop.rows!="300,*")
	{
		parent.mainTop.rows="300,*";
		document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/top.gif\">";
	}
	else
	{
		parent.mainTop.rows="10,*";
		document.all.menuSwitch.innerHTML="<img src=\"/internet/WFCOMMON/images/buttom.gif\">";
	}
}
</script>

<html>
<table cellSpacing=0 cellPadding=0 width="100%" border=0 bgColor=#afcdeb>
  <tr>
    <td id="menuSwitch" width="100%" align="center" onclick=changeWin()><img src="/internet/WFCOMMON/images/top.gif">
    </td>
    <td>
    </td>
  </tr>
</table>

    <table width="100%" height="100%">
        <tr height="100%">
          <td>

          <logic:present property="process/activityDefID">
          	<logic:present property="process/activityType">
	     		<eos:tabframe id="test"  width="100%" height="500" frameborder="1" scrolling="auto" >
    				<eos:tabframetitle url="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDef.do" type="xpath" property="process"  title="流程详细信息"/>
    				<eos:tabframetitle url="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do" type="xpath" property="process"   title="活动详细信息" selected="true"/>
    			</eos:tabframe>
	     	</logic:present>
	  </logic:present>
          </td>
        </tr>
    </table>

</html>

<%@include file="/internet/commonTail.jsp"%>