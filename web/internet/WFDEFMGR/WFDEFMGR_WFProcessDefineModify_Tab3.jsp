<display:tabHead topSpace="20" contentWidth="90%"/>
<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">  

<tr>
<td width="100%" colspan="5">
<html:hidden property="id" />
<html:hidden property="name" />
<html:hidden property="type" />


<input type="hidden" name="tab" value="2" class="null">
<td>
<tr>

  
  <tr> 
     <td colspan="5" width="100%">��������������Ϣ�� </td>
  </tr>  

  <tr>
     <td class="queryLabelTD" colspan="1" width="20%">
     	��������������
     </td>
     
     <td  colspan="4" width="80%">
     	<dict:select businTypeId="WFDICT_ProcStarterType" property="WFProcessDefineXML/Process/processStarterType" 
     	onchange="handleType(this.options[this.options.selectedIndex].value)"
     	/>
     </td>
  </tr>
 
   <tr id="part_org">
   <td width="100%" colspan="5">
    <table width="100%" border="0" cellpadding="2"  cellspacing="0" class="gridtable">
	  <tr>
	      <td class="queryLabelTD" colspan="1" width="20%">
	      	�������б�
	      </td>

	      <td colspan="1" width="80%">
	      	    <table width="100%" border="1" cellpadding="2"  cellspacing="0" class="gridtable">
	
			      <tr > 
			        <td align="center" width="30%" height="16">����</td>
			        <td align="center" width="30%" height="16">����</td>
			        <td align="center" width="30%" height="16">ID</td>
			        <td align="center" width="10%" height="16">����</td>
			      </tr>
			      
			      <logic:iterate id="listResult" property="WFProcessDefineXML/Process/procStarterList">
		
			      <tr>
				        <logic:equal id="listResult" property="row/type" value="person">
				        	<td align="center" width="30%">����</td>
				        </logic:equal>
				        <logic:equal id="listResult" property="row/type" value="role">
				        	<td align="center" width="30%">��ɫ</td>
				        </logic:equal>
				        <logic:equal id="listResult" property="row/type" value="organization">
				        	<td align="center" width="30%">����</td>
				        </logic:equal>
				        <td align="center" width="30%">
				          <bean:write id="listResult" property="row/name"/>
				        </td> 
				        <td align="center" width="30%">
				          <bean:write id="listResult" property="row/id"/>
				        </td>
				        <td align="center" width="10%">
				          <a href="javascript:if(confirm('ȷ��Ҫɾ����')) window.location='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveProcDef_Participant.do?WFProcessDefineXML/Process/processStarterType=organization&num=<bean:write id="listResult" property="row/num"/>&command=delete&id=0&name=0&type=0&processDefID=<bean:write property="processDefID"/>&tab=3'">
				            <img border="0" src="/internet/WFCOMMON/images/button/delete-icon.jpg"  width="13" height="19" >
				          </a>
				        </td>
			      </tr>
			      </logic:iterate>
		    </table>
      
	      </td>
	  </tr>
	  

	  <tr>
	  <td width="100%" colspan="5">
	  <table width="100%" height="40" border="0">
	   <tr> 
	    <td align="right" width="100%">
		<input type="button" class="button" value = "��������������" onclick="javascript:showParticipant();">
	    </td>
	    </tr>
	  </table>  
	  </td>
	  </tr>  


	  <tr id="row_participant" style="display:none">
	    <td align="left" colspan="5" width="100%">
        <input type="text" name="nameText">
        <input type="text" name="hiddenText" style="display:none">
		<input type="button" class="button" value = "ѡ��" onclick="javascript:SelectOMParticipant()">
		<input type="button" class="button" value = "����" onclick="javascript:procStartersave();">
		<input type="button" class="button" value = "ȡ��" onclick="javascript:participantcancel();">
	    </td>
	  </tr>

    </table>
    </td>  
   </tr> 


      
      
      
      
  <tr id="row_save" style="display:none">
  <td colspan="5" width="100%">
  <%@ include file="WFDEFMGR_WFProcessDefineSave.jsp" %> 
  </td>   
  </tr>         
</table>



<display:tabTail buttomSpace="20"/>

<script language="JavaScript">
<!--
function SelectOMParticipant(){
	openUrl = "WFWEBCOMP.prExSelPerson.SelectOMParticipant.do?"+
		"&rootType=ALL_PARTICIPANT"+
		"&rootID="+
		"&maxPartiNum=1"+
		"&isSelOrg=true"+
		"&isSelRole=true"+
		"&isSelPerson=true"+
		"&formName=ProcInfo"+
		"&inputName=nameText"+
		"&hiddenName=hiddenText"+
		"&hiddenType=ID_TYPE_NAME";
		//form name set directly
	window.showModalDialog(openUrl,ProcInfo,"dialogHeight:480px;dialogWidth:650px;center:yes");
}
	
function showParticipant()
{
	row_participant.style.display = "";
	row_save.style.display="none";
}

function procStartersave()
{
	var frm = document.ProcInfo;
	var hiddenText = frm.hiddenText.value;
	
	if (frm.hiddenText.value!="")
	{ 
	  var xmlDoc = new ActiveXObject("Microsoft.XMLDOM") ;
		// xsl�ĵ�������ʾxml����
	  var str = transformToSymbol(hiddenText);
	  
	  xmlDoc.async = false ;
	  xmlDoc.loadXML(str) ;
	  if (xmlDoc.parseError.errorCode != 0) {
		 var myErr = xmlDoc.parseError;
		 alert("You have error " + myErr.reason);
	  } else{
	  	 var idNodeList = xmlDoc.getElementsByTagName("id");
	  	 var typeNodeList = xmlDoc.getElementsByTagName("type");
		 var nameNodeList = xmlDoc.getElementsByTagName("name");
		
		 frm.id.value=idNodeList.item(0).text;
	  	 frm.type.value=typeNodeList.item(0).text;
	  	 frm.name.value=nameNodeList.item(0).text;
	     frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveProcDef_Participant.do?command=insert&num=0';
	     frm.submit();
   	  }
	}
	else
	{
	  alert('��ѡ�������');
	}
}

function participantcancel()
{
	var frm = document.ProcInfo;
	frm.id.value='';
	frm.name.value='';
	frm.type.value='';
	frm.nameText.value='';
	frm.hiddenText.value='';

	row_participant.style.display = "none";
	row_save.style.display="none";
}



/**
  *��xml���ҵ���&gt����&lt�����滻Ϊ��<���͡�>��
  */
function transformToSymbol(str){
	var ret = str.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&quot;/g,"'");
	return ret;
}

function handleType(v) 
{
if (v=="organization")
{
part_org.style.display="";
row_save.style.display="none";
}
else if (v=="all")
{
part_org.style.display="none";
row_save.style.display="";
}
}
handleType(window.ProcInfo.elements['WFProcessDefineXML/Process/processStarterType'].value);
//-->
</script>