<%@include file="/internet/common.jsp"%>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">供应商信息</span>查看</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CAPT_PROVIDER/_order/col1/field"/>
		<html:hidden property="CAPT_PROVIDER/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr>
     <td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td valign="top" class="text" >
		   <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
            <tr>
              <td class="td2" width="13%" align="right">供应商名称：</td>
              <td class="td1" colspan="3"><bean:write property="CAPT_PROVIDER/PROVNAME" />
              </td>
              </tr>
            <tr>
              <td class="td2" align="right">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/LINKMAN" /></td>
              <td class="td2" align="right">联系电话：</td>
              <td class="td1">
              <bean:write property="CAPT_PROVIDER/TEL"/></td>
            </tr>
           <tr>
              <td class="td2" align="right">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
              <td class="td1" width="45%"><bean:write property="CAPT_PROVIDER/ADDRESS"/></td>
              <td class="td2" width="14%" align="right">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
              <td class="td1" width="28%">
             <bean:write  property="CAPT_PROVIDER/ZIPCODE"   />
              </td>
            </tr>
            <tr>
              <td class="td2" align="right">E-mail：</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/E_MAIL" /></td>
              <td class="td2" align="right">传真号码：</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/FAX" /></td>
            </tr>
           <tr>
              <td class="td2" align="right">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                  <td class="td1" colspan="3"><bean:write property="CAPT_PROVIDER/REMARK" />
                  </td>
            </tr>
          </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
               </td>
            </tr>
          </table>
         </td>
      </tr>
</table>
         </td>
      </tr>
</table>
    </form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="供应商信息">
<input type="hidden" name="xmlfcc">
</form>