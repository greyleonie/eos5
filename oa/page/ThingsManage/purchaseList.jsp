 <%@include file="/internet/common.jsp"%>
 <logic:present property="Msg">
 <script>
 alert('<bean:write property="Msg"/>');
 </script>
  </logic:present>
<body>
<form method="post" action="oa.prThingsManage.purchaseList.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;��Ʒ����&gt;<span id="printTable">�ɹ�����</span>
             <logic:equal property="temptype" value="0">��ȫ����</logic:equal>
            <logic:equal property="temptype" value="1">��������</logic:equal>
            <logic:equal property="temptype" value="2">���Ѱ���</logic:equal>
            
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.purchaseList.do">
		<input type="hidden" name="addaction" value="oa.prThingsManage.purchaseAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prThingsManage.purchaseDelete.do">
		<input type="hidden" name="viewaction" value="oa.prThingsManage.purchaseView.do">
		<html:hidden  property="COMM_PURCHASEVIEW/_order/col1/field"/>
		<html:hidden  property="COMM_PURCHASEVIEW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
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
	  	<td class="text">

					<a title="���뵥��ţ����벿�ţ������ˣ���Ʒ���� ">�ؼ��֣�</a>
				<html:text property="COMM_PURCHASEVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="COMM_PURCHASEVIEW/searchField" value="PURCHASECODE,BRANCHNAME,PROPOSERNAME,ZCNC"/>
				
					 
				�������ڣ� ��<html:text property="COMM_PURCHASEVIEW/PURCHASEDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_PURCHASEVIEW/PURCHASEDATE/criteria/min"],"yyyy-MM-dd")>
           �� <html:text property="COMM_PURCHASEVIEW/PURCHASEDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_PURCHASEVIEW/PURCHASEDATE/criteria/max"],"yyyy-MM-dd")>
			<html:hidden property="COMM_PURCHASEVIEW/PURCHASEDATE/criteria/operator" value="between" />	
			<html:hidden property="COMM_PURCHASEVIEW/PURCHASEDATE/criteria/criteriaPattern" value="yyyy-MM-dd" />	
				
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="search()">
			    ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> <br/>
              	<qx:talentButton property="add" type="button" styleClass="button_eight" value="��д�ɹ���" onclick="talentadd()" operation="DX_OASYS_THINGSMANAGE_PURCHASE.DX_OASYS_THINGSMANAGE_PURCHASE_ADD" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_OASYS_THINGSMANAGE_PURCHASE.DX_OASYS_THINGSMANAGE_PURCHASE_DEL" />
				<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">

				
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="COMM_PURCHASEVIEW.PURCHASECODE" onClick="talentsort()">���뵥���</td>
                  <td width="10%" align="center" nowrap id="COMM_PURCHASEVIEW.PROPOSER" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="COMM_PURCHASEVIEW.BRANCH" onClick="talentsort()">���벿��</td>
                  <td width="10%" align="center" nowrap id="COMM_PURCHASEVIEW.PURCHASEDATE" onClick="talentsort()">��������</td>
                  <td width="20%" align="center" nowrap id="COMM_PURCHASEVIEW.ZCNC" onClick="talentsort()">��Ʒ����</td>
                  <td width="17%" align="center" nowrap>��ǰ������</td>
                  <td width="10%" align="center" nowrap >��ǰ����</td>
                  <td width="10%" align="center" nowrap >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_PURCHASEVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="COMM_PURCHASEVIEW/PURCHASEID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="COMM_PURCHASEVIEW/PURCHASEID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/COMM_PURCHASEVIEW/PURCHASEID" property="COMM_PURCHASEVIEW/PURCHASEID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_PURCHASEVIEW/PURCHASECODE"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_PURCHASEVIEW/PROPOSERNAME"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_PURCHASEVIEW/BRANCHNAME"/></td>
                 <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_PURCHASEVIEW/PURCHASEDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
				<td nowrap title="<bean:write id="resultset" property="COMM_PURCHASEVIEW/ZCNC"/>">&nbsp;<bean:write id="resultset" property="COMM_PURCHASEVIEW/ZCNC" maxLength="10"/></td>
                <td nowrap >&nbsp;<fcc:toname dom="resultset" path="COMM_PURCHASEVIEW/participant"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="COMM_PURCHASEVIEW/workItemName"/>
             
                </td>
                <td nowrap>&nbsp;
                <SCRIPT>
                	var tmp=<bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="COMM_PURCHASEVIEW/actionURL"/>\",<bean:write id="resultset" property="COMM_PURCHASEVIEW/PURCHASEID"/>,<bean:write id="resultset" property="COMM_PURCHASEVIEW/workItemID"/>,<bean:write id="resultset" property="COMM_PURCHASEVIEW/processInstID"/>,<bean:write id="resultset" property="COMM_PURCHASEVIEW/currentState"/>,\"<bean:write id="resultset" property="COMM_PURCHASEVIEW/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="COMM_PURCHASEVIEW/WFparticipant"/>\")'  ><font class=\"linkOA\">����</font></a>");
                </SCRIPT>
                
                
				<fcc:wfoperator pageDom="resultset" pagePath="COMM_PURCHASEVIEW/participantExt">
									</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="COMM_PURCHASEVIEW/processInstID"/>','<bean:write id="resultset" property="COMM_PURCHASEVIEW/archiveTitle"/>','COMM_PURCHASE')">���̼��</a>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="COMM_PURCHASEVIEW/processInstID"/>','<bean:write id="resultset" property="COMM_PURCHASEVIEW/archiveTitle"/>')">������־</a>				
				</td>
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
	loadOrderImg(document.forms[0],'COMM_PURCHASEVIEW');
</script>

<script type="text/javascript">
var userID = "<bean:write property="SessionEntity/userID"/>";
function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("��ȷ��Ҫ��������������")==false){
				return ;
			} 
		}
		var stUrl = url+"?COMM_PURCHASE/PURCHASEID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
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
	
	
	function search() {
	var frm =document.forms[0];
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		frm.submit();
	}

}
</script>