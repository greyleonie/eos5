<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>�½��ļ���</title>
</head>
<body >
<form method="post" enctype="multipart/form-data" action="oa.prFolder.folderAddDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�����ļ���</td>
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
            <td width="17%" height="30" align="right" class="td2">�ļ������ƣ�</td>
            <td width="83%" class="td1">&nbsp;
            <html:text property="ShareFolder/FileName" maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="�ļ������Ʋ���Ϊ��"'/>
            <span class="text_red">*</span>
            <html:hidden name="ShareFolder/ParentFileID" property="fid"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="17%" height="90" align="right" class="td2">�ļ���˵����</td>
            <td width="83%" class="td1">&nbsp;
            <html:textarea property="ShareFolder/Description" attributesText='class="input" cols="41" rows="5"'/>
            </td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:window.parent.close()">
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
 