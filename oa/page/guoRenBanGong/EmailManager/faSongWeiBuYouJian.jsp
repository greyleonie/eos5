<%@ include file="/internet/common.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Calendar calendar = Calendar.getInstance();
Date now = calendar.getTime();
String curTime = sdf.format(now);
%>
<script src="/internet/scripts/Check2.js" language='javascript' type='text/javascript'></script>
<script language="JavaScript">
function mailServer(serverId,pop3Name,smtpServer,smtpAddress,smtpUser,smtpPwd,smtpAuth){
	this.serverId = serverId;
	this.pop3Name = pop3Name;
	this.smtpServer = smtpServer;
	this.smtpAddress = smtpAddress;
	this.smtpUser = smtpUser;
	this.smtpPwd = smtpPwd;
	this.smtpAuth = smtpAuth;
}
</script>

<script language="JavaScript">
var keychar = "";
var serverArray = new Array();
<logic:iterate id="server" property="list[@type='pop3server']">
   serverArray[serverArray.length] = new mailServer('<bean:write id="server"  property="TOOL_MAILSERVER/SERVERID"/>','<bean:write id="server"  property="TOOL_MAILSERVER/POP3NAME"/>','<bean:write id="server"  property="TOOL_MAILSERVER/SMTPSERVER"/>','<bean:write id="server"  property="TOOL_MAILSERVER/SHOWADDRESS"/>','<bean:write id="server"  property="TOOL_MAILSERVER/SMTPNAME"/>','<bean:write id="server"  property="TOOL_MAILSERVER/SMTPPWD"/>','<bean:write id="server"  property="TOOL_MAILSERVER/SMTPAUTH"/>');
   </logic:iterate>
</script>
<body>
<form name="form1" action="oa.prPersonOffice.uploadfileout.do" method="post" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;发邮件</td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
</table>
<table width="98%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"><input name="Submit2" type="button" class="button_02" value="发 送" onclick="sendmail();" />
        <input name="Submit3" type="button" class="button_02" value="增加附件" onclick="addRow('tbl')" />
        <input name="Submit4" type="button" class="button_02" value="保存草稿" onclick="saveToPDraft()" />
        <input name="Submit_1" type="button" class="button_02" value="邮件设置" id="Submit_1" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
        <input name="Submit6" type="button" class="button_02" value="重写邮件" onclick="resetForm()" />
        <input name="Submit7" type="button" class="button_02" value="返 回" onclick="history.back()" /></td>
    </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
  <tr >
    <td width="16%" align="right" class="td2"><input name="receiver" type="button" class="button_03" value="选择收件人：" elname="TOOL_Mail/RECEIVEADDRESS,RECEIVEADDRESS" onClick="selectUser();"></td>
    <td width="84%" class="td1">&nbsp;<input name="RECEIVEADDRESS" type="text" class="" size="74" title="请用逗号把所选用户与输入邮件地址隔开" onkeyup="othrerSelectMan(0)"/>
      <input type="hidden" name="TOOL_Mail/RECEIVEADDRESS" />
      <span class="text_red">*</span></td>
  </tr>
  <tr>
    <td align="right" class="td2"><input name="copyer" type="button" class="button_03" value="选择抄送人：" elname="TOOL_Mail/COPYSEND,COPYSEND" onClick="selectUser();"></td>
    <td class="td1">&nbsp;<input name="COPYSEND" type="text" class="" size="74" title="请用逗号把所选用户与输入邮件地址隔开" onkeyup="othrerSelectMan(0)"/>
      <input type="hidden" name="TOOL_Mail/COPYSEND" /></td>
  </tr>
  <tr >
    <td align="right" class="td2"><input name="dense" type="button" class="button_03" value="选择密送人：" elname="TOOL_Mail/DENSESEND,DENSESEND" onClick="selectUser();"></td>
    <td class="td1">&nbsp;<input name="DENSESEND" type="text" class="" size="74" title="请用逗号把所选用户与输入邮件地址隔开" onkeyup="othrerSelectMan(0)"/>
      <input type="hidden" name="TOOL_Mail/DENSESEND" /></td>
  </tr>
  <tr class="td2">
          <td align="right" class="text_red">发送者邮箱:</td>
          <td class="td1">&nbsp; <select name="selectServer" onChange="getServerInfo(this.value)">
                <option value="0">请选择</option>
				<logic:iterate id="popserver" property="list[@type='pop3server']">
				<option value='<bean:write id="popserver" property="TOOL_MAILSERVER/SERVERID"/>'><bean:write id="popserver" property="TOOL_MAILSERVER/POP3NAME"/></option>
				</logic:iterate>
              </select>
              <input name="smtpaddress" type="text" class="" size="60">
			  <input name="TOOL_Mail/ISSINGLE" type="checkbox" value="1">单个发送
              <input type="hidden" name="TOOL_MAILSERVER/SMTPSERVER">
              <input type="hidden" name="TOOL_MAILSERVER/SHOWADDRESS">
			  <input type="hidden" name="TOOL_MAILSERVER/SMTPNAME">
              <input type="hidden" name="TOOL_MAILSERVER/SMTPPWD">
			  <input type="hidden" name="TOOL_MAILSERVER/SMTPAUTH">
              <input type="hidden" name="outmailAttach">
	     </td>
  </tr>
  <tr>
    <td align="right" class="td2">主 题：</td>
    <td class="td1">&nbsp;<input name="TOOL_Mail/TITLE" type="text" class="" size="74" />
      <span class="text_red">*</span> </td>
  </tr>
  <tr align="left" class="td2">
    <td colspan="2" class="text_red">		  	  
	 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="text" id="tbl" name='tbl'></table>		  
	</td>
  </tr>
  <tr align="left" >
    <td align="center" colspan="2"><iframe height="405" width="100%" name="planinfo" id="textid" src="/internet/scripts/rte.htm"></iframe></td>
  </tr>
</table>

<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  
		  <input type="hidden" name="TOOL_Mail/CONTENT" >
		  <input type="hidden" name="TOOL_Mail/REFLAG" >
		  <input type="hidden" name="TOOL_Mail/MAILDIRID" >
		  <input type="hidden" name="TOOL_Mail/MAILTYPE" >
		  <input type="hidden" name="TOOL_Mail/READFLAG" >
		  <input type="hidden" name="TOOL_Mail/SENDDATE" value="<%=curTime%>">
		  <input type="hidden" name="filepath" value="mailattachout"/>
		  <input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="talentoutmail">
		  <input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
		  <html:hidden property="TOOL_MailInfo/LABLE_NAME"/>
		  </td>
        </tr>
      </table>
 <div id="menu_1" style="position:absolute; top:301px; width:220px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                    <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                      <tr>
                        <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                            <tr>
                              <td align="left" class="text"><html:checkbox property="TOOL_MailInfo/RETURN_FLAG" value="1"/>
                    是否回执</td>
                            </tr>
                            <tr>
                              <td align="left" class="text"><html:checkbox property="TOOL_MailInfo/POST_FLAG" value="1"/>
                    保存到发件箱</td>
                            </tr>
                            <tr>
                              <td align="left" class="text"> 选择邮件级别：
                                  
								  <html:select property="TOOL_MailInfo/MAIL_LEVEL">
								  	<html:option value="0">普通邮件</html:option>
									<html:option value="1">重要邮件</html:option>
									<html:option value="2">最普通邮件</html:option>
								  </html:select>
								  </td>
                            </tr>
                        </table></td>
                        <td width="4" bgcolor="#DBDBDB"> </td>
                        <td width="1"> </td>
                      </tr>
                      <tr bgcolor="#A9A9A9">
                        <td height="4" colspan="3"> </td>
                      </tr>
                      <tr>
                        <td height="1" colspan="3"> </td>
                      </tr>
                    </table>
        </div>
<div id="processing" style="position:absolute; top:390px; left:20px; z-index:10; visibility:hidden">
	<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	<td width="30%"></td>
	<td bgcolor="#0">
	<table WIDTH="100%" height="70" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	<tr><td bgcolor="#eeeeee" align="center" class="textb" id="processingStr">&nbsp;&nbsp;邮件正在发送, 请稍候...&nbsp;&nbsp;</td></tr>
	</table>
	</td>
	<td width="30%"></td>
	</tr>
	</table>
</div>
</form>
<script language="javascript">
function menuControl(show)
{
window.event.cancelBubble=true;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+"menu_"+numID+")");
}
else
{
eval("hideMenu("+"menu_"+numID+")");
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
</script>

<script type="text/javascript" language="JavaScript">

rowsCount = 0;
function addRow(tablename){
	FccTable = document.all[tablename];
	rowsCount++;
	FccRow = FccTable.insertRow();//新增一行
	FccRow.id = tablename + rowsCount;
	FccCell = FccRow.insertCell(0);
	FccCell.innerHTML = "&nbsp;";
	FccCell = FccRow.insertCell(1);
	FccCell.innerHTML = '附件：';
	FccCell.width = "15%";
	FccCell.className = "td2";
	FccCell.align = "right";
	FccCell =FccRow.insertCell(2);
	FccCell.width = "85%";
	FccCell.className = "td1";
	FccCell.align = "left";
	FccCell.innerHTML = "&nbsp;<input type='file' name='file"+rowsCount+"' style='width:600px;border:1px #000000 solid'>&nbsp;&nbsp;<img src='/internet/images/attachdelete.gif' alt='删除' align='absmiddle' onClick='deleteRow(\""+tablename+"\","+rowsCount+")' >"

}


function deleteRow(tableName,index) {
	var id = tableName + index;
	FccTable = document.all[tableName];
	FccTable.deleteRow(document.all[id].rowIndex);
	rowsCount--;
}

function selectMailMan(type){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var height = 510;
	if(type==0||type==null){
		url = "tools.pr.manselect.do"
	}else if(type==1){
		url = "tools.pr.outmanselect.do";
	}
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}
	


}

function othrerSelectMan(type){
	
	var inputObject = event.srcElement;
	var btnName;

	if(event.keyCode==8||event.keyCode==46||event.keyCode==9||event.keyCode==27||event.keyCode==13||event.keyCode==17||event.keyCode==32){
		inputObject.value = "";
		
		if(inputObject.name=="RECEIVEADDRESS"){
		   document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value = "";
	    }else if(inputObject.name=="COPYSEND"){
		   document.forms[0].elements["TOOL_Mail/COPYSEND"].value = "";
	    }else if(inputObject.name=="DENSESEND"){
		   document.forms[0].elements["TOOL_Mail/DENSESEND"].value = "";
	    }
	    
		return;
	} 
	/**else {
	    if(inputObject.name=="RECEIVEADDRESS"){
	       if (!event['shiftKey'])
		   document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value = document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value + keychar;
	       //alert(document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value);
	    }else if(inputObject.name=="COPYSEND"){
	       document.forms[0].elements["TOOL_Mail/COPYSEND"].value = document.forms[0].elements["TOOL_Mail/COPYSEND"].value + keychar;
	    }else if(inputObject.name=="DENSESEND"){
	       document.forms[0].elements["TOOL_Mail/DENSESEND"].value = document.forms[0].elements["TOOL_Mail/DENSESEND"].value + keychar;
	    }
	}*/
	/**var frm = inputObject.form;
	var btnName;
	var btn;
	if(inputObject.name=="RECEIVEADDRESS"){
		btnName = "receiver";
	}else if(inputObject.name=="COPYSEND"){
		btnName = "copysend";
	}else if(inputObject.name=="DENSESEND"){
		btnName = "whisper";
	}else{
		btnName = "receiver";
	}
	var frmeles = frm.elements;
	for(i = 0;i<frmeles.length;i++){
		if(frmeles[i].type=="button"&&frmeles[i].name==btnName){
			btn = frmeles[i];
			
			break;
		}
	}
	var url = "";
	var date = new Date();
	var height = 500;
	if(type==0||type==null){
		url = "tools.pr.manselect.do"
	}else if(type==1){
		url = "tools.pr.outmanselect.do";
	}
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		inputObject.value = "";
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}**/
	
}
</script>
<script language="JavaScript">
function turnto(str){
	reg1 = /\n\r/gi;
	reg2=/'/gi;
	str = str.replace(reg1,"");
	str = str.replace(reg2,"’");
	return str;


}

function sendmail(){
	var frm = document.forms[0];
	var planinfotxt = window.planinfo.idEditbox.document.body.innerHTML;
	
	
	if(frm.elements["RECEIVEADDRESS"].value==""){
		alert("收件人不能为空");
		return;
	}  else if (frm.elements["smtpaddress"].value==""){
		alert("发送者邮箱不能为空");
		return;
	}  else if (frm.elements["TOOL_Mail/TITLE"].value==""){
		alert("主题不能为空");
		return;
	}
	
	var mails = document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value;
	var receive = document.forms[0].elements["RECEIVEADDRESS"].value;
	var copymails = document.forms[0].elements["TOOL_Mail/COPYSEND"].value;
	var copy = document.forms[0].elements["COPYSEND"].value;
	var densemail = document.forms[0].elements["TOOL_Mail/DENSESEND"].value;
	var dense = document.forms[0].elements["DENSESEND"].value;
	
	if (mails.indexOf("@")>=0) {
	   receive = mails;
	}
	if (copymails.indexOf("@")>=0) {
	   copy = copymails;
	}
	if (densemail.indexOf("@")>=0) {
	   dense = densemail;
	}
	if (receive.indexOf(",")>=0) {
	   var receives = receive.split(",");
	   for (var i=0;i<receives.length;i++) {
	      var mail = receives[i];
	      if (!is_chinese(mail)) {
	         if (isEmail(mail)) document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value = document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value + "," + mail;
	         else { 
	              alert("收件人邮件地址有误，请重新输入！");
	              return;
	         }
	      }
	   }
	} else {
	   if (!is_chinese(receive)) {
	      if (isEmail(receive)) document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value = receive;
	      else { 
	           alert("收件人邮件地址有误，请重新输入！");
	           return;
	      }
	   }
	}
	if (copy.indexOf(",")>=0) {
	   var copys = copy.split(",");
	   for (var i=0;i<copys.length;i++) {
	      var mail = copys[i];
	      if (!is_chinese(mail)) {
	         if (isEmail(mail)) document.forms[0].elements["TOOL_Mail/COPYSEND"].value = document.forms[0].elements["TOOL_Mail/COPYSEND"].value + "," + mail;
	         else { alert("抄送人邮件地址有误，请重新输入！");
	              return;
	         }
	      }
	   }
	} else {
	   if (!is_chinese(copy)) {
	      if (isEmail(copy)) document.forms[0].elements["TOOL_Mail/COPYSEND"].value = copy;
	      else { alert("抄送人邮件地址有误，请重新输入！");
	              return;
	      }
	   }
	}
	if (dense.indexOf(",")>=0) {
	   var denses = dense.split(",");
	   for (var i=0;i<denses.length;i++) {
	      var mail = denses[i];
	      if (!is_chinese(mail)) {
	         if (isEmail(mail)) document.forms[0].elements["TOOL_Mail/DENSESEND"].value = document.forms[0].elements["TOOL_Mail/DENSESEND"].value + "," + mail;
	         else { alert("密送人邮件地址有误，请重新输入！");
	              return;
	         }
	      }
	   }
	} else {
	   if (!is_chinese(dense)) {
	      if (isEmail(dense)) document.forms[0].elements["TOOL_Mail/DENSESEND"].value = dense;
	      else { alert("密送人邮件地址有误，请重新输入！");
	              return;
	      }
	   }
	}
	
	//if(frm.elements["TOOL_MailInfo/SIGN_FLAG"].checked){
	//	planinfotxt+="<DIV style='font-size:12px;color:#0000FF'><br>-------------------------------------<br>" + frm.elements["TOOL_MailInfo/LABLE_NAME"].value + "</DIV>";
	//}
	planinfotxt = turnto(planinfotxt);
	frm.elements["TOOL_Mail/CONTENT"].value = planinfotxt;
	frm.elements["TOOL_Mail/MAILDIRID"].value = "0";
	frm.elements["TOOL_Mail/MAILTYPE"].value = "0";
	if(!frm.elements["TOOL_MailInfo/RETURN_FLAG"].checked){
		frm.elements["TOOL_Mail/REFLAG"].value = "0";
	}else{
		frm.elements["TOOL_Mail/REFLAG"].value = "1";
	}
	frm.elements["outmailAttach"].value = getOutMailAttach(frm);
	//alert(frm.elements["outmailAttach"].value);
	if(frm.elements["selectServer"].options.value=="0"){
		alert("请选择发送服务器");
		frm.elements["selectServer"].focus();
		return;
	}
	
	processing.style.visibility = "visible";
	frm.submit();
}

function saveToPDraft(){
	var frm = document.forms[0];
	var planinfotxt = window.planinfo.idEditbox.document.body.innerHTML;
	
	if(frm.elements["RECEIVEADDRESS"].value==""){
		alert("收件人不能为空");
		return;
	}  else if (frm.elements["smtpaddress"].value==""){
		alert("发送者邮箱不能为空");
		return;
	}  else if (frm.elements["TOOL_Mail/TITLE"].value==""){
		alert("主题不能为空");
		return;
	}
	
	var mails = document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value;
	var receive = document.forms[0].elements["RECEIVEADDRESS"].value;
	var copymails = document.forms[0].elements["TOOL_Mail/COPYSEND"].value;
	var copy = document.forms[0].elements["COPYSEND"].value;
	var densemail = document.forms[0].elements["TOOL_Mail/DENSESEND"].value;
	var dense = document.forms[0].elements["DENSESEND"].value;
	
	if (mails.indexOf("@")>=0) {
	   receive = mails;
	}
	if (copymails.indexOf("@")>=0) {
	   copy = copymails;
	}
	if (densemail.indexOf("@")>=0) {
	   dense = densemail;
	}
	
	if (receive.indexOf(",")>=0) {
	   var receives = receive.split(",");
	   for (var i=0;i<receives.length;i++) {
	      var mail = receives[i];
	      if (!is_chinese(mail)) {
	         if (isEmail(mail)) document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value = document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value + "," + mail;
	         else { 
	              alert("收件人邮件地址有误，请重新输入！");
	              return;
	         }
	      }
	   }
	} else {
	   if (!is_chinese(receive)) {
	      if (isEmail(receive)) document.forms[0].elements["TOOL_Mail/RECEIVEADDRESS"].value = receive;
	      else { 
	           alert("收件人邮件地址有误，请重新输入！");
	           return;
	      }
	   }
	}
	if (copy.indexOf(",")>=0) {
	   var copys = copy.split(",");
	   for (var i=0;i<copys.length;i++) {
	      var mail = copys[i];
	      if (!is_chinese(mail)) {
	         if (isEmail(mail)) document.forms[0].elements["TOOL_Mail/COPYSEND"].value = document.forms[0].elements["TOOL_Mail/COPYSEND"].value + "," + mail;
	         else { alert("抄送人邮件地址有误，请重新输入！");
	              return;
	         }
	      }
	   }
	} else {
	   if (!is_chinese(copy)) {
	      if (isEmail(copy)) document.forms[0].elements["TOOL_Mail/COPYSEND"].value = copy;
	      else { alert("抄送人邮件地址有误，请重新输入！");
	              return;
	      }
	   }
	}
	if (dense.indexOf(",")>=0) {
	   var denses = dense.split(",");
	   for (var i=0;i<denses.length;i++) {
	      var mail = denses[i];
	      if (!is_chinese(mail)) {
	         if (isEmail(mail)) document.forms[0].elements["TOOL_Mail/DENSESEND"].value = document.forms[0].elements["TOOL_Mail/DENSESEND"].value + "," + mail;
	         else { alert("密送人邮件地址有误，请重新输入！");
	              return;
	         }
	      }
	   }
	} else {
	   if (!is_chinese(dense)) {
	      if (isEmail(dense)) document.forms[0].elements["TOOL_Mail/DENSESEND"].value = dense;
	      else { alert("密送人邮件地址有误，请重新输入！");
	              return;
	      }
	   }
	}
	
	//if(frm.elements["TOOL_MailInfo/SIGN_FLAG"].checked){
	//	planinfotxt+="<DIV style='font-size:12px;color:#0000FF'><br>-------------------------------------<br>" + frm.elements["TOOL_MailInfo/LABLE_NAME"].value + "</DIV>";
	//}
	planinfotxt = turnto(planinfotxt);
	frm.elements["TOOL_Mail/CONTENT"].value = planinfotxt;
	frm.elements["TOOL_Mail/MAILDIRID"].value = "2";
	frm.elements["TOOL_Mail/REFLAG"].value = "0";
	frm.elements["TOOL_Mail/MAILTYPE"].value = "0";
	var processingStr = document.getElementById("processingStr");
	processingStr.innerText = "草稿正在保存, 请稍候...";
	processing.style.visibility = "visible";
	frm.action = "oa.prPersonOffice.mailToDraft.do";
	frm.submit();
	

}

function resetForm(){
	var frm = document.forms[0];
	window.planinfo.idEditbox.document.body.innerHTML = "";
	window.planinfo.idEditbox.document.designModel = "off";
	for(;rowsCount>0;){
		deleteRow('tbl',rowsCount);
	}
	
	frm.reset();

}

function getServerInfo(serverId){
	var frm = document.forms[0];
	if(serverId=="0"){
		frm.elements["smtpaddress"].value = "";
		frm.elements["TOOL_MAILSERVER/SMTPSERVER"].value = "";
		frm.elements["TOOL_MAILSERVER/SHOWADDRESS"].value = "";
		frm.elements["TOOL_MAILSERVER/SMTPNAME"].value = "";
		frm.elements["TOOL_MAILSERVER/SMTPPWD"].value = "";
		frm.elements["TOOL_MAILSERVER/SMTPAUTH"].value = "";
	}
	for(server in serverArray){
		if(serverId==serverArray[server].serverId){
			frm.elements["smtpaddress"].value = serverArray[server].smtpAddress;
			frm.elements["TOOL_MAILSERVER/SMTPSERVER"].value = serverArray[server].smtpServer;
			frm.elements["TOOL_MAILSERVER/SHOWADDRESS"].value = serverArray[server].smtpAddress;
			frm.elements["TOOL_MAILSERVER/SMTPNAME"].value = serverArray[server].smtpUser;
			frm.elements["TOOL_MAILSERVER/SMTPPWD"].value = serverArray[server].smtpPwd;
			frm.elements["TOOL_MAILSERVER/SMTPAUTH"].value = serverArray[server].smtpAuth;
			break;
		}
	}
}

function getOutMailAttaches(frm){
	var str = "";
	eles = frm.elements;
	for(i=0;i<eles.length;i++){
		obj= eles[i];
		if(obj.type == "file"){
			if(obj.value!="") str += obj.value + ";";
		}
	}
	if(str!="") str = str.substring(0,str.lastIndexOf(";"));
	return str;
}

function getOutMailAttach(frm){
	var str = "";
	//eles = frm.elements;
	var selectop;
	if(frm.elements["FWAttach"]){
		selectop = frm.elements["FWAttach"];
		for(i=0;i<selectop.options.length;i++){
			var complex = selectop.options[i].value;
			var filepath = complex.split("|");
			alert(filepath[0])
			str += filepath[0]+",";
			
		}
	}
	
	//for(i=0;i<eles.length;i++){
		//obj= eles[i];
		//if(obj.type == "file"){
			//if(obj.value!="") str += obj.value + ";";
		//}
	//}
	//if(str!="") str = str.substring(0,str.lastIndexOf(";"));
	if(str!="") str = str.substring(0,str.lastIndexOf(","));
	return str;
}

//人员选择，根据参数single='yes'为单个人选择，否则为多个人选择
  function selectUser(single){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	if(single == null) single = "no";
	url = "common.pr.mailselect.do?fccargs=" + fccargs + "&single=" + single;
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	//window.location.href=url;
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
			//alert(retArr[i].value+","+retArr[i].text);
		}
	}
}
</script>