<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prwfAgent.agent.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;ί�а���</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">	
		<html:hidden property="WFAgent/_order/col1/field"/>
		<html:hidden property="WFAgent/_order/col1/asc" />		
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
	  	<td class="text">
				<input name="add" type="button" class="button_02" value="�� ��" onClick="addAgent()">
				<input name="add" type="button" class="button_02" value="�� ��" onClick="update()">
              	<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="del()">
				<input name="view" type="button" class="button_02" value="�� ��" onClick="detail()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="30%" align="center" nowrap id="" onClick="talentsort()">ί������</td>                 
                  <td width="14%" align="center" nowrap id="" onClick="talentsort()">��ʼʱ��</td>
                  <td width="13%" align="center" nowrap id="" onClick="talentsort()">����ʱ��</td>
                  <td width="10%" align="center" nowrap id="" onClick="talentsort()">�а���</td>
                  <td width="10%" align="center" >״̬</td>
                  <td width="10%" align="center" >����</td>
                </tr>
                <%
		           int count=0;
		             String classStr="td1";
		  		%>
                <logic:iterate id="resultset" property="list[@type='WFAgent']"> 
                <%
				     if(count%2==0)classStr="td1";
				       else classStr="td2";
					count++;
			       %>
              <tr class="<%=classStr %>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="WFAgent/agentID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="WFAgent/agentID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/WFAgent/agentID" property="WFAgent/agentID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;
                <logic:equal id="resultset" property="WFAgent/processDefID" value="0">
                	ȫ��
                </logic:equal>
                <logic:notEqual id="resultset" property="WFAgent/processDefID" value="0">
                	<bean:write id="resultset" property="WFAgent/processDefName"/>
                </logic:notEqual>
                </td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="WFAgent/startTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;
					<bean:write id="resultset" property="WFAgent/endTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="WFAgent/agentTo"/></td>
                <td nowrap align="center">&nbsp;
				<logic:equal id="resultset" property="WFAgent/state" value="1">ί����</logic:equal>
				<logic:equal id="resultset" property="WFAgent/state" value="2">�ѹ���</logic:equal>
				<logic:equal id="resultset" property="WFAgent/state" value="3">�ѳ���</logic:equal>
				</td>
                <td nowrap align="center"><logic:equal id="resultset" property="WFAgent/state" value="1">
                 <a href="javascript:cancel('<bean:write id="resultset" property="WFAgent/agentID"/>')">����</a>
                </logic:equal>&nbsp;
			
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
<script language="javascript">
frm =document.forms[0];
function addAgent(){ 
 frm.action="oa.prwfAgent.addAgent.do";
 frm.submit();
}

function update(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  frm.action="oa.prwfAgent.queryAgent.do?isAdd=2";
  frm.submit();
  
}

function detail(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  frm.action="oa.prwfAgent.queryAgent.do?isAdd=3";
  frm.submit();
  
}

function del(){
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
   frm.action="oa.prwfAgent.delAgent.do";
   frm.submit();
}

function cancel(agentId){
	if(confirm("ȷ��Ҫ������ί����")){
	  frm.action="oa.prwfAgent.saveAgent.do?isAdd=2&WFAgent/state=3&WFAgent/agentID="+agentId;
	  frm.submit();
  	}
}
</script>