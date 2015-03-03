<%@include file="/internet/common.jsp"%>

<html lang="zh">
<head>
<title>回收管理</title>


<!-- 读取物理卡号 -->
<script language="javascript">
			function isContainChar(srcString,chr,len,mode){
			rtv = false;
			match = 0;
			for(i=0;i<srcString.length;i++){
			if(mode){
			if(chr==srcString.charAt(i)){
			match++;
			}
			}else{
			if(chr.toLowerCase()==srcString.charAt(i).toLowerCase()){
			match++;
			}
			}
			}
			if(match>=len){
			rtv = true;
			}
			return rtv;
			}
			
			function GetCardData(){
			var id=cardcontrol.GetCardID();
			if(id>0){
				var data2=cardcontrol.ReadData(7,2);
				if(data2.length==0){
					alert("此卡还未注册入党校卡库，无法进行错卡还原！");
				return;
				}
				if((cardForm.fromCardData0.value=cardcontrol.ReadData(7,0)).length==0){
				alert("此卡还未注册或还未开始使用，无法进行错卡还原！");
				}
				else if((cardForm.fromCardData1.value=cardcontrol.ReadData(7,1)).length==0){
					alert("此卡还未注册或还未开始使用，无法进行错卡还原！");
				}
				else{
					cardForm.cardid.value=id;
					cardForm.s70.value=cardcontrol.ReadData(7,0);
					cardForm.s71.value=cardcontrol.ReadData(7,1);
					cardForm.s72.value=cardcontrol.ReadData(7,2);
					cardcontrol.Quit();
					cardcontrol.Init(0);
				}
			}
			}
			
			function WriteCardData(){
				cardcontrol.WriteData(7,0,cardForm.s70.value);
				cardcontrol.WriteData(7,1,cardForm.s71.value);
				cardcontrol.WriteData(7,2,cardForm.s72.value);
			}
			function doCheckClock(){
			var data2=cardcontrol.ReadData(7,2);
			if(data2!=0 && !isContainChar(data2,"f",30,false)){	//2区全为0视为未注册卡，或者超过25个f字符的也视为未注册卡
			if(cardForm.cardtypeid.value==2 && cardForm.cardusingtimes.value>0){
			alert("此卡已经有消费记录，不可以进行还原操作！");
			return false;
			}
			}else if(cardForm.stateid.value==1){
			alert("此卡还未使用，无法进行错卡还原！");
			return false;
			}
			return true;
			}
			
			function doRecover(){
			if(window.confirm("一旦执行此操作，卡内的全部数据都将被清除！确定要还原该卡吗？")){
			if (doCheckClock()){
			cardForm.action="/card.do?action=saverecover";
			cardForm.submit();
			}
			}
			}
			
			function doRefundment(){
			var cardsum=cardForm.cardlastsum.value;
			if(0>=cardsum)
				alert("此卡的余额已经为零，无法进行退款操作！");
			else if(window.confirm("卡内余额为"+cardsum+"元，确定退还吗？")){
			if(cardForm.stateid.value==1){
			alert("此卡还未使用，无法进行退款操作！");}
			else{
			cardForm.fromCardData0.value=cardcontrol.ReadData(7,0);
			cardForm.fromCardData1.value=cardcontrol.ReadData(7,1);
			cardForm.action="/card.do?action=saverefundment";
			cardForm.submit();
			}
			}
			}
		</script>

</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0"
	style="overflow-y:scroll" onload="cardcontrol.Init(0)"
	onunload="cardcontrol.Quit()">
<!-- 导航条 -->


<!-- 工具栏 -->
<table class="Standard-ToolbarTableStyle">
	<tr>
		<td>
				<input type="button" name="23" value="查询卡"	  onclick="GetCardData()">
				
				<input type="button" name="23" value="写卡"	  onclick="WriteCardData()">
					</td>
	</tr>
</table>

<br>

<form name="cardForm" method="POST" action="/card.do?action=recover">
	<table align="center" border="2" cellpadding="1" cellspacing="0"
		bordercolor="#EFF7FF" class="Standard-LabelContent_Table">
		<tr>
			<td width="6%" class="td1" nowrap>操作说明</td>
			<td class="td1" >请把IC卡置于发卡机上，并点击下面的查询按钮，审核无误后再进行还原操作。</td>
		</tr>
		<tr>
			<td width="6%" class="td2" nowrap>卡号</td>
			<td align="left"> 
				<input type="text" size="30" readonly="true" value="(无编号)" name="cardid"/>
			</td>
		</tr>
		<tr>
			<td width="6%" class="td2" nowrap >7--0</td>
			<td align="left"><input type="text" name="s70" value=""  size="60"> </td>
		</tr>
		<tr>
			<td width="6%" class="td2" nowrap>7--1</td>
			<td align="left"><input type="text" name="s71" value="" size="60"> </td>
		</tr>
		<tr>
			<td width="6%" class="td2" nowrap>7--2</td>
			<td align="left"><input type="text" name="s72" size="60" value="" readonly="readonly" class="finput"></td>
		</tr>
		<tr>
			<td id="ccc">
			</td>
		</tr>
		
		
		<input type="hidden" name="fromCardData0" value="">
		<input type="hidden" name="fromCardData1" value="">
	
		
	</table>
</form>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:00BCB426-4501-496F-B780-267302BE3BA3"
	codebase="http://192.168.0.196:8080/DXCard/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</html>