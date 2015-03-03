<%@include file="/internet/common.jsp"%>

<script>
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','按分组查询','ICCard.prMsg.mobileList.do?path=1&part=1','msgFrame22',0)
	tabbox1.add('2','按姓氏查询','ICCard.prMsg.mobileWithChar.do?sql=','msgFrame22',0)
	
</script>
</head>

<body>

<table width="100%" height="5" border="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<form name="fr" method="post">
<table border="0" align="left" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td align="left">
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr >
            <td align="left" class="td1" colspan="2" >用户类型：
            <input type="radio" name="userType" checked value="1" onclick="selectType('1')">教工
			<input type="radio" name="userType" value="2" onclick="selectType('2')">学员
			<input type="radio" name="userType" value="3" onclick="selectType('3')">私有联系人
			<input type="hidden" name="userField" value="1">
			</td>
           
          </tr>
	<tr>
		<td style="border:1px #DCDCDC solid;border-top:none" nowrap>
		
			<table border="0">
			  <tr>
				<td align="center">
				<iframe src="" name="msgFrame22" frameborder="0" ></iframe>
				
				</td>
				
			  </tr>
			</table>
		</td>
	</tr>
	
</table> 
</form>
	
<script>
	tabbox1.initPage(1,'msgFrame22');
</script>
<script language="javascript">

function selectType(typeId){
  document.forms[0].elements["userField"].value=typeId;
	try{
	this.parent.frames["msgFrame22"].document.forms[0].elements["path"].value=typeId;
	var selectName=this.parent.frames["msgFrame22"].document.forms[0].elements["team"];
	this.parent.frames["msgFrame22"].clearAll(selectName);
	this.parent.frames["msgFrame22"].changeUserTeam();
	}catch(e){}
}
	




</script>
</body>
<script>
	tabbox1.doclick(1);
</script>