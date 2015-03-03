<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
		document.domain = "gzswdx.gov.cn";	
		var userID = "<bean:write property="SessionEntity/userID"/>";
		function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
			var stUrl = url+"?WCMMetaTableProvincePaperApp/WCMMetaTableProvincePaperAppID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
			location.href = stUrl ;
		}
</script>
	<logic:iterate id="resultset" property="list[@type='list']">		
	<script>
		doProcess('<bean:write id="resultset" property="WCMMetaTableProvincePaperApp/actionURL"/>',<bean:write id="resultset" property="WCMMetaTableProvincePaperApp/WCMMetaTableProvincePaperAppID"/>,<bean:write id="resultset" property="WCMMetaTableProvincePaperApp/workItemID"/>,<bean:write id="resultset" property="WCMMetaTableProvincePaperApp/processInstID"/>,<bean:write id="resultset" property="WCMMetaTableProvincePaperApp/currentState"/>,'<bean:write id="resultset" property="WCMMetaTableProvincePaperApp/WFparticipant"/>','<fcc:toname dom="resultset" path="WCMMetaTableProvincePaperApp/WFparticipant"/>');
	</script>
	</logic:iterate>