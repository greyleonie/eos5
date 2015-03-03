<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
		document.domain = "gzswdx.gov.cn";	
		var userID = "<bean:write property="SessionEntity/userID"/>";
		function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
			var stUrl = url+"?WCMMetaTableCityPaperApp/WCMMetaTableCityPaperAppID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
			location.href = stUrl ;
		}
</script>
	<logic:iterate id="resultset" property="list[@type='list']">		
	<script>
		doProcess('<bean:write id="resultset" property="WCMMetaTableCityPaperApp/actionURL"/>',<bean:write id="resultset" property="WCMMetaTableCityPaperApp/WCMMetaTableCityPaperAppID"/>,<bean:write id="resultset" property="WCMMetaTableCityPaperApp/workItemID"/>,<bean:write id="resultset" property="WCMMetaTableCityPaperApp/processInstID"/>,<bean:write id="resultset" property="WCMMetaTableCityPaperApp/currentState"/>,'<bean:write id="resultset" property="WCMMetaTableCityPaperApp/WFparticipant"/>','<fcc:toname dom="resultset" path="WCMMetaTableCityPaperApp/WFparticipant"/>');
	</script>
	</logic:iterate>