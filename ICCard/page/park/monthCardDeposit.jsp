<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>月卡充值</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<!-- 读取物理卡号 -->
<script language="javascript">
		var GetterEnable;
		
		function ShowOldCardCoverNO(){
		cardForm.elements["Card/oldCardCoverNO"].disabled="";
		cika.style.display="block";
		}
		
		function HideOldCardCoverNO(){
		cardForm.elements["Card/oldCardCoverNO"].disabled="ture";
		cika.style.display="none";
		}
		
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
		
		
		function start(){
		cardcontrol.Init(0);
		GetterEnable=1;
		if(cardForm.elements["Card/operatorName"].value.length==0 )
		GetCardID();
		}
		
		function GetCardID(){
		setTimeout("GetCardID();",1000);
		var id=cardcontrol.GetCardIDWithoutInfo();
		var errinfo="此卡还未注册或者还未使用！";
		
		if(GetterEnable==1 && id>0){
		var data2=cardcontrol.ReadData(7,2);
		
		if(data2.length==0){
		GetterEnable=0;
		errinfo="此卡还未注册入党校卡库！";
		alert(errinfo);
		cardForm.elements["Card/operatorName"].value=errinfo;
		return;
		}else if(data2==0 || isContainChar(data2,"f",30,false)){	//2区全为0视为未注册卡，或者超过25个f字符的也视为未注册卡
		GetterEnable=0;
		errinfo="此卡还未发行使用，请发卡后再充值！";
		alert(errinfo);
		cardForm.elements["Card/operatorName"].value=errinfo;
		
		return;
		}
		
		if((cardForm.elements["Card/fromCardData0"].value=cardcontrol.ReadData(7,0)).length==0){
			GetterEnable=0;
			alert(errinfo);
			cardForm.elements["Card/operatorName"].value=errinfo;
		}
		else if((cardForm.elements["Card/fromCardData1"].value=cardcontrol.ReadData(7,1)).length==0){
			GetterEnable=0;
			alert(errinfo);
			cardForm.elements["Card/operatorName"].value=errinfo;
			cardForm.elements["Card/CardLastSum"].value=errinfo;
		}
		if((cardForm.elements["Card/fromCardData2"].value=cardcontrol.ReadData(7,2)).length==0){
			GetterEnable=0;
			alert(errinfo);
			cardForm.elements["Card/operatorName"].value=errinfo;
		}
		else{
		cardForm.elements["Card/CardID"].value=id;
		cardForm.submit();
		cardcontrol.Quit();
		}
		}
		}
		
		function Forward(){
		window.navigate("ICCard.prPark.monthCardDeposit.do");
		}
		
		
		
		function doSubmit(){
			var frm = document.forms["usersForm"];
			if(validater(frm)) frm.submit();
		}
		</script>

</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0"
	style="overflow-y:scroll" onLoad="start()"
	onunload="cardcontrol.Quit()">
<br>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">月保卡充值</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table>
			</td>
            <td width="60%" valign="bottom">
			<table width="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                  <td align="right"><span class="td1">
                    
                  </span> </td>
              </tr>
            </table>
			<table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table>
			</td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
  </table>
<table width="100%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td width="12%" class="td2" nowrap>操作说明</td>
		<td width="88%" class="td1">请详细填写下列信息，确定无误即可进行充值操作。</td>
	</tr>
	<form name="cardForm" action="ICCard.prPark.monthCardDeposit.do" method="POST">
	<tr>
		<td width="12%" class="td2" nowrap>持 卡 人</td>
		<td width="88%" class="td1" align="left">
		<html:text property="Card/operatorName"   styleClass="input" size="30"  readonly="true"/>
		<input type="hidden" name="Card/CardID" />
		<input type="hidden" name="Card/fromCardData0" />
		<input type="hidden" name="Card/fromCardData1" />
		<input type="hidden" name="Card/fromCardData2" />		</td>
	</tr>
	</form>
	<html:form action="ICCard.prPark.monthCardDepositDO.do" method="POST" name="usersForm">
	<html:hidden property="Card/CardID" />
		<html:hidden property="Card/fromCardData0" />
		<html:hidden property="Card/fromCardData1" />
		<html:hidden property="Card/fromCardData2" />
	<tr>
	  <td class="td2" nowrap> 最近一次充值使用时间</td>
	  <td class="td1" align="left">
	  <logic:present property="QueryMonthCard/MonthCardID">
	  	从
		<bean:write property="QueryMonthCard/StartTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
		至
		<bean:write property="QueryMonthCard/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
		使用
	 </logic:present>
	  </td>
	  </tr>
	<tr>
	  <td class="td2" nowrap>车牌号码</td>
	  <td class="td1" align="left"><html:text name="MonthCard/CarNO" property="QueryMonthCard/CarNO" styleClass="input" size="30"  attributesText='ValidateType="notempty" Msg="车牌号码不能为空"'/></td>
	  </tr>
	<tr>
	  <td class="td2" nowrap>车辆说明</td>
	  <td class="td1" align="left"><html:textarea name="MonthCard/CarRemark" property="QueryMonthCard/CarRemark" styleClass="input" cols="70" rows="3" /></td>
	  </tr>
	<tr>
	
		<td width="12%" class="td2" nowrap>充卡月数</td>
		<td width="88%" class="td1" align="left">
		<SELECT name="MonthCard/MonthCount" class="input" onChange="changeCount()">
		  <%for(int i=1;i<=48;i++){ %>
		  <OPTION value="<%=i %>"><%=i %></OPTION>
		  <%} %>
		  </SELECT>
		  月		</td>
	</tr>
	
		
		<tr>
			<td width="12%" class="td2" nowrap>开始使用时间</td>
			<td width="88%" class="td1" align="left"><html:text property="MonthCard/StartTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"   ValidateType="notempty" Msg="使用时间不能为空"'  />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick="getDate()"></td>
		</tr>
		<tr >
			<td width="12%" class="td2" nowrap>停止使用时间</td>
			<td width="88%" class="td1"><html:text property="MonthCard/EndTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"' readonly="true"/></td>
		</tr>
		<tr>
			<td width="12%" class="td2" nowrap>应缴金额</td>
			<td width="88%" class="td1" align="left">
			<html:text property="MonthCard/charge" styleClass="inputOA" size="10" attributesText='ValidateType="notempty,money" Msg="应缴金额不能为空;应缴金额格式不正确"'/>(人民币：元)			 </td>
		</tr>
		<tr>
			<td width="12%" class="td2" nowrap></td>
		  <td width="88%" class="td1"><input type="button" value="清 空" onClick="Forward()" class="button_02"/> <logic:present
				 property="Card/CardLastSum">
				<html:button styleClass="button_02" property="button"
					onclick="doSubmit()" value="充 值" />
			</logic:present> 
			<logic:notPresent property="Card/CardLastSum">
				<html:button styleClass="button_02" property="button"
					onclick="doSubmit()" value="充 值" disabled="true" />
		  </logic:notPresent></td>
		</tr>
	</html:form>
</table>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</html:html>
<script language="javascript">
 var preCharge = <bean:write property="ConfigureTree/MonthCardCharge"/>
 function getCharge(){
 	var count = document.usersForm.elements["MonthCard/MonthCount"].value;
 	var countCharge = parseInt(count) * parseInt(preCharge) ; 
 	document.usersForm.elements["MonthCard/charge"].value = countCharge ;
 }
 function changeDate(){
 	var TDate = new Date();
 	var SDate = document.usersForm.elements["MonthCard/StartTime[@pattern='yyyy-MM-dd']"].value;
	SDate=SDate.split("-");
	var yy=SDate[0];
	var mm=SDate[1];
	var dd=SDate[2];
	var mNum=parseInt(document.usersForm.elements["MonthCard/MonthCount"].value);//获取要加的月数
	TDate.setFullYear(yy,mm,dd);   
	TDate.setMonth(parseInt(TDate.getMonth().toString())+mNum);//加月数运算
	//ate.setDate(parseInt(TDate.getDate().toString())+dNum);//加天数运算
	document.usersForm.elements["MonthCard/EndTime[@pattern='yyyy-MM-dd']"].value=ShowDate(TDate);   
}
function ShowDate(iDate){   
	var year = iDate.getYear().toString();         
     var Month = iDate.getMonth().toString();   
     var aDate = iDate.getDate().toString();   
     
     if(Month == "0"){
     	Month = "12";
     	year = parseInt(year) -1 ;
     }  
           
     //if(parseInt(Month) <= 9) Month ="0"+Month;   
     //if(parseInt(aDate) <= 9) aDate ="0"+aDate;   
     var value = year+"-"+Month+"-"+aDate;   
     return value;   
}

 
 function getDate(){
 	showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
				document.usersForm.elements["MonthCard/StartTime[@pattern='yyyy-MM-dd']"].value = retval;
 				changeDate();
 			}
 }
 function changeCount(){
 	if(document.usersForm.elements["MonthCard/StartTime[@pattern='yyyy-MM-dd']"].value!=""){
 		changeDate();
 	}
 	getCharge();
 }
 
 
 getCharge();
</script>