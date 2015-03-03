<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆出行记录查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr>
			    <td height="25" align="center" nowrap class="td1">申请人：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/operatorName"/>			    </td>
			    <td align="center" nowrap class="td1">申请部门：</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/orgName"/></td>
		      </tr>
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">目的地：</td>
				<td width="30%" nowrap class="td1"> &nbsp;<bean:write property="QueryUseCarRequest/Dest" />				</td>
				<td width="10%" align="center" nowrap class="td1">用车人数： </td>
				<td width="20%" nowrap class="td1"> &nbsp;<bean:write property="QueryUseCarRequest/Numb" />				</td>
				<td width="10%" align="center" nowrap class="td1">出车时间：</td>
				<td width="20%" nowrap class="td1"> &nbsp;<bean:write property="QueryUseCarRequest/OutTime[@pattern='yyyy-MM-dd']"/>			</td>
			  </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">事&nbsp;&nbsp;由：</td>
				<td colspan="5" nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/Subject"   /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">驾驶员：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/Driver"/></td>
		        <td align="center" nowrap class="td1">车牌号：</td>
		        <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/CarNO"/></td>
		        <td align="center" nowrap class="td1">派车人：</td>
		        <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/Senter"/></td>
	          </tr>
			  <tr>
			    <td height="25" colspan="6" align="left" nowrap class="td1">
					&nbsp;出车前里程表数：<bean:write property="QueryUseCarRequest/Odometer1"/>
					&nbsp;&nbsp;出车后里程表数：	<bean:write property="QueryUseCarRequest/Odometer2"/>
					&nbsp;&nbsp;行驶公里：<bean:write property="QueryUseCarRequest/Kms"/>
					&nbsp;&nbsp;回场时间：<bean:write property="QueryUseCarRequest/BackTime[@pattern='yyyy-MM-dd']"/>			    			</td>
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
 
 
 