<%@include file="/internet/BNOM/omappbase.jsp"%>
<%	int count=0;%>
<body>	
<form name="el" action="" method="POST">
<!--<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QuerySubEmpsByOrg.do?QueryCondition=&orgID=<bean:write property="orgID"/>">-->
<input type="hidden" name="redirectURL" value="/internet/BNOM/BNOM_CloseModalDialog.jsp">
<html:hidden property="QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/begin" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/length" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/count" />
<html:hidden property="orgID" name="orgID" />
<html:hidden name="type" property="type"/>

<script>
var myPage = new page();
myPage.init("el", "QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/begin", 
"QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/length", "QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/count");

function query(){
	el.elements("QueryCondition[@entity='EOSORG_V_MainOrgEmp']/PageCond/count").value="-1";
	myPage.firstPage();	
	
	el.action="BNOM.pr_automata.BNOM_P_QueryOrgOutSubEmp.do";
	el.submit();
	
}

function beforeAddSubEmps(){
	if(selectedCheckboxCount(document.forms(0)) < 1) {
		alert("������ѡ������һ��Ա������Ϊ�������ĸ���Ա��!");
		return false;
	}
	return true;
}

function addSubEmps(){
	
	var checkedFlag="false";
	for( i=0;i<document.forms(0).elements.length;i++){
		if(document.forms(0).elements[i].type=="checkbox"){
			elm=document.forms(0).elements[i];
			if(elm.checked) checkedFlag="true";
		}
	}
	if(checkedFlag=="true"){
		document.forms(0).action="BNOM.pr_automata.BNOM_P_AddSubEmps.do";
		document.forms(0).submit();
		//parent.window.refreshWin();
	}else{
		alert("��û��ѡ���û���");
	}
}

function selectedCheckboxCount(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}

function dealAllCheckBox(chkAll){
	if ( chkAll.checked == true ){
		CheckAll();
	} else {
		UnCheckAll();
	}
}
	
function CheckAll()	// Select all the check boies
{   
	for (var i=0;i<document.forms[0].elements.length;i++)
	{
		
		var e = document.forms[0].elements[i];
		  
		   e.checked = true;
	}
}

function UnCheckAll()	// uncheck all the check boies 
{
	for (var i=0;i<document.forms[0].elements.length;i++)
	{
		var e = document.forms[0].elements[i];
		    
		   e.checked = false;
	}
}

</script>
			
		 
	  <table border="0" cellspacing="1" cellpadding="1" align="center"> 
        <tr>
          <td class="queryLabelTD">Ա�����</td>
          <td class="queryFieldTD">
          	<html:text property="QueryCondition[@entity='EOSORG_V_MainOrgEmp']/EOSORG_V_MainOrgEmp/empCode" size="12" maxlength="12"/>
          </td>
          <td width="16"></td>
          <td class="queryLabelTD">Ա������</td>
          <td class="queryFieldTD">
	        <html:text property="QueryCondition[@entity='EOSORG_V_MainOrgEmp']/EOSORG_V_MainOrgEmp/operatorName" size="12" maxlength="12"/> 
          </td>
          <td>
            <!--<a href="javascript:query();"><html:image src="/query.gif" border="0" /></a>-->
            <input type="button" value="��ѯ" title="��ѯ" onclick="query()" class="button"></input>
          </td>
        </tr>
      </table>
      
      <!--<table border="0" cellspacing="1" cellpadding="1">
	     <tr> 
          <td colspan="8" class="result_title">�Ǳ����������û��б�
          </td>
         </tr>
      </table>-->
            
      <display:resultHead lineClass="tb_blue" title="�Ǳ����������û��б�"/>
      <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
        <tr class="tableHeadTR"> 
          <td width="4%" nowrap>
            <!--<input type="checkbox" name="checkAll" onclick="dealAllCheckBox(this)" />--> ѡ�� </td>
          <td width="9%"> �û����</td>
          <td width="12%">�û�����</td>
          <td width="18%">����������</td>
          <td width="12%">ְλ</td>
          <td width="14%">�����绰 </td>
          <td width="19%">email</td>
          <td width="12%">ע������</td>
        </tr>
<logic:iterate id="elist" property="QueryCondition[@entity='EOSORG_V_MainOrgEmp']/list[@type='EOSORG_V_MainOrgEmp']">
        <tr class="<%=(count%2 == 0)?"tableContentTR":"tableContentTR"%>"> 
          <td width="4%"> 
            <html:checkbox name="list[@type='addSubEmps']/EOSORG_T_EmpOrgRef/operatorID" id="elist" property="EOSORG_V_MainOrgEmp/operatorID" indexed="true"/>
          </td>
          <td width="9%" align="center"><bean:write id="elist" property="EOSORG_V_MainOrgEmp/empCode"/></td>
          <td width="12%" align="center"><!--<a href="BNOM.pr_automata.BNOM_P_ShowEmp.do?back=1&mode=U&operatorID=<bean:write id="elist" property="EOSORG_V_MainOrgEmp/operatorID"/>">--><bean:write id="elist" property="EOSORG_V_MainOrgEmp/operatorName"/><!--</a>--></td>
				<td width="18%"><bean:write id="elist" property="EOSORG_V_MainOrgEmp/orgName"/></td>
          <td width="12%"><dict:write id="elist" businTypeId="BNORG_position" property="EOSORG_V_MainOrgEmp/positionID"/></td>
          <td width="14%" align="center"><bean:write id="elist" property="EOSORG_V_MainOrgEmp/OTel1"/></td>
          <td width="19%"><bean:write id="elist" property="EOSORG_V_MainOrgEmp/OEmail"/></td>
          <td width="12%" align="center"><bean:write id="elist" property="EOSORG_V_MainOrgEmp/regDate"/></td>
        </tr>
        <%count++;%>
</logic:iterate>
		</table>
		<display:resultTail/>
		<table border="0" width="100%" cellspacing="4" cellpadding="4">
          <tr> 
            <td nowrap width="40%" height="20"> 
              <div align="left">
                <!--<a href="javascript:addSubEmps();" onclick="return beforeAddSubEmps();"><html:image src="/add.gif"  align="absbottom" border="0" /></a>-->
                <input type="button" value="����" title="����" onclick="addSubEmps();" class="button"></input>
              </div>
            </td>
            <td nowrap width="40%" height="20"> 
              <div align="right">
                <!--<a href="javascript:myPage.previousPage();"><html:image src="/prevpage.gif"  align="absbottom" border="0" /></a>&nbsp;
                <a href="javascript:myPage.nextPage();"><html:image src="/nextpage.gif"  align="absbottom" border="0" /></a>&nbsp;
                -->
                <input type="button" value="��һҳ" title="��һҳ" onclick="myPage.previousPage();" class="button"></input>
                <input type="button" value="��һҳ" title="��һҳ" onclick="myPage.nextPage();" class="button"></input>
                <font size="2">��<script>document.write(myPage.current)</script>ҳ/��<script>document.write(myPage.total)</script>ҳ&nbsp;</font> </div>
            </td>
          </tr>
        </table>
        <div align="center">
	        <input type="button" value="�رմ���" title="�رմ���" onclick="javascript:window.close();" class="button"></input>
	    </div>
</form>
</body></html>