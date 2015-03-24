<%@include file="/internet/BNOM/omappbase.jsp"%>
<%	int count=0;%>

<body>		
<form name="orgList" method="POST">
<logic:present property="orgRefTypeID">
	<!--<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=&refresh=tree&orgRefTypeID=<bean:write property="orgRefTypeID"/>">-->
	<input type="hidden" name="orgRefTypeID" value="<bean:write property="orgRefTypeID"/>">
</logic:present>
<logic:notPresent property="orgRefTypeID">
	<!--<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=&bizOrgID=<bean:write property="bizOrgID"/>&orgID=<bean:write property="orgID"/>&refresh=tree">-->
</logic:notPresent>
<input type="hidden" name="redirectURL" value="/internet/BNOM/BNOM_CloseModalDialog.jsp">

<html:hidden property="QueryCondition[@entity='EOSORG_V_Organization']/PageCond/begin" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_Organization']/PageCond/length" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_Organization']/PageCond/count" />
<html:hidden name="bizOrgID" property="bizOrgID"/>
<html:hidden property="orgID" name="orgID" />
<input type="hidden" name="addBizOrg" value="true">
<script>

var myPage = new page();
myPage.init("orgList", "QueryCondition[@entity='EOSORG_V_Organization']/PageCond/begin", 
"QueryCondition[@entity='EOSORG_V_Organization']/PageCond/length", "QueryCondition[@entity='EOSORG_V_Organization']/PageCond/count");

function query(){
	orgList.elements("QueryCondition[@entity='EOSORG_V_Organization']/PageCond/count").value="-1";
	myPage.firstPage();
	
	orgList.action="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do";
	orgList.submit();
}

function beforeAddBizOrgs(){
	if(selectedCheckboxCount(document.forms(0)) < 1) {
		alert("您必须选择至少一个组织机构添加到业务机构中!");
		return false;
	}
	return true;
}

function addBizOrgs(){
	orgList.addBizOrg.value=false;
	document.forms(0).action="BNOM.pr_automata.BNOM_P_AddBizOrgs.do";
	document.forms(0).add_button.disabled=true;
	document.forms(0).submit();
	//parent.window.refreshWin();
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
      <td class="queryLabelTD">机构编号</td>
      <td class="queryFieldTD">
      	<html:text property="QueryCondition[@entity='EOSORG_V_Organization']/EOSORG_V_Organization/orgCode" size="12" maxlength="12"/> 
      </td>
      <td width="16"></td>
      <td class="queryLabelTD">机构名称</td>
      <td class="queryFieldTD">
        <html:text property="QueryCondition[@entity='EOSORG_V_Organization']/EOSORG_V_Organization/orgName" size="32" maxlength="32"/> 
      </td>
      <td>
        <!--<a href="javascript:query();"><html:image src="/query.gif" border="0" /></a>-->
        <input type="button" value="查询" title="查询" onclick="query()" class="button"></input>
      </td>
    </tr>
  </table>

	  <display:resultHead lineClass="tb_blue" title="机构列表"/>
      <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
      <!--<table border="0" cellspacing="1" cellpadding="1" align="center" class="result">
        <tr> 
          <td colspan="8" class="result_title"> 
            <div align="left">机构列表</div>
          </td>
        </tr>
        <tr> -->
        <tr class="tableHeadTR"> 
          <td width="4%" class="result_head" nowrap>
            <!--<input type="checkbox" name="checkAll" class="mycheckbox" onclick="dealAllCheckBox(this)" />--> 选择 </td>
          <td width="9%"> 机构编号</td>
          <td width="12%">机构名称</td>
          <td width="12%">联系人</td>
          <td width="18%">联系电话</td>
        </tr>
<logic:iterate id="elist" property="QueryCondition[@entity='EOSORG_V_Organization']/list[@type='EOSORG_V_Organization']">
        <tr class="<%=(count%2 == 0)?"tableContentTR":"tableContentTR"%>"> 
          <td width="4%"> 
            <html:checkbox name="list[@type='addBizOrgs']/EOSORG_T_OrgRef/orgID" id="elist" property="EOSORG_V_Organization/orgID" indexed="true"/>
          </td>
          <td width="9%" align="center"><!--<a href="BNOM.pr_automata.BNOM_P_ShowEmp.do?back=1&mode=U&empID=<bean:write id="elist" property="EOSORG_V_Organization/orgID"/>">--><bean:write id="elist" property="EOSORG_V_Organization/orgCode"/></a></td>
          <td width="12%" align="center"><bean:write id="elist" property="EOSORG_V_Organization/orgName"/></td>
				<!--<td width="18%"><dict:write id="elist" businTypeId="BNORG_orgType" property="EOSORG_V_Organization/orgTypeID"/></td>-->
				<td width="12%"><bean:write id="elist" property="EOSORG_V_Organization/linkMan"/></td>
				<td width="18%"><bean:write id="elist" property="EOSORG_V_Organization/linkManTel"/></td>
        </tr>
        <%count++;%>
</logic:iterate>
        </table>
        
        <table border="0" width="100%" cellspacing="4" cellpadding="4">
          <tr> 
            <td nowrap width="40%" height="20"> 
              <!--<div align="left"><a href="javascript:addBizOrgs();"><html:image src="/add.gif" onclick="return beforeAddBizOrgs();" align="absbottom" border="0" /></a>
              </div>-->
              <input id="add_button" type="button" value="增加" title="增加" onclick="javascript:if (beforeAddBizOrgs()){addBizOrgs();}" class="button"></input>
            </td>
            <td nowrap width="40%" height="20"> 
              <div align="right">
                <!--<a href="javascript:myPage.previousPage();"><html:image src="/prevpage.gif"  align="absbottom" border="0" /></a>&nbsp;
                <a href="javascript:myPage.nextPage();"><html:image src="/nextpage.gif"  align="absbottom" border="0" /></a>&nbsp;
                -->
                <input type="button" value="上一页" title="上一页" onclick="myPage.previousPage();" class="button"></input>
                <input type="button" value="下一页" title="下一页" onclick="myPage.nextPage();" class="button"></input>
                <font size="2">第<script>document.write(myPage.current)</script>页/共<script>document.write(myPage.total)</script>页&nbsp;</font> </div>
            </td>
          </tr>
        </table>
        <div align="center">
	        <input type="button" value="关闭窗口" title="关闭窗口" onclick="javascript:window.close();" class="button"></input>
	    </div>

</form>
