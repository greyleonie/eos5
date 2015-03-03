<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.receptionModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;交接班修改</td>
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
		<html:hidden property="tblReceptionChangeRec/ID" />
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
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">修改交接班</td>
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
    <td  class="td2" align="right" >登记人：</td>
    <td  class="td1">
    <bean:write property="tblReceptionChangeRec/Author"/></td>
    <td class="td2" align="right"> 班次 ：</td>
    <td class="td1" colspan="2">
    	
    	<logic:equal property="tblReceptionChangeRec/Range" value="0">
    		早班
    	</logic:equal>
    	<logic:equal property="tblReceptionChangeRec/Range"value="1">
    		中班
    	</logic:equal>
    	<logic:equal property="tblReceptionChangeRec/Range"  value="2">
    		夜班
    	</logic:equal>
    </td>

    <td  class="td2" align="right" >时间：</td>
    <td class="td1" >
    	
    	<bean:write property="tblReceptionChangeRec/CreatedTime"  formatType="yyyy-MM-dd HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
    </td>
  </tr>

  <tr>
    <td class="td2" align="right" rowspan="7"> 现金收支 </td>
    <td class="td2" align="right" rowspan="2"> 押金 ：</td>
    <td class="td2" align="right" > 散客</td>
    <td class="td1" colspan="4" ><html:text property="tblReceptionChangeRec/PreGuestNum"   attributesText='class="input" size="20"  ValidateType="int" Msg="份数必须为整数"'/>份&nbsp;
    <html:text property="tblReceptionChangeRec/PreGuestMoney"   attributesText='class="input" size="20"  ValidateType="money" Msg="押金必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 学员</td>
	<td class="td1" colspan="4" ><html:text property="tblReceptionChangeRec/PreStuNum"   attributesText='class="input" size="20"  ValidateType="int" Msg="份数必须为整数"'/>份&nbsp;
	<html:text property="tblReceptionChangeRec/PreStuMoney"   attributesText='class="input" size="20"  ValidateType="money" Msg="押金必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right" rowspan="2">住宿费：</td>
    <td class="td2" align="right">支票</td>
    <td class="td1"> <html:text property="tblReceptionChangeRec/HousingCheck"   attributesText='class="input" size="20"  ValidateType="money" Msg="支票必须为数字"'/>元</td>
    <td  rowspan="2" class="td2" align="right">交款</td>
    <td class="td2" align="right">支票</td>
    <td class="td1"><html:text property="tblReceptionChangeRec/SubmitCheck"   attributesText='class="input" size="20"  ValidateType="money" Msg="支票必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right">现金</td>
    <td class="td1"><html:text property="tblReceptionChangeRec/HousingCash"   attributesText='class="input" size="20"  ValidateType="money" Msg="现金必须为数字"'/>元</td>
    <td class="td2" align="right">现金</td>
    <td class="td1"><html:text property="tblReceptionChangeRec/SubmitCash"   attributesText='class="input" size="20"  ValidateType="money" Msg="现金必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 会议费 ：</td>
    <td class="td1" colspan="5"><html:text property="tblReceptionChangeRec/MeetingCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="会议费必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 电话费、传真 ：</td>
    <td class="td1" colspan="5"><html:text property="tblReceptionChangeRec/TelecomCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="电话费传真必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 其他杂费 ：</td>
    <td class="td1" colspan="5"><html:text property="tblReceptionChangeRec/OtherCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="其他杂费必须为数字"'/>元</td>
  </tr>
  <tr>
    <td class="td2" align="right"> 报修房号及项目 ：</td>
    <td class="td1" colspan="6"><html:textarea property="tblReceptionChangeRec/WaitFixItem" cols="80" rows="4"/></td>
  </tr>
  <tr>
    <td class="td2" align="right"> 来访登记 ：</td>
    <td class="td1" colspan="6"><html:textarea property="tblReceptionChangeRec/VisitItem" cols="80" rows="4"/></td>
  </tr>
  <tr>
    <td class="td2" align="right"> 特别事项务注 ：</td>
    <td class="td1" colspan="6"><html:textarea property="tblReceptionChangeRec/SpecEvent" cols="80" rows="4"/></td>
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
  