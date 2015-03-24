<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<%@ page import="com.primeton.eos.wf.web.util.WFGraphTagUtil"%>
<%@ page import="com.primeton.eos.wf.service.api.WFServiceException"%>

<%
String zoom=request.getParameter("zoom");
String id=request.getParameter("processInstID");
int procId = 0;
if (id!=null)
    procId=Integer.parseInt(id);
float fZoom=1.0f;
try
{
fZoom = WFGraphTagUtil.getProperZoomQuality(0,procId,400,256);
//System.out.println("fZoom =" +fZoom);
}
catch (WFServiceException e)
{
}
if (zoom==null )
{
zoom="1.0";
}
//System.out.println(procId);
//System.out.println(fZoom);
%>
<html>
  <head>
    <title>工作流实例查询</title>
    <META http-equiv=Content-Type content="text/html; charset=GBK">
  </head>
  <script  language="JavaScript">
  	function showActivityList(){
  		graphFrm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryProcessActivityInstTab.do?showWhich=0&processInstID=<bean:write property="processInstID"/>";
  		graphFrm.target="activityList";
   		graphFrm.submit();
//		parent.activityList.table1.style.display="block";
   	}
  
    	function listViewCtrl(){
		if(parent.activityList.table1.style.display=="none")
		parent.activityList.table1.style.display="block";
		else if(parent.activityList.table1.style.display=="block")
		parent.activityList.table1.style.display="none";
			
	}
	
  </script>
<form name="graphFrm" action="" method="post">
<html:hidden  property ="processDefName"/>
<html:hidden  property ="processDefID"/>
<html:hidden  name="WFProcessInst/processInstID" property ="processInstID"/>
<html:hidden  property ="url"/>
<html:hidden property="PageCond"/>   
<html:hidden property="PageCond/begin"/>
<html:hidden name="PageCond/length" value="5"/>
<html:hidden property="PageCond/count"/>
  <table class="add" align="center" border="0" width="100%">
    <tr> 
      <td colspan="3" align="left">
      <input type="button" class="button" style="width:170" value = "显示所有活动" onclick="javascript:showActivityList();"> 
      <!--
      <a href="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryProcessActivityInstTab.do?showWhich=0&processInstID=<bean:write property="processInstID"/>" 
        onclick="show()" target="activityList">[显示该流程的所有活动列表]</a>
        --></td>
      <td  class="detailLabelTD" align="right" nowrap > 缩放比例: 
         <select onchange="handleZoom(this.options[this.options.selectedIndex].value)" size="1" name="D1">
			<option value="0.4"  <%if (zoom.equals("0.4")) {%>selected<%}%>>40%</option>
			<option value="0.55" <%if (zoom.equals("0.55")) {%>selected<%}%>>55%</option>
			<option value="0.7" <%if (zoom.equals("0.7")) {%>selected<%}%>>70%</option> 
			<option value="0.85" <%if (zoom.equals("0.85")) {%>selected<%}%>>85%</option> 
			<option value="1.0" <%if (zoom.equals("1.0")) {%>selected<%}%>>100%</option>
			<option value="1.5" <%if (zoom.equals("1.5")) {%>selected<%}%>>150%</option>
			<option value="2.0" <%if (zoom.equals("2.0")) {%>selected<%}%>>200%</option>
			<option value="0" <%if ((!zoom.equals("0.4"))&&
			(!zoom.equals("0.55")) &&
			(!zoom.equals("0.7")) &&
			(!zoom.equals("0.85")) && 
			(!zoom.equals("1.0")) &&
			(!zoom.equals("1.5")) &&
			(!zoom.equals("2.0"))) 
			{%>selected<%}%>>自动调整大小</option>
    	</select>
	<input type="button" style="width:80" value="刷新" onClick="handleZoom(<%=zoom%>)">
      </td>
    </tr>
  </table>
</form>
<script language="JavaScript">
<!--
function handleZoom(v) 
{
if (v=="0")
{
  v = <%=fZoom%>;
}
frm = document.graphFrm;
frm.action='WFINSTMGR.pr_automata.WFINSTMGR_P_ShowProcessInstGraph.do?processInstID=<bean:write property="processInstID"/>&PageCond/length=5&zoom='+v;
document.graphFrm.target=""; 
frm.submit();
}

function autoZoom()
{
frm = document.graphFrm;
frm.action='WFINSTMGR.pr_automata.WFINSTMGR_P_ShowProcessInstGraph.do?processInstID=<bean:write property="processInstID"/>&PageCond/length=5&zoom=<%=fZoom%>';
document.graphFrm.target=""; 
frm.submit();
}
-->
</script>
 <workflow:showProcessGraph  processInstID="processInstID"   url="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryActivityInstances.do" target="activityList" zoomQuotiety="<%=zoom%>" showUrl="true" xpath="WFActivityInstView" /> 
</html>