<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>注册IC卡</title>
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
				alert("请输入入卡数量!");
  	      		document.all["Card/cardcount"].focus();
	 	   		return ;
    		} 
    	
    		if(isNaN(_cardcount) || parseFloat(_cardcount)!=parseInt(parseFloat(_cardcount)) || parseInt(_cardcount)<=0){
				alert("入卡数量必须是正整数！");
				document.all["Card/cardcount"].focus();
				return;
			}		
    		
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
			document.all.stateinfo.innerHTML="还有 <b>"+(count)+"</b> 张卡未刷";
			document.MIDIPlayer.Play();
			}
			else
			document.all.stateinfo.innerHTML="刷卡完毕，可以保存了！";
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
<!-- 导航条 -->
<form method="post" action="ICCard.prCardBase.cardAddDO.do" name="cardForm">
<table width="101%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td width="642" class="text_wirte">首页—&gt;一卡通—&gt;卡库管理—&gt;注册IC卡             </td>
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


	<!-- 注册步骤一 -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤一：填写入卡信息</td>
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
			<td width="12%" align="right" nowrap class="td2"><a href="/internet/ActiveX/card.cab" target="_blank">入卡数量：</a></td>
		  <td width="88%" align="left" class="td1"><html:text property="Card/cardcount"
				styleClass="input" size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">卡 类 型：</td>
			<td align="left" class="td1"><input type="radio" name="Card/CardTypeID" value="1"
				 checked="true" />个性卡 <input type="radio"
				name="Card/CardTypeID" value="2"  />通用卡</td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">卡面编号：</td>
			<td class="td1">
			<html:text property="Card/CardCoverNO"
				styleClass="input" size="30"  />(只填写起始编号，如00120、DX00108等，末5位必须是整数)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">工 本 费：</td>
			<td class="td1"><html:text property="Card/Cost" styleClass="input"
				size="30" value="20.0" />(人民币：元)</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">备 注：</td>
			<td class="td1"><html:text property="Card/Remark" styleClass="input"
				size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td class="td1"><html:button property="startButton" value="开始入卡" attributesText=' class="button_02" ' onclick="StartIssue()" /></td>
		</tr>
  </table>
	<br>

	<!-- 注册步骤二 -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤二：刷卡读取卡号</td>
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
			<td width="12%" align="right" nowrap class="td2">物理卡号：</td>
			<td width="88%" class="td1"><font color="#FF0000">
			<div id="stateinfo" style="input"></div>
			</font> <html:textarea property="Card/CardIDes"
				styleClass="input" rows="10" cols="25" readonly="true" />
		  </td>
		</tr>
		<tr>
			<td width="12%" class="td2" nowrap></td>
			<td class="td1"><html:button property="saveButton" value="保 存"	onclick="ClickSave()" disabled="true" attributesText=' class="button_02" '/>
			<input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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