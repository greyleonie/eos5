<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.remoteTeachImportDo.do">
  <html:hidden name="Student/ClassID" property="QueryStudent/ClassID/criteria/value"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;Զ�̽�ѧ¼�ư��ŵ���</td>
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
          
         
          <tr  >
            <td align="right" class="td2">�����ļ���</td>
            <td class="td1"><input type="file" name="ImportFile" class="input" size="60"/>
              <span class="text_red">*</span></td>
          </tr>
          
          
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
	if(validater(frm)) {
		//if(window.confirm("���ݵ������Ȼ��ʼ�����ݿ⣬ȷ��Ҫ����Զ�̽�ѧ������")){
		var obj=document.getElementsByName("ImportFile");
      	  if(obj.value!=""){	
      		frm.submit();
      		}else{
      		 alert("��ѡ���ļ���");
      		 return;
      		}
      //}
	}
	
	
	
  
  }
 
  </script>
 