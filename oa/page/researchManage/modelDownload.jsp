<%@include file="/internet/common.jsp"%>

<script>

var url = "/common/page/viewimgdb/viewFromDB.jsp?table=KetiModel&pkn=modelID&field=modelContent&pkv=<bean:write property="KetiModel/modelID"/>&type=<bean:write property="KetiModel/modelType"/>&fileName=<bean:write property="KetiModel/modelName"/>";
window.location.href = url;
</script>
