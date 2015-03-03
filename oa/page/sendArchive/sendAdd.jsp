<%@include file="/internet/common.jsp"%>
<link href="/internet/css/autoFinish.css" rel="stylesheet" type="text/css">

<%
String userName = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");
%>
<script>
var inputobj;
var tabbox1 = new TabComponent("tab1c")
tabbox1.add("basedata","基础数据",1,"document.getElementById('tail').style.display = 'inline'");
tabbox1.add("attachment","正 文",0,"document.getElementById('tail').style.display = 'none'");
</script>

<script>
var i=1 
 function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='删 除' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
	}
</script> 


<body>
<form method="post" name="myform" action="oa.prSendArchive.sendAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;发文管理—&gt;新增发文</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="SendArchive/RecordID"/>
		<html:hidden property="SendArchive/_order/col1/asc" />
		<html:hidden property="SendArchive/_order/col1/field"/>
		
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="WFWorkItem/submitType" />
		<html:hidden property="WFWorkItem/workItemID" />
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		
		
		
	  </td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>
			<!------------------------------  文头  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校发文呈批表</td></tr>
			</table>
			<!------------------------------  表单意见  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td height="25" align="center" nowrap class="td1">发文标题：</td>
				<td colspan="8" nowrap class="td1">&nbsp;<html:text property="SendArchive/archiveTitle" styleClass="inputOA" maxlength="200" attributesText='style="width:98%;" ValidateType="notempty" Msg="文件标题不能为空"' /></td>
			  </tr>
			  <tr>
				<td width="6%" align="center" nowrap class="td1">密级：</td>
				<td width="12%" nowrap class="td1">&nbsp;<html:select property="SendArchive/secretLevel"> 
				  <html:option value="0">公开</html:option> <html:option value="1">秘密</html:option> 
				  <html:option value="2">机密</html:option> <html:option value="3">绝密</html:option> 
				  </html:select> </td>
				<td width="6%" align="center" nowrap class="td1">缓急程度：</td>
				<td width="13%" nowrap class="td1">&nbsp;<html:select property="SendArchive/timeLevel"> 
				  <html:option value="0">正常</html:option> <html:option value="1">稍急</html:option> 
				  <html:option value="2">紧急</html:option> <html:option value="3">特急</html:option> 
				  </html:select>
				</td>
				<td width="6%" height="25" align="center" nowrap class="td1">发文机关：</td>
				<td nowrap width="15%" class="td1">&nbsp;<html:text property="SendArchive/sendOrgan" maxlength="25" styleClass="inputOA" attributesText='style="width:95%;" ValidateType="notempty" Msg="发文机关不能为空"' onmousedown="menuControl('sendOrgan',1)" onmouseout="menuControl('sendOrgan',0)"/> 
				</td>
			  </tr>
			  <tr>
				<td width="6%" align="center" nowrap class="td1">拟稿部门：</td>
				<td colspan="3" nowrap class="td1">&nbsp;<html:text property="SendArchive/draftDept" maxlength="25" styleClass="inputOA" attributesText='style="width:97%;" ValidateType="notempty" Msg="拟稿单位不能为空"' onmousedown="menuControl('draftDept',1)" onmouseout="menuControl('draftDept',0)"/>
				<td width="6%" height="25" align="center" nowrap class="td1">拟 稿 人：</td>
				<td nowrap width="15%" class="td1">&nbsp;<html:text property="SendArchive/drafter" styleClass="inputOA" value="<%=userName%>" attributesText='style="width:65%;border:1 #efefef soild;" ValidateType="notempty" Msg="拟稿人不能为空"'/>
				<input name="receiver" type="button" class="button_02" value="选择" elname="SendArchive/drafter,SendArchive/drafter" onClick="selectSysUser();">
				</td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">文号：</td>
				<td colspan="3" width="25%" nowrap class="td1">
				&nbsp;<html:text property="SendArchive/archiveCode" value="" styleClass="inputOA" maxlength="25" attributesText='style="width:96%;" ValidateType="notempty" Msg="文号不能为空"' onmousedown="menuControl('prefixs',1)" onmouseout="menuControl('prefixs',0)"/> 
				</td>
				<td width="6%" align="center" nowrap class="td1">发文日期：</td>
				<td nowrap width="15%" class="td1">&nbsp;<html:text name="SendArchive/sendDate[@pattern='yyyy-MM-dd']" styleClass="inputOA" attributesText='style="width:95%;" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate"/>
				</td>
			  </tr>
			  <tr>
			    <td width="6%" align="center" nowrap class="td1">打字： </td>
				<td width="12%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityInstID" value="DX62">
				&nbsp;<html:text property="SendArchive/printer" value="<%=userName%>" styleClass="inputOA" attributesText='style="width:60%;" ValidateType="notempty" Msg="打字为空"'/>
				<input name="receiver" type="button" class="button_02" value="选择" elname="SendArchive/printer,SendArchive/printer" onClick="selectSysUser();">
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityInstID" value="DX62">
				&nbsp;<bean:write property="SendArchive/printer"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">校对： </td>
				<td width="13%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityInstID" value="DX62">
				&nbsp;<html:text property="SendArchive/corrector" value="<%=userName%>" styleClass="inputOA" attributesText='style="width:60%;" ValidateType="notempty" Msg="校对为空"'/>
				<input name="receiver" type="button" class="button_02" value="选择" elname="SendArchive/corrector,SendArchive/corrector" onClick="selectSysUser();"> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityInstID" value="DX62">
				&nbsp;<bean:write property="SendArchive/corrector"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">共印份数： </td>
				<td width="15%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityInstID" value="DX62">
				&nbsp;<html:text property="SendArchive/sendNum" styleClass="inputOA" attributesText='style="width:96%;" ValidateType="notempty,int" Msg="份数为空;份数必须是整型"'/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityInstID" value="DX62">
				&nbsp;<bean:write property="SendArchive/sendNum"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="8" nowrap class="tdwf">
				    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				      <tr>
				        <td width="80%" align="left" valign="top" class="divwf1">【部门领导签发】</td> 
				        <td width="20%" align="center" valign="top"><a href="javascript:gotoText();" class="divwf1">【发文正文】</a></td>
				      </tr>
				    </table>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">【分管领导签发】</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">【校主要领导签发】</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap>
				<!------------------------------  公文流转  开始 ----------------------------->
				
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			          <tr> 
                        <td width="100%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	               <iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" style="height:200;"></iframe>	
		                </td>
                      </tr>
		              <tr> 
                         <td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
                         <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  %>
		                 <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	             <input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
			<%
				i++;
			%>
		                </logic:iterate>
                        </td>
                     </tr>
		             <tr> 
                        <td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
                        <td class="td1">
		                    <html:text property="SendArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		                    <html:hidden property="SendArchive/nextParticipantId"/>
		                    <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','SendArchive/nextParticipantName','SendArchive/nextParticipantId')">
		                </td>
                    </tr>
					</table>
					
					<!------------------------------  公文流转  结束 ----------------------------->
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap> 
	            <table id="tail" width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				  <tr>
				  <td align="center" valign="middle">
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
				  </tr>
                </table>
				</td>
			  </tr>
			  
			  <!------------------------------  编辑正文  开始 ----------------------------->
			  
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" id="attachment">
				<!--<tr> 
				  <td width="100%" height="30px" align="left" valign="middle" class="td1">
				  <INPUT type="hidden" id="FileType" name="FileType" value=".doc">
				  <INPUT type="hidden" id="UserName" name="UserName" value="<bean:write property='SessionEntity/userName'/>">
				  <html:select property="Template">
				  <html:option value="-1">--请选择发文模版--</html:option> 
                  <html:options property="list[@type='Template_Files']/Template_File/RecordID" labelProperty="list[@type='Template_Files']/Template_File/FileName"/> 
				  </html:select>&nbsp;
				  <INPUT type="button" class="button_02" value="保存正文" onClick="saveFile();">&nbsp;
				  </td>
				</tr>-->
				<tr><td width="100%" height="600px" align="center">
				<iframe src='/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&FileType=.doc&Template=' frameborder="0" width="100%" name="sendText" style=" height: 100%" scrolling="no"></iframe>
				</td></tr>
				<tr valign="top"> 
				<td width="100%" height="50" align="center" valign="middle">
				  <input name="wfcancel" type="button" class="button_02" value="保 存" onClick="document.getElementById('tab1c_tabcon1').click()">
				</td>
			    </tr>
        	  </table>
        	  
        	  <!------------------------------  编辑正文  结束 ----------------------------->
		</td>
	</tr>
	<tr>
		<td>
			<script>
			tabbox1.inithidetab();
			</script>
		</td>
		</tr>
	</table>
</form>
<div id="draftDept" style="position:absolute; top:301px; width:375px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="draftDepts" property="list[@type='draftDepts']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='draftDepts' property='draftDepts/draftDept'/>');"><bean:write id='draftDepts' property='draftDepts/draftDept'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="sendOrgan" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="sendOrgans" property="list[@type='sendOrgans']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='sendOrgans' property='sendOrgans/sendOrgan'/>');"><bean:write id='sendOrgans' property='sendOrgans/sendOrgan'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="pubLemma" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');"><bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="prefixs" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="prefixs" property="list[@type='prefixs']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='prefixs' property='prefixs/DESCRIPTION'/>');"><bean:write id='prefixs' property='prefixs/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
</body>
<script language="javascript">
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>

<script language="javascript">
function save() {
		var frm = document.forms[0];
		frm.action = "oa.prSendArchive.sendAddDo.do";
		frm.enctype = "multipart/form-data";
        frm.target = "_self";
		frm.method = "post";
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			saveFile();
			setTimeout("document.forms[0].submit()",5000);
			//document.forms[0].submit();
		}

}

function send() {
	var frm = document.forms[0];
	
	//if (frm.elements["SendArchive/RecordID"].value == '') {
	   //alert("正文内容为空，请编辑保存后发送！");
	   //return;
	//}
	frm.action = "oa.prSendArchive.sendAddDo.do";
		frm.enctype = "multipart/form-data";
        frm.target = "_self";
		frm.method = "post";
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["SendArchive/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			saveFile();
			setTimeout("document.forms[0].submit()",5000);
			//document.forms[0].submit();
		}

}

function editText() {
    var frm = document.forms[0];
    
    if (frm.elements["SendArchive/archiveTitle"].value == "") {
       alert("请先填写好发文标题，作为正文标题！");
       return false;
    }
    //document.getElementById("sendText").style.display = "";
    frm.action = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit";
    frm.target = "sendText";
    frm.submit();
}

function saveFile() {
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
     alert(webOffice.Status);
     return false;
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   webform.submit();
}

function hiddenButtons() {
    document.getElementById("tail").style.display = "none";
}

function gotoText() {
   document.getElementById('tab1c_tabcon2').click();
   document.getElementById('tab1c_tabbar1').className = 'tbottom4';
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
</script>