<%@include file="/internet/common.jsp"%>
<script>
//得到计量单位SELECT
function createUnitOption(name){
var result = "";
	result += "<select name=\""+name+"\" style=\"width:100%\" >";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	return result;

}

</script>

<body>
<form method="post" action="oa.prThingsManage.purchaseProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;用品管理—&gt;用品采购申请处理流程—&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="COMM_PURCHASE/_order/col1/field"/>
		<html:hidden  property="COMM_PURCHASE/_order/col1/asc" />
		
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
		
		<html:hidden property="COMM_PURCHASE/PURCHASEID"/> 
		<html:hidden property="COMM_PURCHASE/participant" />
		<html:hidden property="COMM_PURCHASE/passParticipant" />
		
		
		<html:hidden property="listInsert" />
		<html:hidden property="listOld" />
		

		
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校用品采购申请单</td>
				</tr>
			</table>
<!------------------------------  表单意见  ----------------------------->
            <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr> 
                  <td align="right" width="10%" class="td2">申请单编号：</td>
                  <td width="10%" class="td1"><bean:write property="COMM_PURCHASEVIEW/PURCHASECODE"/>  </td>
                  <td width="10%" align="right" class="td2">申请日期：</td>
                  <td width="10%" class="td1"><bean:write  property="COMM_PURCHASEVIEW/PURCHASEDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                   <td width="10%" align="right" class="td2">申请部门：</td>
                  <td width="10%" class="td1" nowrap="nowrap"> <bean:write  property="COMM_PURCHASEVIEW/BRANCHNAME"/></td>
                  <td width="10%" align="right" class="td2">申 请 人：</td>
                  <td width="*" class="td1"><bean:write  property="COMM_PURCHASEVIEW/PROPOSERNAME"/> </td>
              </table>
			
                            <table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
				            
		
              <td align="right" height="30">
                &nbsp; </td>
            </tr>
			</table>
			                 <%
		             int count=0;
			         String trClass = ""; 
		  
		  		%>
              <logic:greaterThan property="rowNum2" value="0">
			<table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
				            
		     <td align="center" class="td1">
		     计划采购用品</td> 
            </tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
               <logic:notEqual property="COMM_PURCHASE/activityDefID" value="DX1">    
                <tr class="td_title">
				  <td width="5%" align="center">序号</td>
                  <td width="25%" align="center">品名</td>
                  <td width="10%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="10%" align="center">数量</td>
                   <td width="10%" align="center">单位</td>
                  <td width="15%" align="center">合计（元）</td>
                  <td width="15%" align="center">备注</td>
                </tr>

		  		
		  		
                      <logic:iterate id="detail" property="list[@type='COMM_PURCHASEDETAILVIEW']">
                        <%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
                         <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
                          <td  nowrap="nowrap" align="center">&nbsp;<%=count %></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/COMMNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/SPECIA"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/PRICE"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/QUANTITY"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/UNITNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/AMOUNT"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/REMARK"/></td>
                        </tr>
                      </logic:iterate>
                      </logic:notEqual>
              </table>	
               </logic:greaterThan>
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【部门负责人签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【财务处签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX3" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【校领导签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX4" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
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
		  <!--<html:text property="COMM_PURCHASE/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="COMM_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','COMM_PURCHASE/nextParticipantName','COMM_PURCHASE/nextParticipantId')">-->
		  <%if(display){ %>
		  <html:text property="COMM_PURCHASE/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="COMM_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','COMM_PURCHASE/nextParticipantName','COMM_PURCHASE/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="COMM_PURCHASE/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="COMM_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','COMM_PURCHASE/nextParticipantName','COMM_PURCHASE/nextParticipantId')">
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
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
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
var listName = "listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='"; 
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
		document.getElementById('COMM_PURCHASE/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('COMM_PURCHASE/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
				if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["COMM_PURCHASE/nextParticipantId"].value == ""){
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
  	frm.action = "oa.prThingsManage.purchaseList.do";
	frm.submit();
  }

</script>


<script>
function displayLayer(obj,layerID){
	hiddenLayer('popupArea','popupFuntype','popupSubfuntype','popupIndustry','popupIssuedate');
	
	var dv = document.getElementById(layerID);
	
	GetCenterXY_ForLayer(dv);
	DivSetVisible(dv);

	//dv.style.visibility = "visible";
}

function hiddenLayer(){
	var argArr = hiddenLayer.arguments;
	
	showElementAll();
	//var IfrRef = document.getElementById('DivShim');
	//IfrRef.style.display = "none";
	
	for(var i=0;i<argArr.length;i++){
		eval(argArr[i]).style.visibility = "hidden";
	}
}

//将悬浮层的位置定位在屏幕中央
function GetCenterXY_ForLayer(objdiv){
	x = document.body.scrollLeft;
	y = document.body.scrollTop;
	
	//获取屏幕宽度
	availWidth = parseInt(window.screen.availWidth);
	availHeight = parseInt(window.screen.availHeight);
	
	tblWidth = parseInt(objdiv.width);
	
		
	y = y + availHeight/4;
	x = (availWidth - tblWidth)/2;
	
	objdiv.style.top = y;
	objdiv.style.left = x;
}
</script>
<script language="javascript">
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
	function returnNameNull(i){
 var frm = document.forms[0];
 var v_radios = frm.elements["COMM_PURCHASE/nextParticipantName"];
 
 v_radios.value="";
}

</script>