<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
		document.domain = "gzswdx.gov.cn";	
		var userID = "<bean:write property="SessionEntity/userID"/>";
		function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
			var stUrl = url+"?WCMMetaTableschoolPaperApp/WCMMetaTableschoolPaperAppID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
			location.href = stUrl ;
		}
</script>
	<logic:iterate id="resultset" property="list[@type='list']">		
	<script>
		doProcess('<bean:write id="resultset" property="WCMMetaTableschoolPaperApp/actionURL"/>',<bean:write id="resultset" property="WCMMetaTableschoolPaperApp/WCMMetaTableschoolPaperAppID"/>,<bean:write id="resultset" property="WCMMetaTableschoolPaperApp/workItemID"/>,<bean:write id="resultset" property="WCMMetaTableschoolPaperApp/processInstID"/>,<bean:write id="resultset" property="WCMMetaTableschoolPaperApp/currentState"/>,'<bean:write id="resultset" property="WCMMetaTableschoolPaperApp/WFparticipant"/>','<fcc:toname dom="resultset" path="WCMMetaTableschoolPaperApp/WFparticipant"/>');
	</script>
	</logic:iterate>