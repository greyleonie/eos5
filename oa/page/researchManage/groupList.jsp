<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchManage.groupList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;科研管理—&gt;科研组管理</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchManage.groupList.do">
		<input type="hidden" name="addaction" value="oa.prResearchManage.groupAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prResearchManage.groupModify.do">
		<input type="hidden" name="deleteaction" value="oa.prResearchManage.groupDelete.do">
		<input type="hidden" name="viewaction" value="oa.prResearchManage.groupView.do">
		
		<html:hidden property="researchTeam/_order/col1/field"/>
		<html:hidden property="researchTeam/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

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
                <a title='科研组名称"' id="keytitle">科研组名称</a>： 
			    <html:text property="groupSearch/groupName" attributesText='class="input" size="15"'/>
			    &nbsp;
				<a title='负责人"' id="keytitle">负责人</a>： 
			    <html:text property="groupSearch/manager" attributesText='class="input" size="15"'/>
								
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">

			</td>
      </tr>
	  <tr>
	  	<td class="text">
	  	   <qx:talentButton value="新 增" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_GROUPMANAGE.DX_OASYS_RESEARCH_GROUPMANAGE_ADD" onclick="talentadd()" property="add"></qx:talentButton>
           <qx:talentButton value="修 改" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_GROUPMANAGE.DX_OASYS_RESEARCH_GROUPMANAGE_MODIFY" onclick="talentmodify()" property="modify"></qx:talentButton>
           <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
           <qx:talentButton value="删 除" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_GROUPMANAGE.DX_OASYS_RESEARCH_GROUPMANAGE_DELETE" onclick="talentdelete()" property="delete"></qx:talentButton>
           <qx:talentButton value="打 印" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_GROUPMANAGE.DX_OASYS_RESEARCH_GROUPMANAGE_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="导 出" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_GROUPMANAGE.DX_OASYS_RESEARCH_GROUPMANAGE_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
               
	  	   <!-- <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
				<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">-->
				
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
                  <td width="15%" align="center" nowrap id="researchTeam.groupName" onClick="talentsort()">科研组名称</td>
                  <td width="12%" align="center" nowrap id="researchTeam.manager" onClick="talentsort()">负责人</td>
                  <!--td width="8%" align="center" >用户权限</td-->
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='researchTeam']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="researchTeam/groupID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="researchTeam/groupID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/researchTeam/groupID" property="researchTeam/groupID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="researchTeam/groupName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="researchTeam/managerName"/></td>
                
                <!--td nowrap align="center">
                
				</td-->
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