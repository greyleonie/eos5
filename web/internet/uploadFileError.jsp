<!-- saved from url=(0022)http://internet.e-mail -->
<!-- saved from url=(0022)http://internet.e-mail -->
<%@ include file="/internet/common.jsp" %>
<script language="javascript">
var errMsg = "<bean:write property="Error/Message"/>";
if(errMsg=="01"){
	alert("不能上载，文件超过规定的大小！");
	history.go(-1);
	}
if(errMsg=="02"){
	alert("不能上载，文件大小为0！");
	history.go(-1);
	}
if(errMsg=="03"){
	alert("该文件为不允许上传的文件！");
	history.go(-1);
	}
if(errMsg=="04"){
	alert("不能覆盖已有的文件！");
	history.go(-1);
	}

</script>
<%@ include file="/internet/commonTail.jsp" %>
