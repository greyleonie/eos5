<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>新建文件</title>
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
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;共享文件夹—&gt;新增文件</td>
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
            <td width="17%" height="30" align="right" class="td2">上传文件：</td>
            <td width="83%" class="td1">&nbsp;
            <html:hidden name="ShareFolder/ParentFileID" property="fid"/>
            <input type="file" name="file" class='input' size='30' ValidateType="notempty" Msg="上传文档不能为空">
            <span class="text_red">*</span>（小于25M）</td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="javascript:window.parent.close()">
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
  	  alert("该文件为不允许上传的文件！");
  	  return;
  	}
	if(validater(frm)) frm.submit();
  
  }
  

  </script>
 