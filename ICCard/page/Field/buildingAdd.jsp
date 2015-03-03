<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.buildingAddDo.do">
<logic:greaterThan property="count" value="0"><script> alert("楼宇名已存在");</script> </logic:greaterThan>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;楼宇信息新增</td>
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
		<html:hidden property="Building/_order/col1/field"/>
		<html:hidden property="Building/_order/col1/asc" />
		<html:hidden property="viewType" />
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">  
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">

        <tr> 
          <td align="right" class="td2">楼宇名： </td>
          <td class="td1" ><html:text property="Building/BuildingName"   maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="楼宇名不能为空"'/> <span class="text_red">*</span></td> 
           </tr>
        <tr> 
          <td align="right" class="td2">层数： </td>
          <td class="td1" ><html:text property="Building/LayerNum" attributesText='class="input" size="10" ValidateType="int" Msg="层数必须为数字"'/></td>
        </tr>
        <tr> 
          <td align="right" class="td2">房间数： </td>
          <td class="td1" ><html:text property="Building/RoomNum" attributesText='class="input" size="10" ValidateType="int" Msg="房间数必须为数字"'/></td>
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
		window.location.href = "ICCard.prField.buildingList.do";
	}

  </script>
  