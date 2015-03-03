<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prTeachingCase.caseTypeList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学案例库—&gt;<span id="printTable">教案类别</span>管理
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prTeachingCase.caseTypeList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prTeachingCase.caseTypeAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prTeachingCase.caseTypeModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prTeachingCase.caseTypeDelete.do">
		<html:hidden property="CaseType/_order/col1/field"/>
		<html:hidden property="CaseType/_order/col1/asc" />
		
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
				
				 <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_TEACH_MANAGE_TeachingCase_TYPE.DX_TEACH_MANAGE_TeachingCase_TYPE_ADD"/>
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_TeachingCase_TYPE.DX_TEACH_MANAGE_TeachingCase_TYPE_DEL"/>
              	<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_TeachingCase_TYPE.DX_TEACH_MANAGE_TeachingCase_TYPE_MODIFY"/>
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="65%"  border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="10%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="90%" align="center" nowrap id="CaseType.CaseTypeName" onClick="talentsort()">教案类别</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CaseType']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
              
                <td align="center"> 
					
                  		<html:checkbox id="resultset" name="list[@name='update']/CaseType/CaseTypeID" property="CaseType/CaseTypeID" indexed="true"/>                  				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="CaseType/CaseTypeName"/></td>
                </tr>
                </logic:iterate> 
              </table>
			 
       	    </td>
      </tr>
	  <tr>
        <td class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
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
	loadOrderImg(document.forms[0],'CaseType');
</script>