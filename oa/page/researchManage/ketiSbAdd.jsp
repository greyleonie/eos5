<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.ketiSbAddDo.do">
  		<input type="hidden" name="filepath" value="KetiSb"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="KetiSb">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F"> 
		
		<html:hidden property="KetiSb/_order/col1/field"/>
		<html:hidden property="KetiSb/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="type" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;<logic:equal property="type" value="sb">�����걨</logic:equal><logic:equal property="type" value="bj">�ɹ��걨</logic:equal></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="74%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <html:hidden name="KetiSb/ShenBaoriqi[@pattern='yyyy-MM-dd']" property="curDate"/>
          <tr  onClick="changeTRBgColor(this)">
            <td width="34%" align="right" class="td2">�������ƣ�</td>
            <td width="66%" class="td1">&nbsp;
            <html:text property="KetiSb/KetiName" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
         
		  <tr  onClick="changeTRBgColor(this)">
            <td width="34%" align="right" class="td2">�걨�ˣ�</td>
            <td width="66%" class="td1">&nbsp;
            <input type="text" name="KetiSb/Sbr" value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>' maxlength="50" class="input" size="30" ValidateType="notempty" Msg="�걨�˲���Ϊ��"/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="34%" align="right" class="td2">���ڲ��ţ�</td>
            <td width="66%" class="td1">&nbsp;
            <html:text name="KetiSb/SbrDepartment" property="SessionEntity/orgName" maxlength="50" attributesText='class="input" size="30"'/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="34%" align="right" class="td2">�ϴ��ĵ���</td>
            <td width="66%" class="td1">&nbsp;
            <table width="100%" id="fjtable">
            &nbsp;&nbsp;<input type="file" name="Content" class='input' size='30' ValidateType="notempty" Msg="�ϴ��ĵ�����Ϊ��">
            <span class="text_red">*</span>&nbsp;<input name="Button" type="button" class="button_02" value="��Ӹ���" onClick="insertFile();">
            </table>&nbsp;</td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
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
var i=0;
  function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "&nbsp;<input  type='file' name='Content' class='input' size='30'  ValidateType='notempty' Msg='�ϴ��ĵ�����Ϊ��'>&nbsp;<img src='/internet/images/attachdelete.gif' alt='ɾ��' align='absmiddle' style='cursor:hand' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
  }
  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 