<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<script language="javascript">
<logic:present property="message">
alert('<bean:write  property="message"/>');
</logic:present>
			function getCardID(){
			var cardid;
			cardid=cardcontrol.GetCardID();
			if(cardid>0){
			opeForm.elements["cardid"].value=cardid;
			}
			}
		</script>
<body onload="cardcontrol.Init(0)" onunload="cardcontrol.Quit()">
<form method="post"  action="ICCard.prField.guestRoomBook2UpdateDo.do" name="opeForm" >

<html:hidden  property="Room/State"/>
<html:hidden  property="Room/RoomID"/>
<html:hidden  property="HousingLogs/HousingLogsID"/>
<html:hidden  property="Guest/GuestID"/>


<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 场地管理 -&gt; 客房出租  -&gt; 预订入住</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
      
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤一：填写住宿信息</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="70%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
	 <table width="98%" border="0" align="center" cellPadding="0" cellSpacing="1" bgcolor="#A2C4DC">
    <tbody>
      <tr align="center">
        <td colSpan="4" class="td_title">客房信息</td>
      </tr>
      <tr>
        <td  width="6%" align="right" class="td2">房号：</td>
        <td width="40%" class="td1"><html:text property="Room/RoomName" readonly="true"/></td>
        <td  width="6%" align="right" class="td2">床位：</td>
        <td class="td1"><html:text property="Room/SeatNum" readonly="true"/></td>
      </tr>
      <tr>
        <td  width="6%" align="right" class="td2">价格：</td>
        <td colSpan="3" class="td1"><html:text property="Room/Price1"   attributesText='class="input" size="20"  ValidateType="money"  Msg="价格格式不正确"'/>
        （人民币：元/天）</td>
      </tr>
    </tbody>
  </table>
  <br>
  <table width="98%" border="0" align="center" cellPadding="0" cellSpacing="1" bgcolor="#A2C4DC">
      <tr align="center">
        <td colSpan="4" class="td_title">宾客信息</td>
    </tr>
      <tr>
        <td  width="9%" align="right" class="td2">姓　　名：</td>
        <td  width="37%" class="td1"><html:text property="Guest/GuestName"  maxlength="100" attributesText='class="input" size="30"  ValidateType="notempty"  Msg="姓名不能为空" '/>  <span class="text_red">*</span></td>
        <td  width="9%" align="right" class="td2">性　　别：</td>
        <td  width="45%" class="td1"><dict:radio businTypeId="BNDICT_gender" property="Guest/Sex" modifiable="true" value="1"/></td>
      </tr>
      <tr>
        <td align="right" class="td2">籍　　贯：</td>
        <td class="td1"><html:text property="Guest/OriginalPlace" maxlength="20" attributesText='class="input" size="30"'/></td>
        <td align="right" class="td2">年　　龄：</td>
        <td class="td1"><html:text property="Guest/Age"  attributesText='class="input" size="30"  ValidateType="int"  Msg="年龄必须为数字"'/></td>
      </tr>
      <tr>
        <td  align="right" class="td2">职　　业：</td>
        <td  class="td1"><html:text property="Guest/Occupation"  maxlength="100" attributesText='class="input" size="30"  '/></td>
        <td  align="right" class="td2">工作单位：</td>
        <td  class="td1"><html:text property="Guest/WorkingOrgan"  maxlength="100" attributesText='class="input" size="30"  '/></td>
      </tr>
      <tr>
        <td  align="right" class="td2">户口地址：</td>
        <td  class="td1"><html:text property="Guest/RegisteredPlace"  maxlength="100" attributesText='class="input" size="30"  '/></td>
        <td  align="right" class="td2">从何处来：</td>
        <td  class="td1"><html:text property="Guest/ComingFromPlace"  maxlength="100" attributesText='class="input" size="30"  '/></td>
      </tr>
      <tr>
        <td   align="right" class="td2">证件名称：</td>
        <td   class="td1"><html:text property="Guest/Certificate"  maxlength="100" attributesText='class="input" size="30"  '/></td>
        <td   align="right" class="td2">证件号码：</td>
        <td   class="td1"><html:text property="Guest/CertificateNO"  maxlength="100" attributesText='class="input" size="30"  '/></td>
      </tr>
      <tr>
        <td   align="right" class="td2">来宿日期：</td>
        <td   class="td1"><html:text property="begintime" attributesText='class="input" size="30" ValidateType="notempty"  Msg="来宿日期不能为空" ' readonly="true"/>  <span class="text_red">*</span>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["begintime"],"yyyy-MM-dd")></td>
        <td   align="right" class="td2">退宿日期：</td>
        <td   class="td1"><html:text property="endtime" attributesText='class="input" size="30" ValidateType="notempty"  Msg="退宿日期不能为空"' readonly="true"/>  <span class="text_red">*</span>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["endtime"],"yyyy-MM-dd")></td>
      </tr>
         <tr>
       <td align="right" class="td2">预存金额： </td>
          <td class="td1" colspan="3" ><html:text property="HousingLogs/PreCost"   attributesText='class="input" size="10" ValidateType="money" Msg="预存金额必须为数字"'/>元</td>
      </tr>
  </table>
      
       <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤二：读取IC卡号</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="70%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="selectClassroomPane">
                <tr class="td_title"> 
                <td  width="8%"  class="td2" align="right"><input type="button" onClick="getCardID()"value="发卡" Class="button_02" /></td>
				<td width="92%" class="td1"><input readonly size="30" name="cardid"  ValidateType="notempty"  Msg="卡号不能为空，请发卡" > <span class="text_red">*</span></td>
                </tr>

				
              </table>        
      
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()"></td>
            </tr>
          </table>
     
          
          
          
          </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>

  </body>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
 function save(){
	var frm = document.forms[0];

	if (validater(frm)&& verifyDate()==true){
			frm .submit();
	}
 }
 

 
 
 //返回两个时间的天数:要求比较的时间的格式为：YYYY-MM-DD   
  function   better_time(strDateStart,strDateEnd){   
        var   strSeparator   =   "-";   //日期分隔符   
        var   strDateArrayStart;   
        var   strDateArrayEnd;   
        var   intDay   
        strDateArrayStart   =   strDateStart.split(strSeparator);   
        strDateArrayEnd   =   strDateEnd.split(strSeparator);   
        var   strDateS   =   new   Date(strDateArrayStart[0]   +   "/"   +   strDateArrayStart[1]   +   "/"   +   strDateArrayStart[2]);   
        var   strDateE   =   new   Date(strDateArrayEnd[0]   +   "/"   +   strDateArrayEnd[1]   +   "/"   +   strDateArrayEnd[2]);   
        intDay   =   (strDateS-strDateE)/(1000*3600*24)   
        return   intDay   
  }   
  
  
   function verifyDate(){
 	frm = document.forms[0]
 	var beginTime = frm["begintime"].value;
 	var endTime = frm["endtime"].value;
 	var currTime = getCurDateValue2();
 	var initDay = better_time(beginTime,endTime);
 	if(better_time(currTime,beginTime)>0){
 		alert("来宿日期必须大于或等于当前日期");
 		return false;
 	}else if(better_time(currTime,endTime)>0){
 		alert("退宿日期必须大于或等于当前日期");
 		return false;
 	
 	}else if(better_time(beginTime,endTime)>0){
 		alert("退宿日期必须大于或等于来宿日期");
 		return false;
 	
 	}else{
 		return true;
 	}
 
 }
  
  </script>
  <OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:00BCB426-4501-496F-B780-267302BE3BA3"
	codebase="/internet/ActiveX/card.cab" name="cardcontrol"> </OBJECT>
  