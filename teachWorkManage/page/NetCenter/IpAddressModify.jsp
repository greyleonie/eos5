<%@ include file="/internet/common.jsp"%>
<body>
<form method="post"  action="teachWorkManage.prNetCenter.IpAddressModifyDo.do" name="opeForm">
<INPUT type="hidden" name="IPADDRESS/RESERVE1">
<INPUT type="hidden" name="IPADDRESS/RESERVE2">
<html:hidden property="IPADDRESS/ID"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;�޸�IP��ַ</td>
          </tr>
        </table>
        </td>
       <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
	   	<tr>
      		<td height="8"> </td>
    	</tr>
    	<tr>
      		<td class="text">
      		
      	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">������</td>
            <td class="td1">
            	<html:text property="IPADDRESS/USERNAME"  maxlength="50"  attributesText='class="input" size="60"'  />
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���ţ�</td>
            <td class="td1">
            	<html:text property="IPADDRESS/DEPARTMENT"  maxlength="50"  attributesText='class="input" size="60"'  />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���������</td>
            <td class="td1">
            	<html:text property="IPADDRESS/COMPUTERNAME"  maxlength="50"  attributesText='class="input" size="60"'  />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">MAC��ַ��</td>
            <td class="td1">
            	<html:text property="IPADDRESS/MACADDRESS"  maxlength="50"  attributesText='class="input" size="60"'  />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">IP��ַ��</td>
            <td class="td1">
            	<html:text property="IPADDRESS/IPADDRESS"  maxlength="50"  attributesText='class="input" size="60"'  />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�豸λ�ã�</td>
            <td class="td1">
            	<html:text property="IPADDRESS/EQUIPMENTADDRESS"  maxlength="50"  attributesText='class="input" size="60"'  />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�豸���ͣ�</td>
            <td class="td1">
            	<html:text property="IPADDRESS/EQUIPMENTTYPE"  maxlength="50"  attributesText='class="input" size="60"'  />
            </td>
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
 
function doClearSelect(){
			document.opeForm["DistanceTeaching/ClassRooms"].value = "";
			document.opeForm.ClassRoomName.value = "";
			}
			
  </script>