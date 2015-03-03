<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.pr.rolelist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;角色管理—&gt;角色列表</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.pr.rolelist.do">
		<input type="hidden" name="addaction" value="talent.pr.roleadd.do">
		<input type="hidden" name="modifyaction" value="talent.pr.rolemodify.do">
		<input type="hidden" name="deleteaction" value="talent.pr.roledelete.do">
		<input type="hidden" name="viewaction" value="talent.pr.roleview.do">
		<input type="hidden" name="modifytoSave" value="talent.pr.rolemodify.do">
		<html:hidden property="EOSRole/_order/col1/field"/>
		<html:hidden property="EOSRole/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<INPUT value="like" type="hidden" name="EOSRole/roleName/criteria/operator">
		<INPUT value="center" type="hidden" name="EOSRole/roleName/criteria/likeRule">
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
				<a title='关键字可以是"角色名称"' id="keytitle">角色名称</a>： 
			    <html:text property="EOSRole/roleName/criteria/value" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="modifyandsave" type="button" class="button_02" value="修改保存" onClick="modifySave('listdetail')">
				
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
                  <td width="29%" align="center" nowrap id="EOSRole.roleName" onClick="talentsort()">角色名称</td>
                  <td width="21%" align="center" nowrap >角色权限</td>
                  <td width="20%" align="center" nowrap >角色用户分配</td>
                  
                  
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='rolelist']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="EOSRole/roleID"/>','false')">  
                <td align="center"> 
					<logic:present  id="resultset" property="EOSRole/roleID">
						<logic:equal propertyId="resultset" property="EOSRole/roleClass" value="100"> 
                  			<html:checkbox id="resultset" name="list[@name='update']/EOSRole/roleID" property="EOSRole/roleID" indexed="true" attributesText="disabled"/> 
                  		</logic:equal>
                  		<logic:notEqual propertyId="resultset" property="EOSRole/roleClass" value="100"> 
                  			<html:checkbox id="resultset" name="list[@name='update']/EOSRole/roleID" property="EOSRole/roleID" indexed="true" /> 
                  		</logic:notEqual>
                  	</logic:present> 
				</td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="EOSRole/roleName"/></td>
                
                <td nowrap align="center"><a href='talent.pr.roleRightNew.do?rolemark=<bean:write id="resultset" property="EOSRole/roleID"/>&roleNick=<bean:write id="resultset" property="EOSRole/roleName"/>'><img src="/internet/image/QuanXian.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
                <td align="center" nowrap><a href='
                <logic:equal id="resultset" property="EOSRole/roleName" value="学员"> 
                talent.pr.roleSelectStudent.do?EOSOperatorRole/roleID=<bean:write id="resultset" property="EOSRole/roleID"/>&roleName=<bean:write id="resultset" property="EOSRole/roleName"/>
                </logic:equal>
                <logic:notEqual id="resultset" property="EOSRole/roleName" value="学员"> 
                talent.pr.roleSelectUsers.do?EOSOperatorRole/roleID=<bean:write id="resultset" property="EOSRole/roleID"/>&roleName=<bean:write id="resultset" property="EOSRole/roleName"/>
                </logic:notEqual>
                '><img src="/internet/image/QuanXian.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
                
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
	loadOrderImg(document.forms[0],'EOSRole');
</script>