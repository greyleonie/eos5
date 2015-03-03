<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prDoWork.workFlowAll.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;审批事项—&gt;<span  id="printTable"> <logic:equal property="worktype" value="1">待办事项</logic:equal><logic:equal property="worktype" value="2">已办事项</logic:equal></span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prDoWork.workFlowAll.do">
		<input type="hidden" name="viewaction" value="">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="WorkFlow/_order/col1/field"/>
		<html:hidden property="WorkFlow/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="worktype" />
		
		<INPUT value="yyyy-MM-dd" type="hidden" name="WorkFlow/FlowDate/criteria/criteriaPattern">		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				申请人或部门： 
			    <html:text property="WorkFlow/UserName" attributesText='class="input"'/>
				&nbsp;
				时间：
				<html:text property="WorkFlow/SelectDate" attributesText='class="input"'/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WorkFlow/SelectDate"],"yyyy-MM-dd")>
				&nbsp;
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			    <input name="view" type="button" class="button_02" value="查 看" onClick="flowview()">
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
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" > <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> </td>
                  <td width="14%" align="center"  id="WorkFlow.FlowName" onClick="talentsort()">流程名</td>                 
                  <td width="11%" align="center"  id="WorkFlow.UserID" onClick="talentsort()">申请人或部门</td>
                  <td width="11%" align="center"  id="WorkFlow.Title" onClick="talentsort()">标题</td>
                  <td width="13%" align="center"  id="WorkFlow.FlowDate" onClick="talentsort()">时间</td>
                  <td width="16%" align="center" >处理人员</td>
                  <td width="16%" align="center" >当前环节</td>
                  <td width="20%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='WorkFlow']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String flowID = base.util.TalentContext.getValue(pageContext,"resultset","WorkFlow/FlowID");
						String flowType = base.util.TalentContext.getValue(pageContext,"resultset","WorkFlow/FlowType");
						String flowContent = flowID + "#" + flowType;
						System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+flowContent);
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="flowviewf('<bean:write id="resultset" property="WorkFlow/FlowID"/>','true','<bean:write id="resultset" property="WorkFlow/FlowType"/>')">  
                <td align="center"> 
					<logic:present  id="resultset" property="WorkFlow/FlowID"> 
                  		<input type="checkbox" name="WorkFlow/FlowID" value="<%=flowContent %>"> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="WorkFlow/FlowName"/></td>
                <td nowrap align="center">
                <logic:present id="resultset" property="WorkFlow/Dept">
                <bean:write id="resultset" property="WorkFlow/Dept"/>
                </logic:present>
                <logic:equal id="resultset" property="WorkFlow/Dept" value="">               
                <bean:write id="resultset" property="WorkFlow/UserID" formatClass="username" formatType="operatorID"/>
                </logic:equal></td>  
                <td nowrap title=<bean:write id="resultset" property="WorkFlow/Title"/>>&nbsp;<bean:write id="resultset" property="WorkFlow/Title" maxLength="30" maxLengthString=".."/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="WorkFlow/FlowDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<fcc:toname dom="resultset" path="WorkFlow/participant"/>				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="WorkFlow/workItemName"/></td>
                <td nowrap>&nbsp;
                
                <script>
                	var tmp=<bean:write property="worktype"/><bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="WorkFlow/actionURL"/>\",<bean:write id="resultset" property="WorkFlow/FlowID"/>,<bean:write id="resultset" property="WorkFlow/workItemID"/>,<bean:write id="resultset" property="WorkFlow/processInstID"/>,<bean:write id="resultset" property="WorkFlow/currentState"/>,\"<bean:write id="resultset" property="WorkFlow/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="WorkFlow/WFparticipant"/>\",\"<bean:write id="resultset" property="WorkFlow/FlowType"/>\",\"1\")' ><font class=\"linkOA\">办理</font></a>");
                </script>
				<fcc:wfoperator pageDom="resultset" pagePath="WorkFlow/participantExt">
									</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="WorkFlow/processInstID"/>','<bean:write id="resultset" property="WorkFlow/FlowName"/>','<bean:write id="resultset" property="WorkFlow/FlowType"/>')">流程监控</a>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="WorkFlow/processInstID"/>','<bean:write id="resultset" property="WorkFlow/FlowName"/>')">流程日志</a></td>
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

	
	var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName,flow,type){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var flowID = "";
		
		if(flow=='SendArchive'){
			flowID = "?SendArchive/sendID=";
	}else if(flow=='ReceiveArchive'){
        flowID = "?ReceiveArchive/receiveID="
	}else if(flow=='COMM_PURCHASE'){
        flowID = "?COMM_PURCHASE/PURCHASEID="
	}else if(flow=='COMM_STOREOUT'){
        flowID = "?COMM_STOREOUT/STOREOUTID="
	}else if(flow=='CAPT_PURCHASE'){
        flowID = "?CAPT_PURCHASE/PURCHASEID="
	}else if(flow=='CAPT_WRITEOFF'){
        flowID = "?CAPT_WRITEOFF/WRITEOFFID="
	}else if(flow=='UseCarRequest'){
		flowID = "?UseCarRequest/RequestID="
	}else if(flow=='CostClaim'){
		flowID = "?CostClaim/RequestID="
	}else if(flow=='TravelCostClaim'){
        flowID = "?TravelCostClaim/RequestID="
	}else if(flow=='BorrowRequest'){
        flowID = "?BorrowRequest/RequestID="
	}else if(flow=='CheckRequest'){
        flowID = "?CheckRequest/RequestID="
	}else if(flow=='MR_APPLY'){
        flowID = "?MR_APPLY/APPLYID="
	}else if(flow=='OMM_Request'){
				flowID = "?OMM_Request/RequestID="
	}

		var stUrl = url+flowID+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID+"&type="+type;
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
	
	
	function flowviewf(id,authority,type){
	  if(authority == "true") {
		var frm =document.forms[0];
		
	   	frm.action = flowaction(type);
	   	frm.action += "?fid=" + id;
		frm.submit();		
      } 	
	}
	
	function flowview(){
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
	    	alert("至少必须选择一行！");
	    	return ;
	    }
		if(chechedCount(frm)>1){
	   		alert("只能选择一行！");
	    	return ;
	   	}
		var content = getChechedValue(frm);
		var arr = new   Array();   
		arr = content.split("#");
		id = arr[0];
		type = arr[1];
		frm.action = flowaction(type);
	   	frm.action += "?fid=" + id;
		frm.submit();	
	}
	
	function flowaction(type){
	    var actions = "";
		if(type=='SendArchive') actions = "oa.prSendArchive.sendView.do";
		else if(type=='ReceiveArchive') actions = "oa.prReceiveArchive.receiveView.do";
		else if(type=='COMM_PURCHASE') actions = "oa.prThingsManage.purchaseView.do";
		else if(type=='COMM_STOREOUT') actions = "oa.prThingsManage.storeOutView.do";
		else if(type=='CAPT_PURCHASE') actions = "oa.prAssetsManage.purchaseView.do";
		else if(type=='CAPT_WRITEOFF') actions = "oa.prAssetsManage.writeOffView.do";
		else if(type=='UseCarRequest') actions = "oa.prCarManage.useCarView.do";
		else if(type=='CostClaim') actions = "oa.prFinance.costClaimView.do";
		else if(type=='TravelCostClaim') actions = "oa.prFinance.travelCostClaimView.do";
		else if(type=='BorrowRequest') actions = "oa.prFinance.checkRequestView.do";
		else if(type=='CheckRequest') actions = "oa.prFinance.borrowRequestView.do";
		else if(type=='MR_APPLY') actions = "oa.prMeetingManage.mrApplyView.do";
		return actions;
	}
</script>