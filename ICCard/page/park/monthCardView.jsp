<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">一卡通—&gt;停车管理—&gt;月保卡充值记录查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr >
            <td width="20%" align="right" class="td2">卡编号：</td>
            <td width="80%" colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/CardID"/>			</td>
          </tr>
          
          <tr  >
            <td align="right" class="td2">持卡人：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/operatorName"/>
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">车牌号：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/CarNO"/>
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">充卡月数：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/MonthCount"/>
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">开始使用时间：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/StartTime"/>
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">停止使用时间：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/EndTime"/>
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">交纳费用：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/BusinessMoney"/>
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">车辆说明：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryMonthCard/CarRemark"/>
            </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
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
  
  </script>
 