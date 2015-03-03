<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.workArrangeAddDo.do">
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
            <td class="text_wirte">首页—&gt;网络中心—&gt;中心工作日志—&gt;分派工作安排—&gt;工作安排新增</td>
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
            <html:text property="CenterWorkPlan/Summary" maxlength="50" attributesText='class="input" size="80" ValidateType="notempty" Msg="工作概要不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">工作地点：</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="CenterWorkPlan/Place" attributesText='class="input" size="80"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">工作内容：</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkPlan/Content" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">备注：</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkPlan/Remark" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
          <!--
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">安排时间：</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="WorkArrange/CALENDAR[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"'/>
			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WorkArrange/CALENDAR[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 	
            </td>
          </tr>-->
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">安排人员：</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkPlan/DirectorName" attributesText='class="input" cols="70" rows=3" readOnly="fcc"'/>
            <html:hidden property="CenterWorkPlan/Director"/><input name="Button" type="button" class="button_02" value="选 择" elname="CenterWorkPlan/Director,CenterWorkPlan/DirectorName" onClick="selectSysUser()"> 
		    </td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="发 送" onClick="save()">
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
 