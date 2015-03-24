<%@ page import="com.primeton.eos.wf.web.util.WFGraphTagUtil"%>
<%@ page import="com.primeton.eos.wf.service.api.WFServiceException"%>

<%
String zoom=request.getParameter("zoom");
String id=request.getParameter("processDefID");
int procId = 0;
if (id!=null)
    procId=Integer.parseInt(id);
float fZoom=1.0f;
try
{
fZoom = WFGraphTagUtil.getProperZoomQuality(procId,0,1000,300);
}
catch (WFServiceException e)
{
}
if (zoom==null )
{
zoom = "1.0";
}
//System.out.println(procId);
//System.out.println(fZoom);
%>

<form name="graphFrm" action="" method="post">
<html:hidden  property ="processDefID"/>

<table class="add" align="center" border="0">  
  <tr>
    <td width="75%"></td>
    <td align="right">
	缩放比例:
    </td>   
    <td align="right">
    <select onchange="handleZoom(this.options[this.options.selectedIndex].value)" size="1" name="D1">
	<option value="0.5"  <%if (zoom.equals("0.5")) {%>selected<%}%>>50%</option>
	<option value="0.75" <%if (zoom.equals("0.75")) {%>selected<%}%>>75%</option>
	<option value="1.0" <%if (zoom.equals("1.0")) {%>selected<%}%>>100%</option>
	<option value="1.5" <%if (zoom.equals("1.5")) {%>selected<%}%>>150%</option>
	<option value="2.0" <%if (zoom.equals("2.0")) {%>selected<%}%>>200%</option>
	<option value="3.0" <%if (zoom.equals("3.0")) {%>selected<%}%>>300%</option>
	<option value="4.0" <%if (zoom.equals("4.0")) {%>selected<%}%>>400%</option>
	<option value="0" <%if ((!zoom.equals("0.5"))&&
				(!zoom.equals("0.75")) &&
				(!zoom.equals("1.0")) &&
				(!zoom.equals("1.5")) &&
				(!zoom.equals("2.0")) &&
				(!zoom.equals("3.0")) &&
				(!zoom.equals("4.0"))) {%>selected<%}%>>自动调整大小</option>
    </select>
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
frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDefGraph.do?zoom='+v;
//alert(document.graphFrm.action); 
frm.submit();
}

function autoZoom()
{
frm = document.graphFrm;
frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDefGraph.do?zoom=<%=fZoom%>';
//alert(document.graphFrm.action); 
frm.submit();
}
</script>



