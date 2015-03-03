<%@include file="/internet/common.jsp"%>
<head>
<script>
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','楼宇信息','ICCard.prField.buildingList.do','testframe',0)
	tabbox1.add('2','课室信息','ICCard.prField.roomList.do?RoomTypeID=1','testframe',0)
	tabbox1.add('3','客房信息','ICCard.prField.roomList.do?RoomTypeID=2','testframe',0)
	tabbox1.add('4','讨论室信息','ICCard.prField.roomList.do?RoomTypeID=3','testframe',0)
	tabbox1.add('5','其它场地信息','ICCard.prField.roomList.do?RoomTypeID=4','testframe',0)
</script>
</head>

<body>

<table width="100%" height="5" border="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>

<table border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td style="border:1px #DCDCDC solid;border-top:none" nowrap>
		
			<table border="0">
			  <tr>
				<td align="center">
				<iframe src="" name="testframe" frameborder="0" ></iframe>
				
				</td>
				
			  </tr>
			</table>
		</td>
	</tr>
	
</table> 
	
<script>
	tabbox1.initPage(1,'testframe');
</script>
</body>