<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prFinance.checkRequestList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;财务管理—&gt;领用支票审批—&gt;<logic:equal property="temptype" value="0">所有领用支票审批</logic:equal><logic:equal property="temptype" value="1">待办领用支票审批</logic:equal><logic:equal property="temptype" value="2">已办领用支票审批</logic:equal></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prFinance.checkRequestList.do">
		<input type="hidden" name="addaction" value="oa.prFinance.checkRequestAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prFinance.checkRequestDelete.do">
		<input type="hidden" name="viewaction" value="oa.prFinance.checkRequestView.do">
		<html:hidden property="CheckRequest/_order/col1/field"/>
		<html:hidden property="CheckRequest/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		 </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	 <tr>
            <td height="30" class="text">
				领用人： 
			    <html:text property="CheckRequest/UserName" attributesText='class="input"'/>
				&nbsp;
				领用时间：
				<INPUT value="yyyy-MM-dd" type="hidden" name="CheckRequest/ConsumDate/criteria/criteriaPattern">		
				<html:text property="CheckRequest/ConsumDate/criteria/value" attributesText='class="input"'/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CheckRequest/ConsumDate/criteria/value"],"yyyy-MM-dd")>
				&nbsp;
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
		
		
		
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
                  <td width="11%" align="center"  id="CheckRequest.UserID" onClick="talentsort()">领用人</td>
                  <td width="14%" align="center"  id="CheckRequest.Advance" onClick="talentsort()">预支金额</td>
                  <td width="13%" align="center"  id="CheckRequest.ConsumDate" onClick="talentsort()">领用时间</td>
                  <td width="16%" align="center" >处理人员</td>
                  <td width="16%" align="center" >当前环节</td>
                  <td width="20%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CheckRequest']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CheckRequest/RequestID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CheckRequest/RequestID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CheckRequest/RequestID" property="CheckRequest/RequestID" indexed="true"/> 
                  	</logic:present>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/UserID" formatClass="username" formatType="operatorID"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/Advance"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/ConsumDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center">
				<fcc:toname dom="resultset" path="CheckRequest/participant"/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/workItemName"/></td>
                <td nowrap>&nbsp;
                
                <SCRIPT>
                	var tmp=<bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="CheckRequest/actionURL"/>\",<bean:write id="resultset" property="CheckRequest/RequestID"/>,<bean:write id="resultset" property="CheckRequest/workItemID"/>,<bean:write id="resultset" property="CheckRequest/processInstID"/>,<bean:write id="resultset" property="CheckRequest/currentState"/>,\"<bean:write id="resultset" property="CheckRequest/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="CheckRequest/WFparticipant"/>\")'  ><SPAN class=\"linkOA\">办理</SPAN></a>");
                </SCRIPT>
                
				<fcc:wfoperator pageDom="resultset" pagePath="CheckRequest/participantExt">
									</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="CheckRequest/processInstID"/>','<bean:write id="resultset" property="CheckRequest/archiveTitle"/>','CheckRequest')">流程监控</a>
				<a href="javascript:getWfLog('<bean:write id="resultset" property="CheckRequest/processInstID"/>','<bean:write id="resultset" property="CheckRequest/archiveTitle"/>')">流程日志</a>				</td>
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
	loadOrderImg(document.forms[0],'CheckRequest');
	var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var stUrl = url+"?CheckRequest/RequestID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
		if(currentState == 10 &&WFparticipant != null && WFparticipant != "" && userID != WFparticipant ){
			if(confirm("该工作流程已被"+WFparticipantName+"领取了，是否要提取来自己办理吗？")==false){
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