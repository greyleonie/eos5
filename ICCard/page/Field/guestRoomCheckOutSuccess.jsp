<%@include file="/internet/common.jsp"%>
<%
  String url=base.util.TalentContext.getValue(pageContext,null,"url");
%>
<script>
alert("客房退房成功");
window.opener.location.href="<%=url%>";
window.close();

</script>