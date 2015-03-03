<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.prNotify.notifyAddDo.do">
  <html:hidden property="QueryClassNotify/ClassID/criteria/value" name="ClassNotify/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;班级通知—&gt;通知新增</td>
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
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">班 级：</td>
            <td width="85" colspan="3" class="td1">&nbsp;
            <bean:write property="ClassNotify/ClassName"/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">发布时间：</td>
            <td class="td1">&nbsp;
            <html:text property="ClassNotify/PublishTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"  ValidateType="notempty" Msg="发布时间不能为空" onfocus="textValidate()"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassNotify/PublishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
            <td align="right" class="td2">结束时间：</td>
            <td class="td1">&nbsp;
            <html:text property="ClassNotify/endTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"  ValidateType="notempty" Msg="结束时间不能为空" onfocus="textValidate()"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassNotify/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">通知内容：</td>
            <td colspan="3" class="td1">&nbsp;
			<html:textarea property="ClassNotify/Content" rows="8" size="80"  attributesText='class="input"  ValidateType="notempty" Msg="内容不能为空" onfocus="textValidate()" maxlength="1000"'/>
			</td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
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
  	var createtime=frm.elements["ClassNotify/PublishTime[@pattern='yyyy-MM-dd']"].value;
  	var endtime=frm.elements["ClassNotify/endTime[@pattern='yyyy-MM-dd']"].value;
  	if(endtime<createtime) 
  	{
  		alert('结束时间必须大于发布时间');
  		return ;
  	}
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 