<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>�½��ļ�</title>
</head>
<!--body onblur="this.focus();"-->
<body>
<form method="post" enctype="multipart/form-data" action="oa.prFolder.fileAddDo.do">
  		<input type="hidden" name="filepath" value="ShareFolder"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="ShareFolder">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F"> 
		
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�����ļ��С�&gt;�����ļ�</td>
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
            <td width="17%" height="30" align="right" class="td2">�ϴ��ļ���</td>
            <td width="83%" class="td1">&nbsp;
            <html:hidden name="ShareFolder/ParentFileID" property="fid"/>
            <input type="file" name="file" class='input' size='30' ValidateType="notempty" Msg="�ϴ��ĵ�����Ϊ��">
            <span class="text_red">*</span>��С��25M��</td>
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
  	var filenames = frm.file.value;
  	var fname = filenames.split("\\");  
  	var filename = fname[fname.length-1]; 
  	if(filename.indexOf(".")<0) {
  	  alert("���ļ�Ϊ�������ϴ����ļ���");
  	  return;
  	}
	if(validater(frm)) frm.submit();
  
  }
  

  </script>
 