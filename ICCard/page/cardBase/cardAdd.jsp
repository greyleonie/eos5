<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>ע��IC��</title>
<script language="javascript">
			function ShowCardCoverNO(){
			cardForm.elements["Card/CardCoverNO"].disabled="";
			cardTable.rows[2].style.display="block";
			}
			
			function HideCardCoverNO(){
			cardForm.elements["Card/CardCoverNO"].disabled="ture";
			cardTable.rows[2].style.display="none";
			}
			
			function StartIssue(){
			_cardcount=document.all["Card/cardcount"].value;
   			if(trim(_cardcount)=="" ){
				alert("�������뿨����!");
  	      		document.all["Card/cardcount"].focus();
	 	   		return ;
    		} 
    	
    		if(isNaN(_cardcount) || parseFloat(_cardcount)!=parseInt(parseFloat(_cardcount)) || parseInt(_cardcount)<=0){
				alert("�뿨������������������");
				document.all["Card/cardcount"].focus();
				return;
			}		
    		
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
			count=_cardcount;
			totalcount=_cardcount;			
			GetCardID();
			}
			
			function GetCardID(){
			setTimeout("GetCardID();",100);
			if(count>0){
			id=cardcontrol.GetMulCardID();
			if(id>0 && oldid!=id){
			document.forms["cardForm"].elements["Card/CardIDes"].value=document.forms["cardForm"].elements["Card/CardIDes"].value+id+"\n";
			--count;
			oldid=id;
			if(count>0){
			document.all.stateinfo.innerHTML="���� <b>"+(count)+"</b> �ſ�δˢ";
			document.MIDIPlayer.Play();
			}
			else
			document.all.stateinfo.innerHTML="ˢ����ϣ����Ա����ˣ�";
			document.MIDIPlayer.Play();
			}
			}
			}

			function ClickSave()
			{
			cardForm["Card/cardcount"].value=totalcount-count;
			cardForm.submit();
			}
			
			function ClickRevert()
			{
			cardForm.reset();
			}
			
			function ClickClose()
			{
			window.close();
			}
</script>
</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0"
	onload="cardcontrol.Init(0)" onUnload="cardcontrol.Quit()">
<script language="JavaScript">
			var count=0,totalcount=0,id=0,oldid=0;
		</script>
<!-- ������ -->
<form method="post" action="ICCard.prCardBase.cardAddDO.do" name="cardForm">
<table width="101%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td width="642" class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;�������&gt;ע��IC��             </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


	<!-- ע�Ჽ��һ -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">����һ����д�뿨��Ϣ</td>
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
			<td width="12%" align="right" nowrap class="td2"><a href="/internet/ActiveX/card.cab" target="_blank">�뿨������</a></td>
		  <td width="88%" align="left" class="td1"><html:text property="Card/cardcount"
				styleClass="input" size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ͣ�</td>
			<td align="left" class="td1"><input type="radio" name="Card/CardTypeID" value="1"
				 checked="true" />���Կ� <input type="radio"
				name="Card/CardTypeID" value="2"  />ͨ�ÿ�</td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">�����ţ�</td>
			<td class="td1">
			<html:text property="Card/CardCoverNO"
				styleClass="input" size="30"  />(ֻ��д��ʼ��ţ���00120��DX00108�ȣ�ĩ5λ����������)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� �� �ѣ�</td>
			<td class="td1"><html:text property="Card/Cost" styleClass="input"
				size="30" value="20.0" />(����ң�Ԫ)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� ע��</td>
			<td class="td1"><html:text property="Card/Remark" styleClass="input"
				size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td class="td1"><html:button property="startButton" value="��ʼ�뿨" attributesText=' class="button_02" ' onclick="StartIssue()" /></td>
		</tr>
  </table>
	<br>

	<!-- ע�Ჽ��� -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�������ˢ����ȡ����</td>
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
			<td width="12%" align="right" nowrap class="td2">�����ţ�</td>
			<td width="88%" class="td1"><font color="#FF0000">
			<div id="stateinfo" style="input"></div>
			</font> <html:textarea property="Card/CardIDes"
				styleClass="input" rows="10" cols="25" readonly="true" />
		  </td>
		</tr>
		<tr>
			<td width="12%" class="td2" nowrap></td>
			<td class="td1"><html:button property="saveButton" value="�� ��"	onclick="ClickSave()" disabled="true" attributesText=' class="button_02" '/>
			<input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
			</td>
		</tr>
	</table>
</form>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab" name="cardcontrol"></OBJECT>
<object id=MIDIPlayer
	codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701
	type=application/x-oleobject height=0
	standby="?? Microsoft Windows Media Player ??..." width=0
	classid=CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95 name=wmplayer
	VIEWASTEXT>
	<param name="FileName" value="//internet//ActiveX//ding.wav">
	<param name="AutoStart" value="true">
	<param name="AutoRewind" value="-1">
	<param name="AnimationAtStart" value="true">
	<param name="ShowControls" value="false">
	<param name="ClickToPlay" value="false">
	<param name="EnableContextMenu" value="true">
	<param name="EnablePositionControls" value="false">
	<param name="Balance" value="0">
	<param name="ShowStatusBar" value="false">
	<param name="AutoSize" value="0">
	<embed type="application/x-mplayer2"
		pluginspage="http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/"
		filename src autostart="false" enablecontextmenu="false"
		clicktoplay="false" enablepositioncontrols="false" showcontrols="0"
		showstatusbar="1" showdisplay="0">
	</embed> </object>

</body>
</html>