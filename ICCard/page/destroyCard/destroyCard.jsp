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
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;��ע����&gt;�����Ǽ�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>


<form name="curcardForm" method="POST"><!-- ����һ����ѯ�̿���Ϣ -->
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">����һ����ѯ����Ϣ</td>
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
		<td width="12%" align="right" nowrap class="td2">����˵����</td>
		<td width="88%" class="td1">��׼ȷ��д�����źͳֿ��˵��û����룬Ȼ���ѯ����Ϣ��
		
		</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�����ţ�</td>
	  <td width="88%" class="td1" align="left">
	 
	  <html:text  property="QueryCard/CardCoverNO"
			styleClass="input" size="30" />(���磺DX00048��00256�ȣ�ע�����ִ�Сд)</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�û����룺</td>
	  <td width="88%" class="td1" align="left"><input type="password" name="QueryCard/password" size="30" value="" class="input" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2"></td>
	  <td width="88%" class="td1">
	  <html:button property="startButton" value="��ѯ" onclick="Query()" styleClass="button_02"/>
	  &nbsp;
		<qx:talentButton type="button" property="selectSt" value="ѡ��ѧԱ" styleClass="button_02" onclick="selectStudent()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_SElSTU"/>
		<qx:talentButton type="button"  property="selectTe" value="ѡ��̹�" styleClass="button_02" onclick="selectTeacher()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_SElTEA"/>
	  <FONT color="RED"><bean:write property="info"/></FONT>
	  </td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">�� �� �ˣ�</td>
	  <td width="88%" class="td1" align="left"><html:text  property="QueryCard/operatorName"
			styleClass="input" size="30" readonly="true" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">����ʱ�䣺</td>
	  <td width="88%" class="td1" align="left"><html:text  property="QueryCard/TimeOfIssueCard"
			styleClass="input" size="30" readonly="true" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">������</td>
		<td width="88%" class="td1" align="left"><logic:present  property="QueryCard/CardLastSum">
			<input type="text" name="QueryCard/CardLastSumExt" Class="input" size="30"
				readonly="true"
				value="<bean:write  property="QueryCard/CardLastSum"/>  (����ܲ����������)" />
		</logic:present> <logic:notPresent 
			property="QueryCard/CardLastSum">
			<input type="text" name="QueryCard/CardLastSumExt" Class="input" size="30"
				readonly="true" value="" />
	  </logic:notPresent> (����ң�Ԫ)</td>
	</tr>
</table>
</form>


<html:form name="destroyForm" action="ICCard.prDestroyCard.destroyCardDO.do" method="POST">
	<!-- ������������Ǽ� -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">������������Ǽ�</td>
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
			<td width="12%" align="right" nowrap class="td2">����˵����</td>
			<td width="88%" class="td1">ȷ����Ϣ�������ѡ������ԭ���ύ��</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">����ԭ��</td>
			<td width="88%" class="td1" align="left"><input type="radio" name="DestroyCard/ReasonID" value="2"
				checked="true" />ʧ �� <input type="radio" name="DestroyCard/ReasonID" value="1" />��
		  ��</td>
		</tr>
		
		<html:hidden  property="QueryCard/CardID"  name="DestroyCard/CardID"/>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td width="88%" class="td1">
			<logic:present  property="QueryCard/InnerCardID">
				<input type="submit" name="tosubmit"  class="button_02" value="�ύ"/>
				
			</logic:present> 
			<logic:notPresent 
				property="QueryCard/InnerCardID">
				<input type="submit"  name="tosubmit" class="button_02" value="�ύ" disabled="disabled"/>
		  </logic:notPresent>
		  &nbsp;&nbsp;
		  <input name="button" type="button" class="button_02" onClick="goBack()" value="�� ��"/>
		  </td>
		</tr>
  </table>
</html:form>
<br>
</html>
<script>
	function selectStudent(){
		curcardForm.reset();
		destroyForm.tosubmit.disabled="disabled";
		window.open("ICCard.prDestroyCard.selectStudent.do","","scrollbars=yes,height=450,width=600,top=100,left=200");
	}
	function selectTeacher(){
		curcardForm.reset();
		destroyForm.tosubmit.disabled="disabled";
		window.open("ICCard.prDestroyCard.selectTeacher.do","","scrollbars=yes,height=450,width=600,top=100,left=200");
	}

</script>