<%@include file="/internet/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������ί��У��Ϣһ�廯ƽ̨</title>

<script language="javascript">
		function doTreeMenuFrameHandle(){
			var treeFrame = window.parent.frames["contentFrameSet"];
			var rows = treeFrame.rows;			
			var imgSrc = event.srcElement;
			if(rows.charAt(4)=="0"){
			
				treeFrame.rows = "*,6,250";
				imgSrc.src="/internet/image/space_img4.gif";
				imgSrc.title = "���ز˵�";
			}else{
				treeFrame.rows = "*,6,0";
				imgSrc.src="/internet/image/space_img3.gif";
				imgSrc.title = "��ʾ�˵�";
			}			
		}
</script>
</head>

<body background="/internet/image/space_bg2.gif">
<table width="100%" height="6"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" align="center"></td>
  </tr>
</table>
</body>
</html>