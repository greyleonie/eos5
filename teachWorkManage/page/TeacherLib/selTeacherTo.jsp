<%@include file="/internet/common.jsp"%>


<script>
var id = '<bean:write property="fid"/>';
var department = '<bean:write property="Teacher/Department"/>';
var arr = new Array('<bean:write property="fid"/>','<bean:write property="Teacher/operatorName"/>','<bean:write property="Teacher/Sex"/>','<bean:write property="Teacher/Department"/>','<bean:write property="Teacher/DutyTechnicalPost"/>');
window.returnValue = arr;
window.close();
</script>

