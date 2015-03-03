<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.pr.deptlist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;部门管理—&gt;<bean:write property="EOSORG_T_Organization/parentName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.pr.deptlist.do">
		<input type="hidden" name="addaction" value="talent.pr.deptAdd.do">
		<input type="hidden" name="modifyaction" value="talent.pr.deptModify.do">
		<input type="hidden" name="deleteaction" value="talent.pr.deptDelete.do">
		<input type="hidden" name="viewaction" value="talent.pr.deptView.do">
		<input type="hidden" name="modifytoSave" value="">
		<input type="hidden" name="depDistributedUses" value="talent.pr.deptSelectUsers.do">
		<html:hidden property="EOSORG_T_Organization/_order/col1/field"/>
		<html:hidden property="EOSORG_T_Organization/_order/col1/asc" />
		<html:hidden property="EOSORG_T_Organization/parentOrgID/criteria/value" />
		<html:hidden property="EOSORG_T_Organization/parentName" />
		<html:hidden property="EOSORG_T_Organization/orgLevel" />
		
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<INPUT value="like" type="hidden" name="EOSORG_T_Organization/orgName/criteria/operator">
		<INPUT value="center" type="hidden" name="EOSORG_T_Organization/orgName/criteria/likeRule">
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
				<a title='关键字可以是"部门名称"' id="keytitle">部门名称</a>： 
			    <html:text property="EOSORG_T_Organization/orgName/criteria/value" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="modifyandsave" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="29%" align="center" nowrap id="EOSORG_T_Organization.orgName" onClick="talentsort()">部门名称</td>
                  <td width="21%" align="center" nowrap id="EOSORG_T_Organization.managerID" onClick="talentsort()">部门负责人</td>
                  <td width="20%" align="center" nowrap >部门人员分配</td>
                  
                  
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='deptlist']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="EOSORG_T_Organization/orgID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="EOSORG_T_Organization/orgID">
						
                  		
                  			<html:checkbox id="resultset" name="list[@name='update']/EOSORG_T_Organization/orgID" property="EOSORG_T_Organization/orgID" indexed="true" /> 
                  
                  	</logic:present> 
				</td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="EOSORG_T_Organization/orgName"/></td>
                
                  <td nowrap align="center"><bean:write id="resultset" property="EOSORG_T_Organization/managerID" formatClass="username" formatType="operatorID"/></td>
                <td align="center" nowrap><img src="/internet/image/QuanXian.gif" width="16" height="16" style="cursor:hand" border="0" align="absmiddle" onClick="deptSelectUsers('<bean:write id="resultset" property="EOSORG_T_Organization/orgID"/>','true')"></td>
                
              </tr>
			  
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
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
	loadOrderImg(document.forms[0],'EOSORG_T_Organization');
</script>

<script>
	function deptSelectUsers(id,authority) {
		if(authority == "true") {
			var frm =document.forms[0];
			
			
			
			frm.action = frm.elements["depDistributedUses"].value;
			frm.action += "?EOSORG_T_EmpOrgRef/orgID=" + id;
			frm.submit();		
		} 	
}
</script>
