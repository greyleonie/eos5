<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>��У԰�̿�</title>


<!-- ��ȡ������ -->
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
			alert("��������ȷ�Ĺ����ѣ�");
			return false;
			}else if(parseInt(cardcost)>30){
			alert("�����Ѳ��ó���30Ԫ��");
			return false;
			}else if(parseFloat(cardcost)!=parseInt(cardcost)){
			alert("�����ѱ�����������");
			return false;
			}
			
			if (isNaN(sum)){
			alert("��������ȷ�ĳ俨��");
			return false;
			}else if(parseInt(sum)>=10000){
			alert("�俨���ó���10000Ԫ��");
			return false;
			}else if(parseInt(array[1])>=100){
			alert("�俨���ֻ�ܾ�ȷ��С�������λ��");
			return false;
			}
			
			if(pwd.length!=6){
				alert("�����������λ�ģ�");
				usersForm.elements["Card/password"].value="";
				usersForm.elements["Card/passwordconfirm"].value="";
				return false;
			}else if(isNaN(pwd)){
				alert("��������Ǵ����֣�");
				usersForm.elements["Card/password"].value="";
				usersForm.elements["Card/passwordconfirm"].value="";
				return false;
			}else if(pwd!=pwdcf){
				alert("������������벻��ͬ��");
				usersForm.elements["Card/password"].value="";
				usersForm.elements["Card/passwordconfirm"].value="";
				return false;
			}else if(usersForm.elements["MonthCard/StartTime[@pattern='yyyy-MM-dd']"].value==""){
				alert("��ѡ��ʱ�䣡");
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

<!-- ע�Ჽ��һ -->
<form name="cardForm" action="/ICCard.prPark.monthCardAdd.do" method="POST">
<br>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">����һ������</td>
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
		<td width="12%" align="right" nowrap class="td2">����˵����</td>
		<td colspan="3"  class="td1">���IC�����ڷ������ϣ����������Ĳ�ѯ��ť����˿���Ϣ��ȷ������
	    <input name="queryinfo" type="button" class="button_03" value="��ѯ����Ϣ" onClick="getCardID()"></td>
      </tr>
	<tr>
		<td width="12%" align="right" nowrap class="td2">�����ţ�</td>
		<td width="38%"  class="td1" align="left"><html:text property="Card/CardCoverNO"  name="QueryCard/CardCoverNO"  styleClass="input" size="20" readonly="true" /></td>
	    <td width="12%" align="right" nowrap class="td2">�� �� �ͣ�</td>
	    <td width="38%" align="left"  class="td1"><input type="text" Class="input" size="20" readonly="true" name="QueryCard/CardTypeID" value='<dict:write  property="Card/CardTypeID" businTypeId="dx_cardTypeID"/>'>        </td>
	</tr>
	
	<tr>
		<td width="12%" align="right" nowrap class="td2">�� ״ ̬��</td>
		<td width="38%"  class="td1" align="left">
		<input type="text" Class="input" size="20" readonly="true" name="QueryCard/StateID" value='<dict:write  property="Card/StateID" businTypeId="dx_cardStateID"/>'>		</td>
	    <td align="right" nowrap class="td2">ע��ʱ�䣺</td>
	    <td align="left"  class="td1"><html:text property="Card/RegisterTime" name="QueryCard/RegisterTime" styleClass="input" size="20" readonly="true" /></td>
	</tr>
	
	<tr>
		<td width="12%" align="right" nowrap class="td2">�� �� �ѣ�</td>
		<td width="38%"  class="td1" align="left"><html:text property="Card/Cost"  name="QueryCard/Cost" styleClass="input" size="20"  />
		(����ң�Ԫ)</td>
	    <td align="right" nowrap class="td2">�� ע��</td>
	    <td align="left"  class="td1"><html:text property="Card/Remark" name="QueryCard/Remark" styleClass="input" size="20" readonly="true" /></td>
	</tr>
</table>
</form>

<!-- ע�Ჽ��� -->
<html:form action="/ICCard.prPark.monthCardAddDO.do" method="POST" name="usersForm">
	<html:hidden property="Card/CardID"/>
	<html:hidden property="Card/Cost"/>
	<html:hidden property="fid" value=""/>
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�����������</td>
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
			<td width="12%" align="right" nowrap class="td2">����˵����</td>
			<td colspan="3" class="td1">����ϸ��д������Ϣ��ȷ�����󼴿��շѺͷ�����</td>
	    </tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ˣ�</td>
			<td align="left" class="td1"><html:text property="Card/UserName" styleClass="input" size="30" /> </td>
	        <td align="right" nowrap class="td2">�� �� �룺</td>
	        <td align="left" class="td1"><input type="password" name="Card/password"
				Class="input" size="20" value="888888" />
	          (��λ����������,Ĭ��6��8)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">���ƺ��룺</td>
			<td align="left" class="td1"><html:text property="MonthCard/CarNO" styleClass="input" size="30" /> </td>
	        <td align="right" class="td2"><span class="td2">ȷ�����룺</span></td>
	        <td align="left" class="td1"><input type="password" name="Card/passwordconfirm"
				class="input" size="20"  value="888888" /></td>
		</tr>
		
		<tr>
		  <td align="right" nowrap class="td2">����˵����</td>
		  <td colspan="3" align="left" class="td1"><html:textarea property="MonthCard/CarRemark" styleClass="input" cols="70" rows="3" />
		  (�糵�͵���Ϣ)
		  </td>
	   </tr>
		<tr>
		  <td align="right" nowrap class="td2">�俨������</td>
		  <td width="25%" align="left" class="td1">
		  <SELECT name="MonthCard/MonthCount" class="input" onChange="changeCount()">
		  <%for(int i=1;i<=48;i++){ %>
		  <OPTION value="<%=i %>"><%=i %></OPTION>
		  <%} %>
		  </SELECT>
		  ��</td>
	      <td width="15%" align="right" class="td2">Ӧ�ɽ�</td>
	      <td width="50%" align="left" class="td1"> <html:text property="MonthCard/charge" styleClass="inputOA" size="10" />(����ң�Ԫ)</td>
	   </tr>
		<tr>
		  <td align="right" nowrap class="td2" >��ʼʹ��ʱ�䣺</td>
		  <td align="left" class="td1"><html:text property="MonthCard/StartTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"'  />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick="getDate()"></td>
	      <td align="right" class="td2">ֹͣʹ��ʱ�䣺</td>
	      <td align="left" class="td1"><html:text property="MonthCard/EndTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"' readonly="true"/></td>
	   </tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td colspan="3" class="td1">
			
			<logic:present property="Card/StateID">
				<logic:equal property="Card/StateID"	value="1">
				<input name="faka" type="button" class="button_02" value="����" onClick="doSubmit()"> 
				</logic:equal>
				<logic:notEqual property="Card/StateID" value="1">
				<input name="faka" type="button" class="button_02" value="����" disabled="true"> 
				</logic:notEqual>
			</logic:present> 
			<logic:notPresent property="Card/StateID">
				<input name="faka" type="button" class="button_02" value="����" disabled="true">
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
	var mNum=parseInt(document.usersForm.elements["MonthCard/MonthCount"].value);//��ȡҪ�ӵ�����
	TDate.setFullYear(yy,mm,dd);   
	TDate.setMonth(parseInt(TDate.getMonth().toString())+mNum);//����������
	//ate.setDate(parseInt(TDate.getDate().toString())+dNum);//����������
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