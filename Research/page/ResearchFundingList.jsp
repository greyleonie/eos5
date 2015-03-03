<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
		document.domain = "gzswdx.gov.cn";	
		var userID = "<bean:write property="SessionEntity/userID"/>";
		function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
			var stUrl = url+"?WCMMetaTableAccountExpense/WCMMetaTableAccountExpenseID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
			location.href = stUrl ;
		}
</script>
	<logic:iterate id="resultset" property="list[@type='list']">		
	<script>
		doProcess('<bean:write id="resultset" property="WCMMetaTableAccountExpense/actionURL"/>',<bean:write id="resultset" property="WCMMetaTableAccountExpense/WCMMetaTableAccountExpenseID"/>,<bean:write id="resultset" property="WCMMetaTableAccountExpense/workItemID"/>,<bean:write id="resultset" property="WCMMetaTableAccountExpense/processInstID"/>,<bean:write id="resultset" property="WCMMetaTableAccountExpense/currentState"/>,'<bean:write id="resultset" property="WCMMetaTableAccountExpense/WFparticipant"/>','<fcc:toname dom="resultset" path="WCMMetaTableAccountExpense/WFparticipant"/>');
	</script>
	</logic:iterate>