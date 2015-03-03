<%@include file="/internet/common.jsp"%>

<script>
//得到计量单位SELECT
function createUnitOption(name){
var result = "";
	result += "<select name=\""+name+"\" style=\"width:100%\" class=\"inputOA\" >";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	return result;

}
</script>
<body>
<form method="post" action="oa.prAssetsManage.purchaseProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;资产管理—&gt;资产采购申请处理流程—&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_PURCHASEVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_PURCHASEVIEW/_order/col1/asc" />
		<html:hidden  property="CAPT_PURCHASEVIEW/PURCHASEID" />
		
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
		
		<html:hidden property="CAPT_PURCHASE/PURCHASEID"/> 
		<html:hidden property="CAPT_PURCHASE/participant" />
		<html:hidden property="CAPT_PURCHASE/passParticipant" />
		
        <html:hidden property="delId" />
		
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校资产采购申请</td>
				</tr>
			</table>
<!------------------------------  表单意见  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr> 
                  <td width="10%"  align="right" class="td2">申请单编号：</td>
                  <td width="10%" class="td1">&nbsp;<bean:write property="CAPT_PURCHASEVIEW/PURCHASECODE"/>  </td>
                  <td width="10%" align="right" class="td2">申请日期：</td>
                  <td width="10%" class="td1">&nbsp; <bean:write property="CAPT_PURCHASEVIEW/PURCHASEDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%"  align="right" class="td2">申请部门：</td>
                  <td width="20%"  class="td1">&nbsp; <bean:write   property="CAPT_PURCHASEVIEW/DepName" /> </td>
                  <td width="10%"  align="right" class="td2">申 请 人：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="CAPT_PURCHASEVIEW/RequestName" /> 
               
                  </td>
                </tr>
                 <%String isRead=""; %>
               <logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
                   <% isRead="disabled"; %>
               	<tr class="td2"> 
                  <td width="10%" align="right" class="td2">申请事由：</td>
                  <td colspan="7" class="td1"><bean:write property="CAPT_PURCHASEVIEW/Reason" />
                  </td>
                </tr>
               </logic:notEqual>
              </table>
                 <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
                <tr> <td valign="bottom" colspan="8" class="td1" align="center"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >采购申请明细</font></td></tr>
                </table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
               
                <tr class="td_title">
				 
                  <td width="25%" nowrap="nowrap" align="center">品名</td>
                  <td width="10%" nowrap="nowrap" align="center">计量单位</td>
                  <td width="20%" nowrap="nowrap" align="center">规格</td>
                  <td width="10%" nowrap="nowrap" align="center">数量</td>
                  <td width="10%" nowrap="nowrap" align="center">供应商1报价</td>
                  <td width="10%" nowrap="nowrap" align="center">供应商2报价</td>
                  <td width="10%" nowrap="nowrap" align="center">供应商3报价</td>
                  <logic:equal property="WFWorkItem/activityDefID" value="DX1"><td width="10%" nowrap="nowrap" align="center">操作</td></logic:equal>
                </tr>
                 <%
		           int count=0;
			         String trClass = ""; 
			         String unitName="";
		             String unit="";
		             String selected="";
		  		%>
		  		
		  		
                      <logic:iterate id="resultset" property="list[@type='CAPT_PURCHASEDETAIL']">
                        <%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	   try{ 
			       	    unitName=base.util.TalentContext.getValue(pageContext,"resultset","CAPT_PURCHASEDETAIL/UNITCODE");
			       	    }catch(Exception e){
			       	     System.out.println("====errors:"+e);
			       	    }
			       
			       %>
                         <tr class="td1"    id="row_<%=count%>">
                <td nowrap ><input type="text" <%=isRead %> id="goodName" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/CAPTNAME"  style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/CAPTNAME" />'/> </td>
                <td nowrap >
            <select style="width:100%" <%=isRead %> class="inputOA" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/UNITNAME" >
           <logic:iterate id="unitList" property="list[type='Unit']">
            <% 
              selected="";
            try{ 
			       	    unit=base.util.TalentContext.getValue(pageContext,"unitList","Unit/businID");
			       	    }catch(Exception e){
			       	     System.out.println("====errors:"+e);
			       	    }
			//System.out.println("=================unit:"+unit+"============unitName:"+unitName);       	    
			       if(unit!=null&&unitName!=null&&unit.equals(unitName)){
			       	 selected="selected";
			       	}    
			     %>			    
               <option value='<bean:write id="unitList" property="Unit/businID"/>' <%=selected %>><bean:write id="unitList" property="Unit/businName"/></option>
           </logic:iterate>
            </select>
                </td>
                <td nowrap ><input type="text" <%=isRead %> name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/SPECIA" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/SPECIA"/>'/></td>
                <td nowrap ><input type="text" <%=isRead %> name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/QUANTITY" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/QUANTITY"/>'/></td>
                <td nowrap ><input type="text" <%=isRead %> name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE1" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE1"/>'/></td>
				<td nowrap ><input type="text" <%=isRead %> name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE2" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE2"/>'/></td>
				<td nowrap >
				<input type="text" <%=isRead %> name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE3" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE3"/>'/>
				<input type="hidden"  name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/DETAILID" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/DETAILID"/>'/>
				</td>
				 <logic:equal property="WFWorkItem/activityDefID" value="DX1">
				<td nowrap align="center"><img  onClick='removeRowFromTable(document.all["listdetail"], "row_<%=count %>","<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/DETAILID"/>")' src="/internet/image/delete1.gif" style="cursor: hand"></td>
				 </logic:equal>
				</tr><%	count++; %>
                      </logic:iterate>
                
              </table>	
                <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                  <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="1" >
       		<tr class="td2"> 
                  <td align="right" nowrap="nowrap" class="td2">申请事由：</td>
                  <td colspan="7" class="td1"><textarea name="CAPT_PURCHASE/Reason" rows="3" cols="80"><bean:write property="CAPT_PURCHASE/Reason"/></textarea> 
                  </td>

                  <td align="center" valign="top" class="td1" >
				<input name="add" type="button" class="button_eight" value="增加资产输入栏"  onClick="insertDetail()">
				</td>
                </tr>
  		</table>
                </logic:equal>     
              
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【部门负责人签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="CAPT_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【财务处签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX3" type="textarea" list="list[@type='wfdata']" domwfnode="CAPT_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【校领导签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX4" type="textarea" list="list[@type='wfdata']" domwfnode="CAPT_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
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
          <%if(display){ %>
		  <html:text property="CAPT_PURCHASE/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CAPT_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CAPT_PURCHASE/nextParticipantName','CAPT_PURCHASE/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="CAPT_PURCHASE/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CAPT_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CAPT_PURCHASE/nextParticipantName','CAPT_PURCHASE/nextParticipantId')">
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
				  <input name="wfsend" type="button" class="button_02" value=" 发 送 " onClick="send()">
				  </logic:notEqual>				  
				  <logic:equal property="WFWorkItem/activityDefID" value="DX5"> 
				    <input name="wfsend" type="button" class="button_02" value=" 结束流程 " onClick="send()">
				  </logic:equal>
				  <%
				  	String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
				  	if ("DX2,DX3,DX4".indexOf(act)>=0){
				  %>
				  <input name="wfreturn" type="button" class="button_02" value=" 驳 回 " onClick="returnNode()">
				  <%} %>
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
 var listName = "listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='"; 

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
		document.getElementById('CAPT_PURCHASE/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('CAPT_PURCHASE/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
				if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["CAPT_PURCHASE/nextParticipantId"].value == ""){
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
  	frm.action = "oa.prAssetsManage.purchaseList.do";
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





  // 校验表单数据的合法性
    function verifyForm(frm)
    {
    	var frm = document.forms[0];
    	var objTable = document.all['listdetail'];  
    	var rowIndexId = 0;
    	var rowObj;
    	removeRowNull(objTable);
    	objTable = document.all['listdetail'];    	
    	if (objTable.rows.length <= 1) {
    		alert("至少要有一条明细！");
    		return false;
    	}
		for (var i=1; i<objTable.rows.length; ++i) {
    		rowObj = objTable.rows[i];
    		var rowId = rowObj.id;
    		rowIndexId = rowId.substr(4, rowId.length-4);  
    		if (!verifyEachRow(rowObj, rowIndexId)) 
    			return false;
    	}
    	return true;
    }
    // 检查每一行的合法性
    function verifyEachRow(rowObj, rowIndexId) {
    	var quantityName = listName + rowIndexId + "']/QUANTITY";
    	var commName = listName + rowIndexId + "']/CAPTNAME";
    	var price1 = listName + rowIndexId + "']/PRICE1";
    	var price2 = listName + rowIndexId + "']/PRICE2";
    	var price3 = listName + rowIndexId + "']/PRICE3";
    	
       // 品名
        if (isEmpty(rowObj.all[commName].value)) {
        	alert("品名不能为空");
        	return false;	
        }
    	// 数量
        if (!isNumeric(rowObj.all[quantityName].value)||isEmpty(rowObj.all[quantityName].value)) {
        	alert("数量不能为空且必须是数字");
        	return false;	
        }
            	// 报价
        if (!isNumeric(rowObj.all[price1].value)||!isNumeric(rowObj.all[price2].value)||!isNumeric(rowObj.all[price3].value)) {
        	alert("报价不能有字母");
        	return false;	
        }
        return true;
    }
    
    // 判断一个项是否在一个数组中存在
    function isArrayItem(arr, itemID, itemName) {
    	var len = arr.length;
    	var isFlag = false;
    	for (var i=0; i<len; ++i) {
    		if ((arr[i][0]==itemID && arr[i][2]!=itemName)) {
    			isFlag = false;
    			break;
    		}
    		if ((arr[i][0]==itemID && arr[i][2]==itemName)) {
    			isFlag = true;
    			break;
    		}
    	}
    	
    	return isFlag;
    }
    
function countRow(){
	var count=0;
	 var items=document.forms[0].elements;
	
	 for(var i=0;i<items.length;i++){
	    var obj=items[i];
	    if(obj.id=="goodName"){
	      count++;
	    }
	 }
	 checkboxIndex=count;
	}
	
 // 增加明细表记录
	function insertDetail() {
		
		var objTable = document.all['listdetail']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "CAPTNAME"; 
		nameArray[i++] = "UNITCODE";
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "QUANTITY";
		nameArray[i++] = "PRICE1";
		nameArray[i++] = "PRICE2";
		nameArray[i++] = "PRICE3";
		nameArray[i++] = "OP";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = 0;  //递增索引号
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
			case  0: // 用品名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" id=\"goodName\" name=\"" + listName + checkboxIndex + "'" + "]/CAPTNAME\"  style=\"width:100%\" class=\"inputOA\" />";
		  		break;
		  		
		  case  1: //单位
				colHTML += "<td  nowrap>";
				colHTML += createUnitOption(listName + checkboxIndex + "'" + "]/" + nameArray[i] );
				break;
		 case 7: //操作
				colHTML += "<td  nowrap align=\"center\">";
				colHTML += "<img  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+checkboxIndex+"','')\" src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
				break;	
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName+ checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\" />";
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['listdetail']; // 明细表
		
		// 递增 checkboxIndex
		checkboxIndex ++ ;
	}
		// 删除明细表记录
	function deleteDetails() {
		var objForm = document.forms[0];
    	var rowArray = new Array;
    	// 遍历objForm中所有的控件，但只是对checkbox进行处理
    	// 找出选中的checkbox，因为checkbox的value中记录了它所在行的id
    	for (var i=0; i<objForm.length; ++i) {
    		if (objForm.elements[i].type == "checkbox" && 
    		    objForm.elements[i].checked == true && objForm.elements[i].name != "chkall") {
    			rowArray[rowArray.length] = objForm.elements[i].value;
    		}
    	}
		if (rowArray.length == 0) {
			alert("至少必须选择一行！");
    		return;
		}
		
		if(confirm("是否确定删除指定记录？") == false) { 
			return ;
		}  
		
		// 遍历rowArray，然后删除每一条入库单明细表记录
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // 入库单明细表
			var rowId = "row_" + rowArray[i]; 
			removeRowFromTable(objTable, rowId);
		}
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
		
	if(confirm("确定删除该记录吗")==true){//confirm
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
</script>