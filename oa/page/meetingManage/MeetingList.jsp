<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prMeetingManage.mrApplyList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;会议管理—&gt;会议列表</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.prMeetingList.do">
		<input type="hidden" name="addaction" value="oa.prMeetingManage.mrApplyAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prMeetingManage.mrApplyDelete.do">
		<input type="hidden" name="viewaction" value="oa.prMeetingManage.mrApplyView.do">
		<html:hidden property="MR_APPLY/_order/col1/field"/>
		<html:hidden property="MR_APPLY/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	 <tr>
            <td height="30" class="text">
				会议名称： 
			    <html:text property="MR_APPLY/MeetingName/criteria/value" attributesText='class="input"'/>
				&nbsp;
				申请时间：
				<INPUT value="yyyy-MM-dd" type="hidden" name="MR_APPLY/APPLYDATE/criteria/criteriaPattern">
				<html:text property="MR_APPLY/APPLYDATE/criteria/value" attributesText='class="input"'/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["MR_APPLY/APPLYDATE/criteria/value"],"yyyy-MM-dd")>
				&nbsp;
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()"  operation="DX_OASYS_MR_APPLY.DX_OASYS_MR_APPLY_ADD" />
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
                  <td width="11%" align="center"  id="MR_APPLY.UserID" onClick="talentsort()">会议名称</td>
                  <td width="14%" align="center"  id="MR_APPLY.APPLYDATE" onClick="talentsort()">会议主题</td>
                  <td width="13%" align="center"  id="MR_APPLY.MeetingName" onClick="talentsort()">主持人</td>
                  <td width="16%" align="center" >会议时间</td>
                  <td width="16%" align="center" >会议地点</td>
                  <td width="20%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='MR_APPLY']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="MR_APPLY/APPLYID"/>','true')">  
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/MeetingName" maxLength="30" maxLengthString=".."/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/TOPIC" maxLength="30" maxLengthString=".."/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/Moderator" maxLength="30" maxLengthString=".."/></td>                
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/MRNAME" maxLength="30" maxLengthString=".."/></td>  
                <td nowrap>&nbsp;
				<a href='oa.prMeetingManage.prMeetingStart.do?applyid=<bean:write id="resultset" property="MR_APPLY/APPLYID"/>'>开始</a>				
				<a href='oa.prMeetingManage.prMeetingAtt.do?depid=-1&itemid=-1&ismanual=-1&name=&applyid=<bean:write id="resultset" property="MR_APPLY/APPLYID"/>'>统计</a>	
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
    </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>

</body>
<script type="text/javascript">
	loadOrderImg(document.forms[0],'MR_APPLY');
	var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,APPLYID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var stUrl = url+"?MR_APPLY/APPLYID="+APPLYID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
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