<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.driverModifyDO.do">
  <html:hidden property="DriverInfo/DriverID"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;司机修改</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="80%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">司机姓名：</td>
            <td width="70%" class="td1">&nbsp;<html:text property="DriverInfo/DriverName" attributesText='class="input" size="30" ValidateType="notempty" Msg="姓名不能为空"'/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">准驾车型：</td>
            <td class="td1">&nbsp;<html:text property="DriverInfo/VehType" attributesText='class="input" size="30" '/></td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">驾驶证号：</td>
            <td class="td1">&nbsp;<html:text property="DriverInfo/DrivCardNO" attributesText='class="input" size="30" ValidateType="numeric" Msg="驾驶证号不正确"'/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">出生日期：</td>
            <td class="td1">&nbsp;<html:text property="DriverInfo/BirthDay[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DriverInfo/BirthDay[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
            <td class="td1">&nbsp;<dict:radio businTypeId="BNDICT_gender" property="DriverInfo/Sex" modifiable="true" value="1"/>         </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  </script>
 