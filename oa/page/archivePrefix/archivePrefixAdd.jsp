<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prArchivePrefix.archivePrefixAddDo.do">		


  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;公文管理—&gt;公文前缀新增</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="60%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="40%" align="right" class="td2">创建人：</td>
            <td width="60%" class="td1">&nbsp;
            <bean:write property="SessionEntity/userName"/>
            <input type="hidden" name="ArchivePrefix/CREATEOR" value="<bean:write property='SessionEntity/userName'/>">
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="40%" align="right" class="td2">类 型：</td>
            <td width="60%" class="td1">&nbsp;
            <select name="ArchivePrefix/REMARK" class="myselect" /><option value="1">发文</option>
			<option value="2">收文</option></select>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
          <td width="40%" align="right" class="td2">文号前缀名称：</td>
            <td width="60%" class="td1">&nbsp;
            <html:text property="ArchivePrefix/DESCRIPTION" size="20"/>
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
  	
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 