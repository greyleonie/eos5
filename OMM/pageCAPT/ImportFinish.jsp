<%@ include file="/internet/common.jsp" %>
<script>
if(confirm("资产已成功导入到IT运维库中，是否继续导入？")==true){
	window.location.href="OMM.prCAPT.prToCAPTList.do";
}else{
	window.location.href="OMM.prCAPT.prToITDeviceList.do";
}
</script>