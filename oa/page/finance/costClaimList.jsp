<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prFinance.costClaimList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;�������&gt;���ñ�����&gt;<logic:equal property="temptype" value="0">���з��ñ���</logic:equal><logic:equal property="temptype" value="1">������ñ���</logic:equal><logic:equal property="temptype" value="2">�Ѱ���ñ���</logic:equal></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prFinance.costClaimList.do">
		<input type="hidden" name="addaction" value="oa.prFinance.costClaimAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prFinance.costClaimDelete.do">
		<input type="hidden" name="viewaction" value="oa.prFinance.costClaimView.do">
		<html:hidden property="QueryCostClaim/_order/col1/field"/>
		<html:hidden property="QueryCostClaim/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		<INPUT value="yyyy-MM-dd" type="hidden" name="QueryCostClaim/OutTime/criteria/criteriaPattern">		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				�������ţ� 
			    <html:text property="QueryCostClaim/orgName/criteria/value" attributesText='class="input"'/>
				<INPUT value="like" type="hidden" name="QueryCostClaim/orgName/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryCostClaim/orgName/criteria/likeRule">
		
				&nbsp;
				ʱ�䣺
				<INPUT value="yyyy-MM-dd" type="hidden" name="QueryCostClaim/ClaimDate/criteria/criteriaPattern">		
				<html:text property="QueryCostClaim/ClaimDate/criteria/value" attributesText='class="input"'/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryCostClaim/ClaimDate/criteria/value"],"yyyy-MM-dd")>
				&nbsp;
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
				
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<input name="add" type="button" class="button_02" value="�� ��" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
				<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
		
		
		
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" > <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="14%" align="center"  id="QueryCostClaim.orgName" onClick="talentsort()">��������</td>
                  <td width="13%" align="center"  id="QueryCostClaim.ClaimDate" onClick="talentsort()">ʱ��</td>
                  <td width="16%" align="center" >������Ա</td>
                  <td width="16%" align="center" >��ǰ����</td>
                  <td width="20%" align="center" >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='QueryCostClaim']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryCostClaim/RequestID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="QueryCostClaim/RequestID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/QueryCostClaim/RequestID" property="QueryCostClaim/RequestID" indexed="true"/> 
                  	</logic:present>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryCostClaim/orgName" /></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryCostClaim/ClaimDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center">
				<fcc:toname dom="resultset" path="QueryCostClaim/participant"/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryCostClaim/workItemName"/></td>
                <td nowrap>&nbsp;
                
                <SCRIPT>
                	var tmp=<bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="QueryCostClaim/actionURL"/>\",<bean:write id="resultset" property="QueryCostClaim/RequestID"/>,<bean:write id="resultset" property="QueryCostClaim/workItemID"/>,<bean:write id="resultset" property="QueryCostClaim/processInstID"/>,<bean:write id="resultset" property="QueryCostClaim/currentState"/>,\"<bean:write id="resultset" property="QueryCostClaim/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="QueryCostClaim/WFparticipant"/>\")'  ><SPAN class=\"linkOA\">����</SPAN></a>");
                </SCRIPT>
                
				<fcc:wfoperator pageDom="resultset" pagePath="QueryCostClaim/participantExt">
									</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="QueryCostClaim/processInstID"/>','���ñ���','CostClaim')">���̼��</a>
				<a href="javascript:getWfLog('<bean:write id="resultset" property="QueryCostClaim/processInstID"/>','���ñ���')">������־</a>				</td>
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
    </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script type="text/javascript">
	loadOrderImg(document.forms[0],'QueryCostClaim');
	var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("��ȷ��Ҫ��������������")==false){
				return ;
			} 
		}
		var stUrl = url+"?CostClaim/RequestID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
		if(currentState == 10 &&WFparticipant != null && WFparticipant != "" && userID != WFparticipant ){
			if(confirm("�ù��������ѱ�"+WFparticipantName+"��ȡ�ˣ��Ƿ�Ҫ��ȡ���Լ�������")==false){
				return ;
			} 
			stUrl = stUrl + "&WFWorkItem/reProcess=1";
		} 
		location.href = stUrl ; 
		//var frm = document.forms[0];
		//frm.action = stUrl;
		//frm.submit();
		
	}
</script>