<%@include file="/internet/common.jsp"%>
<html:html locale="true">
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
			if((cardForm.elements["Card/fromCardData0"].value=cardcontrol.ReadData(7,0)).length==0){
			alert("此卡还未注册或还未开始使用，无法进行错卡还原！");
			}
			else if((cardForm.elements["Card/fromCardData1"].value=cardcontrol.ReadData(7,1)).length==0){
			alert("此卡还未注册或还未开始使用，无法进行错卡还原！");
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
			if(data2!=0 && !isContainChar(data2,"f",30,false)){	//2区全为0视为未注册卡，或者超过25个f字符的也视为未注册卡
				if(cardForm.elements["Card/CardTypeID"].value==2 && cardForm.elements["Card/CardUsingTimes"].value>0){
					alert("此卡已经有消费记录，不可以进行还原操作！");
					return false;
				}
			}
			else if(cardForm.elements["Card/StateID"].value==1){
				alert("此卡还未使用，无法进行错卡还原！");
				return false;
			}
			return true;
			}
			
			function doRecover(){
			if(window.confirm("一旦执行此操作，卡内的全部数据都将被清除！确定要还原该卡吗？")){
			if (doCheckClock()){
			cardForm.action="/ICCard.prRecover.cardRecoverDO.do";
			cardForm.submit();
			}
			}
			}
			
			function doRefundment(){
			var cardsum=cardForm.elements["Card/CardLastSum"].value;
			if(0>=cardsum)
				alert("此卡的余额已经为零，无法进行退款操作！");
			else if(window.confirm("卡内余额为"+cardsum+"元，确定退还吗？")){
			if(cardForm.elements["Card/StateID"].value==1){
			alert("此卡还未使用，无法进行退款操作！");}
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
            <td class="text_wirte">首页—&gt;一卡通—&gt;回收管理</td>
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
			<td width="12%" align="right" nowrap class="td2">操作说明：</td>
			<td width="88%" class="td1" >请把IC卡置于发卡机上，并点击下面的查询按钮，审核无误后再进行还原操作。
			<input type="button" value="查询卡" onclick="GetCardData()" title="查询IC卡的基本信息" class="button_02">
			</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">卡面编号：</td>
			<td width="88%" class="td1"  align="left"><logic:present
				property="QueryCard/CardCoverNO">
				<html:text property="QueryCard/CardCoverNO"
					styleClass="finput" size="30" readonly="true" />
			</logic:present> <logic:notPresent
				property="QueryCard/CardCoverNO">
				<input type="text" size="30" readonly="true" value="(无编号)" />
		  </logic:notPresent>
		  
		  <font color="red"><bean:write  property="info"/></font>
		  </td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">卡 类 型：</td>
		  <td width="88%" class="td1"  align="left">
		  <html:hidden name="Card/CardTypeID"  property="QueryCard/CardTypeID"/>
		  <input type="text" 
				value='<dict:write   property="QueryCard/CardTypeID" businTypeId="dx_cardTypeID"/>'
				size="30" readonly="true" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">卡 状 态：</td>
		  <td width="88%" class="td1"  align="left">
		   <html:hidden name="Card/StateID"  property="QueryCard/StateID"/>
		   <input type="text" 
				value='<dict:write   property="QueryCard/StateID" businTypeId="dx_cardStateID"/>'
				size="30" readonly="true" />
		  
		  
		  </td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">发卡时间：</td>
		  <td width="88%" class="td1"  align="left"><html:text
				property="QueryCard/TimeOfIssueCard" styleClass="finput" size="30"
				readonly="true" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">持 卡 人：</td>
		  <td width="88%" class="td1"  align="left">
		  <html:text property="QueryCard/operatorName" styleClass="finput" size="30" readonly="true" />
		</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">卡内余额：</td>
		  <td width="88%" class="td1"  align="left"><html:text  name="Card/CardLastSum"   property="QueryCard/CardLastSum"
				styleClass="finput" readonly="true" size="30" /> (人民币：元)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">刷卡次数：</td>
		  <td width="88%" class="td1"  align="left">
		  <html:text property="QueryCard/CardUsingTimes" name="Card/CardUsingTimes"	styleClass="finput" readonly="true" size="30" /></td>
		</tr>
		
			<tr>
				<td width="12%" align="right" nowrap class="td2">
				<input name="button" type="button" class="button_02" onClick="goBack()" value="返 回"/>&nbsp;
				</td>
			  <td width="88%" class="td1" >
			  
			  <logic:present property="QueryCard/CardLastSum">
			  <input type="button" onclick="doRecover()" value="还原错卡" title="还原发错或打错的卡" class="button_02"/>
			 <input type="button" onclick="doRefundment()" value="退还卡余" title="退还卡内所有余额" class="button_02"/>
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