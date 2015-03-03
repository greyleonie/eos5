<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prArchivePrefix.archivePrefixModifyDo.do">		
<html:hidden property="ArchivePrefix/CODE"/>

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;公文管理—&gt;公文前缀修改</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">创建人：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="ArchivePrefix/CREATEOR"/>
            <html:hidden property="ArchivePrefix/CREATEOR"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">类 型：</td>
            <td width="36%" class="td1">&nbsp;
            <logic:equal property="ArchivePrefix/REMARK" value="1">发文</logic:equal>
            <logic:equal property="ArchivePrefix/REMARK" value="2">收文</logic:equal>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">内 容：</td>
            <td width="36%" class="td1">&nbsp;
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
 