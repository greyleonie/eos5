<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/pageComponent/resources/scripts/editor.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/datacell.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/dataset.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>

<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">



<form method="post"  action="ICCard.prField.receptionAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;结帐管理</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="tblReceptionChangeRec/_order/col1/field"/>
		<html:hidden property="tblReceptionChangeRec/_order/col1/asc" />
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"> 
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">结帐管理</td>
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
      
      
       
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	  

   <tr>
    <td class="td2" align="right"  width="20%"> 客户 ：</td>
    <td class="td1"  width="80%">	  
   <richclient:selectText textId="text1" buttonId="bt1" nameField="roleName" filterFi eld="roleID" >

       <richclient:optionTable tableId="optionsTable2" action="ROL E.biz.ROLE_B_queryRole" xpaths="list" width="320" height="100">onclick="setValue">

           <TABLE id="optionsTable2" class="RC_DATACELL_OPTIONTABLE">

       <tbody>

           <tr>

              <TD width="160" name="roleID"></TD>

              <TD width="160" name="roleName"></TD>

           </tr>

       </tbody>

       </TABLE>   

       </richclient:optionTable>

       <input type="text" id="text1" />

       <input type="button" id="bt1"/>

</richclient:selectText>

<script>

  function setValue(entity)

    {

     var str=entity.getProperty("roleId");

    }

</script></td>
 </tr>  

  <tr>
    <td class="td2" align="right"  width="20%"> 押金 ：</td>
    <td class="td1"  width="80%"><html:text property="tblReceptionChangeRec/PreGuestMoney"   attributesText='class="input" size="20"  ValidateType="money" Msg="押金必须为数字"'/>元</td>
 </tr>
  <tr>
    <td class="td2" align="right">住宿费：</td>
    <td class="td1"> <html:text property="tblReceptionChangeRec/HousingCheck"   attributesText='class="input" size="20"  ValidateType="money" Msg="支票必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 会议费 ：</td>
    <td class="td1" ><html:text property="tblReceptionChangeRec/MeetingCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="会议费必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 电话费、传真 ：</td>
    <td class="td1" ><html:text property="tblReceptionChangeRec/TelecomCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="电话费传真必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 其他杂费 ：</td>
    <td class="td1" ><html:text property="tblReceptionChangeRec/OtherCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="其他杂费必须为数字"'/>元</td>
  </tr>
 
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
	// 返回到查询页面
	function goBack() {
		window.location.href = "ICCard.prField.receptionList.do";
	}

  </script>
  