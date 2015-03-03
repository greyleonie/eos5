<%@include file="/internet/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州市委党校信息一体化平台</title>

<script language="javascript">
		function doTreeMenuFrameHandle(){
			var treeFrame = window.parent.frames["contentFrameSet"];
			var cols = treeFrame.cols;			
			var imgSrc = event.srcElement;
			if(cols.charAt(0)=="0"){
				treeFrame.cols = "190,6,*";
				imgSrc.src="/internet/image/space_img.gif";
				imgSrc.title = "隐藏菜单";
			}else{
				treeFrame.cols = "0,6,*";
				imgSrc.src="/internet/image/space_img2.gif";
				imgSrc.title = "显示菜单";
			}			
		}
</script>
</head>

<body background="/internet/image/space_bg.gif">
<table width="6" height="500"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="27"><img src="/internet/image/space_img.gif" width="5" height="9" onclick="doTreeMenuFrameHandle()" style="cursor:hand" title="隐藏菜单"></td>
  </tr>
</table>
</body>
</html>