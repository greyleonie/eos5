<%@include file="/internet/common.jsp"%>

<html lang="zh">
<head>
<title>���չ���</title>


<!-- ��ȡ������ -->
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
					alert("�˿���δע���뵳У���⣬�޷����д���ԭ��");
				return;
				}
				if((cardForm.fromCardData0.value=cardcontrol.ReadData(7,0)).length==0){
				alert("�˿���δע���δ��ʼʹ�ã��޷����д���ԭ��");
				}
				else if((cardForm.fromCardData1.value=cardcontrol.ReadData(7,1)).length==0){
					alert("�˿���δע���δ��ʼʹ�ã��޷����д���ԭ��");
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
			if(data2!=0 && !isContainChar(data2,"f",30,false)){	//2��ȫΪ0��Ϊδע�Ῠ�����߳���25��f�ַ���Ҳ��Ϊδע�Ῠ
			if(cardForm.cardtypeid.value==2 && cardForm.cardusingtimes.value>0){
			alert("�˿��Ѿ������Ѽ�¼�������Խ��л�ԭ������");
			return false;
			}
			}else if(cardForm.stateid.value==1){
			alert("�˿���δʹ�ã��޷����д���ԭ��");
			return false;
			}
			return true;
			}
			
			function doRecover(){
			if(window.confirm("һ��ִ�д˲��������ڵ�ȫ�����ݶ����������ȷ��Ҫ��ԭ�ÿ���")){
			if (doCheckClock()){
			cardForm.action="/card.do?action=saverecover";
			cardForm.submit();
			}
			}
			}
			
			function doRefundment(){
			var cardsum=cardForm.cardlastsum.value;
			if(0>=cardsum)
				alert("�˿�������Ѿ�Ϊ�㣬�޷������˿������");
			else if(window.confirm("�������Ϊ"+cardsum+"Ԫ��ȷ���˻���")){
			if(cardForm.stateid.value==1){
			alert("�˿���δʹ�ã��޷������˿������");}
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
<!-- ������ -->


<!-- ������ -->
<table class="Standard-ToolbarTableStyle">
	<tr>
		<td>
				<input type="button" name="23" value="��ѯ��"	  onclick="GetCardData()">
				
				<input type="button" name="23" value="д��"	  onclick="WriteCardData()">
					</td>
	</tr>
</table>

<br>

<form name="cardForm" method="POST" action="/card.do?action=recover">
	<table align="center" border="2" cellpadding="1" cellspacing="0"
		bordercolor="#EFF7FF" class="Standard-LabelContent_Table">
		<tr>
			<td width="6%" class="td1" nowrap>����˵��</td>
			<td class="td1" >���IC�����ڷ������ϣ����������Ĳ�ѯ��ť�����������ٽ��л�ԭ������</td>
		</tr>
		<tr>
			<td width="6%" class="td2" nowrap>����</td>
			<td align="left"> 
				<input type="text" size="30" readonly="true" value="(�ޱ��)" name="cardid"/>
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