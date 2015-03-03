<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>修改IC卡</title>
<SCRIPT type="text/javascript" language="javascript">
function StartModify(){
    		_cardCost=document.all["Card/Cost"].value;
   			if(trim(_cardCost)=="" ){
				alert("请输入工本费!");
        		document.all["Card/Cost"].focus();
	    		return ;
    		} 
    	
    		if(isNaN(_cardCost) || parseInt(_cardCost)<0){
				alert("工本费必须是正数！");
				document.all["Card/Cost"].focus();
				return;
			}
			
			if(cardForm.elements["Card/CardCoverNO"].value!=""){
			var cardCovernoStr=cardForm.elements["Card/CardCoverNO"].value;
			var subCardCovernoStr=cardCovernoStr.substring(cardCovernoStr.length-5,cardCovernoStr.length);
			if(isNaN(subCardCovernoStr) || parseFloat(subCardCovernoStr)!=parseInt(parseFloat(subCardCovernoStr))){
			alert("卡面编号的末5位必须是整数！");
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
            <td width="642" class="text_wirte">首页—&gt;一卡通—&gt;卡库管理—&gt;修改IC卡             </td>
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
			<td width="12%" align="right" nowrap class="td2">卡 类 型：</td>
			<td align="left" class="td1">
			<html:radio property="Card/CardTypeID" value="1" checked="true"/>个性卡 
			<html:radio property="Card/CardTypeID" value="2"/>通用卡
			</td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">卡面编号：</td>
			<td class="td1">
			<html:text property="Card/CardCoverNO" styleClass="input" size="30"  />(只填写起始编号，如00120、DX00108等，末5位必须是整数)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">工 本 费：</td>
			<td class="td1">
			<html:text property="Card/Cost" styleClass="input" size="30"/>(人民币：元)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">备 注：</td>
			<td class="td1"><html:text property="Card/Remark" styleClass="input" size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td class="td1">
			<input name="saveButton" type="button" class="button_02" value="保 存" onClick="StartModify()">
            <input name="return" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
			</td>
		</tr>
  </table>
</form>
</body>
</html>