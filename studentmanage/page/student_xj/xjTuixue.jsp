<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.xjTuixueDo.do">
  <html:hidden property="Student/StudentID"/>
  <html:hidden property="QueryStudent/ClassID/criteria/value"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学籍管理—&gt;学员退学</td>
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
          <tr  >
            <td width="17%" align="right" class="td2">班　　级：</td>
            <td width="83%" class="td1">&nbsp;<bean:write property="Class/ClassName"/>
				
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">姓　　名：</td>
            <td class="td1">&nbsp;<bean:write property="Student/operatorname"/></td>
          </tr>
          <tr  >
            <td align="right" class="td2">退学时间：</td>
            <td class="td1">&nbsp;<html:text property="Student/QuitTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30" ValidateType="notempty" Msg="退学时间不能为空"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Student/QuitTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
          </tr>
          <tr  >
            <td align="right" class="td2">退学原因：</td>
            <td class="td1">&nbsp;<html:textarea property="Student/QuitReason" rows="5" cols="60"></html:textarea></td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="submit" class="button_02" value="保 存">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  </script>
  <%
 
  %>