 <%@include file="/internet/common.jsp"%>

 <SCRIPT language="JavaScript" src="/internet/scripts/autoSelect2.js" ></SCRIPT>
<body>
<form method="post" action="oa.prAssetsManage.writeOffProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;资产管理—&gt;资产报废申请处理流程—&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_WRITEOFFVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_WRITEOFFVIEW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />

		<html:hidden property="WFWorkItem/submitType" />
		
		<html:hidden property="WFWorkItem/workItemID" />
		
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		
		
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		
		<html:hidden property="CAPT_WRITEOFF/WRITEOFFID"/> 
		<html:hidden property="CAPT_WRITEOFF/participant" />
		<html:hidden property="CAPT_WRITEOFF/passParticipant" />
		
       <html:hidden property="delId" />
		
		<!--传递给选择用品层的参数-->
		<html:hidden property="detailName"/>
		<html:hidden property="index"/>
		<html:hidden property="goodIDs" />
	  </td>
    </tr>
  </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8"></td>
      </tr>
      
        <tr>
          <td>
          
<!------------------------------  文头  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校资产报废申请</td>
				</tr>
			</table>
<!------------------------------  表单意见  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr> 
                  <td width="10%" align="right" class="td2">申请单编号：</td>
                  <td width="15%" class="td1">&nbsp;<bean:write property="CAPT_WRITEOFFVIEW/WRITEOFFCODE"/> </td>
                  <td width="10%" align="right" class="td2">申请日期：</td>
                  <td width="15%" class="td1">&nbsp; <bean:write property="CAPT_WRITEOFFVIEW/WRITEOFFDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%" align="right" class="td2">申请部门：</td>
                  <td width="15%"  class="td1">&nbsp; <bean:write   property="CAPT_WRITEOFFVIEW/DepName" /> </td>
                  <td  width="10%"  align="right" class="td2">申 请 人：</td>
                  <td  width="15%"  class="td1">&nbsp;<bean:write property="CAPT_WRITEOFFVIEW/RequestName" /> 
               
                  </td>
                </tr>
                <%String isRead=""; %>
               <logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
               <%isRead="disabled=\"true\""; %>
                <tr class="td2"> 
                  <td width="15%" align="right" class="td2">申请事由：</td>
                  <td  width="85%" class="td1" colspan="7"><bean:write property="CAPT_WRITEOFFVIEW/Reason" />
                  </td>
                </tr>
               </logic:notEqual>
              </table>
                <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
                <tr> <td valign="bottom" colspan="6" class="td1" align="center">
                <font style="font-size: 14;color: #FF9900;font-weight: bold;"  >采购申请明细</font>
               </td>
                </tr>
                
                </table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                  <tr class="td_title">
                  
                  <td width="25%" align="center">品名</td>
                  <td width="20%" align="center">编码</td>
                  <td width="20%" align="center">规格</td>
                  <td width="20%" align="center">单价（元）</td>
                  <td width="10%" align="center">备注</td>
                   <logic:equal property="WFWorkItem/activityDefID" value="DX1"><td width="5%" align="center">操作</td>  </logic:equal>
                </tr>
                
                     <%
		             int count=0;
		             int index=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[type='CAPT_WRITEOFFDETAILVIEW']"> 
                <%
					count++;
			       %>
              <tr class="td1"    id="row_<%=index%>">                
                
               <td nowrap >
               <input type="text" <%=isRead %> name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/CAPTNAME" onclick="selectGood(this,'<%=index%>')"  onkeyup="selectGood(this,'<%=index %>')" onblur="f_OnBlur()" style="width:100%;cursor: hand" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTNAME" />'/>
                <input type="hidden" id="goodID" name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/CAPTID" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTID"/>'/>
               
                 <input type="hidden"  name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/GOODNAME" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTNAME"/>'/>
               
                </td>
                <td nowrap ><input type="text" readOnly="true" name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/CAPTCODE" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTCODE"/>'/></td>
                <td nowrap ><input type="text" readOnly="true" name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/SPECIA" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/SPECIA"/>'/></td>
                <td nowrap ><input type="text" readOnly="true" name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/PRICE" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/PRICE"/>'/></td>
				<td nowrap >
				<input type="text" name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/REMARK" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/REMARK"/>' <%=isRead %>/>
				<input type="hidden"  name="listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='<%=index%>']/DETAILID" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/DETAILID"/>'/>
              </td>
				 <logic:equal property="WFWorkItem/activityDefID" value="DX1">
				 <td nowrap align="center"> <img  onClick="removeRowFromTable(document.all['listdetail'], 'row_<%=index%>','<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/DETAILID"/>')" src="/internet/image/delete1.gif" style="cursor: hand"></td>
				 </logic:equal>
				</tr>
				<%index++; %>
				</logic:iterate>
                
              </table>	
              
              <logic:equal property="WFWorkItem/activityDefID" value="DX1">
               <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr class="td2"> 
                  <td align="right" class="td2">申请事由：</td>
                  <td  class="td1"><textarea name="CAPT_WRITEOFF/Reason" rows="3" cols="80"><bean:write property="CAPT_WRITEOFF/Reason"/></textarea> 
                  </td>
                  <td align="center" valign="top" class="td1" >
				<input name="add" type="button" class="button_eight" value="增加资产输入栏"  onClick="insertDetail()">
				</td>
                </tr>
  </table>
          </logic:equal>     
              
              <table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="space">
				
      		</table>
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【部门负责人签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="CAPT_WRITEOFF/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【财务处签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX3" type="textarea" list="list[@type='wfdata']" domwfnode="CAPT_WRITEOFF/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【校领导签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX4" type="textarea" list="list[@type='wfdata']" domwfnode="CAPT_WRITEOFF/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
		</table>
<!------------------------------  流转  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="100%" align="left" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"  name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  	boolean display=true;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<%
		  	 String actDefID=base.util.TalentContext.getValue(pageContext,"resultset","Activity/actDefID");
		  	 String passedNode=base.util.TalentContext.getValue(pageContext,null,"ExtendData/PassedNode/Node");
		  	 if(actDefID.equals(passedNode)){
		  	 	if(i==0){
		  	 		display=false;
		  	 	}
		  	 %>
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> style="display: none;" >
		  	<%}else{ 
		  	%>
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
		  	<%} %>
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
         <logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
          <td class="td1">
		  <!--<html:text property="CAPT_WRITEOFF/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="CAPT_WRITEOFF/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CAPT_WRITEOFF/nextParticipantName','CAPT_WRITEOFF/nextParticipantId')">-->
		  <%if(display){ %>
		  <html:text property="CAPT_WRITEOFF/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CAPT_WRITEOFF/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CAPT_WRITEOFF/nextParticipantName','CAPT_WRITEOFF/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="CAPT_WRITEOFF/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CAPT_WRITEOFF/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CAPT_WRITEOFF/nextParticipantName','CAPT_WRITEOFF/nextParticipantId')">
		  <%} %>
		  </td>
        </tr>
        </logic:notEqual>
      </table>
<!------------------------------  文尾  ----------------------------->			
	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
		</table>

 </td></tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				   <logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  </logic:notEqual>
				  <%
				  	String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
				  	if ("DX2,DX3,DX4".indexOf(act)>=0){
				  %>
				  <input name="wfreturn" type="button" class="button_02" value=" 驳 回 " onClick="returnNode()">
				  <%} %>				
				  <logic:equal property="WFWorkItem/activityDefID" value="DX5">
				  <input name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
				  </logic:equal>
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="history.go(-1);"></td>
				</tr>
     </table>
</form>
<div id="pubLemma" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');"><bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script language="JavaScript" type="text/javascript">
var listName = "listInsert/CAPT_WRITEOFFDETAIL[@hciTagIndex='"; 



function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}

<% if ("DX2,DX3,DX4".indexOf(act)>=0){ %>
function returnNode(){
	var isSure = confirm('是否驳回申请?');
	if(isSure==true){
		var newValue='<bean:write property="ExtendData/PassedNode/Node"/>';
		selRadioByValue("Flow/nextNode",newValue);
		document.getElementById('CAPT_WRITEOFF/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('CAPT_WRITEOFF/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
				if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["CAPT_WRITEOFF/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}		
			getWFData(frm);
			frm.submit();	
		}

}
 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.writeOffList.do";
	frm.submit();
  }
</script><script language="javascript">
function menuControl(obj,show)
{
window.event.cancelBubble=true;
inputobj = event.srcElement;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+obj+")");
}
else
{
eval("hideMenu("+obj+")");
}


}

var nbottom=0,speed=11;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{var parent = event.srcElement;
obj.style.display="block";
//obj.style.clip="rect(0 0 0 0)";
obj.style.top = ylib_getPageY(parent)+18;
obj.style.left = ylib_getPageX(parent);
//nbottom=5;
//displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}

function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
 
function setValue(value) {
inputobj.value = inputobj.value + value;
}

// 从表格中删除id为rowId的行
	var selectedRowIndex;
	function removeRowFromTable(objTable, rowId,detailID) {
		
		var tableHTML = objTable.outerHTML; 
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
		
		//改变颜色
	    if (document.getElementById(selectedRowIndex)) {
	    document.getElementById(selectedRowIndex).style.backgroundColor="#FFFFFF"; }
	    selectedRowIndex = rowId;
		document.getElementById(rowId).style.backgroundColor="#999999";
		
	
	  if(confirm("确定删除该记录吗")==true){
		objTable.outerHTML = beforeHTML + latterHTML;
		
		if(detailID!=""){//if1
		var delId=document.forms[0].elements["delId"].value;
		  if(delId==""){
		    delId=detailID;
		  }else{
		    delId+=","+detailID
		  }
		}//end if1
	}//end confirm
	document.forms[0].elements["delId"].value=delId;
 
	}
	
		// 从表格中删除品名为空的行
	function removeRowNull(objTable) {
		var nullRowArr = new Array();
		var length = objTable.rows.length;
		for (var i=1; i< length; i++) {
    		rowObj = objTable.rows[i];
    		var rowId = rowObj.id;
    		var rowIndexId = rowId.substr(4, rowId.length-4);  
    		var goodName = listName + rowIndexId + "']/CAPTNAME";
           if (isEmpty(rowObj.all[goodName].value)) {
                nullRowArr[nullRowArr.length] = rowId;
          }	
    	}
      var tableHTML = objTable.outerHTML; 
   	  for(var i =0;i<nullRowArr.length;i++){
   	    rowId = nullRowArr[i];
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
   	  	tableHTML= beforeHTML + latterHTML;
   	  }
   	  objTable.outerHTML = tableHTML;
	}	
	
function getGoodIDs() {  //得到已加入的物品
	var goodIDs = document.all['goodID'];
	var goodIDArray = new Array();
	if(goodIDs != null) {
		if(typeof(goodIDs.length) == "undefined") {
			return document.all['goodID'].value;
		} else {
			for(var i=0 ;i< goodIDs.length ; i++) {
				if(goodIDs[i].value != ""){
					goodIDArray[i] = goodIDs[i].value;
				}
			}
		}
	}
	return goodIDArray.join();
}
	
	 /*选择物品
  */
   function selectGood(obj,index) {  //选择物品
  
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "CAPT_WRITEOFFDETAIL";
	frm["index"].value = index;
	frm["goodIDs"].value = goodIDs;
	f_InitDivData(obj); //此函数在autoSelect文件中
}
	
	 // 增加明细表记录
function insertDetail() {
		var objTable = document.all['listdetail']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "CAPTNAME"; 
		nameArray[i++] = "CAPTCODE";
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "PRICE";
		nameArray[i++] = "REMARK";
		nameArray[i++] = "OP";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = 0;  //递增索引号
	
	
	function countRow(){
	var count=0;
	 var items=document.forms[0].elements;
	
	 for(var i=0;i<items.length;i++){
	    var obj=items[i];
	    if(obj.id=="goodID"){
	      count++;
	    }
	 }
	 checkboxIndex=count;
	}
	
	function addRecordToTable(objTable, nameArray) {
	countRow();
	
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\" onClick='changeTRBgColor(this)'>";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			
			switch (i) {
			case  0: // 资产名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/CAPTNAME\"     onclick=\"selectGood(this,"+checkboxIndex+")\"  onkeyup=\"selectGood(this,"+checkboxIndex+")\" onblur=\"f_OnBlur()\"  style=\"width:100% ;cursor:hand\" class=\"inputOA\"  readonly/>";
		  		colHTML += "<input type=\"hidden\" id=\"goodID\" name=\"" + listName + checkboxIndex + "'" + "]/CAPTID\"  />";
		  		colHTML += "<input type=\"hidden\"  name=\"" + listName + checkboxIndex + "'" + "]/GOODNAME\"  />";
		  		break;
		    case 4: //备注
				colHTML += "<td  nowrap>";//alert(i+" "+nameArray[i]);
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" maxlength=\"25\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
		    case 5: //操作
				colHTML += "<td  nowrap align=\"center\">";
				colHTML += "<img  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+ checkboxIndex + "','')\" src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
				break;	
			default:
				colHTML += "<td  nowrap>";//alert(i+" "+nameArray[i]);
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"    style=\"width:100%\" class=\"inputOA\" readonly/>";
				break;
			}
			
			colHTML += "</td>";//alert(colHTML);
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;//alert(formHTML);
		var objTable = document.all['listdetail']; // 明细表
		
		// 递增 checkboxIndex
		checkboxIndex ++ ;
	}
</script>