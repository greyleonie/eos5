<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.xjImportDo.do">
  <html:hidden name="Student/ClassID" property="QueryStudent/ClassID/criteria/value"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧ������&gt;����ѧԱ��Ϣ</td>
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
            <td width="15%" align="right" class="td2">�༶��</td>
            <td width="85%" class="td1">
            <bean:write property="Student/ClassName"/>
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">�����ļ���</td>
            <td class="td1"><input type="file" name="ImportFile" class="input" size="60"/>
              <span class="text_red">*</span></td>
          </tr>
          <!--
          <tr>
            <td align="right" class="td2">�Ƿ�ͬ����½�ʻ���</td>
            <td class="td1"><input type="radio" name="syn" value="1" />��&nbsp;&nbsp;<input type="radio" name="syn" value="0" checked="checked" />��
              <span class="text_red">*</span></td>
          </tr>
          -->
          <input type="hidden" name="syn" value="0" checked="checked" />
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="������"  onclick="save()" >
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
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	var className = "<bean:write property='Student/ClassName'/>";
  	var fileName = frm.ImportFile.value;
  	if(fileName.indexOf(className)<0){
        alert("���ϴ����ļ���������ѡ��İ༶����ͬ��");
        return;
      }
	if(validater(frm)) {
		if(window.confirm("���ݵ������Ȼ��ʼ�����ݿ⣬ȷ��Ҫ����ѧԱ������")){
      		frm.submit();
      }
	}
	
	
	
  
  }
 
  </script>
 