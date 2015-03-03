<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>充值管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<!-- 读取物理卡号 -->
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
				alert("请选择一种操作方式");
			}
			else if (type==1){
				var cardID = cardcontrol.GetCardID();
				if(cardID>0){
					var data0=cardcontrol.ReadData(7,0);
					var data1=cardcontrol.ReadData(7,1);
					var data2=cardcontrol.ReadData(7,2);
					if(data2.length==0){
						alert("此卡还未注册入党校卡库！");
						return;
					}else if(data2==0 || isContainChar(data2,"f",30,false)){	//2区全为0视为未注册卡，或者超过25个f字符的也视为未注册卡
						alert("此卡还未发行使用，请发卡后再充值！");
						return;
					}
					if(data0.length==0||data1.length==0){
						alert("此卡还未注册或者还未使用");
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
            <td class="text_wirte">首页—&gt;一卡通—&gt;销卡管理—&gt;余额转出/退款</td>
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
		<td width="20%" align="right" nowrap class="td2">操作说明：</td>
		<td width="80%" class="td1">
		&nbsp;
		若为余额转出需把IC卡置于读卡器上，按确认进行操作。</td>
	</tr>
	
	<tr>
	  <td align="right" nowrap class="td2">卡面编号：</td>
	  <td class="td1" align="left">
	  &nbsp;
	  <bean:write property="QueryDestroyCard/CardCoverNO"/></td>
	  </tr>
	<tr>
		<td width="12%" align="right" nowrap class="td2">持 卡 人：</td>
		<td width="88%" class="td1" align="left">&nbsp;
		<bean:write property="QueryDestroyCard/UserName"/>		</td>
	</tr>
	<tr>
		<td width="12%" align="right" nowrap class="td2">卡内余额：</td>
		<td width="88%" class="td1" align="left">&nbsp;
		<bean:write property="QueryDestroyCard/CardLastSumCache"/> (人民币：元)		</td>
	</tr>
		
		<tr>
			<td width="12%" align="right" nowrap class="td2">操作方式：</td>
			<td width="88%" class="td1" align="left">&nbsp;<html:radio property="QueryDestroyCard/Type" name="DestroyCard/Type" value="1"/>
			
			余额转出 
			 <html:radio property="QueryDestroyCard/Type" value="2" name="DestroyCard/Type"/>
			  退款</td>
		</tr>
		
		<tr>
			<td width="12%" height="30" nowrap class="td2"></td>
		  <td width="88%" class="td1">
				<html:button styleClass="button_02" property="button"
					onclick="doSubmit()" value="确 认" />			</td>
		</tr>
	
</table>
</form>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:00BCB426-4501-496F-B780-267302BE3BA3"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</html:html>