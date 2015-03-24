<%@include file="/internet/hciHead.jsp" %>
<logic:equal property="return/code" value="1">
<b><font color="black">上载 WorkFlow Schema 成功！</font></b>
</logic:equal>

<logic:equal property="return/code" value="0">
<b><font color="black">上载 发生异常！</font></b>
</logic:equal>

<logic:equal property="return/code" value="2">
<b><font color="black">上载 无效文件！</font></b>
</logic:equal>

<%@include file="/internet/hciTail.jsp" %>
