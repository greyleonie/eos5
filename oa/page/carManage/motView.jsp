<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="MOT/MOTID"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆保险年检查看</td>
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
            <td width="34%" class="td1">&nbsp;<bean:write property="MOT/Charger"  />           </td>
            <td width="16%" align="right" class="td2">责任人：</td>
            <td width="34%" class="td1">
			&nbsp;<bean:write property="MOT/Charger"  />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">保险年检类型：</td>
            <td class="td1">&nbsp;<bean:write property="MOT/MOTType" />
        	</td>
            <td align="right" class="td2">保险年检时间：</td>
            <td class="td1">&nbsp;<bean:write property="MOT/MOTTime[@pattern='yyyy-MM-dd']" />
            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">费用(元)：</td>
            <td class="td1">&nbsp;<bean:write property="MOT/Cost" />
            </td>
            <td align="right" class="td2">&nbsp;</td>
            <td class="td1">&nbsp;</td>
          </tr>
          
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备注：</td>
            <td colspan="3" class="td1">
			&nbsp;<bean:write property="MOT/Remark"  />			</td>
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
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
 
  </script>
 