<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<script type="text/javascript">
		function getKnowledge() {
		var table=document.getElementById('knowledgeList');
		var row=table.rows.length;
		if(row>1){
			for(var i=row;i>1;i--){
				table.deleteRow(i-1);
			}
		}
		document.getElementById('keyWordsLabel').innerText='相关知识关键字:'
		var sub = new HiddenSubmit('OMM.bizKownledgeBase.bizGetKnowledgeBaseByKeyWord');
		var temp=document.getElementById('title').value;
		sub.add("OMM_Request/Title", temp);
		if (sub.submit()) {
			var keyword=sub.getValues("root/data/keyword");
			document.getElementById('keyWordsLabel').innerText='相关知识关键字:'+keyword;
			if (sub.getValues("root/data/list/entity").length<1) {
			} else{
				for (var i=0;i<sub.getValues("root/data/list/entity").length;i++) {
					var id=sub.getValues("root/data/list/entity[@rowNum='"+i+"']/KnowledgeBaseID");
					var sn=sub.getValues("root/data/list/entity[@rowNum='"+i+"']/KnowledgeSN");
					var title=sub.getValues("root/data/list/entity[@rowNum='"+i+"']/Title");
					var keyWords=sub.getValues("root/data/list/entity[@rowNum='"+i+"']/KeyWords");
					var description=sub.getValues("root/data/list/entity[@rowNum='"+i+"']/Description");
					var processMethod=sub.getValues("root/data/list/entity[@rowNum='"+i+"']/ProcessMethod");
					add_r(id,sn,title,keyWords,description,processMethod);
				}
			}
		}
	}
	
	function getTitle(tempTitle){
		document.getElementById('title').value=tempTitle;
		getKnowledge();
	}

	function add_r(id,sn,title,keyWords,description,processMethod) {
		var t=document.getElementById("knowledgeList");
		t.insertRow(1);
		if(t.rows.length%2==0){
			t.rows[1].className="td2";
		}else{
			t.rows[1].className="td1";
		}
    	for(var k=0;k<6;k++){
			t.rows[1].insertCell(0);
		}
		t.rows[1].cells[0].innerHTML=sn;
		t.rows[1].cells[0].align="center";
		t.rows[1].cells[1].innerHTML=title;
		t.rows[1].cells[1].align="center";
		t.rows[1].cells[2].innerHTML=keyWords;
		t.rows[1].cells[2].align="center";
		t.rows[1].cells[3].innerHTML=description;
		t.rows[1].cells[3].align="center";
		t.rows[1].cells[4].innerHTML=processMethod;
		t.rows[1].cells[4].align="center";
		t.rows[1].cells[5].innerHTML="<a href='OMM.prKnowledgeBase.prGetKnowledgeById.do?OMM_KnowledgeBase/KnowledgeBaseID="+id+"&op=edit' >详细</a>";
		t.rows[1].cells[5].align="center";	
	}</script>
<body>
<input name="title" type="hidden" value=""/>
<form method="post" action="OMM.prRequest.prRequestList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">运维管理—&gt;运维列表</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="OMM.prRequest.prRequestList.do">
		<input type="hidden" name="addaction" value="OMM.prRequest.prRequestAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="OMM.prRequest.prRequestDel.do">
		<input type="hidden" name="viewaction" value="OMM.prRequest.prRequestView.do">
		<html:hidden property="OMM_Request/_order/col1/field"/>
		<html:hidden property="OMM_Request/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		<INPUT value="like" type="hidden" name="OMM_Request/Title/criteria/operator">
		<INPUT value="center" type="hidden" name="OMM_Request/Title/criteria/likeRule">
		<INPUT value="like" type="hidden" name="OMM_Request/ReqSN/criteria/operator">
		<INPUT value="center" type="hidden" name="OMM_Request/ReqSN/criteria/likeRule">
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
	  	<td class="text">
				<!--<input name="add" type="button" class="button_02" value="申请" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="终止" onClick="talentdelete()"> -->
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
                  <td width="11%" align="center" nowrap id="OMM_Request.ReqSN" onClick="talentsort()">请求编号</td>
                  <td width="18%" align="center" nowrap id="OMM_Request.Title" onClick="talentsort()">标题</td>
                  <td width="8%" align="center" nowrap id="OMM_Request.Urgency" onClick="talentsort()">紧急程度</td>
                  <td width="12%" align="center" nowrap id="OMM_Request.CreateTime" onClick="talentsort()">创建时间</td>
                  <td width="18%" align="center" >当前环节（状态）</td>
                  <td width="18%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  			int index=0;
		  		%>
                <logic:iterate id="resultset" property="list[@type='OMM_Request']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this);getTitle('<bean:write id='resultset' property='OMM_Request/Title'/>')" >  
                <td align="center"> 
					<logic:present  id="resultset" property="OMM_Request/RequestID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/OMM_Request/RequestID" property="OMM_Request/RequestID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap align="center">&nbsp;
                <bean:write id="resultset" property="OMM_Request/ReqSN"/>
                </td>
                <td nowrap align="center" title="<bean:write id='resultset' property='OMM_Request/Title'/>">&nbsp;<bean:write id="resultset" property="OMM_Request/Title" maxLength="20"/>
                <%
                	if(count==1){
                	%>
                	<SCRIPT>
                		document.getElementById('title').value='<bean:write id="resultset" property="OMM_Request/Title"/>';
                	</SCRIPT>
                	<%
                	}
                 %>
                </td>
                <td nowrap align="center">&nbsp;
					<SCRIPT type="text/javascript">
					var temp='<bean:write id="resultset" property="OMM_Request/Urgency"/>';
					if(temp==1) temp='一般';
					if(temp==2) temp='紧急';
					if(temp==3) temp='特急';
					document.write(temp);
					</SCRIPT>
				</td>
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="OMM_Request/CreateTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="OMM_Request/workItemName"/>(
                <SCRIPT type="text/javascript">
					var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
					if(temp==1) temp='草稿';
					if(temp==2) temp='等待验证';
					if(temp==3) temp='拒绝受理';
					if(temp==4) temp='已受理';
					if(temp==5) temp='已完成';
					document.write(temp);
					</SCRIPT>
                )
                </td>
                <td nowrap align="center">&nbsp;
                <fcc:wfoperator pageDom="resultset" pagePath="OMM_Request/participantExt">
					<a  href='javascript:doProcess("<bean:write id="resultset" property="OMM_Request/actionURL"/>",<bean:write id="resultset" property="OMM_Request/RequestID"/>,<bean:write id="resultset" property="OMM_Request/workItemID"/>,<bean:write id="resultset" property="OMM_Request/processInstID"/>,<bean:write id="resultset" property="OMM_Request/currentState"/>,"<bean:write id="resultset" property="OMM_Request/WFparticipant"/>","<fcc:toname dom="resultset" path="OMM_Request/WFparticipant"/>")'  >
					<SPAN style="color:red;">办理</SPAN>
					</a>
				<a id="showImg<%=count %>" href="#" onclick="getWfImage('<bean:write id="resultset" property="OMM_Request/processInstID"/>','<bean:write id="resultset" property="OMM_Request/Title"/>','sendArchive')">流程监控</a>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="OMM_Request/processInstID"/>','<bean:write id="resultset" property="OMM_Request/Title"/>')">流程日志</a>
				</fcc:wfoperator>
				</td>
              </tr>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="text">
			  <script>
				PageCond(document.forms[0]);
		  	  </script>
			  </td>
            </tr>			 
          </table>		  
		  </td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<DIV id="keyWordsLabel" style="color:red;">相关知识关键字:</DIV>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="knowledgeList">
									<tr class="td_title">
										<td width="10%" align="center" nowrap id="OMM_KnowledgeBase.KnowledgeBaseSN" onClick="talentsort()">知识编号</td>
										<td width="20%" align="center" nowrap id="OMM_KnowledgeBase.Title" onClick="talentsort()">标题</td>
										<td width="10%" align="center" nowrap id="OMM_KnowledgeBase.KeyWords" onClick="talentsort()">关键字</td>
										<td width="25%" align="center">描述</td>
										<td width="30%" align="center">处理方法</td>
										<td width="5%" align="center">操作</td>
									</tr>
</table>
</body>

<script>
	loadOrderImg(document.forms[0],'OMM_Request');
var userID = "<bean:write property="SessionEntity/userName"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("你确认要办理该项工作事项吗？")==false){
				return ;
			} 
		}
		var stUrl = url+"?OMM_Request/RequestID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
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
	
try{	
document.getElementById("showImg1").click();
}catch(err){
}
	getKnowledge();
	
	
</script>