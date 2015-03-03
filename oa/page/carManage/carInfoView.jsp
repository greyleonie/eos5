<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆信息查看</td>
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
            <td width="34%" class="td1">&nbsp;<bean:write property="CAR_CARINFO/CARNO" /></td>
            <td width="16%" align="right" class="td2">厂牌型号：</td>
            <td width="34%" class="td1">&nbsp;<bean:write property="CAR_CARINFO/MANUNO"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">车架号：</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/FRAMENO" /></td>
            <td align="right" class="td2">车辆类型：</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/CARTYPE" /> </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">购买价格：</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/PRICE" /> 元(人民币)</td>
            <td align="right" class="td2">驾驶员：</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/DRIVER"  />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">发动机号码：</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/ENGINENO" /></td>
            <td align="right" class="td2">购置日期：</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/BUYDATE[@pattern='yyyy-MM-dd']" />
            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">当前状态：</td>
            <td colspan="3" class="td1">&nbsp;<dict:write businTypeId="dx_CARSTATE" property="CAR_CARINFO/STATE" />         </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              
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
 
 
 