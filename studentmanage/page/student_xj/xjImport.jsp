<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.xjImportDo.do">
  <html:hidden name="Student/ClassID" property="QueryStudent/ClassID/criteria/value"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学籍管理—&gt;导入学员信息</td>
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
            <td width="15%" align="right" class="td2">班级：</td>
            <td width="85%" class="td1">
            <bean:write property="Student/ClassName"/>
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">导入文件：</td>
            <td class="td1"><input type="file" name="ImportFile" class="input" size="60"/>
              <span class="text_red">*</span></td>
          </tr>
          <!--
          <tr>
            <td align="right" class="td2">是否同步登陆帐户：</td>
            <td class="td1"><input type="radio" name="syn" value="1" />是&nbsp;&nbsp;<input type="radio" name="syn" value="0" checked="checked" />否
              <span class="text_red">*</span></td>
          </tr>
          -->
          <input type="hidden" name="syn" value="0" checked="checked" />
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="导　入"  onclick="save()" >
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
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	var className = "<bean:write property='Student/ClassName'/>";
  	var fileName = frm.ImportFile.value;
  	if(fileName.indexOf(className)<0){
        alert("您上传的文件名须与您选择的班级名相同！");
        return;
      }
	if(validater(frm)) {
		if(window.confirm("数据导入首先会初始化数据库，确定要导入学员数据吗？")){
      		frm.submit();
      }
	}
	
	
	
  
  }
 
  </script>
 