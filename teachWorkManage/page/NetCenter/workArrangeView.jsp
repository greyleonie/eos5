<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.workArrangeView.do">
		<html:hidden property="CenterWorkPlan/_order/col1/field"/>
		<html:hidden property="CenterWorkPlan/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;网络中心—&gt;中心工作日志—&gt;分派工作安排—&gt;工作安排查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="86%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">工作概要：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Summary"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">工作地点：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Place"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">工作内容：</td>
            <td width="87%" class="td1">&nbsp;
             <bean:write property="CenterWorkPlan/Content"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">备注：</td>
            <td width="87%" class="td1">&nbsp;
             <bean:write property="CenterWorkPlan/Remark"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">安排时间：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/WorkDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">安排人员：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/DirectorName"/>
            </td>
          </tr>
          <logic:present property="CenterWorkPlan/HaveReadIDs">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="58" class="td2">已查看人员：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/HaveReadIDsName"/>
            </td>
          </tr>
          </logic:present>
          <logic:present property="CenterWorkPlan/Reply">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="94" class="td2">回 复：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Reply"/>
            </td>
          </tr>
          </logic:present>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
            <td height="49" align="center">
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
 

 