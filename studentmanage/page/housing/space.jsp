<%@include file="/internet/common.jsp"%>
<html>
<head>

<title>������ί��У��Ϣһ�廯ƽ̨</title>

<script language="javascript">
		function toLeft(){
			window.parent.document.all.rightFrame.width="0";
			window.parent.document.all.leftFrame.width="99%";
		}
		function toRight(){
			window.parent.document.all.leftFrame.width="0";
			window.parent.document.all.rightFrame.width="99%";
		}
		function toCenter(){
			window.parent.document.all.rightFrame.width="49%";
			window.parent.document.all.leftFrame.width="49%";
		}
</script>
</head>

<body background="/internet/image/space_bg.gif">
<table width="6" height="500"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="27"><img src="/internet/image/space_img.gif" width="5" height="9" onClick="toRight()" style="cursor:hand" title="����">
	
	<a href="javascript:toCenter()" title="����"><strong><font color="#FFFFFF" >=</font></strong></a>
	
	<img src="/internet/image/space_img2.gif" width="5" height="9" onClick="toLeft()" style="cursor:hand" title="����">
	</td>
  </tr>
</table>
</body>
</html>