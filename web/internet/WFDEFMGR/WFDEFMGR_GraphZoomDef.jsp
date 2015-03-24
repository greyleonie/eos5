<%@ page import="com.primeton.eos.wf.web.util.WFGraphTagUtil"%>
<%@ page import="com.primeton.eos.wf.service.api.WFServiceException"%>

<%
String zoom=request.getParameter("zoom");
String id=request.getParameter("processDefID");
float fZoom=1.0f;


if ((zoom==null )||(zoom.equals("0")))
{
	try
	{
		zoom="0";
		fZoom = WFGraphTagUtil.getProperZoomQuality(Integer.parseInt(id),0,640,480);
	}
	catch (WFServiceException e)
	{
	}
}
else
{
	try
	{
		fZoom = Float.parseFloat(zoom);
	}
	catch(NumberFormatException ex)
	{
	}
}	
//System.out.println(fZoom);
%>

<form name="graphFrm" action="" method="post">
<html:hidden  property ="processDefID"/>

<table class="add" align="center" border="0">  
  <tr>
    <td width="70%"></td>
    <td  class="detailLabelTD" nowrap > 
   	缩放比例: 
    </td>
    <td align="right">
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
</td>
  </tr>
</table>
</form>

<script language="JavaScript">
<!--
function handleZoom(v) 
{

frm = document.graphFrm;
//frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDefGraph.do?zoom='+v;
frm.action='default.pr_automata.forward.do?nextPage=/internet/WFDEFMGR/WFDEFMGR_WFShowGraphInFrame.jsp&zoom='+v;
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



