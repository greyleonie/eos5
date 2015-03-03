<%@include file="/internet/common.jsp"%>
<%
		String url = "";
		String act = base.util.TalentContext.getValue(pageContext, null, "WFWorkItem/activityDefID");
		String recordId = base.util.TalentContext.getValue(pageContext, null, "SendArchive/RecordID");
		String title = base.util.TalentContext.getValue(pageContext, null, "SendArchive/archiveTitle");
		String username = base.util.TalentContext.getValue(pageContext, null, "SessionEntity/userName");
		url = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&RecordID=" + recordId + "&EditType=0,0&ShowType=1&UserName=" + username + "&SendArchive/archiveTitle=" + title;
%>
<script>

	var inputobj;
	var tabbox1 = new TabComponent("tab1c")
	tabbox1.add("listdetail","基础数据",1)
	tabbox1.add("attachment","正 文",0)
</script>
  <table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>
			<!------------------------------  文头  ----------------------------->
			<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="printTable">
	        <tr>
		      <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校发文呈批表</td>
	        </tr>
            </table>
			<!------------------------------  表单意见  ----------------------------->
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
	<tr valign="top">
		<td colspan="9" nowrap class="tdwf"></td>
	</tr>
	<tr>
		<td width="9%" height="25" align="center" nowrap class="td1">拟稿单位：</td>
		<td colspan="2" nowrap class="td1">&nbsp;
			<bean:write property="SendArchive/draftDept" />
		</td>
		<td width="6%" align="center" nowrap class="td1">共印份数：</td>
		<td width="11%" align="center" nowrap class="td1">
			<bean:write property="SendArchive/sendNum" />
		</td>
		<td width="6%" align="center" nowrap class="td1">密级：</td>
		<td width="12%" align="center" nowrap class="td1">
			<logic:equal property="SendArchive/secretLevel" value="0">公开</logic:equal>
			<logic:equal property="SendArchive/secretLevel" value="1">秘密</logic:equal>
			<logic:equal property="SendArchive/secretLevel" value="2">机密</logic:equal>
			<logic:equal property="SendArchive/secretLevel" value="3">绝密</logic:equal>
		</td>
		<td width="9%" align="center" nowrap class="td1">缓急程度：</td>
		<td width="13%" align="center" nowrap class="td1">
			<logic:equal property="SendArchive/timeLevel" value="0">正常</logic:equal>
			<logic:equal property="SendArchive/timeLevel" value="1">稍急</logic:equal>
			<logic:equal property="SendArchive/timeLevel" value="2">紧急</logic:equal>
			<logic:equal property="SendArchive/timeLevel" value="3">特急</logic:equal>
		</td>
	</tr>
	<tr>
		<td height="25" align="center" nowrap class="td1">发文日期：</td>
		<td width="25%" nowrap class="td1">&nbsp;
			<bean:write property="SendArchive/sendDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
		</td>
		<td width="9%" align="center" nowrap class="td1">文号：</td>
		<td colspan="4" nowrap class="td1">&nbsp;
			<bean:write property="SendArchive/archiveCode" />
		</td>
		<td align="center" nowrap class="td1">拟 稿 人：</td>
		<td nowrap class="td1">&nbsp;
			<bean:write property="SendArchive/drafter" />
		</td>
	</tr>
	<tr>
		<td height="25" align="center" nowrap class="td1">标题：</td>
		<td colspan="8" nowrap class="td1">&nbsp;
			<bean:write property="SendArchive/archiveTitle" />
		</td>
	</tr>
	<tr valign="top">
		<td colspan="9" nowrap class="tdwf">
			<div style='font-size:14px;font-weight:bold'>[部门领导签发]</div>
			<div>
				<fcc:wfdataview name="bumen" wfnode="DX3" list="list[@type='wfdata']" /><br>
			</div>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="9" nowrap class="tdwf">
			<div style='font-size:14px;font-weight:bold'>[分管领导签发]</div>
			<div>
				<fcc:wfdataview name="zhuban" wfnode="DX5" list="list[@type='wfdata']" /><br>
			</div>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="9" nowrap class="tdwf">
			<div style='font-size:14px;font-weight:bold'>[校主要领导签发]</div>
			<div class="divwf2">
				<fcc:wfdataview name="zhuguan" wfnode="DX61" list="list[@type='wfdata']" /><br>
			</div>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="9" nowrap class="tdwf">
			<div style='font-size:14px;font-weight:bold'>[其它人意见]</div>
			<div class="divwf2">
				<fcc:wfdataview name="others" wfnode="DX2,DX41,DX42,DX62" list="list[@type='wfdata']" /><br>
			</div>
		</td>
	</tr>
    </table>
    
			<!------------------------------  编辑正文  ----------------------------->
			  
			  
			  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
				<tr><td width="100%" height="600px" align="center" class="td2">
				<iframe src='<%=url%>' frameborder="0" width="100%" height="100%" name="sendText"></iframe>
				</td></tr>
        	  </table>
      
		</td>
	</tr>
	<tr>
		<td>
			<script>
			tabbox1.inithidetab();
			</script>
		</tr>
		</td>
	</table> 

<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
	<tr>
		<td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input
				name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> <input name="ieprint" type="button"
				class="button_02" value="返 回" onClick="history.back()"></td>
	</tr>
</table>