<%@ include file="/internet/hciHead.jsp" %>

<div id="mparam">
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css" />
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>

<script language="JavaScript" src="/internet/scripts/check.js"></script>

<body >
<form name="frmEdit" method="POST" action="BNDICT.pr_automata.BNDICT_P_DictModifySubmit.do" onsubmit="javascript:return false">
  <html:hidden property="BNDICT_V_Dictionary/businTypeID" />
  <html:hidden property="PageCond/count"/>
  <html:hidden property="PageCond/length"/>
  <html:hidden property="PageCond/begin"/>
  <html:hidden property="BNOMtag"/>

<html:hidden property="BNDICT_T_Dictionary/businTypeID"/>
<html:hidden property="BNDICT_T_Dictionary/businID"/>
<table width="100%" height="100%">
   <tr>
    <td>	
        <eos:OneTab name="ҵ���ֵ��޸�" imagePath="/internet/images/tt.gif" >
<table class="result2" border="0" width="100%">
    <tr class="result_title"><td colspan="2" height="5%">��ҵ���ֵ���Ϣ��</td></tr>
    <tr> 
      <td class="result_head" nowrap width="14%" height="5%">ҵ������</td>
      <td nowrap width="86%"><bean:write property="BNDICT_T_Dictionary/businTypeName"/></td>
    </tr>
    <tr> 
      <td class="result_head" nowrap width="14%" height="5%">ҵ����</td>
      <td nowrap width="86%"><bean:write property="BNDICT_T_Dictionary/businID"/></td>
    </tr>
    <tr>
      <td class="result_head" nowrap width="14%" height="5%">ҵ������</td>
      <td nowrap width="86%">
     		<input name="BNDICT_T_Dictionary/businName" value="<bean:write property="BNDICT_T_Dictionary/businName"/>" isNeed  fieldName="ҵ������" maxlength="20">
      </td>
    </tr>
    
    <tr valign="top"> 
      <td nowrap width="100%"  colspan="2" height="80%">
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

<script>
function return1(){
      var frm = document.frmEdit;
      	frm.target = "_parent";
      	frm.action = "BNDICT.pr_automata.BNDICT_P_ShowDict.do";
	frm.submit();
}

function submit1(){
	var frm = document.frmEdit;
	if(checkForm(frm) ==false) {
		return;
	} else {
		if(confirm("ȷʵҪ�޸�?")==true){
			frm.submit();
		}
	}
}
</script>
<script>
mparam.style.display="block";
function hiddenSet() {
    mparam.style.display="none";
}
</script>
<%@ include file="/internet/commonTail.jsp" %>