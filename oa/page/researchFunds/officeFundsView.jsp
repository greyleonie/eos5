<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchFunds.officeFundsAddDo.do">		
		<html:hidden property="KetiLx/_order/col1/field"/>
		<html:hidden property="KetiLx/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;科研处经费管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            
            <td width="16%" align="right" class="td2">课题名称：</td>
            <td class="td1" colspan="3">&nbsp;
            <bean:write property="KetiLx/name"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">课题序号：</td>
            <td width="33%" class="td1">&nbsp;
            <bean:write property="KetiLx/xuhao"/></td>
			<td width="16%" align="right" class="td2">课题代码：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="KetiLx/daima"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">拨款总额：</td>
            <td class="td1" colspan="3">&nbsp;
			<bean:write property="KetiLx/zonge"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">拨款金额：</td>
            <td width="33%" class="td1">&nbsp;
            <bean:write property="KetiLx/jine1"/></td>
			<td width="16%" align="right" class="td2" >拨款日期：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="KetiLx/riqi1" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">拨款金额：</td>
            <td width="33%" class="td1">&nbsp;
            <bean:write property="KetiLx/jine2"/></td>
			<td width="16%" align="right" class="td2">拨款日期：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="KetiLx/riqi2" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">拨款金额：</td>
            <td width="33%" class="td1">&nbsp;
            <bean:write property="KetiLx/jine3"/></td>
			<td width="16%" align="right" class="td2">拨款日期：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="KetiLx/riqi3" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">拨款金额：</td>
            <td width="33%" class="td1">&nbsp;
            <bean:write property="KetiLx/jine4"/></td>
			<td width="16%" align="right" class="td2">拨款日期：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="KetiLx/riqi4" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">拨款金额：</td>
            <td width="33%" class="td1">&nbsp;
            <bean:write property="KetiLx/jine5"/></td>
			<td width="16%" align="right" class="td2">拨款日期：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="KetiLx/riqi5" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">负责人：</td>
            <td class="td1" colspan="3">&nbsp;
            <bean:write property="KetiLx/fuzeren" formatClass="username" formatType="userid"/>
            <td>
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
 

 