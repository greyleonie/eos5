<%@include file="/internet/common.jsp"%>
<html:html locale="true">
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
			if((cardForm.elements["Card/fromCardData0"].value=cardcontrol.ReadData(7,0)).length==0){
			alert("�˿���δע���δ��ʼʹ�ã��޷����д���ԭ��");
			}
			else if((cardForm.elements["Card/fromCardData1"].value=cardcontrol.ReadData(7,1)).length==0){
			alert("�˿���δע���δ��ʼʹ�ã��޷����д���ԭ��");
			}
			else{
			cardForm.elements["Card/CardID"].value=id;
			cardForm.submit();
			cardcontrol.Quit();
			}
			}
			}
			
			function doCheckClock(){
			var data2=cardcontrol.ReadData(7,2);
			if(data2!=0 && !isContainChar(data2,"f",30,false)){	//2��ȫΪ0��Ϊδע�Ῠ�����߳���25��f�ַ���Ҳ��Ϊδע�Ῠ
				if(cardForm.elements["Card/CardTypeID"].value==2 && cardForm.elements["Card/CardUsingTimes"].value>0){
					alert("�˿��Ѿ������Ѽ�¼�������Խ��л�ԭ������");
					return false;
				}
			}
			else if(cardForm.elements["Card/StateID"].value==1){
				alert("�˿���δʹ�ã��޷����д���ԭ��");
				return false;
			}
			return true;
			}
			
			function doRecover(){
			if(window.confirm("һ��ִ�д˲��������ڵ�ȫ�����ݶ����������ȷ��Ҫ��ԭ�ÿ���")){
			if (doCheckClock()){
			cardForm.action="/ICCard.prRecover.cardRecoverDO.do";
			cardForm.submit();
			}
			}
			}
			
			function doRefundment(){
			var cardsum=cardForm.elements["Card/CardLastSum"].value;
			if(0>=cardsum)
				alert("�˿�������Ѿ�Ϊ�㣬�޷������˿������");
			else if(window.confirm("�������Ϊ"+cardsum+"Ԫ��ȷ���˻���")){
			if(cardForm.elements["Card/StateID"].value==1){
			alert("�˿���δʹ�ã��޷������˿������");}
			else{
			cardForm.elements["Card/fromCardData0"].value=cardcontrol.ReadData(7,0);
			cardForm.elements["Card/fromCardData1"].value=cardcontrol.ReadData(7,1);
			cardForm.action="/ICCard.prRecover.refundmentDO.do";
			cardForm.submit();
			}
			}
			}
			
		function goBack(){
			window.navigate("ICCard.prRecover.recoverList.do");
		}
		</script>

</head>

<body  onLoad="cardcontrol.Init(0)" onunload="cardcontrol.Quit()">

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���չ���</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>



<html:form action="/ICCard.prRecover.cardRecover.do" method="POST" name="cardForm">
	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
			<td width="12%" align="right" nowrap class="td2">����˵����</td>
			<td width="88%" class="td1" >���IC�����ڷ������ϣ����������Ĳ�ѯ��ť�����������ٽ��л�ԭ������
			<input type="button" value="��ѯ��" onclick="GetCardData()" title="��ѯIC���Ļ�����Ϣ" class="button_02">
			</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�����ţ�</td>
			<td width="88%" class="td1"  align="left"><logic:present
				property="QueryCard/CardCoverNO">
				<html:text property="QueryCard/CardCoverNO"
					styleClass="finput" size="30" readonly="true" />
			</logic:present> <logic:notPresent
				property="QueryCard/CardCoverNO">
				<input type="text" size="30" readonly="true" value="(�ޱ��)" />
		  </logic:notPresent>
		  
		  <font color="red"><bean:write  property="info"/></font>
		  </td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ͣ�</td>
		  <td width="88%" class="td1"  align="left">
		  <html:hidden name="Card/CardTypeID"  property="QueryCard/CardTypeID"/>
		  <input type="text" 
				value='<dict:write   property="QueryCard/CardTypeID" businTypeId="dx_cardTypeID"/>'
				size="30" readonly="true" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� ״ ̬��</td>
		  <td width="88%" class="td1"  align="left">
		   <html:hidden name="Card/StateID"  property="QueryCard/StateID"/>
		   <input type="text" 
				value='<dict:write   property="QueryCard/StateID" businTypeId="dx_cardStateID"/>'
				size="30" readonly="true" />
		  
		  
		  </td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">����ʱ�䣺</td>
		  <td width="88%" class="td1"  align="left"><html:text
				property="QueryCard/TimeOfIssueCard" styleClass="finput" size="30"
				readonly="true" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ˣ�</td>
		  <td width="88%" class="td1"  align="left">
		  <html:text property="QueryCard/operatorName" styleClass="finput" size="30" readonly="true" />
		</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">������</td>
		  <td width="88%" class="td1"  align="left"><html:text  name="Card/CardLastSum"   property="QueryCard/CardLastSum"
				styleClass="finput" readonly="true" size="30" /> (����ң�Ԫ)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">ˢ��������</td>
		  <td width="88%" class="td1"  align="left">
		  <html:text property="QueryCard/CardUsingTimes" name="Card/CardUsingTimes"	styleClass="finput" readonly="true" size="30" /></td>
		</tr>
		
			<tr>
				<td width="12%" align="right" nowrap class="td2">
				<input name="button" type="button" class="button_02" onClick="goBack()" value="�� ��"/>&nbsp;
				</td>
			  <td width="88%" class="td1" >
			  
			  <logic:present property="QueryCard/CardLastSum">
			  <input type="button" onclick="doRecover()" value="��ԭ��" title="��ԭ�������Ŀ�" class="button_02"/>
			 <input type="button" onclick="doRefundment()" value="�˻�����" title="�˻������������" class="button_02"/>
			</logic:present>
			</td>
			</tr>
		
		<html:hidden property="Card/CardID" />
		<html:hidden property="Card/fromCardData0" />
		<html:hidden property="Card/fromCardData1" />
		
	</table>
</html:form>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</html:html>