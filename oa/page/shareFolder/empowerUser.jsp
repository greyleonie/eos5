<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>��Ȩ�ļ���</title>
</head>

<body>
<form method="post" enctype="multipart/form-data" action="oa.prFolder.folderEmpowerDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�����ļ��С�&gt;�ļ�����Ȩ</td>
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
            <td width="17%" height="30" align="right" class="td2">�ļ������ƣ�</td>
            <td width="83%" class="td1">&nbsp;
              <html:hidden property="ShareFolder/FileID"/>
              <bean:write property="ShareFolder/FileName"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="17%" height="30" align="right" class="td2">ѡ���û���</td>
            <td width="83%" class="td1">&nbsp;
               <input type="checkbox" onclick="doCheck()" name="chkall"/>�����û�&nbsp;
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)" id="userlist">
           <td width="17%" height="90" align="right" class="td2">�û��б�</td>
           <td width="83%" class="td1">&nbsp;
            <html:textarea property="ShareFolder/EmpowerIDsName" attributesText='class="input" cols="40" rows=5" readOnly="fcc"'/>
            <html:hidden property="ShareFolder/EmpowerIDs"/><input name="Button" type="button" class="button_02" value="ѡ ��" elname="ShareFolder/EmpowerIDs,ShareFolder/EmpowerIDsName" onClick="selectSysUser()"> 
           </td>
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
<logic:equal property="ShareFolder/EmpowerType" value="0">
  document.forms[0].chkall.checked = "checked";
  userlist.style.display="none";
</logic:equal>
</script>
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
function doCheck(){ 
   var frm = document.forms[0];
   var oldname=frm.elements["ShareFolder/EmpowerIDs"].value;
   if(document.all.chkall.checked)
   {

	 frm.elements["ShareFolder/EmpowerIDs"].value ="all";

	 userlist.style.display="none";
	}
	else {
	 frm.elements["ShareFolder/EmpowerIDs"].value = "";

	 userlist.style.display="";
	}

}
  </script>
 