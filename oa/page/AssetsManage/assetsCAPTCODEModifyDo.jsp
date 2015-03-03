<%@ include file="/internet/common.jsp" %>

<html>
<head></head>
<body>
<!-- Insert your jsp/html code here -->

<script>

window.returnValue = <bean:write property="isRepeat"/>;
window.close(); 

</script>

</body>
</html>
