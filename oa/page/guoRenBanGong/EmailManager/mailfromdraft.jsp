<%@ include file="/internet/common.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Calendar calendar = Calendar.getInstance();
Date now = calendar.getTime();
String curTime = sdf.format(now);
%>
<script language="JavaScript">
var pattern;//正则
function setPattern(patternStr) {
	pattern = new RegExp(patternStr);
}
function User(identify,id,name,dept,job){
	this.identify = identify;
	this.id = id;
	this.name = name;
	this.dept = dept;
	this.job = job;
	this.isRight = false;//是否被选中
	this.index = 0;
	function compare_by_type(type,index){
		switch(type) {
			case 'id':
				return pattern.test(";" + this.id + ";");
			case 'id_left':
                        	if(pattern.test(";" + this.id + ";")) {
                                	this.isRight = true;
                        	}
							this.index=index;
				return ;
			case 'id_right':
                        	if(pattern.test(";" + this.id + ";")) {
                                	this.isRight = false;
                        	}
				return ;
			case 'name':
				return pattern.test(this.name);
			case 'dept':
				return pattern.test(seperator + this.dept + seperator);
			case 'dept_all':
				return this.dept.length > 0;
			case 'job':
				return pattern.test(seperator + this.job + seperator);
			case 'job_all':
				return this.job.length > 0;
			case 'all':
				return true;
			default:
				return pattern.test(this.name);
		}
	}
	this.isMatch = compare_by_type;

}
</script>
<script language="JavaScript">
var userArray = new Array()
 <logic:iterate id="resultset" property="list[@type='men']">
   userArray[userArray.length] = new User("<bean:write id="resultset" property="sysTUser/OPERATORID" />","<bean:write id="resultset" property="sysTUser/USERID" />","<bean:write id="resultset" property="sysTUser/OPERATORNAME" />","","");
 </logic:iterate>
</script>

<script language="JavaScript" for="window" event="onLoad">
	var frm = document.forms[0];
	var tempreceiver = frm.elements["mailtempreciever"].value;
	var tempcopy = frm.elements["mailtempcopy"].value;
	var tempdense = frm.elements["mailtempdense"].value;
	var trd="";
	var tcd="";
	var tdd="";
	var temparray1;
	var temparray2;
	var temparray3;
	
	if(tempreceiver!=null&&tempreceiver!=""){
		temparray1 = tempreceiver.split(",");
		for(i=0;i<temparray1.length;i++){
			for(muser in userArray){
				if(temparray1[i]==userArray[muser].id) trd += userArray[muser].name + ",";
			}
		}
		trd = trd.substring(0,trd.lastIndexOf(","));
	
	}
	
	if(tempcopy!=null&&tempcopy!=""){
		temparray2 = tempcopy.split(",");
		for(j=0;j<temparray2.length;j++){
			for(luser in userArray){
				if(temparray2[j]==userArray[luser].id) tcd += userArray[luser].name + ",";
			}
		}
		tcd = tcd.substring(0,tcd.lastIndexOf(","));
	
	}
	
	if(tempdense!=null&&tempdense!=""){
		temparray3 = tempdense.split(",");
		for(p=0;p<temparray3.length;p++){
			for(nuser in userArray){
				if(temparray3[p]==userArray[nuser].id) tdd += userArray[nuser].name + ",";
			}
		}
		tdd = tdd.substring(0,tdd.lastIndexOf(","));
	
	}
	frm.elements["RECEIVEADDRESS"].value = trd;
	frm.elements["TOOL_Mail/RECEIVEADDRESS"].value = tempreceiver;
	frm.elements["COPYSEND"].value = tcd;
	frm.elements["TOOL_Mail/COPYSEND"].value = tempcopy;
	frm.elements["DENSESEND"].value = tdd;
	frm.elements["TOOL_Mail/DENSESEND"].value = tempdense;
	
	frm.elements["TOOL_Mail/TITLE"].value = '<bean:write property="TOOL_Mail/TITLE"/>';
	window.planinfo.idEditbox.document.body.innerHTML = frm.elements["mailcontent"].value;
	
	
</script>
<form name="form1" action="oa.prPersonOffice.uploadfiletestDR.do" method="post" enctype="multipart/form-data">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;邮件管理</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 
  <tr>
    <td align="right">
    <table width="99%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center">
          <table width="98%" height="25"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center"><input name="Submit2" type="button" class="button_02" value="发 送" onClick="sendmail();">
                  <input name="Submit3" type="button" class="button_02" value="增加附件" onClick="addRow('tbl')">
                  <input name="Submit4" type="button" class="button_02" value="保存草稿" onClick="saveToPDraft()">
                  <input name="Submit_1" type="button" class="button_02" value="邮件设置" id="Submit_1" onmousedown="menuControl(1)" onmouseout="menuControl(0)" >
                  <input name="Submit622" type="button" class="button_02" value="重写邮件" onclick="resetForm()" />
                  <input name="Submit722" type="button" class="button_02" value="返 回" onclick="history.back()" /></td>
          </tr>
          </table>
          </td>
        </tr>
      </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
        <tr class="td1">
          <td width="16%" align="right" class="td2"><input name="receiver" type="button" class="button_03" value="选择收件人：" elname="TOOL_Mail/RECEIVEADDRESS,RECEIVEADDRESS" onClick="selectSysUser();">&nbsp;</td>
          <td width="84%" class="td1">&nbsp;<input name="RECEIVEADDRESS" type="text" class="" size="74" onkeyup="othrerSelectMan(0)" readonly="readonly"/>
      <input type="hidden" name="TOOL_Mail/RECEIVEADDRESS"/>
      <span class="text_red">*</span></td>
        </tr>
        <tr class="td2">
          <td align="right" class="td2"><input name="copyer" type="button" class="button_03" value="选择抄送人：" elname="TOOL_Mail/COPYSEND,COPYSEND" onClick="selectSysUser();">&nbsp;</td>
    <td class="td1">&nbsp;<input name="COPYSEND" type="text" class="" size="74" onkeyup="othrerSelectMan(0)" readonly="readonly"/>
      <input type="hidden" name="TOOL_Mail/COPYSEND"/></td>
        </tr>
        <tr class="td1">
          <td align="right" class="td2"><input name="dense" type="button" class="button_03" value="选择密送人：" elname="TOOL_Mail/DENSESEND,DENSESEND" onClick="selectSysUser();">&nbsp;</td>
    <td class="td1">&nbsp;<input name="DENSESEND" type="text" class="" size="74" onkeyup="othrerSelectMan(0)" readonly="readonly"/>
      <input type="hidden" name="TOOL_Mail/DENSESEND"/></td>
        </tr>
        <tr class="td2">
          <td align="right" class="text_red">主 题：</td>
          <td class="td1">&nbsp;<input name="TOOL_Mail/TITLE" type="text" class="" size="74">
            <span class="text_red">*</span> </td>
        </tr>
		<tr align="left" class="td1">
            <td colspan="2"" class="td2">附件：
			<select name="FWAttach">
			<logic:iterate id="fwattch" property="list[@type='mailattach']">
                <option value='<bean:write id="fwattch" property="TOOL_MailAttch/FILEPATH"/>|<bean:write id="fwattch" property="TOOL_MailAttch/REMARK"/>|<bean:write id="fwattch" property="TOOL_MailAttch/ATTACHID"/>' ><bean:write id="fwattch" property="TOOL_MailAttch/ATTCHNAME"/></option>
			</logic:iterate>
              </select>
              <!--<input type="button" name="Button" value="查看" class="button_six" onClick="AttachFWView()">-->
			  <input type="button" name="Button" value="删除" class="button_02" onClick="attachFWDelete()">
			  </td>
        </tr>
		<tr class="td2">
          <td colspan="2" align="left" class="text_red">		  	  
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="text" id="tbl" name='tbl'>
          </table>		  
		  </td>
        </tr>
        <tr class="td1">
          <td align="center" colspan="2">
		  <iframe height="320" width="610" name="planinfo" id="textid" src="/internet/scripts/rte.htm"></iframe>
         </td>
        </tr>
      </table>  	  
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  
		  <input type="hidden" name="TOOL_Mail/CONTENT" >
		  <input type="hidden" name="TOOL_Mail/REFLAG" >
		  <input type="hidden" name="TOOL_Mail/MAILDIRID" >
		  <input type="hidden" name="TOOL_Mail/MAILTYPE">
		  <input type="hidden" name="TOOL_Mail/READFLAG" >
		  <input type="hidden" name="TOOL_Mail/SENDDATE" value="<%=curTime%>">
		  <input type="hidden" name="filepath" value="mailattach"/>
		  <input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="talentmail">
		  <input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
		  <html:hidden property="TOOL_MailInfo/LABLE_NAME"/>
		  <input type="hidden" name="FWAttchId" >
		 <input type="hidden" name="mailcontent" value='<bean:write property="TOOL_Mail/CONTENT"/>'>
		 <input type="hidden" name="postusername" value='<bean:write property="TOOL_Mail/POSTUSERNAME"/>'>
		 <input type="hidden" name="postaddress" value='<bean:write property="TOOL_Mail/POSTADDRESS"/>'>
		 <input type="hidden" name="mailtitle" value='<bean:write property="TOOL_Mail/TITLE"/>'>
		 <input type="hidden" name="mailid" value='<bean:write property="TOOL_Mail/MAILID"/>'>
		 <input type="hidden" name="mailtempreciever" value='<bean:write property="TOOL_Mail/RECEIVEADDRESS"/>'>
		 <input type="hidden" name="mailtempcopy" value='<bean:write property="TOOL_Mail/COPYSEND"/>'>
		 <input type="hidden" name="mailtempdense" value='<bean:write property="TOOL_Mail/DENSESEND"/>'>
		 
		  </td>
        </tr>
      </table></td>
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
	<tr><td bgcolor="#eeeeee" align="center" class="f14" id="processingStr">&nbsp;&nbsp;邮件正在发送, 请稍候...&nbsp;&nbsp;</td></tr>
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

<script language="JavaScript">

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
		url = "oa.prPersonOffice.manselect.do"
	}else if(type==1){
		url = "oa.prPersonOffice.outmanselect.do";
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

function showFWContent(obj){
	var fwcontent = document.getElementById(obj);
	var fwtitle = document.getElementById("FWTitle");
	if(fwcontent.style.display=="block"){
		fwcontent.style.display = "none";
		fwtitle.innerText = " 显示正文内容：";
	}else{
		fwcontent.style.display = "block";
		fwtitle.innerText = " 隐葳正文内容：";
	}

}

function AttachFWView(){
    var frm = document.forms[0];
	if(frm.elements["FWAttach"].options.length<=0) return;
	var complex = frm.elements["FWAttach"].options.value;
	var array = complex.split("|");
	var path = array[0];
	var type = array[1];
	var mailid = array[2];
	url = "oa.prPersonOffice.attachFWView.do?fbfile/filePath="+path+"&fbfile/fileType="+type;
	window.open(url,"");
}
var deletetemp = "";
function attachFWDelete(){
	var frm = document.forms[0];
	var o = frm.elements["FWAttach"];
	var deletevalue = o.options.value;
	for(var i=0;i<o.options.length;i++){
		if(deletevalue==o.options[i].value){
			var complex = o.options[i].value;
			var array = complex.split("|");
			var mailid = array[2];
			deletetemp +=mailid + "|";
			o.remove(i);
			
		}
	}
	frm.elements["FWAttchId"].value = deletetemp;
	//alert(frm.elements["FWAttchId"].value );
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
</script>

<script language="JavaScript">
function sendmail(){
	var frm = document.forms[0];
	var planinfotxt = window.planinfo.idEditbox.document.body.innerHTML;
	
	var receive = document.forms[0].elements["RECEIVEADDRESS"].value;
	var copy = document.forms[0].elements["COPYSEND"].value;
	var dense = document.forms[0].elements["DENSESEND"].value;
	
	//if(frm.elements["TOOL_MailInfo/SIGN_FLAG"].checked){
	//	planinfotxt+="<DIV style='font-size:12px;color:#0000FF'><br>" + frm.elements["TOOL_MailInfo/LABLE_NAME"].value + "</DIV>";
	//}
	planinfotxt = turnto(planinfotxt);
	frm.elements["TOOL_Mail/CONTENT"].value = planinfotxt;
	frm.elements["TOOL_Mail/MAILDIRID"].value = "0";
	frm.elements["TOOL_Mail/MAILTYPE"].value = "1";
	if(!frm.elements["TOOL_MailInfo/RETURN_FLAG"].checked){
		frm.elements["TOOL_Mail/REFLAG"].value = "0";
	}else{
		frm.elements["TOOL_Mail/REFLAG"].value = "1";
	}
	processing.style.visibility = "visible";
	frm.submit();
}

function saveToPDraft(){
	var frm = document.forms[0];
	var planinfotxt = window.planinfo.idEditbox.document.body.innerHTML; 
	
	//if(frm.elements["TOOL_MailInfo/SIGN_FLAG"].checked){
	//	planinfotxt+="<DIV style='font-size:12px;color:#0000FF'><br>-------------------------------------<br>" + frm.elements["TOOL_MailInfo/LABLE_NAME"].value + "</DIV>";
	//}
	planinfotxt = turnto(planinfotxt);
	frm.elements["TOOL_Mail/CONTENT"].value = planinfotxt;
	frm.elements["TOOL_Mail/MAILDIRID"].value = "2";
	frm.elements["TOOL_Mail/REFLAG"].value = "0";
	frm.elements["TOOL_Mail/MAILTYPE"].value = "1";
	var processingStr = document.getElementById("processingStr");
	processingStr.innerText = "草稿正在保存, 请稍候...";
	processing.style.visibility = "visible";
	frm.action = "oa.prPersonOffice.mailtoDraftFW.do";
	frm.submit();
	

}
</script>