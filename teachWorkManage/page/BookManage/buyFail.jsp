<%@ include file="/internet/common.jsp" %>
<script>
  <logic:present property="message">
    alert("<bean:write property='message' />");
  </logic:present>
</script>