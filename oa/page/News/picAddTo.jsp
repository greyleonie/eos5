<%@include file="/internet/common.jsp"%>
<%@ page import="java.net.*"%>
<head>
	<script type="text/javascript" language="javascript">
      function inst()
      {
        window.parent.getsave.disabled = false;
      }
		function save() {
			var url=document.getElementById("picName").value;
			return url
		}
	</script>
</head>
<HTML>
	<BODY bgcolor="#F0F0F0" onload="inst()">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<input type="hidden" id="picName" value=<bean:write property="File/oldname"/> > 
	      <tr>
			<td class="text" >
		       <P align="center"><FONT size="2"><FONT color="#ff0080">上传成功请点击插入</FONT></FONT></P>
		 
	        </td>
		</tr>
	</table>
	</BODY>
</HTML>