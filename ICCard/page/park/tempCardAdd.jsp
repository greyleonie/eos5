<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>��ͣ����ʱ��</title>


<!-- ��ȡ������ -->
<script language="javascript">
			function getCardID(){
			var cardid;
			cardid=cardcontrol.GetCardID();
			if(cardid>0){
			cardForm.action="/ICCard.prIssueCard.greedCardAdd.do?Card/CardID="+cardid;
			cardForm.submit();
			}
			}
			
			function doCheckClock(){
			var sum=usersForm.elements["Card/CardLastSum"].value;
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
			}else{
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
<!-- ������ -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;ͣ������&gt;��ʱ������ </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>

<!-- ע�Ჽ��һ -->
<form name="cardForm" action="/ICCard.prIssueCard.greedCardAdd.do" method="POST">

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
		<td width="88%"  class="td1">���IC�����ڷ������ϣ����������Ĳ�ѯ��ť����˿���Ϣ��ȷ������</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2"></td>
		<td width="88%"  class="td1">
		<input name="queryinfo" type="button" class="button_03" value="��ѯ����Ϣ" onClick="getCardID()"> 
		
		<font color="#FF0000"> <bean:write  property="info" />
		</font></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�����ţ�</td>
		<td width="88%"  class="td1" align="left"><html:text property="Card/CardCoverNO"  name="QueryCard/CardCoverNO"  styleClass="input" size="30" readonly="true" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�� �� �ͣ�</td>
		<td width="88%"  class="td1" align="left">
			<input type="text" Class="input" size="30" readonly="true" name="QueryCard/CardTypeID" value='<dict:write  property="Card/CardTypeID" businTypeId="dx_cardTypeID"/>'>
		
		</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�� ״ ̬��</td>
		<td width="88%"  class="td1" align="left">
		<input type="text" Class="input" size="30" readonly="true" name="QueryCard/StateID" value='<dict:write  property="Card/StateID" businTypeId="dx_cardStateID"/>'>
		</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">ע��ʱ�䣺</td>
		<td width="88%"  class="td1" align="left"><html:text property="Card/RegisterTime" name="QueryCard/RegisterTime" styleClass="input" size="30" readonly="true" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�� �� �ѣ�</td>
		<td width="88%"  class="td1" align="left"><html:text property="Card/Cost"  name="QueryCard/Cost" styleClass="input" size="30"  />
		(����ң�Ԫ)</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�� ע��</td>
		<td width="88%"  class="td1" align="left"><html:text property="Card/Remark" name="QueryCard/Remark" styleClass="input" size="30" readonly="true" /></td>
	</tr>
</table>
</form>

<!-- ע�Ჽ��� -->
<html:form action="/ICCard.prIssueCard.greedCardAddDO.do" method="POST" name="usersForm">
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
			<td width="12%" align="right" nowrap class="td2">�� �� �ˣ�</td>
			<td width="88%" align="left" class="td1"><html:text property="Card/UserName" styleClass="input" size="30" value="��ʱ��"/> (������ֿ��˵���������)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �룺</td>
			<td width="88%" align="left" class="td1"><input name="Card/password" type="password"
				Class="input" value="888888" size="30" /> 
			  (��������λ�����ֿ����룬Ĭ��6��8)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">ȷ�����룺</td>
			<td width="88%" align="left" class="td1"><input name="Card/passwordconfirm" type="password"
				Class="input" value="888888" size="30" /> (���ٴ����뿨���룬����ȷ��)</td>
		</tr>
	
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td width="88%" class="td1">
			<html:hidden property="Card/CardLastSum" value="0" />
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