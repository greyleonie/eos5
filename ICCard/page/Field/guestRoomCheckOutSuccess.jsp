<%@include file="/internet/common.jsp"%>
<%
  String url=base.util.TalentContext.getValue(pageContext,null,"url");
%>
<script>
alert("�ͷ��˷��ɹ�");
window.opener.location.href="<%=url%>";
window.close();

</script>