<%@include file="/internet/common.jsp"%>

<html>
<head>
<title><bean:write property="title"/>��&gt;������־</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<SCRIPT type="text/javascript">
function   trim(str){   
  return   str.replace(/(^\s*)|(\s*$)/g,'');   
  }
function getStat(atvt,stat) {
   var lastAtvt = "atvt" + (parseInt(atvt.substring(4))-1);
   var atvtValue = document.getElementById(atvt).value;
   
   if (document.getElementById(lastAtvt)) {
      var lastValue = document.getElementById(lastAtvt).value;
   if (atvtValue < lastValue) {
      document.write("����");
      document.getElementById(atvt).parentNode.parentNode.className = "td2";
      return;
   } else {
      switch (stat) {
         case 1: document.write("�Ѵ���"); break;
         case 2: document.write("������"); break;
         case 3: document.write("�ѷ���"); break;
         case 4: document.write("����ȡ"); break;
         case 5: document.write("δ����"); break;
         case 6: document.write("����ȡ"); break;
         case 7: document.write("ֹͣ"); break;
         case 8: document.write("����"); break;
         case 9: document.write("�ܾ�"); break;
         case 10: document.write("����"); break;
         case 11: document.write("���"); break;
         case 12: document.write("���"); break;
         case 13: document.write("��ֹ"); break;
         case 14: document.write("ȡ��"); break;
      }
   } 
   } else {
      switch (stat) {
         case 1: document.write("�Ѵ���"); break;
         case 2: document.write("������"); break;
         case 3: document.write("�ѷ���"); break;
         case 4: document.write("����ȡ"); break;
         case 5: document.write("δ����"); break;
         case 6: document.write("����ȡ"); break;
         case 7: document.write("ֹͣ"); break;
         case 8: document.write("����"); break;
         case 9: document.write("�ܾ�"); break;
         case 10: document.write("����"); break;
         case 11: document.write("���"); break;
         case 12: document.write("���"); break;
         case 13: document.write("��ֹ"); break;
         case 14: document.write("ȡ��"); break;
      }
   }
}
</SCRIPT>
</head>
<body>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8" align="center">
		<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' width="100%" frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto">
		</iframe>
		 </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<!--
		<table width="99%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  
                  <td width="27%" align="center" nowrap id="ReceiveArchive.userID" onClick="talentsort()">��������</td>
                  <td width="25%" align="center" nowrap id="ReceiveArchive.operatorName" onClick="talentsort()">������</td>
                  <td width="19%" align="center" nowrap id="ReceiveArchive.status" onClick="talentsort()">��ʼʱ��</td>
                  <td width="17%" align="center" nowrap id="ReceiveArchive.cardID" onClick="talentsort()">����ʱ��</td>
                  <td width="12%" align="center" >״̬</td>
                 
                </tr>
                <%
		             //int count=0;
			         //String trClass = "result_content"; 
		  		%>
                <logic:iterate id="resultset" property="list[@type='allitem']">
              <tr class="td1" onClick="changeTRBgColor(this)" >  
                
                <td nowrap>&nbsp;<bean:write id="resultset" property="SyWFWorkItem/workItemName"/>
                </td>
                <td nowrap>&nbsp;
                <logic:present property="SyWFWorkItem/agentUser" id="resultset">
                	<logic:notEqual property="SyWFWorkItem/agentUser" id="resultset" valueId="resultset" valueProperty="SyWFWorkItem/participant">
                		<fcc:toname dom="resultset" path="SyWFWorkItem/agentUser"/>
                		ί��
                	</logic:notEqual>
                </logic:present>
                
                <fcc:toname dom="resultset" path="SyWFWorkItem/participant"/></td>
                <td align="center" nowrap>&nbsp;
					<bean:write id="resultset" property="SyWFWorkItem/startTime"/>
				</td>
                <td align="center" nowrap>&nbsp;<bean:write id="resultset" property="SyWFWorkItem/endTime" /></td>
                <td align="center" nowrap>&nbsp;
                <INPUT type="hidden" id="atvt<%//count;%>" value="<bean:write id='resultset' property='SyWFWorkItem/activityDefID'/>">
				<SCRIPT>getStat("atvt<%//count++;%>",<bean:write id='resultset' property='SyWFWorkItem/currentState'/>);</SCRIPT>
				</td>
              </tr>
                </logic:iterate> 
          </table>
          -->
          
		<table width="99%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  
                  <td width="13%" align="center" nowrap>��������</td>
                  <td width="13%" align="center" nowrap>������</td>
                  <td width="20%" align="center" nowrap>��ʼʱ��</td>
                  <td width="20%" align="center" nowrap>����ʱ��</td>
                  <td width="13%" align="center" nowrap>������</td>
                  <td width="10%" align="center" nowrap>��������</td>
                  <td width="10%" align="center" nowrap>״̬</td>
                 
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
					boolean rollBackFlag=false;
 				%>
                <logic:iterate id="resultset" property="list[@type='wfitem']">
                <%
                boolean tmpFlag=false;
                String flag=base.util.TalentContext.getValue(pageContext,"resultset","entity/rollbackflag");    
                String state=base.util.TalentContext.getValue(pageContext,"resultset","entity/currentstate");
                if(state.equals("13"))
                	rollBackFlag=true;
                else
                	rollBackFlag=false;                	
                if(rollBackFlag)
                	tmpFlag=rollBackFlag;
                if(flag.equals("1")){
                	rollBackFlag=true;
                }
                 %>
              <tr id="tr<%=count %>" class="td1" onClick="changeTRBgColor(this)" >  
                
                <td nowrap align="center"><bean:write id="resultset" property="entity/workitemname"/>
                </td>
                <td nowrap align="center">
                <logic:present property="entity/agentuser" id="resultset">
                	<logic:notEqual property="entity/agentUser" id="resultset" valueId="resultset" valueProperty="entity/participant">
                		<fcc:toname dom="resultset" path="entity/agentuser"/>
                		ί��
                	</logic:notEqual>
                </logic:present>
                <fcc:toname dom="resultset" path="entity/participant"/>
                <INPUT type="hidden" id="name<%=count%>" value="<fcc:toname dom='resultset' path='entity/participant'/>">
                </td>
                <td align="center" nowrap>
					<bean:write id="resultset" property="entity/starttime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>
				</td>
                <td align="center" nowrap><bean:write id="resultset" property="entity/endtime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
                <td nowrap align="center">
				<logic:equal id="resultset" property="entity/currentstate" value="10"></logic:equal>
                <logic:notEqual id="resultset" property="entity/currentstate" value="10">
                <%if(tmpFlag){ 
					int tmpCount=count-1;
				%>
					<SCRIPT>document.write(document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[1].innerText);</SCRIPT>
				<%} else{%>
                <fcc:toname dom="resultset" path="entity/participant"/>
                <%} %>         
                </logic:notEqual>
				</td>
				<td nowrap align="center">
                <%if(tmpFlag){ 
				%>
					<SCRIPT>document.write('���');</SCRIPT>
				<%} else{
					int tmpCount=count-1;
				%>
                	<SCRIPT>
                		var returnNode='<bean:write property="ExtendData/PassedNode/Node"/>';
                		var node='<bean:write id="resultset" property="entity/activitydefid"/>'
                		if(returnNode==node){
                			try{
                			document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[5].innerText='����';
                			}catch(e){}
                		}
                		if(<%=state %>!='10')
                			document.write('�ύ');
                	</SCRIPT>
                	
                <%} %>
                </td>
                <td align="center" nowrap>
                <logic:equal id="resultset" property="entity/currentstate" value="10">
                <font color="red">������</font>
                </logic:equal>
                <logic:notEqual id="resultset" property="entity/currentstate" value="10">
                <font color="green">����</font>           
                </logic:notEqual>
				</td>
              </tr>
              <%
              	count++;
              	if(tmpFlag){
              	//if(false){
              		int tmpCount=count-2;
              %>
              		<tr id='tr<%=count %>' class='td1' onClick='changeTRBgColor(this)' >
              			<td nowrap align='center'>
              				<script>
              					document.write(document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[0].innerText);
              				</script>
              			</td>
              			<td nowrap align='center'>
              				<INPUT type='hidden' id='name<%=tmpCount %>' value=''>
              				<script>
              					document.getElementById('name<%=tmpCount %>').value=document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[1].innerText;
              					document.write(document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[1].innerText);
              				</script>
              			</td>
              			<td align='center' nowrap>
              				<script>
              					document.write(document.getElementById('tr<%=tmpCount+1 %>').getElementsByTagName('td')[3].innerText);
              				</script>
              			</td>
              			<td align='center' nowrap>
              				<script>
              					document.write(document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[3].innerText);
              					document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[3].innerText=document.getElementById('tr<%=tmpCount+1 %>').getElementsByTagName('td')[2].innerText;
              				</script>
              			</td>
              			<td nowrap align='center'>
              				<script>
              					document.write(document.getElementById('tr<%=tmpCount+1 %>').getElementsByTagName('td')[4].innerText);
              					var tmp=document.getElementById('tr<%=tmpCount+1 %>').getElementsByTagName('td')[4].innerText;
              					if(tmp!=''){
              						document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[4].innerText=tmp;
              					}
              				</script>
              			</td>
              			<td nowrap align='center'>
              				<script>
              					document.write(document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[5].innerText);
              					document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[5].innerText='�ύ';
              				</script>
              			</td>
              			<td align='center' nowrap>
              				<script>
              					if(trim(document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[6].innerText)=='������')
              						document.write("<font color='red'>"+document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[6].innerText+"</font>");
              					else
              						document.write("<font color='green'>"+document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[6].innerText+"</font>");
              					document.getElementById('tr<%=tmpCount %>').getElementsByTagName('td')[6].innerHTML="<font color='green'>����</font>";
              					if(document.getElementById('tr<%=count %>').getElementsByTagName('td')[5].innerText==''){
              						document.getElementById('tr<%=count %>').getElementsByTagName('td')[4].innerText='';
              						document.getElementById('tr<%=count %>').getElementsByTagName('td')[3].innerText='';
              					}
              				</script>
              			</td>
              		</tr>
              <%
              		count++;
              	}
              %>
                </logic:iterate> 
          </table>
		  
	    </td>
      </tr>
    </table>

<script>
	//document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
</body>
</html>