<%@ include file="/internet/common.jsp" %>
<form name="queryFrm" action="BNDICT.pr_automata.BNDICT_P_DictDetailQuery.do" target="mainWindow" method="post">
  <html:hidden property="BNDICT_V_Dictionary/businTypeID" />
  <html:hidden property="PageCond/count" value="-1"/>
  <html:hidden property="PageCond/length" value="10"/>
  <html:hidden property="PageCond/begin" value="0"/>
</form>
	<table class="hci" align="center">
		<tr class="result_title"><td>【业务类型】<br></td></tr>
		<tr class="hcicontent">
			<td nowrap>
				&nbsp;&nbsp;
				<a href="javascript:submit1('')">
					<font COLOR="#3366FF" SIZE="2">全部</font><br>
				</a>
				<logic:iterate id="businTypeID" property="list[@type='BNDICT_T_BusinType']">
					&nbsp;&nbsp;
					<a href="javascript:submit1('<bean:write id="businTypeID" property="BNDICT_T_BusinType/businTypeID"/>')">
						<font COLOR="#3366FF" SIZE="2" ><bean:write id="businTypeID" property="BNDICT_T_BusinType/businTypeName" /></font><br>
					</a>
				</logic:iterate>
			</td>
		</tr>

	</table>
<script>
	function submit1(id) {
		var frm = document.queryFrm;
		frm.elements["BNDICT_V_Dictionary/businTypeID"].value=id;
		frm.submit();
	}
</script>
<%@include file="/internet/commonTail.jsp" %>