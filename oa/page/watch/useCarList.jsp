<%@include file="/internet/common.jsp"%>
<%
	//Ȩ�޿���
	base.util.RightParse RP = new base.util.RightParse();
	boolean duban = RP.parse("DX_OASYS_WATCH_USECAR.DX_OASYS_WATCH_USECAR_DB",session) ;
 
 %>
<body>
<form method="post" action="oa.prWatch.useCarList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���̼�ء�&gt;�ó�����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prWatch.useCarList.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prCarManage.useCarDelete.do">
		<input type="hidden" name="viewaction" value="oa.prCarManage.useCarView.do">
		<html:hidden property="UseCarRequest/_order/col1/field"/>
		<html:hidden property="UseCarRequest/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		<INPUT value="yyyy-MM-dd" type="hidden" name="UseCarRequest/OutTime/criteria/criteriaPattern">		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				�����ˣ� 
			    <html:text property="UseCarRequest/UserName" attributesText='class="input"'/>
				&nbsp;
				����ʱ�䣺
				<html:text property="UseCarRequest/OutTime/criteria/value" attributesText='class="input"'/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["UseCarRequest/OutTime/criteria/value"],"yyyy-MM-dd")>
				&nbsp;
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
				
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_OASYS_WATCH_USECAR.DX_OASYS_WATCH_USECAR_DEL" />
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
                  <td width="11%" align="center"  id="UseCarRequest.UserID" onClick="talentsort()">������</td>
                  <td width="14%" align="center"  id="UseCarRequest.Dest" onClick="talentsort()">Ŀ�ĵ�</td>
                  <td width="22%" align="center"  id="UseCarRequest.Subject" onClick="talentsort()">����</td>
                  <td width="13%" align="center"  id="UseCarRequest.OutTime" onClick="talentsort()">����ʱ��</td>
                  <td width="16%" align="center" >������Ա</td>
                  <td width="16%" align="center" >��ǰ����</td>
                  <td width="20%" align="center" >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='UseCarRequest']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="UseCarRequest/RequestID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="UseCarRequest/RequestID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/UseCarRequest/RequestID" property="UseCarRequest/RequestID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap align="center"><bean:write id="resultset" property="UseCarRequest/UserID" formatClass="username" formatType="operatorID"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="UseCarRequest/Dest"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="UseCarRequest/Subject" maxLength="30" maxLengthString=".."/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="UseCarRequest/OutTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center">
				<fcc:toname dom="resultset" path="UseCarRequest/participant"/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="UseCarRequest/workItemName"/></td>
                <td nowrap>&nbsp;
                <%if(duban){ %>
                <logic:present id="resultset"  property="UseCarRequest/currentState">
               <logic:notEqual id="resultset"  property="UseCarRequest/currentState" value="">
                <a href="javascript:toWfSupervise('<bean:write id="resultset" property="UseCarRequest/workItemID"/>','<bean:write id="resultset" property="UseCarRequest/participant"/>')">����</a>
				</logic:notEqual>
                </logic:present>
                <%} %>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="UseCarRequest/processInstID"/>','<bean:write id="resultset" property="UseCarRequest/archiveTitle"/>')">������־</a>				</td>
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
	loadOrderImg(document.forms[0],'UseCarRequest');
	var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("��ȷ��Ҫ��������������")==false){
				return ;
			} 
		}
		var stUrl = url+"?UseCarRequest/RequestID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
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