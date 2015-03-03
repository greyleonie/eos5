<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
		document.domain = "gzswdx.gov.cn";	
		var userID = "<bean:write property="SessionEntity/userID"/>";
		function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
			var stUrl = url+"?WCMMetaTablePaperBuild/WCMMetaTablePaperBuildID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
			location.href = stUrl ;
		}
</script>
	<logic:iterate id="resultset" property="list[@type='list']">		
	<script>
		doProcess('<bean:write id="resultset" property="WCMMetaTablePaperBuild/actionURL"/>',<bean:write id="resultset" property="WCMMetaTablePaperBuild/WCMMetaTablePaperBuildID"/>,<bean:write id="resultset" property="WCMMetaTablePaperBuild/workItemID"/>,<bean:write id="resultset" property="WCMMetaTablePaperBuild/processInstID"/>,<bean:write id="resultset" property="WCMMetaTablePaperBuild/currentState"/>,'<bean:write id="resultset" property="WCMMetaTablePaperBuild/WFparticipant"/>','<fcc:toname dom="resultset" path="WCMMetaTablePaperBuild/WFparticipant"/>');
	</script>
	</logic:iterate>