<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>ע����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<script language="JavaScript">
		function Query(){
			if(curcardForm.elements["QueryCard/CardCoverNO"].value.length==0){
				alert("�����Ų���Ϊ�գ�");
			}
			else  if(curcardForm.elements["QueryCard/password"].value.length==0){
				alert("���벻��Ϊ�գ�");
			}
			else{
				curcardForm.submit();
			}
		}
			
		function goBack(){
			window.navigate("ICCard.prDestroyCard.destroyList.do");
		}
		</script>
</head>

<body>
<!-- ������ -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;������Ϣ��&gt;�����Ǽ�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>

<logic:equal property="Card/StateID" value="2">
<html:form name="destroyForm" action="ICCard.prPerson.destroyCardDO.do" method="POST">
	<!-- ������������Ǽ� -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�����Ǽ�</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td> </td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td height="2" colspan="2"> </td>
            </tr>
  </table>

	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
		<td width="6%" align="right" nowrap class="td2">�û����룺</td>
	    <td width="88%" class="td1" align="left">
	    <input type="password" name="DestroyCard/password" size="30" value="" class="input"  ValidateType="notempty" Msg="���벻��Ϊ��"/>
	    <font color="red">�����������½������ͬ��</font>
	    </td>
	</tr>
	    <tr>
			<td width="12%" align="right" nowrap class="td2">״̬��</td>
			<td width="88%" class="td1" align="left"><font color="red">ʹ����</font></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">����ԭ��</td>
			<td width="88%" class="td1" align="left">
			<input type="radio" name="DestroyCard/ReasonID" value="2" checked="true" />ʧ ������ʧ�Ŀ���&nbsp;&nbsp;
			<input type="radio" name="DestroyCard/ReasonID" value="1" />�� �����𻵵Ŀ���
			</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td width="88%" class="td1">
			
				<input type="button" name="tosubmit"  class="button_02" value="�ύ" onClick="save()"/>
				
			
		  
		  </td>
		</tr>
  </table>
</html:form>
</logic:equal>
<logic:equal property="Card/StateID" value="4">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�����Ǽ�</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;�˿��ѹ�ʧ�������ٹ�ʧ��</font></td>
            </tr>
  </table>
</logic:equal>
<logic:equal property="Card/StateID" value="3">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�����Ǽ�</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;�˿����������Ǽǣ��������������Ǽǣ�</font></td>
            </tr>
  </table>
</logic:equal>
</html>
<script type="text/javascript">
 function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
</script>