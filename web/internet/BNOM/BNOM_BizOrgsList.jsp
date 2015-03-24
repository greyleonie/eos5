<%@include file="/internet/BNOM/omappbase.jsp"%>
<%	int count=0;%>

<display:pageHead bodyColor="#EEEEEE"/>		
<form name="el" method="POST">
<logic:present property="orgRefTypeID">
	<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?	QueryCondition=&refresh=tree&orgRefTypeID=<bean:write property="orgRefTypeID"/>">
	<html:hidden property="orgRefTypeID" name="orgRefTypeID" />
</logic:present>
<logic:notPresent property="orgRefTypeID">
	<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?	QueryCondition=&refresh=tree&orgID=<bean:write property="orgID"/>&bizOrgID=<bean:write 	property="bizOrgID"/>">
	<html:hidden property="bizOrgID" name="bizOrgID" />
</logic:notPresent>

<html:hidden property="QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/begin" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/length" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/count" />
<html:hidden name="QueryCondition[@entity='EOSORG_V_BizOrg']/expandAll" value="true"/>
<html:hidden name="QueryCondition[@entity='EOSORG_V_BizOrg']/selectAll" value="true"/>
<html:hidden property="orgID" name="orgID" />
<script>
var ref='<%=(request.getParameter("refresh")==null)?"":request.getParameter("refresh") %>';
	if(ref=="tree"){
		window.top.frames("tree").navigate("BNOM.pr_automata.BNOM_P_ShowBizOrgTree.do?");
	}

var myPage = new page();
myPage.init("el", "QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/begin", 
"QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/length", "QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/count");

function query(){
	el.elements("QueryCondition[@entity='EOSORG_V_BizOrg']/PageCond/count").value="-1";
	myPage.firstPage();	
}

function beforeDelete(){
	if(selectedCheckboxCount(document.forms(0)) < 1) {
		alert("您必须选择至少一个机构进行移除!");
		return false;
	}else{
		if(confirm("您真的要移除所选中的记录吗?")==true){
			return true;
		}else{
			return false;
		}
	}
}
function deleteBizOrgs(){
	document.forms(0).action="BNOM.pr_automata.BNOM_P_DeleteBizOrgs.do";
	document.forms(0).submit();
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
				if (eles.item(i).name!="checkAll"){
					count++;
				}
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

function addBizOrg(){
	openUrl = "/internet/BNOM/BNOM_ModalDialog.jsp?url=" +encodeURIComponent(document.forms(0).url.value);
	window.showModalDialog(openUrl,window,"dialogHeight:480px;dialogWidth:800px;center:yes");
}

</script>

<table border="0" cellspacing="1" cellpadding="1">
       <tr> 
          <td colspan="6" class="queryTitle">当前机构:<bean:write property="EOSORG_V_Organization/orgName"/></td>
        </tr>
</table>
<display:resultHead />
  
  <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
    <tr class="tableHeadTR">
      <!--<table border="0" cellspacing="1" cellpadding="1" align="center" class="result">
        <tr> 
          <td colspan="8" class="result_title"> 
            <div align="left">业务子机构列表</div>
          </td>
        </tr>
        <tr> -->
          <td width="4%" class="result_head" nowrap>
            <!--<input type="checkbox" name="checkAll" class="mycheckbox" onclick="dealAllCheckBox(this)" />-->选择</td>
          <td width="9%" class="result_head"> 机构编号</td>
          <td width="12%" class="result_head">机构名称</td>
          <td width="12%" class="result_head">联系人</td>
          <td width="18%" class="result_head">联系电话</td>
        </tr>
<logic:iterate id="elist" property="QueryCondition[@entity='EOSORG_V_BizOrg']/list[@type='EOSORG_V_BizOrg']">
        <tr class="<%=(count%2 == 0)?"tableContentTR":"tableContentTR"%>"> 
          <td width="4%"> 
            <html:checkbox name="list[@type='delete']/EOSORG_T_OrgRef/bizOrgID" id="elist" property="EOSORG_V_BizOrg/bizOrgID" indexed="true"/>
          </td>
          <td width="9%" align="center"><!--<a href="BNOM.pr_automata.BNOM_P_ShowEmp.do?back=1&mode=U&empID=<bean:write id="elist" property="EOSORG_V_MainOrgEmp/empID"/>">--><bean:write id="elist" property="EOSORG_V_BizOrg/orgCode"/></a></td>
          <td width="12%" align="center"><bean:write id="elist" property="EOSORG_V_BizOrg/orgName"/></td>
          <!--<td width="12%"><dict:write id="elist" businTypeId="BNORG_orgType" property="EOSORG_V_BizOrg/orgTypeID"/></td>-->
				<td width="12%"><bean:write id="elist" property="EOSORG_V_BizOrg/linkMan"/></td>
				<td width="18%"><bean:write id="elist" property="EOSORG_V_Organization/linkManTel"/></td>
        </tr>
        <%count++;%>
</logic:iterate>
	    </table>
         
            <table border="0" width="100%" cellspacing="4" cellpadding="4">
              <tr> 
                <td nowrap width="40%" height="20"> 
                  <div align="left">
                    <logic:present property="orgRefTypeID">
                    	<input type="hidden" name="url" value="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=&addBizOrg=true&bizOrgID=<bean:write 	property="bizOrgID"/>&orgID=<bean:write property="orgID"/>&orgRefTypeID=<bean:write 	property="orgRefTypeID"/>" >
									<!--<a href="javascript:addBizOrg();">-->
									
	                    <!--<a href="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=&addBizOrg=true&bizOrgID=<bean:write 	property="bizOrgID"/>&orgID=<bean:write property="orgID"/>&orgRefTypeID=<bean:write 	property="orgRefTypeID"/>">-->
								</logic:present>
								<logic:notPresent property="orgRefTypeID">
									<input type="hidden" name="url" value="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=&addBizOrg=true&bizOrgID=<bean:write property="bizOrgID"/>&orgID=<bean:write property="orgID"/>" >
									<!--<a href="javascript:addBizOrg();">-->

	                    <!--<a href="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=&addBizOrg=true&bizOrgID=<bean:write 	property="bizOrgID"/>&orgID=<bean:write property="orgID"/>">-->
								</logic:notPresent>

								<!--<html:image src="/select_1.gif"  align="absbottom" border="0" /></a>-->
								<input type="button" value="加入机构" title="加入机构" onclick="addBizOrg()" class="button"></input>
								<!--&nbsp;<A href="javascript:deleteBizOrgs();" onclick="return beforeDelete();"><html:image src="/remove.gif"  align="absbottom" border="0" /></A>-->
								<input type="button" value="移除" title="移除" onclick="javascript:if (beforeDelete()){deleteBizOrgs();}" class="button"></input>
                  </div>
                </td>
                <td nowrap width="40%" height="20"> 
                  <div align="right">
                    <!--<a href="javascript:myPage.previousPage();"><html:image src="/prevpage.gif"  align="absbottom" border="0" /></a>&nbsp;
                    <a href="javascript:myPage.nextPage();"><html:image src="/nextpage.gif"  align="absbottom" border="0" /></a>&nbsp;
                    
                    <input type="button" value="上一页" title="上一页" onclick="myPage.previousPage();" class="button"></input>
                    <input type="button" value="下一页" title="下一页" onclick="myPage.nextPage();" class="button"></input>
                    <font size="2">第<script>document.write(myPage.current)</script>页/共<script>document.write(myPage.total)</script>页&nbsp;</font> </div>
                    -->
                    <script>
					if (myPage.total > 1 && !myPage.noCount) {
						document.write('<input type="button" value="上一页" title="上一页" onclick="myPage.previousPage();" class="button"></input>&nbsp;');
            			document.write('<input type="button" value="下一页" title="下一页" onclick="myPage.nextPage();" class="button"></input>');
            			document.write('&nbsp;');
						//document.write('<font size=2>总共' + myPage.count + '条');
						document.write('<font size=2>&nbsp;第');
						document.write(myPage.current + '页/');
						document.write('共'+myPage.total + '页</font>')
			 		}
		        </script>
                </td>
              </tr>
            </table>
         
</form>
