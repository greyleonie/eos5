<%@include file="/internet/common.jsp"%>
<body>
<form method="post" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲���Ϣ����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="Textbook/TextbookID" /> 
		
		
		
	  </td>
    </tr>
  </table>
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="14%" align="right" nowrap class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
            <td width="35%" class="td1"><bean:write property="Textbook/Title"/></td>
            <td width="12%" align="right" nowrap class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ� </td>
            <td width="39%" class="td1"><bean:write property="Textbook/Author"/>
			</td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�� �� �磺 </td>
            <td class="td1"><bean:write  property="Textbook/Publisher"/>
            </td>
            <td align="right" nowrap class="td2">����ʱ�䣺</td>  
              <td class="td1"><bean:write property="Textbook/PublishTime[@pattern='yyyy-MM-dd']"/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ� </td>
            <td class="td1"><bean:write property="Textbook/Price"/></td>
            <td align="right" nowrap class="td2">״&nbsp;&nbsp;&nbsp;&nbsp;̬�� </td>
            <td class="td1">
            <logic:equal property="Textbook/State" value="1">��</logic:equal>
          <logic:equal property="Textbook/State" value="0">��</logic:equal>
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)