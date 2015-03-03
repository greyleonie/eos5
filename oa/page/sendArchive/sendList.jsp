<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prSendArchive.sendList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;发文管理</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prSendArchive.sendList.do">
		<input type="hidden" name="addaction" value="oa.prSendArchive.sendAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prSendArchive.sendDelete.do">
		<input type="hidden" name="viewaction" value="oa.prSendArchive.sendView.do">
		<html:hidden property="SendArchive/_order/col1/field"/>
		<html:hidden property="SendArchive/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		<INPUT value="like" type="hidden" name="SendArchive/archiveTitle/criteria/operator">
		<INPUT value="center" type="hidden" name="SendArchive/archiveTitle/criteria/likeRule">
		<INPUT value="like" type="hidden" name="SendArchive/draftDept/criteria/operator">
		<INPUT value="center" type="hidden" name="SendArchive/draftDept/criteria/likeRule">
		<INPUT value="like" type="hidden" name="SendArchive/archiveCode/criteria/operator">
		<INPUT value="center" type="hidden" name="SendArchive/archiveCode/criteria/likeRule">
	  </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="10"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				<a title='关键字可以是"发文标题"' id="keytitle">标题</a>： 
			    <html:text property="SendArchive/archiveTitle/criteria/value" attributesText='class="input"'/>
				&nbsp;
				拟稿单位：
				<html:text property="SendArchive/draftDept/criteria/value" attributesText='class="input"'/>
				&nbsp;
				文号：
				<html:text property="SendArchive/archiveCode/criteria/value" attributesText='class="input"'/>
				
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
        <td height="10"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="11%" align="center" nowrap id="SendArchive.archiveCode" onClick="talentsort()">文号</td>
                  <td width="18%" align="center" nowrap id="SendArchive.archiveTitle" onClick="talentsort()">标题</td>
                  <td width="13%" align="center" nowrap id="SendArchive.draftDept" onClick="talentsort()">拟稿单位</td>
                  <td width="12%" align="center" nowrap id="SendArchive.sendDate" onClick="talentsort()">发文日期</td>
                  <td width="15%" align="center" >收阅人员</td>
                  <td width="13%" align="center" >当前环节</td>
                  <td width="18%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='sendlist']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="SendArchive/sendID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="SendArchive/sendID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/SendArchive/sendID" property="SendArchive/sendID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="SendArchive/archiveCode"/></td>
                <td nowrap title="<bean:write id='resultset' property='SendArchive/archiveTitle'/>">&nbsp;<bean:write id="resultset" property="SendArchive/archiveTitle" maxLength="20"/></td>
                <td nowrap>&nbsp;
					<bean:write id="resultset" property="SendArchive/draftDept"/>
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="SendArchive/sendDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;
				<fcc:toname dom="resultset" path="SendArchive/participant"/>
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="SendArchive/workItemName"/></td>
                <td nowrap>&nbsp;
                <SCRIPT>
                	var tmp=<bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="SendArchive/actionURL"/>\",<bean:write id="resultset" property="SendArchive/sendID"/>,<bean:write id="resultset" property="SendArchive/workItemID"/>,<bean:write id="resultset" property="SendArchive/processInstID"/>,<bean:write id="resultset" property="SendArchive/currentState"/>,\"<bean:write id="resultset" property="SendArchive/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="SendArchive/WFparticipant"/>\")'  ><SPAN style=\"color:red;\">办理</SPAN></a>");
                </SCRIPT>
                
                <fcc:wfoperator pageDom="resultset" pagePath="SendArchive/participantExt">
					</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="SendArchive/processInstID"/>','<bean:write id="resultset" property="SendArchive/archiveTitle"/>','sendArchive')">流程监控</a>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="SendArchive/processInstID"/>','<bean:write id="resultset" property="SendArchive/archiveTitle"/>')">流程日志</a>
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
	loadOrderImg(document.forms[0],'SendArchive');
	
	//流程图查看
function getWfImageR(processInstID,title,tableName) {
	var url = "oa.prSendArchive.sendWfImageForRollback.do?WFWorkItem/processInstID=" + processInstID;
	url += "&title=" + title;
	url += "&tableName=" + tableName;
	getWfImg(url);
}

var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var stUrl = url+"?SendArchive/sendID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
		if(currentState == 10 &&WFparticipant != null && WFparticipant != "" && userID != WFparticipant ){
			if(confirm("该业务已被"+WFparticipantName+"领取了，是否要提取来自己办理吗？")==false){
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