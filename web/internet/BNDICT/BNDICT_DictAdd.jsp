<%@ include file="/internet/hciHead.jsp" %>

<div id="param">
   <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
   <link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>
<script language="JavaScript" src="/internet/scripts/checkForm.js"></script>
<script language="JavaScript" src="/internet/scripts/check.js"></script>
<body>
<form name="frmEdit" method="POST" action="BNDICT.pr_automata.BNDICT_P_DictAddSubmit.do">

	  <html:hidden property="BNDICT_V_Dictionary/businTypeID" />
	  <html:hidden property="PageCond/count" value="-1"/>
	  <html:hidden property="PageCond/length"/>
	  <html:hidden property="PageCond/begin" value="0"/>
	    <html:hidden property="BNOMtag"/>
<table width="100%" height="100%">
   <tr>
    <td>	
        <eos:OneTab name="ҵ���ֵ�����" imagePath="/internet/images/tt.gif" >	  
<table class="result2" border="0">
  <tr class="result_title"><td colspan="2" height="5%">��ҵ���ֵ���Ϣ��</td></tr>
    <tr> 
      <td class="query_content" nowrap width="14%" height="5%"> ҵ������</td>
      <td nowrap width="86%"> 
      	<html:select styleClass="myselect" property="BNDICT_T_Dictionary/businTypeID">
      		<logic:iterate id="businTypeID" property="list[@type='BNDICT_T_BusinType']">
      			<html:option id="businTypeID" property="BNDICT_T_BusinType/businTypeID">
      				<bean:write id="businTypeID" property="BNDICT_T_BusinType/businTypeName"/>
      			</html:option>
            </logic:iterate>
        </html:select>
      </td>
    </tr>
    <tr> 
      <td class="query_content" nowrap width="14%" height="5%">ҵ����</td>
      <td nowrap width="86%">
      	<input type="text" name="BNDICT_T_Dictionary/businID" maxlength="16" isNeed fieldName="ҵ����">
      </td>
    </tr>
    <tr> 
      	<td class="query_content" nowrap width="14%" height="5%">ҵ������</td>
      	<td nowrap width="86%">
     		<input type="text" name="BNDICT_T_Dictionary/businName" maxlength="30" isNeed fieldName="ҵ������">
      	</td>
    </tr>
    <tr valign="top"> 
      <td nowrap width="100%" colspan="2" height="80%">
        <input type="button" name="button1" value="����" onclick="javascript:submit1()"/>
        <input type="button" name="button2" value="����" onclick="javascript:document.frmEdit.reset()"/>
        <input type="button" name="button3" value="����" onclick="javascript:return1()"/> 
      </td>
      
    </tr>
  </table>
    	</eos:OneTab> 
      </td>
   </tr>
</table>
</form>
</body>
</div>
<script language="JavaScript">
function submit1(){
	var frm = document.frmEdit;
	frm.target = "_parent";
	if(checkForm(frm)==false) return;
	frm.submit();
}

function return1(){
      var frm = document.frmEdit;
      	frm.target = "_parent";
      	frm.action = "BNDICT.pr_automata.BNDICT_P_ShowDict.do";
	frm.submit();
}
</script>

<script>
param.style.display="block";
function hiddenSet() {
    param.style.display="none";
}
</script>
<%@ include file="/internet/commonTail.jsp" %>