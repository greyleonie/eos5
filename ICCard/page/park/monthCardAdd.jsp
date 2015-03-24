<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>发校园绿卡</title>


<!-- 读取物理卡号 -->
<script language="javascript">
			function getCardID(){
			var cardid;
			cardid=cardcontrol.GetCardID();
			if(cardid>0){
			cardForm.action="/ICCard.prPark.monthCardAdd.do?Card/CardID="+cardid;
			cardForm.submit();
			}
			}
			
			function doCheckClock(){
			var sum=usersForm.elements["MonthCard/charge"].value;
			var cardcost=cardForm.elements["QueryCard/Cost"].value;
			var array = sum.split(".");
			var pwd=usersForm.elements["Card/password"].value;
			var pwdcf=usersForm.elements["Card/passwordconfirm"].value;
			
			if (isNaN(cardcost)){
			alert("请输入正确的工本费！");
			return false;
			}else if(parseInt(cardcost)>30){
			alert("工本费不得超过30元！");
			return false;
			}else if(parseFloat(cardcost)!=parseInt(cardcost)){
			alert("工本费必须是整数！");
			return false;
			}
			
			if (isNaN(sum)){
			alert("请输入正确的充卡金额！");
			return false;
			}else if(parseInt(sum)>=10000){
			alert("充卡金额不得超过10000元！");
			return false;
			}else if(parseInt(array[1])>=100){
			alert("充卡金额只能精确到小数点后两位！");
			return false;
			}
			
			if(pwd.length!=6){
				alert("密码必须是六位的！");
				usersForm.elements["Card/password"].value="";
				usersForm.elements["Card/passwordconfirm"].value="";
				return false;
			}else if(isNaN(pwd)){
				alert("密码必须是纯数字！");
				usersForm.elements["Card/password"].value="";
				usersForm.elements["Card/passwordconfirm"].value="";
				return false;
			}else if(pwd!=pwdcf){
				alert("输入的两次密码不相同！");
				usersForm.elements["Card/password"].value="";
				usersForm.elements["Card/passwordconfirm"].value="";
				return false;
			}else if(usersForm.elements["MonthCard/StartTime[@pattern='yyyy-MM-dd']"].value==""){
				alert("请选择时间！");
				return false;
			}
			else{
			return true;
			}
			}
			
			function doSubmit(){
			if (doCheckClock()){
			usersForm.elements["Card/Cost"].value=cardForm.elements["QueryCard/Cost"].value*1;
			usersForm.submit();
			}
			}
		</script>
</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0"
	style="overflow-y:scroll" onLoad="cardcontrol.Init(0)"
	onunload="cardcontrol.Quit()">

<!-- 注册步骤一 -->
<form name="cardForm" action="/ICCard.prPark.monthCardAdd.do" method="POST">
<br>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤一：备卡</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
    </table>
<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td width="12%" align="right" nowrap class="td2">操作说明：</td>
		<td colspan="3"  class="td1">请把IC卡置于发卡机上，并点击下面的查询按钮，审核卡信息以确保无误。
	    <input name="queryinfo" type="button" class="button_03" value="查询卡信息" onClick="getCardID()"></td>
      </tr>
	<tr>
		<td width="12%" align="right" nowrap class="td2">卡面编号：</td>
		<td width="38%"  class="td1" align="left"><html:text property="Card/CardCoverNO"  name="QueryCard/CardCoverNO"  styleClass="input" size="20" readonly="true" /></td>
	    <td width="12%" align="right" nowrap class="td2">卡 类 型：</td>
	    <td width="38%" align="left"  class="td1"><input type="text" Class="input" size="20" readonly="true" name="QueryCard/CardTypeID" value='<dict:write  property="Card/CardTypeID" businTypeId="dx_cardTypeID"/>'>        </td>
	</tr>
	
	<tr>
		<td width="12%" align="right" nowrap class="td2">卡 状 态：</td>
		<td width="38%"  class="td1" align="left">
		<input type="text" Class="input" size="20" readonly="true" name="QueryCard/StateID" value='<dict:write  property="Card/StateID" businTypeId="dx_cardStateID"/>'>		</td>
	    <td align="right" nowrap class="td2">注册时间：</td>
	    <td align="left"  class="td1"><html:text property="Card/RegisterTime" name="QueryCard/RegisterTime" styleClass="input" size="20" readonly="true" /></td>
	</tr>
	
	<tr>
		<td width="12%" align="right" nowrap class="td2">工 本 费：</td>
		<td width="38%"  class="td1" align="left"><html:text property="Card/Cost"  name="QueryCard/Cost" styleClass="input" size="20"  />
		(人民币：元)</td>
	    <td align="right" nowrap class="td2">备 注：</td>
	    <td align="left"  class="td1"><html:text property="Card/Remark" name="QueryCard/Remark" styleClass="input" size="20" readonly="true" /></td>
	</tr>
</table>
</form>

<!-- 注册步骤二 -->
<html:form action="/ICCard.prPark.monthCardAddDO.do" method="POST" name="usersForm">
	<html:hidden property="Card/CardID"/>
	<html:hidden property="Card/Cost"/>
	<html:hidden property="fid" value=""/>
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤二：发卡</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td> </td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td height="2" colspan="2"> </td>
            </tr>
    </table>
	 <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
			<td width="12%" align="right" nowrap class="td2">操作说明：</td>
			<td colspan="3" class="td1">请详细填写下列信息，确定无误即可收费和发卡。</td>
	    </tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">持 卡 人：</td>
			<td align="left" class="td1"><html:text property="Card/UserName" styleClass="input" size="30" /> </td>
	        <td align="right" nowrap class="td2">卡 密 码：</td>
	        <td align="left" class="td1"><input type="password" name="Card/password"
				Class="input" size="20" value="888888" />
	          (六位纯数字密码,默认6个8)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">车牌号码：</td>
			<td align="left" class="td1"><html:text property="MonthCard/CarNO" styleClass="input" size="30" /> </td>
	        <td align="right" class="td2"><span class="td2">确认密码：</span></td>
	        <td align="left" class="td1"><input type="password" name="Card/passwordconfirm"
				class="input" size="20"  value="888888" /></td>
		</tr>
		
		<tr>
		  <td align="right" nowrap class="td2">车辆说明：</td>
		  <td colspan="3" align="left" class="td1"><html:textarea property="MonthCard/CarRemark" styleClass="input" cols="70" rows="3" />
		  (如车型等信息)
		  </td>
	   </tr>
		<tr>
		  <td align="right" nowrap class="td2">充卡月数：</td>
		  <td width="25%" align="left" class="td1">
		  <SELECT name="MonthCard/MonthCount" class="input" onChange="changeCount()">
		  <%for(int i=1;i<=48;i++){ %>
		  <OPTION value="<%=i %>"><%=i %></OPTION>
		  <%} %>
		  </SELECT>
		  月</td>
	      <td width="15%" align="right" class="td2">应缴金额：</td>
	      <td width="50%" align="left" class="td1"> <html:text property="MonthCard/charge" styleClass="inputOA" size="10" />(人民币：元)</td>
	   </tr>
		<tr>
		  <td align="right" nowrap class="td2" >开始使用时间：</td>
		  <td align="left" class="td1"><html:text property="MonthCard/StartTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"'  />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick="getDate()"></td>
	      <td align="right" class="td2">停止使用时间：</td>
	      <td align="left" class="td1"><html:text property="MonthCard/EndTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"' readonly="true"/></td>
	   </tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td colspan="3" class="td1">
			
			<logic:present property="Card/StateID">
				<logic:equal property="Card/StateID"	value="1">
				<input name="faka" type="button" class="button_02" value="发卡" onClick="doSubmit()"> 
				</logic:equal>
				<logic:notEqual property="Card/StateID" value="1">
				<input name="faka" type="button" class="button_02" value="发卡" disabled="true"> 
				</logic:notEqual>
			</logic:present> 
			<logic:notPresent property="Card/StateID">
				<input name="faka" type="button" class="button_02" value="发卡" disabled="true">
			</logic:notPresent></td>
	    </tr>
	</table>
	
</html:form>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab" name="cardcontrol"> </OBJECT>
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