<%@include file="/internet/BNOM/omappbase.jsp"%>
<%	int count=0;%>

<display:pageHead bodyColor="#EEEEEE"/>		
<form name="el" method="POST">
<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QuerySubEmpsByOrg.do?QueryCondition=&orgID=<bean:write property="EOSORG_V_Organization/orgID"/>">
<html:hidden property="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/begin" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/length" />
<html:hidden property="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/count" />
<html:hidden name="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/expandAll" value="true"/>
<html:hidden name="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/selectAll" value="true"/>
<html:hidden name="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/EOSORG_V_SubOrgEmp/orgID" property="EOSORG_V_Organization/orgID"/>
<html:hidden property="EOSORG_V_Organization/orgID" name="orgID" />
<script>
var myPage = new page();
myPage.init("el", "QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/begin", 
"QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/length", "QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/count");

function query(){
	el.elements("QueryCondition[@entity='EOSORG_V_SubOrgEmp']/PageCond/count").value="-1";
	myPage.firstPage();	
}

function beforeDelete(){
	if(selectedCheckboxCount(document.forms(0)) < 1) {
		alert("您必须选择至少一个员工进行删除!");
		return false;
	}else{
		if(confirm("您真的要删除所选中的记录吗?")==true){
			return true;
		}else{
			return false;
		}
	}
}
function deleteEmps(){
	document.forms(0).action="BNOM.pr_automata.BNOM_P_DeleteSubEmps.do";
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

function selectEmps(){
	openUrl = "/internet/BNOM/BNOM_ModalDialog.jsp?url=" +encodeURIComponent(document.forms(0).url.value);
	window.showModalDialog(openUrl,window,"dialogHeight:480px;dialogWidth:800px;center:yes");
}


</script>
<table border="0" cellspacing="1" cellpadding="1">
       <tr> 
          <td colspan="6" class="queryTitle">当前机构:<bean:write property="EOSORG_V_Organization/orgName"/></td>
        </tr>
</table>
					
<display:resultHead lineClass="tb_blue" />

<table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
   
    <!--<tr> 
      <td colspan="8" class="result_title"> 
        <div align="left">附属用户列表</div>
      </td>
    </tr>-->
    
    <tr class="tableHeadTR"> 
      <td width="4%" nowrap>
        <!--<input type="checkbox" name="checkAll" onclick="dealAllCheckBox(this)" />-->选择</td>
      <td width="9%"> 用户编号</td>
      <td width="12%">用户姓名</td>
      <td width="18%">所属主机构</td>
      <td width="12%">职位</td>
      <td width="14%">工作电话 </td>
      <td width="19%">email</td>
      <td width="12%">注册日期</td>
      <!--<td width="12%">状态</td>-->
    </tr>
<logic:iterate id="elist" property="QueryCondition[@entity='EOSORG_V_SubOrgEmp']/list[@type='EOSORG_V_SubOrgEmp']">
    <tr class="tableContentTR"> 
      <td width="4%"> 
        <html:checkbox name="list[@type='delete']/EOSORG_T_EmpOrgRef/operatorID" id="elist" property="EOSORG_V_SubOrgEmp/operatorID" indexed="true"/>
      </td>
      <td width="9%" align="center"><bean:write id="elist" property="EOSORG_V_SubOrgEmp/empCode"/></td>
      <td width="12%" align="center"><!--<a href="BNOM.pr_automata.BNOM_P_ShowEmp.do?back=1&mode=U&operatorID=<bean:write id="elist" property="EOSORG_V_SubOrgEmp/operatorID"/>">--><bean:write id="elist" property="EOSORG_V_SubOrgEmp/operatorName"/><!--</a>-->
			</td>
      <td width="18%"><bean:write id="elist" property="EOSORG_V_SubOrgEmp/orgName"/></td>
      <td width="12%"><dict:write id="elist" businTypeId="BNORG_position" property="EOSORG_V_SubOrgEmp/positionID"/></td>
      <td width="14%" align="center"><bean:write id="elist" property="EOSORG_V_SubOrgEmp/OTel1"/></td>
      <td width="19%"><bean:write id="elist" property="EOSORG_V_SubOrgEmp/OEmail"/></td>
      <td width="12%" align="center"><bean:write id="elist" property="EOSORG_V_SubOrgEmp/regDate"/></td>
    </tr>
    <%count++;%>
</logic:iterate>
    </table>
    <display:resultTail/>
    
        <table border="0" width="100%" cellspacing="4" cellpadding="4">
          <tr> 
            <td nowrap width="40%" height="20"> 
              <div align="left">
              	<input type="hidden" name="url" value="BNOM.pr_automata.BNOM_P_QueryOrgOutSubEmp.do?QueryCondition=&orgID=<bean:write property="EOSORG_V_Organization/orgID"/>">
							<!--<a href="javascript:selectEmps();">-->

                <!--<a href="BNOM.pr_automata.BNOM_P_QueryOrgOutSubEmp.do?QueryCondition=&orgID=<bean:write property="EOSORG_V_Organization/orgID"/>">--><!--<html:image src="/select_1.gif"  align="absbottom" border="0" /></a>-->
                <input type="button" value="加入用户" title="加入用户" onclick="selectEmps()" class="button"></input>
                <input type="button" value="移除" title="移除" onclick="javascript:if (beforeDelete()){deleteEmps();}" class="button"></input>
                <!--<A href="javascript:deleteEmps();" onclick="return beforeDelete();"><html:image src="/remove.gif"  align="absbottom" border="0" /></A>-->
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
<display:pageTail/>
