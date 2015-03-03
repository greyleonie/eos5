<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.storeOutList.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;用品管理—&gt;<span id="printTable">领用申请</span>
            <logic:equal property="temptype" value="0">（全部）</logic:equal>
            <logic:equal property="temptype" value="1">（待办理）</logic:equal>
            <logic:equal property="temptype" value="2">（已办理）</logic:equal>
            
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.storeOutList.do">
		<input type="hidden" name="addaction" value="oa.prThingsManage.storeOutAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prThingsManage.storeOutDelete.do">
		<input type="hidden" name="viewaction" value="oa.prThingsManage.storeOutView.do">
		<html:hidden  property="COMM_STOREOUTVIEW/_order/col1/field"/>
		<html:hidden  property="COMM_STOREOUTVIEW/_order/col1/asc" />
		
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
            <td height="30" class="text">
				<a title="申请单编号，申请部门，申请人，用品名称 ">关键字：</a>
				<html:text property="COMM_STOREOUTVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="COMM_STOREOUTVIEW/searchField" value="STOREOUTCODE,BRANCHNAME,PROPOSERNAME,ZCNC"/>
				
				申请日期： 从<html:text property="COMM_STOREOUTVIEW/PURCHASEDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_STOREOUTVIEW/PURCHASEDATE/criteria/min"],"yyyy-MM-dd")>
           到 <html:text property="COMM_STOREOUTVIEW/PURCHASEDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_STOREOUTVIEW/PURCHASEDATE/criteria/max"],"yyyy-MM-dd")>
			<html:hidden property="COMM_STOREOUTVIEW/PURCHASEDATE/criteria/operator" value="between" />	
			<html:hidden property="COMM_STOREOUTVIEW/PURCHASEDATE/criteria/criteriaPattern" value="yyyy-MM-dd" />	
				
				
			    <input name="query" type="button" class="button_02" value="查 询" onClick="search()">
			    服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <br/>
              	<qx:talentButton property="add" type="button" styleClass="button_eight" value="填写领用单" onclick="talentadd()" operation="DX_OASYS_THINGSMANAGE_STOREOUT.DX_OASYS_THINGSMANAGE_STOREOUT_ADD" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_THINGSMANAGE_STOREOUT.DX_OASYS_THINGSMANAGE_STOREOUT_DEL" />
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">

				
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
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.STOREOUTCODE" onClick="talentsort()">申请单编号</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.PROPOSER" onClick="talentsort()">申请人</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.BRANCH" onClick="talentsort()">申请部门</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.PURCHASEDATE" onClick="talentsort()">申请日期</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.ZCNC" onClick="talentsort()">用品名称</td>
                  <td width="20%" align="center" >当前操作人</td>
                  <td width="17%" align="center" >当前环节</td>
                  <td width="*" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_STOREOUTVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="COMM_STOREOUTVIEW/STOREOUTID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="COMM_STOREOUTVIEW/STOREOUTID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/COMM_STOREOUTVIEW/STOREOUTID" property="COMM_STOREOUTVIEW/STOREOUTID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/STOREOUTCODE"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/PROPOSERNAME"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/BRANCHNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/PURCHASEDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
				<td nowrap title="<bean:write id="resultset" property="COMM_STOREOUTVIEW/ZCNC"/>">&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/ZCNC" maxLength="10"/></td>
				<td nowrap >&nbsp;<fcc:toname dom="resultset" path="COMM_STOREOUTVIEW/participant"/></td>
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/workItemName"/></td>
                <td nowrap>&nbsp;
                <SCRIPT>
                	var tmp=<bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="COMM_STOREOUTVIEW/actionURL"/>\",<bean:write id="resultset" property="COMM_STOREOUTVIEW/STOREOUTID"/>,<bean:write id="resultset" property="COMM_STOREOUTVIEW/workItemID"/>,<bean:write id="resultset" property="COMM_STOREOUTVIEW/processInstID"/>,<bean:write id="resultset" property="COMM_STOREOUTVIEW/currentState"/>,\"<bean:write id="resultset" property="COMM_STOREOUTVIEW/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="COMM_STOREOUTVIEW/WFparticipant"/>\")'  ><SPAN class=\"linkOA\">办理</SPAN></a>");
                </SCRIPT>
                
                
				<fcc:wfoperator pageDom="resultset" pagePath="COMM_STOREOUTVIEW/participantExt">
									</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="COMM_STOREOUTVIEW/processInstID"/>','<bean:write id="resultset" property="COMM_STOREOUTVIEW/archiveTitle"/>','COMM_STOREOUT')">流程监控</a>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="COMM_STOREOUTVIEW/processInstID"/>','<bean:write id="resultset" property="COMM_STOREOUTVIEW/archiveTitle"/>')">流程日志</a>				
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
	loadOrderImg(document.forms[0],'COMM_STOREOUTVIEW');
</script>
<script type="text/javascript">
var userID = "<bean:write property="SessionEntity/userID"/>";
function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var stUrl = url+"?COMM_STOREOUT/STOREOUTID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
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