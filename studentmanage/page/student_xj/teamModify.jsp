<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.teamModifyDo.do">
  <html:hidden property="Team/TeamID"/>
  <html:hidden property="Team/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧ������&gt;�����޸�</td>
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
            <bean:write property="Class/ClassName"/>
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">������</td>
            <td class="td1">
             <html:select property="Team/TeamName">
               <html:option value="��һ��">��һ��</html:option>
               <html:option value="�ڶ���">�ڶ���</html:option>
               <html:option value="������">������</html:option>
               <html:option value="������">������</html:option>
               <html:option value="������">������</html:option>
               <html:option value="������">������</html:option>
               <html:option value="������">������</html:option>
               <html:option value="�ڰ���">�ڰ���</html:option>
               <html:option value="�ھ���">�ھ���</html:option>
               <html:option value="��ʮ��">��ʮ��</html:option>
                <html:option value="��ʮһ��">��ʮһ��</html:option>
               <html:option value="��ʮ����">��ʮ����</html:option>
                <html:option value="��ʮ����">��ʮ����</html:option>
                 <html:option value="��ʮ����">��ʮ����</html:option>
                  <html:option value="��ʮ����">��ʮ����</html:option>
            </html:select>  <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�����ң�</td>
            <td class="td1">
            <html:select property="Team/RoomID"  attributesText='id="printTable"'> 
              <html:options property="list[@type='Room']/Room/RoomID" labelProperty="list[@type='Room']/Room/RoomName"/> 
              </html:select>
            </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="submit" class="button_02" value="�� ��">
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
  	
	if(validater(frm)) frm.submit();
  
  }
 
  </script>
 