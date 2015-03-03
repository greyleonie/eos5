<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
		document.domain = "gzswdx.gov.cn";	
		var userID = "<bean:write property="SessionEntity/userID"/>";
		function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
			var stUrl = url+"?WCMMetaTablecountryPaperApp/WCMMetaTablecountryPaperAppID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
			location.href = stUrl ;
		}
</script>
	<logic:iterate id="resultset" property="list[@type='list']">		
	<script>
		doProcess('<bean:write id="resultset" property="WCMMetaTablecountryPaperApp/actionURL"/>',<bean:write id="resultset" property="WCMMetaTablecountryPaperApp/WCMMetaTablecountryPaperAppID"/>,<bean:write id="resultset" property="WCMMetaTablecountryPaperApp/workItemID"/>,<bean:write id="resultset" property="WCMMetaTablecountryPaperApp/processInstID"/>,<bean:write id="resultset" property="WCMMetaTablecountryPaperApp/currentState"/>,'<bean:write id="resultset" property="WCMMetaTablecountryPaperApp/WFparticipant"/>','<fcc:toname dom="resultset" path="WCMMetaTablecountryPaperApp/WFparticipant"/>');
	</script>
	</logic:iterate>