<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>��ֵ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<!-- ��ȡ������ -->
<script language="javascript">
		
		
		function isContainChar(srcString,chr,len,mode){
			rtv = false;
			match = 0;
			for(i=0;i<srcString.length;i++){
				if (mode){
				if( chr==srcString.charAt(i)){
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
		
		
		
		
		
		
		function doSubmit(){
			var frm =document.forms[0];
			eles = frm.elements["DestroyCard/Type"];
			var i=0;
			var type=0;
			while(i<eles.length){
				obj= eles[i];
				if(obj.checked){
					type=obj.value;
				}
				i++;
			}
			
			if(type==0){
				alert("��ѡ��һ�ֲ�����ʽ");
			}
			else if (type==1){
				var cardID = cardcontrol.GetCardID();
				if(cardID>0){
					var data0=cardcontrol.ReadData(7,0);
					var data1=cardcontrol.ReadData(7,1);
					var data2=cardcontrol.ReadData(7,2);
					if(data2.length==0){
						alert("�˿���δע���뵳У���⣡");
						return;
					}else if(data2==0 || isContainChar(data2,"f",30,false)){	//2��ȫΪ0��Ϊδע�Ῠ�����߳���25��f�ַ���Ҳ��Ϊδע�Ῠ
						alert("�˿���δ����ʹ�ã��뷢�����ٳ�ֵ��");
						return;
					}
					if(data0.length==0||data1.length==0){
						alert("�˿���δע����߻�δʹ��");
						return;
					}
					else{
						frm.elements["Card/fromCardData0"].value=data0;
						frm.elements["Card/fromCardData1"].value=data1;
						frm.elements["Card/CardID"].value=cardID;
						frm.submit();
						cardcontrol.Quit();
					}
			}
			}
			else{
				frm.submit();
				cardcontrol.Quit();
			}
		}
		</script>

</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0"
	style="overflow-y:scroll" onLoad="cardcontrol.Init(0);"
	onunload="cardcontrol.Quit()">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;��������&gt;���ת��/�˿�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>
<form name="curCardForm" action="ICCard.prDestroyCard.cardVirementDO.do" method="POST">
<INPUT type="hidden" name="Card/CardID">
<html:hidden property="Card/fromCardData0" />
<html:hidden property="Card/fromCardData1" />
<html:hidden property="QueryDestroyCard/DestroyCardID" name="DestroyCard/DestroyCardID"/>
<table width="96%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td width="20%" align="right" nowrap class="td2">����˵����</td>
		<td width="80%" class="td1">
		&nbsp;
		��Ϊ���ת�����IC�����ڶ������ϣ���ȷ�Ͻ��в�����</td>
	</tr>
	
	<tr>
	  <td align="right" nowrap class="td2">�����ţ�</td>
	  <td class="td1" align="left">
	  &nbsp;
	  <bean:write property="QueryDestroyCard/CardCoverNO"/></td>
	  </tr>
	<tr>
		<td width="12%" align="right" nowrap class="td2">�� �� �ˣ�</td>
		<td width="88%" class="td1" align="left">&nbsp;
		<bean:write property="QueryDestroyCard/UserName"/>		</td>
	</tr>
	<tr>
		<td width="12%" align="right" nowrap class="td2">������</td>
		<td width="88%" class="td1" align="left">&nbsp;
		<bean:write property="QueryDestroyCard/CardLastSumCache"/> (����ң�Ԫ)		</td>
	</tr>
		
		<tr>
			<td width="12%" align="right" nowrap class="td2">������ʽ��</td>
			<td width="88%" class="td1" align="left">&nbsp;<html:radio property="QueryDestroyCard/Type" name="DestroyCard/Type" value="1"/>
			
			���ת�� 
			 <html:radio property="QueryDestroyCard/Type" value="2" name="DestroyCard/Type"/>
			  �˿�</td>
		</tr>
		
		<tr>
			<td width="12%" height="30" nowrap class="td2"></td>
		  <td width="88%" class="td1">
				<html:button styleClass="button_02" property="button"
					onclick="doSubmit()" value="ȷ ��" />			</td>
		</tr>
	
</table>
</form>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:00BCB426-4501-496F-B780-267302BE3BA3"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</html:html>