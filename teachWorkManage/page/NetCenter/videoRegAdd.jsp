<%@include file="/internet/common.jsp"%>
<body>
<form method="post"  action="teachWorkManage.prNetCenter.videoRegAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;¼�����ϵǼ�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      
      
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		 <html:hidden property="VideoRegister/PlanType"/>
		 <html:hidden property="VideoRegister/PlanID" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��¼ʱ�䣺</td>
            <td class="td1"><html:text  property="VideoRegister/RecordTime" attributesText='class="input" size="20" '/> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;Ŀ��</td>
            <td class="td1"><html:text  property="VideoRegister/Title" maxlength="200"  attributesText='class="input" size="60" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�����ˣ�</td>
            <td class="td1"><html:text  property="VideoRegister/Speaker" maxlength="20"  attributesText='class="input" size="20" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��λ��</td>
            <td class="td1"><html:text  property="VideoRegister/Org" maxlength="50"  attributesText='class="input" size="60" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ְ��</td>
            <td class="td1"><html:text  property="VideoRegister/Post" maxlength="50"  attributesText='class="input" size="60" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��¼�ˣ�</td>
            <td class="td1"><input class="input" size="30" name="VideoRegister/Recorder"  value="<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>"></td>
          </tr>
           <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�������ͣ�</td>
            <td class="td1">            <html:select property="VideoRegister/DataType">
							<html:option value="">--��ѡ��--</html:option>
							<html:option value="¼���">¼���</html:option>
							<html:option value="DV��">DV��</html:option>
							<html:option value="��Ƶ�ļ�">��Ƶ�ļ�</html:option>
							<html:option value="DVD">DVD</html:option>
							<html:option value="VCD">VCD</html:option>
							<html:option value="����">����</html:option>
			</html:select></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">������Դ��</td>
            <td class="td1">            <html:select property="VideoRegister/Source">
							<html:option value="">--��ѡ��--</html:option>
							<html:option value="��¼">��¼</html:option>
							<html:option value="���뵳У">���뵳У</html:option>
							<html:option value="ʡ��У">ʡ��У</html:option>
							<html:option value="����">����</html:option>
			</html:select></td>
          </tr>
         <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�����ţ�</td>
            <td class="td1"><html:text  property="VideoRegister/DocumentNO" maxlength="30"  attributesText='class="input" size="30" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���ȣ�</td>
            <td class="td1"><html:text  property="VideoRegister/Length"   attributesText='class="input" size="30" ValidateType="int",Msg="���ȱ���Ϊ����" ' />����</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">¼�ƺã�</td>
            <td class="td1"><html:radio value="1" property="VideoRegister/IsOk" checked="true"/>
            ��
            <html:radio value="0" property="VideoRegister/IsOk"/>
              ��
            </td>
          </tr>
          

          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
            <td class="td1"><textarea class="finput" name="VideoRegister/Remarks"  cols="80" rows="4"></textarea></td>
          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                 <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
    <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }

  </script>