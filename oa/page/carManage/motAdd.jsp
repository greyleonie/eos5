<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.motAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆保险年检新增</td>
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
            <td width="34%" class="td1">&nbsp;<html:select  property="MOT/CarNO" attributesText='class="input"  ValidateType="notempty" Msg="车牌号不能为空"'>
             <html:options property="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO" labelProperty="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO"></html:options>
            </html:select>
            	<span class="text_red">*</span>            </td>
            <td width="16%" align="right" class="td2">责任人：</td>
            <td width="34%" class="td1">
			&nbsp;<html:text property="MOT/Charger"  styleClass="input"  size="30"  maxlength="20"/>
              <html:hidden  property="MOT/ChargerID"  />
              <input name="Submit2232" elname="MOT/ChargerID,MOT/Charger" type="button" class="button_02" value="选择" onclick="selectDriver()">			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">保险年检类型：</td>
            <td class="td1">&nbsp;<html:text property="MOT/MOTType" attributesText='class="input" size="30"  ValidateType="notempty" Msg="保险年检类型不能为空"' maxlength="20"/>
        	<span class="text_red">*</span>        	</td>
            <td align="right" class="td2">保险年检时间：</td>
            <td class="td1">&nbsp;<html:text property="MOT/MOTTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["MOT/MOTTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>			</td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">费用(元)：</td>
            <td class="td1">&nbsp;<html:text property="MOT/Cost" attributesText='class="input" size="30"  ValidateType="numeric" Msg="费用必须为数字"' maxlength="20"/>
            </td>
            <td align="right" class="td2">&nbsp;</td>
            <td class="td1">&nbsp;</td>
          </tr>
          
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备注：</td>
            <td colspan="3" class="td1">
			&nbsp;<html:textarea property="MOT/Remark" cols="50" rows="8" styleClass="input" attributesText='maxlength="200"  ValidateType="maxlength" Msg="备注必须小于200字"' />			</td>
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
  
 
  </script>
 