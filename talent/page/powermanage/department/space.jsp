<%@include file="/internet/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������ί��У��Ϣһ�廯ƽ̨</title>

<script language="javascript">
		function doTreeMenuFrameHandle(){
			var treeFrame = window.parent.frames["contentFrameSet"];
			var cols = treeFrame.cols;			
			var imgSrc = event.srcElement;
			if(cols.charAt(0)=="0"){
				treeFrame.cols = "190,6,*";
				imgSrc.src="/internet/image/space_img.gif";
				imgSrc.title = "���ز˵�";
			}else{
				treeFrame.cols = "0,6,*";
				imgSrc.src="/internet/image/space_img2.gif";
				imgSrc.title = "��ʾ�˵�";
			}			
		}
</script>
</head>

<body background="/internet/image/space_bg.gif">
<table width="6" height="500"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="27"><img src="/internet/image/space_img.gif" width="5" height="9" onclick="doTreeMenuFrameHandle()" style="cursor:hand" title="���ز˵�"></td>
  </tr>
</table>
</body>
</html>