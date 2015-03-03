<%@include file="/internet/common.jsp"%>

 <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>

<body>
<form method="post" action="oa.prAssetsManage.purchaseList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产采购申请列表</span>
 			 <logic:equal property="temptype" value="0">（全部）</logic:equal>
             <logic:equal property="temptype" value="1">（待办理）</logic:equal>
             <logic:equal property="temptype" value="2">（已办理）</logic:equal>
 			
 			</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.purchaseList.do">
		<input type="hidden" name="addaction" value="oa.prAssetsManage.purchaseAdd.do">
		<input type="hidden" name="deleteaction" value="oa.prAssetsManage.purchaseDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.purchaseView.do">
	
		<html:hidden property="CAPT_PURCHASEVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_PURCHASEVIEW/_order/col1/asc" />
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
					<a title="申请单编号,申请部门，申请人,资产名称,资产编码 ">关键字：</a>
				<html:text property="CAPT_PURCHASEVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_PURCHASEVIEW/searchField" value="PURCHASECODE,DepName,RequestName,ZCNC"/>
				 
				申请日期： 从<html:text property="CAPT_PURCHASEVIEW/PURCHASEDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_PURCHASEVIEW/PURCHASEDATE/criteria/min"],"yyyy-MM-dd")>
           到 <html:text property="CAPT_PURCHASEVIEW/PURCHASEDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_PURCHASEVIEW/PURCHASEDATE/criteria/max"],"yyyy-MM-dd")>
			<html:hidden property="CAPT_PURCHASEVIEW/PURCHASEDATE/criteria/operator" value="between" />	
			<html:hidden property="CAPT_PURCHASEVIEW/PURCHASEDATE/criteria/criteriaPattern" value="yyyy-MM-dd" />	

			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentsearch()">
			服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> <br/>
              	<qx:talentButton property="add" type="button" styleClass="button_eight" value="填写申请单" onclick="talentadd()" operation="DX_OASYS_ASSETSMANAGE_PURCHASE.DX_OASYS_ASSETSMANAGE_PURCHASE_ADD" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_ASSETSMANAGE_PURCHASE.DX_OASYS_ASSETSMANAGE_PURCHASE_DEL" />
              	<input name="delete" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="CAPT_PURCHASEVIEW.PURCHASECODE" onClick="talentsort()">申请编号</td>
                  <td width="10%" align="center" nowrap id="CAPT_PURCHASEVIEW.PURCHASEDATE" onClick="talentsort()">申请日期</td>
                  <td width="10%" align="center" nowrap id="CAPT_PURCHASEVIEW.DepName" onClick="talentsort()">申请部门</td>
                  <td width="10%" align="center" nowrap id="CAPT_PURCHASEVIEW.RequestName" onClick="talentsort()">申请人</td>
                  <td width="20%" align="center" nowrap id="CAPT_PURCHASEVIEW.ZCNC" onClick="talentsort()">资产名称[编码]</td>
                  <td width="20%" align="center" nowrap id="CAPT_PURCHASEVIEW.participant" onClick="talentsort()">当前操作人</td>
                  <td width="7%" align="center" >当前环节</td>
                  <td width="10%" align="center" nowrap >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CAPT_PURCHASEVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="CAPT_PURCHASEVIEW/PURCHASEID"/>','true')">  
                <td align="center"  > 
					<logic:present  id="resultset" property="CAPT_PURCHASEVIEW/PURCHASEID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_PURCHASEVIEW/PURCHASEID" property="CAPT_PURCHASEVIEW/PURCHASEID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_PURCHASEVIEW/PURCHASECODE"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_PURCHASEVIEW/PURCHASEDATE"  formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_PURCHASEVIEW/DepName"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_PURCHASEVIEW/RequestName"/></td>
                <td nowrap title="<bean:write id="resultset" property="CAPT_PURCHASEVIEW/ZCNC"/>">&nbsp;<bean:write id="resultset" property="CAPT_PURCHASEVIEW/ZCNC" maxLength="15"/></td>
              	<td nowrap >&nbsp;<fcc:toname dom="resultset" path="CAPT_PURCHASEVIEW/participant"/>				</td>
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="CAPT_PURCHASEVIEW/workItemName"/></td>
				 <td nowrap>&nbsp;
				 <SCRIPT>
                	var tmp=<bean:write property="temptype"/>;
                	if(tmp==1)
                		document.write("<a  href='javascript:doProcess(\"<bean:write id="resultset" property="CAPT_PURCHASEVIEW/actionURL"/>\",<bean:write id="resultset" property="CAPT_PURCHASEVIEW/PURCHASEID"/>,<bean:write id="resultset" property="CAPT_PURCHASEVIEW/workItemID"/>,<bean:write id="resultset" property="CAPT_PURCHASEVIEW/processInstID"/>,<bean:write id="resultset" property="CAPT_PURCHASEVIEW/currentState"/>,\"<bean:write id="resultset" property="CAPT_PURCHASEVIEW/WFparticipant"/>\",\"<fcc:toname dom="resultset" path="CAPT_PURCHASEVIEW/WFparticipant"/>\")'  ><SPAN class=\"linkOA\">办理</SPAN></a>");
                </SCRIPT>
				 
				 
				<fcc:wfoperator pageDom="resultset" pagePath="CAPT_PURCHASEVIEW/participantExt">
									</fcc:wfoperator>
				<a href="#" onmousedown="getWfImage('<bean:write id="resultset" property="CAPT_PURCHASEVIEW/processInstID"/>','<bean:write id="resultset" property="CAPT_PURCHASEVIEW/archiveTitle"/>','CAPT_PURCHASE')">流程监控</a>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="CAPT_PURCHASEVIEW/processInstID"/>','<bean:write id="resultset" property="CAPT_PURCHASEVIEW/archiveTitle"/>')">流程日志</a>				
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
<input type="hidden" name="title" value="资产采购信息列表">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'CAPT_PURCHASEVIEW');
</script>

<script type="text/javascript">
var userID = "<bean:write property="SessionEntity/userID"/>";
function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var stUrl = url+"?CAPT_PURCHASE/PURCHASEID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
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