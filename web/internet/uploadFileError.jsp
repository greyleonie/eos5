<!-- saved from url=(0022)http://internet.e-mail -->
<!-- saved from url=(0022)http://internet.e-mail -->
<%@ include file="/internet/common.jsp" %>
<script language="javascript">
var errMsg = "<bean:write property="Error/Message"/>";
if(errMsg=="01"){
	alert("�������أ��ļ������涨�Ĵ�С��");
	history.go(-1);
	}
if(errMsg=="02"){
	alert("�������أ��ļ���СΪ0��");
	history.go(-1);
	}
if(errMsg=="03"){
	alert("���ļ�Ϊ�������ϴ����ļ���");
	history.go(-1);
	}
if(errMsg=="04"){
	alert("���ܸ������е��ļ���");
	history.go(-1);
	}

</script>
<%@ include file="/internet/commonTail.jsp" %>
