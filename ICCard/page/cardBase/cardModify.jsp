<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>�޸�IC��</title>
<SCRIPT type="text/javascript" language="javascript">
function StartModify(){
    		_cardCost=document.all["Card/Cost"].value;
   			if(trim(_cardCost)=="" ){
				alert("�����빤����!");
        		document.all["Card/Cost"].focus();
	    		return ;
    		} 
    	
    		if(isNaN(_cardCost) || parseInt(_cardCost)<0){
				alert("�����ѱ�����������");
				document.all["Card/Cost"].focus();
				return;
			}
			
			if(cardForm.elements["Card/CardCoverNO"].value!=""){
			var cardCovernoStr=cardForm.elements["Card/CardCoverNO"].value;
			var subCardCovernoStr=cardCovernoStr.substring(cardCovernoStr.length-5,cardCovernoStr.length);
			if(isNaN(subCardCovernoStr) || parseFloat(subCardCovernoStr)!=parseInt(parseFloat(subCardCovernoStr))){
			alert("�����ŵ�ĩ5λ������������");
			return;
			}
			}
			document.forms["cardForm"].saveButton.disabled="";
			document.forms["cardForm"].submit();
}
</SCRIPT>
</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0">
<form method="post" action="ICCard.prCardBase.cardModifyDo.do" name="cardForm">
<table width="101%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td width="642" class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;�������&gt;�޸�IC��             </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="Card/CardID"/>
	  </td>
    </tr>
  </table>

	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ͣ�</td>
			<td align="left" class="td1">
			<html:radio property="Card/CardTypeID" value="1" checked="true"/>���Կ� 
			<html:radio property="Card/CardTypeID" value="2"/>ͨ�ÿ�
			</td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">�����ţ�</td>
			<td class="td1">
			<html:text property="Card/CardCoverNO" styleClass="input" size="30"  />(ֻ��д��ʼ��ţ���00120��DX00108�ȣ�ĩ5λ����������)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ѣ�</td>
			<td class="td1">
			<html:text property="Card/Cost" styleClass="input" size="30"/>(����ң�Ԫ)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� ע��</td>
			<td class="td1"><html:text property="Card/Remark" styleClass="input" size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td class="td1">
			<input name="saveButton" type="button" class="button_02" value="�� ��" onClick="StartModify()">
            <input name="return" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
			</td>
		</tr>
  </table>
</form>
</body>
</html>