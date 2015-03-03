<%@include file="/internet/common.jsp"%><br/><br/>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td width="15%" align="center" nowrap class="td2">知识编号</td>
		<td width="35%" align="center" nowrap class="td1">
			<bean:write property="OMM_KnowledgeBase/entity/KnowledgeSN" />
		</td>
		<td width="15%" align="center" nowrap class="td2">知识类别</td>
		<td width="35%" align="center" nowrap class="td1"></td>
	</tr>
	<tr>
		<td width="15%" align="center" nowrap class="td2">标题</td>
		<td width="35%" align="center" nowrap class="td1">
			<bean:write property="OMM_KnowledgeBase/entity/Title" />
		</td>
		<td width="15%" align="center" nowrap class="td2">知识作者</td>
		<td width="35%" align="center" nowrap class="td1"></td>
	</tr>
	<tr>
		<td width="15%" align="center" nowrap class="td2">知识评价</td>
		<td align="center" nowrap class="td1">
			<SCRIPT>

				var star='<bean:write property="OMM_KnowledgeBase/entity/Evaluate"/>';
				for (var i=1;i<=star;i++) {
					document.write('<img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/>');
				}
			</SCRIPT>
		</td>
		<td width="15%" align="center" nowrap class="td2">关键字</td>
		<td align="center" nowrap class="td1">
			<bean:write property="OMM_KnowledgeBase/entity/KeyWords" />
		</td>
	</tr>
	<tr height="150px">
		<td align="center" nowrap class="td2">故障描述</td>
		<td 1align="left" nowrap class="td1" colspan="3" >
			<bean:write property="OMM_KnowledgeBase/entity/Description" />
		</td>
	</tr>
	<tr height="150px">
		<td align="center" nowrap class="td2">处理方式</td>
		<td 1align="left" nowrap class="td1" colspan="3" >
			<bean:write property="OMM_KnowledgeBase/entity/ProcessMethod" />
		</td>
	</tr>
</table><br/><br/>
<table width="100%">
	<tr>
		<td align="center"><input type="button" class="button_02" value="返 回" onClick="history.back()"></td>
	</tr>
</table>
