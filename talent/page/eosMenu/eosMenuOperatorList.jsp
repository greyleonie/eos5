<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("��ʶ�Ѵ��ڣ����������룡");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.prEosMenu.eosMenulist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ϵͳ����&gt;�˵�����&gt;<bean:write property="SYSRESOPERATION/MENULABEL"/>��������</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.prEosMenu.eosMenuOperatorList.do">
		<input type="hidden" name="addaction" value="">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="talent.prEosMenu.eosMenuOperatorDelete.do">
		<input type="hidden" name="viewaction" value="">
		<input type="hidden" name="modifytoSave" value="talent.prEosMenu.eosMenuOperatorModifySave.do">
		<html:hidden property="TEOSMenu/_order/col1/field"/>
		<html:hidden property="TEOSMenu/_order/col1/asc" />
		<html:hidden property="TEOSMenu/parentsID/criteria/value" />
		<html:hidden property="TEOSMenu/parentName" />
		<html:hidden property="TEOSMenu/parentLevel" />
		
		
		<html:hidden property="SYSRESOPERATION/_order/col1/field"/>
		<html:hidden property="SYSRESOPERATION/_order/col1/asc" />
		<html:hidden property="SYSRESOPERATION/MENUID/criteria/value" />
		<html:hidden property="SYSRESOPERATION/MENULABEL"/>
		
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<INPUT value="like" type="hidden" name="SYSRESOPERATION/RESOPNAME/criteria/operator">
		<INPUT value="center" type="hidden" name="SYSRESOPERATION/RESOPNAME/criteria/likeRule">
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				<a id="keytitle">��������</a>�� 
			    <html:text property="SYSRESOPERATION/RESOPNAME/criteria/value" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
              <input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
			  <input name="modifyandsave" type="button" class="button_02" value="�޸ı���" onClick="modifySave('listdetail')">
			  <input name="modifyandsave" type="button" class="button_02" value="�����ϼ�" onClick="returnParentParent()">
				
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
		  <tr>
			      <td width="521" valign="top"> 
					  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
						  <tr class="td_title"> 
							<td width="12%" align="center" nowrap> <input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
							</td>
							<td width="29%" align="center" nowrap id="SYSRESOPERATION.RESOPNAME" onClick="talentsort()">��������</td>
							<td width="59%" align="center" nowrap id="SYSRESOPERATION.DESCRIPTION" onClick="talentsort()">��ע</td>
						  </tr>
						  <%
							 int count=0;
							 String trClass = "result_content"; 
				  
						%>
						  <logic:iterate id="resultset" property="list[@type='teosmenuoperator']"> 
						  <%
							 
								if(count%2==0)
									trClass = "td1";
								else
									trClass = "td2";
								count++;
						   %>
						  <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="SYSRESOPERATION/RESOPID"/>','false')"> 
						  <td align="center"> <logic:present  id="resultset" property="SYSRESOPERATION/RESOPID"> 
							<html:checkbox id="resultset" name="list[@name='update']/SYSRESOPERATION/RESOPID" property="SYSRESOPERATION/RESOPID" indexed="true" /> 
							</logic:present> </td>
						  <td nowrap onClick="toEditable()">&nbsp;<bean:write id="resultset" property="SYSRESOPERATION/RESOPNAME"/></td>
						  <td nowrap align="center" onClick="toEditable()"><bean:write id="resultset" property="SYSRESOPERATION/DESCRIPTION" /></td>
						  </tr>
						  
						  </logic:iterate> 
					</table>
					<table width="100%" border="0">
					  <tr>
						<td>
							<script>
								PageCond(document.forms[0]);
						  	</script>
						</td>
					  </tr>
					</table>

				</td>
			<td width="10" nowrap>&nbsp;</td>
			<td width="349" align="right" valign="top">
				<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="operatorAdd">
				  <tr> 
					<td colspan="2" align="center" class="td1"><span style='font-size:12px;color:#000000'><b style="color:#ff0000"><bean:write property="SYSRESOPERATION/MENULABEL"/></b>������������ʶ��<bean:write property="SYSRESOPERATION/MENUID/criteria/value"/>_��ͷ</span></td>
					
				  </tr>
				  <tr> 
					<td width="28%" align="right" nowrap class="td2">�������ƣ� </td>
					<td width="72%" class="td1"><html:text property="SYSRESOPERATIONTEMP/RESOPNAME" maxlength="30" attributesText='class="input" size="30" '/> 
					  <span class="text_red">*</span> </td>
				  </tr>
				  <tr> 
					<td width="28%" align="right" nowrap class="td2">������ʶ�� </td>
					<td width="72%" class="td1"><html:text property="SYSRESOPERATIONTEMP/RESOPID" maxlength="60" attributesText='class="input" size="30" '/> 
					  <span class="text_red">*</span></td>
				  </tr>
				  <tr> 
					<td width="28%" align="right" nowrap class="td2">����˵���� </td>
					<td width="72%" class="td1"><html:text property="SYSRESOPERATIONTEMP/DESCRIPTION" maxlength="100" attributesText='class="input" size="30" '/> 
					</td>
				  </tr>
				  <tr> 
					<td height="30" colspan="2" align="center" class="td1"><input type="hidden" name="SYSRESOPERATIONTEMP/MENUID" value=""><input name="modifyandsave" type="button" class="button_02" value="�� ��" onClick="save()"></td>
					
				  </tr>
				</table>
				

				</td>
			  </tr>
			</table>

		
          
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
	loadOrderImg(document.forms[0],'SYSRESOPERATION');
</script>

<script>
function save() {
var frm = document.forms[0];
	if(validateOther(frm)) {
		var start = '<bean:write property="SYSRESOPERATION/MENUID/criteria/value"/>_';
		pattern = new RegExp("^(" + start + ")")
		
		//if(!pattern.test(frm.elements["SYSRESOPERATIONTEMP/RESOPID"].value)){
		//	alert("�˵���ʶҪ��" + start + "��ͷ");
		//	frm.elements["SYSRESOPERATIONTEMP/RESOPID"].focus();
		//	return;
		//}
	
		frm.action = "talent.prEosMenu.eosMenuOperatorAddDO.do";
	  	frm.submit();	
	} 

}

function validateOther(frm) {
	if(frm.elements["SYSRESOPERATIONTEMP/RESOPNAME"].value == "") {
		alert("�������Ʋ���Ϊ��");
		return false;
	}
	if(frm.elements["SYSRESOPERATIONTEMP/RESOPID"].value == "") {
		alert("������ʶ����Ϊ��");
		return false;
	}
	frm.elements["SYSRESOPERATIONTEMP/MENUID"].value = frm.elements["SYSRESOPERATION/MENUID/criteria/value"].value;
	if(frm.elements["SYSRESOPERATIONTEMP/MENUID"].value == "") {
		alert("�ò����˵���ʶ");
		return false;
	}
	return true;
}

function returnParentParent() {
	var frm = document.forms[0];
	frm.action = "talent.prEosMenu.eosMenuReturnParent.do";
	frm.submit();
}
</script>

