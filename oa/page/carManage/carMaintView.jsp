<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;����ά��(��)��¼�鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">���ƺţ�</td>
            <td width="34%" class="td1">&nbsp;<bean:write property="CarMaint/CarNO"/>
            </td>
            <td width="16%" align="right" class="td2">�����ˣ�</td>
            <td width="34%" class="td1">
			&nbsp;<bean:write property="CarMaint/Charger"  />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ά��(��)����</td>
            <td class="td1">&nbsp;<bean:write property="CarMaint/MaintLevel"  />
        	</td>
            <td align="right" class="td2">ά��(��)ʱ�䣺</td>
            <td class="td1">&nbsp;<bean:write property="CarMaint/MaintTime" />
            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ά��(��)�̣�</td>
            <td class="td1">&nbsp;<bean:write property="CarMaint/Mainter"/></td>
            <td align="right" class="td2">����(Ԫ)��</td>
            <td class="td1">&nbsp;<bean:write property="CarMaint/MaintCost"/>
              </td>
          </tr>
          
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ע��</td>
            <td colspan="3" class="td1">
			&nbsp;<bean:write property="CarMaint/Remark" />
			</td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
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

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  </script>
 