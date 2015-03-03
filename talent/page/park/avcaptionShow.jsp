<%@include file="/internet/common.jsp"%>
 <style type="text/css">
<!--

.tds1{
	color: #3399FF;
	font-size: 22px;
	line-height: 22px;
}

-->
</style>
<body onload="start()" onunload="Quit()" bgcolor="#CAE2F0">
<table width="1024" border="0" align="center" bgcolor="#CAE2F0">
  <tr>
    <td width="11%" align="right" class="tds1">&nbsp;进门</td>
    <td width="25%"  height="143">
	<table align="center" border="2" cellpadding="1" cellspacing="0" bordercolor="#EFF7FF" class="Standard-LabelContent_Table">
		<tr>
			 <td align="center"><OBJECT ID="Card Control" WIDTH="200" HEIGHT="120" CLASSID="CLSID:EA4C7953-BDF0-11D7-84AE-444553540000"
	codebase="/talent/page/park/ActiveID.ocx" name="photocontrol"> </OBJECT></td>
		</tr>
	</table>
	</td>
	<td width="10%" >&nbsp;</td>
    <td width="10%">&nbsp;</td>
	<td width="6%" align="right" class="tds1">&nbsp;出门</td>
    <td width="25%">	<table align="center" border="2" cellpadding="1" cellspacing="0" bordercolor="#EFF7FF" class="Standard-LabelContent_Table">
		<tr>
			 <td align="center"><OBJECT ID="Card Control2" WIDTH="200" HEIGHT="120" CLASSID="CLSID:EA4C7953-BDF0-11D7-84AE-444553540000"
	codebase="/talent/page/park/ActiveID.ocx" name="photocontrol2"> </OBJECT></td>
		</tr>
	</table></td>
	<td width="13%">&nbsp;</td>
  </tr>
</table>
</body>
<script>
function start(){
	photocontrol.PreviewStart(0);
	photocontrol2.PreviewStart(0);
}

function Quit(){
	photocontrol.PreviewStop();
	photocontrol2.PreviewStop();
}
</script>