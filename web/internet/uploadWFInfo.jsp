<%@include file="/internet/hciHead.jsp" %>
<logic:equal property="return/code" value="1">
<b><font color="black">���� WorkFlow Schema �ɹ���</font></b>
</logic:equal>

<logic:equal property="return/code" value="0">
<b><font color="black">���� �����쳣��</font></b>
</logic:equal>

<logic:equal property="return/code" value="2">
<b><font color="black">���� ��Ч�ļ���</font></b>
</logic:equal>

<%@include file="/internet/hciTail.jsp" %>
