<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>������</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="oa.prFolder.renameDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�����ļ��С�&gt;������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="22%" height="30" align="right" class="td2">ԭ<logic:equal property="type" value="0">�ļ���</logic:equal><logic:equal property="type" value="1">�ļ�</logic:equal>���ƣ�</td>
            <td width="78%" class="td1">&nbsp;
            <html:hidden name="fid" property="ShareFolder/FileID"/>
            <html:hidden property="ShareFolder/FileID"/>
            <html:hidden property="type"/>
            <html:hidden name="OldFileName" property="ShareFolder/FileName"/>
            <html:hidden property="ShareFolder/FilePath"/>
            <bean:write property="ShareFolder/FileName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td  height="30" align="right" class="td2">��<logic:equal property="type" value="0">�ļ���</logic:equal><logic:equal property="type" value="1">�ļ�</logic:equal>���ƣ�</td>
            <td  class="td1">&nbsp;
            <html:text name="NewFileName" property="ShareFolder/FileName" maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="���Ʋ���Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:window.close()">
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
  </body>
 </html>
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  

  </script>
 