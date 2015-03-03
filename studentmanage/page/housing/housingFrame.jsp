<%@include file="/internet/common.jsp"%>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学员住宿管理</td>
          </tr>
        </table></td>
    </tr>
	<tr>
	<td width="49%" height="500">	
	<iframe src="studentmanage.prHousing.classStudentList.do" name="leftFrame" frameborder="0"   width="49%"  height="100%" />
	<iframe src="studentmanage.prHousing.space.do" name="spaceFrame" frameborder="0"   width="7" height="100%" />
	<iframe src="studentmanage.prHousing.roomList.do" name="rightFrame" frameborder="0"   width="49%" height="100%" />
	
	</tr>
		</table>
</body>