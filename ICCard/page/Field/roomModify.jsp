<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.roomModifyDo.do">
<logic:greaterThan property="count" value="1"><script> alert("�����Ѵ���");</script> </logic:greaterThan>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
              <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���ع���&gt;<span id="printTable">
              <logic:equal property="RoomTypeID" value="1">������Ϣ�޸�</logic:equal>
            <logic:equal property="RoomTypeID" value="2">�ͷ���Ϣ�޸�</logic:equal>
            <logic:equal property="RoomTypeID" value="3">��������Ϣ�޸�</logic:equal>
            <logic:equal property="RoomTypeID" value="4">����������Ϣ�޸�</logic:equal></span></td>
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
		<html:hidden property="Room/_order/col1/field"/>
		<html:hidden property="Room/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="Room/RoomTypeID"/>
		<html:hidden property="Room/RoomID"  />
		<input type="hidden" name="RoomTypeID"  value="<bean:write property="Room/RoomTypeID"/>" />
		<html:hidden property="viewType"  />
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">  
	    <logic:equal property="RoomTypeID" value="1"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">���������</td>
            <td class="td1"> <html:select property="Room/BuildingID"  attributesText=' ValidateType="notempty"  Msg="���������ﲻ��Ϊ��"'> 
              <html:option value="">--��ѡ��--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select><span class="text_red">*</span>
			 </td>
			 <td align="right" class="td2">����¥�㣺 </td>
          <td  class="td1" ><html:text property="Room/LayerNO" attributesText='class="input" size="20"  ValidateType="notempty,int"  Msg="����¥�㲻��Ϊ��;����¥�����������"'/> <span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�������ƣ� </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/> <span class="text_red">*</span>
           </td>
            <td align="right" class="td2">��λ���� </td>
          <td class="td1" ><html:text property="Room/SeatNum" attributesText='class="input" size="20" ValidateType="int,notempty" Msg="��λ������Ϊ����;��λ������Ϊ��"'/> <span class="text_red">*</span>
           </td>

        </tr>
        <tr> 
          <td align="right" class="td2">���ڻ�ID��</td>
         <td class="td1" colspan="3"><html:text property="Room/POTID" attributesText='class="input" size="20"'/> </td>
         
       
        </tr>
        <tr> 
          <td align="right" class="td2">���쿪�յ��ۣ� </td>
          <td class="td1"><html:text property="Room/Price1" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����" '/></td>
          <td align="right" class="td2">�����޿յ��ۣ�</td>
           <td class="td1"><html:text property="Room/Price2" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����"'/></td></tr>
           <tr> 
          <td align="right" class="td2">���Ͽ��յ��ۣ� </td>
          <td class="td1"><html:text property="Room/Price3" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����"'/></td>
          <td align="right" class="td2">�����޿յ��ۣ�</td>
           <td class="td1"><html:text property="Room/Price4" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����"'/></td></tr>
      </table>
      </logic:equal>
      
      
       <logic:equal property="RoomTypeID" value="2"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">���������</td>
            <td class="td1"> <html:select property="Room/BuildingID"  attributesText=' ValidateType="notempty"  Msg="���������ﲻ��Ϊ��"'> 
              <html:option value="">--��ѡ��--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select><span class="text_red">*</span>
			 </td>
			 <td align="right" class="td2">����¥�㣺 </td>
          <td  class="td1" ><html:text property="Room/LayerNO" attributesText='class="input" size="20"  ValidateType="notempty,int"  Msg="����¥�㲻��Ϊ��;����¥�����������"'/> <span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�������ƣ� </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/> <span class="text_red">*</span>
           </td>
            <td align="right" class="td2">��λ���� </td>
          <td class="td1" ><html:text property="Room/SeatNum" attributesText='class="input" size="20" ValidateType="int" Msg="��λ������Ϊ����"'/> 
           </td>

        </tr>
        <tr> 
        
          <td align="right" class="td2">�绰�� </td>
          <td class="td1" colspan="3"><html:text property="Room/Tel" attributesText='class="input" size="20" ValidateType="int" Msg="�绰����Ϊ����"'/> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">���쿪�յ��ۣ� </td>
          <td class="td1"><html:text property="Room/Price1" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����" '/></td>
          <td align="right" class="td2">�����޿յ��ۣ�</td>
           <td class="td1"><html:text property="Room/Price2" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����"'/></td></tr>
           <tr> 
          <td align="right" class="td2">���Ͽ��յ��ۣ� </td>
          <td class="td1"><html:text property="Room/Price3" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����"'/></td>
          <td align="right" class="td2">�����޿յ��ۣ�</td>
           <td class="td1"><html:text property="Room/Price4" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����"'/></td></tr>
      </table>
      </logic:equal>
       
       <logic:equal property="RoomTypeID" value="3"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">���������</td>
            <td class="td1"> <html:select property="Room/BuildingID"  attributesText=' ValidateType="notempty"  Msg="���������ﲻ��Ϊ��"'> 
              <html:option value="">--��ѡ��--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select><span class="text_red">*</span>
			 </td>
			 <td align="right" class="td2">����¥�㣺 </td>
          <td  class="td1" ><html:text property="Room/LayerNO" attributesText='class="input" size="20"  ValidateType="notempty,int"  Msg="����¥�㲻��Ϊ��;����¥�����������"'/> <span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">���������ƣ� </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/> <span class="text_red">*</span>
           </td>
            <td align="right" class="td2">��λ���� </td>
          <td class="td1" ><html:text property="Room/SeatNum" attributesText='class="input" size="20" ValidateType="int" Msg="��λ������Ϊ����"'/> 
           </td>
        </tr>
                <tr> 
          <td align="right" class="td2">�绰���룺</td>
         <td class="td1" colspan="3"><html:text property="Room/Tel" attributesText='class="input" size="20"'/> </td>
          
       
        </tr>
      </table>
      </logic:equal>
      
      
       <logic:equal property="RoomTypeID" value="4"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr> 
          <td align="right" class="td2">�������ƣ� </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"' /> <span class="text_red">*</span>
          <html:hidden property="Room/LayerNO"/>
          <html:hidden property="Room/BuildingID"/>
          </td>
        </tr>
        
        <tr>
          <td align="right" class="td2">�绰�� </td>
          <td class="td1"><html:text property="Room/Tel" attributesText='class="input" size="20" ValidateType="int" Msg="�绰����Ϊ����"'/> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�۸� </td>
          <td class="td1"><html:text property="Room/Price1" attributesText='class="input" size="20" ValidateType="money" Msg="�۸����Ϊ����" '/></td>
         </tr>
      </table></logic:equal>
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
            </tr>
          </table>
      
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
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
  	// ���ص���ѯҳ��
function goBack() {
		var frm = document.forms[0];
		var viewType = frm.viewType.value;
		var RoomTypeID = frm["RoomTypeID"].value;
		if(viewType == 1){
		window.location.href = "ICCard.prField.roomAll.do?RoomTypeID="+RoomTypeID;
		}else{
		window.location.href = "ICCard.prField.buildingList.do?RoomTypeID="+RoomTypeID;
		}
	}
  
  </script>
  