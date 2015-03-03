<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.carInfoAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆新增</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">车牌号：</td>
            <td width="34%" class="td1">&nbsp;<html:text property="CAR_CARINFO/CARNO" attributesText='class="input" size="30" ValidateType="notempty" Msg="车牌号不能为空"' maxlength="20"/>
            	<span class="text_red">*</span>
            </td>
            <td width="16%" align="right" class="td2">厂牌型号：</td>
            <td width="34%" class="td1">&nbsp;<html:text property="CAR_CARINFO/MANUNO" attributesText='class="input" size="30" ValidateType="notempty" Msg="厂牌型号不能为空"' maxlength="20"/>
            	<span class="text_red">*</span>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">车架号：</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/FRAMENO" attributesText='class="input" size="30" ' maxlength="30"/></td>
            <td align="right" class="td2">车辆类型：</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/CARTYPE" attributesText='class="input" size="30" '  maxlength="20"/> </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">购买价格：</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/PRICE" attributesText='class="input" size="30"  ValidateType="numeric" Msg="价格必须为数字"'/> 元(人民币)</td>
            <td align="right" class="td2">驾驶员：</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/DRIVER"  styleClass="input"  size="30"  maxlength="20"/>
              <html:hidden  property="CAR_CARINFO/DRIVERID"  />
              <input name="Submit2232" elname="CAR_CARINFO/DRIVERID,CAR_CARINFO/DRIVER" type="button" class="button_02" value="选择" onclick="selectDriver()">
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">发动机号码：</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/ENGINENO" attributesText='class="input" size="30" '/></td>
            <td align="right" class="td2">购置日期：</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/BUYDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAR_CARINFO/BUYDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>			</td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">当前状态：</td>
            <td colspan="3" class="td1">&nbsp;<dict:select businTypeId="dx_CARSTATE" property="CAR_CARINFO/STATE" />         </td>
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
 