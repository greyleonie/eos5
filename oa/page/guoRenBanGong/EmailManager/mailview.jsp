<%@ include file="/internet/common.jsp" %>
<%
int userlen = 0;
String mailid = request.getParameter("TOOL_Mail/MAILID");
com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);

%>
<%String flag = request.getParameter("flag"); %>
<script language="JavaScript">
function tempUser(identify,id,name,dept,job) {
	this.identify = identify;
	this.id = id;
	this.name = name;
	this.dept = dept;
	this.job = job;
}
var userArray = new Array()
 <logic:iterate id="resultset" property="list[@type='men']">
   userArray[<%=userlen%>] = new tempUser('<bean:write id="resultset" property="sysTUser/operatorID" />','<bean:write id="resultset" property="sysTUser/userID" />','<bean:write id="resultset" property="sysTUser/operatorName" />','<bean:write id="resultset" property="sysTUser/ORGID" />','-2');
   <%userlen++;%>
 </logic:iterate>
</script>

<script language="JavaScript">
function getTempName(ids) {
	var result = "";
	
	if (ids.indexOf(",")>=0) {
	   var tarray = ids.split(",");
	   for(var i = 0; i < tarray.length; i++) {
		   result += getSingleName(tarray[i]) + ",";
	   }
	   if(result!="") result = result.substring(0,result.lastIndexOf(","));
	   document.write(result);
	} else {
	   result = getSingleName(ids);
	   document.write(result);
	}


}
function getSingleName(id) {
	var result = id;
	for(var i=0;i<userArray.length;i++) {
		if(id == userArray[i].identify) {
			result = userArray[i].name;
			break;
		}
	}
	return result;
}
</script>

<script language="JavaScript">
var curmailid = 0;
var premailid = 0;
var nextmailid = 0;

function Mail(mailid,title,postaddress,receiveaddress,senddate){
	this.mailid = mailid;
	this.title = title;
	this.postaddress = postaddress;
	this.receiveaddress = receiveaddress;
	this.senddate = senddate;

}

function mailPage(cmailid){
	var size = mailArray.length;
	for(tempindex in mailArray){
		if(mailArray[tempindex].mailid==cmailid){
			curmailid = parseInt(tempindex);
			premailid = curmailid-1;
			nextmailid = curmailid+1;
			if(premailid<0) premailid=-1;
			if(nextmailid>=parseInt(size)) nextmailid=-1;
			
		}
	}

}

function toViewMail(mailid){
  	var frm = document.forms[0];
	var url = "?";
	var frmaction = "oa.prPersonOffice.mailView.do";
	url+="TOOL_Mail/MAILID="+mailid;
	frmaction+=url;
	frm.action = frmaction;
	frm.submit();
  
  }

var mailArray = new Array();
<logic:iterate id="allmailtype" property="list[@type='mailalltype']">
	mailArray[mailArray.length] = new Mail("<bean:write id="allmailtype" property="TOOL_Mail/MAILID"/>","<bean:write id="allmailtype" property="TOOL_Mail/TITLE"/>","<bean:write id="allmailtype" property="TOOL_Mail/POSTADDRESS"/>","<bean:write id="allmailtype" property="TOOL_Mail/RECEIVEADDRESS"/>","<bean:write id="allmailtype" property="TOOL_Mail/SENDDATE"/>");
</logic:iterate>

mailPage("<%=mailid%>");
//alert("curmailid:"+curmailid+",premailid:"+premailid+"nextmailid:"+nextmailid);
</script>
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
function FCCPage(curmailid,premailid,nextmailid,mailArray){
	this.curmailid = parseInt(curmailid);
	this.totalsize = parseInt(mailArray.length)-1;
	this.premailid = parseInt(premailid);
	this.nextmailid = parseInt(nextmailid);
	
	this.firstImg = "/internet/image/firstpage.gif";
	this.nfirstImg = "/internet/image/first.gif";
	
	this.lastImg = "/internet/image/lastpage.gif";
	this.nlastImg = "/internet/image/last2.gif";
	
	this.preImg = "/internet/image/prepage.gif";
	this.npreImg = "/internet/image/last.gif";
	
	this.nextImg = "/internet/image/nextpage.gif";
	this.nnextImg = "/internet/image/next.gif";
	
	function PageWrite(){
		var str="<DIV align=\"center\">";
		var first ="";
		var last = "";
		var pre = "";
		var next = "";
		if(this.curmailid>0&&this.curmailid<this.totalsize){
			first = "<a href=\"javascript:toViewMail('" + mailArray[0].mailid + "')\" ><img src=\"" + this.firstImg + "\" align=\"absmiddle\" border=\"0\" alt=\"首页\"></a>";
			last = "<a href=\"javascript:toViewMail('" + mailArray[this.totalsize].mailid + "')\" ><img src=\"" + this.lastImg + "\" align=\"absmiddle\" border=\"0\" alt=\"末页\"></a>";
		}else{
			first = "<img src=\"" + this.nfirstImg + "\" >";
			last = "<img src=\"" + this.nlastImg + "\" >";
			if(this.curmailid==0) {
				last = "<a href=\"javascript:toViewMail('" + mailArray[this.totalsize].mailid + "')\" ><img src=\"" + this.lastImg + "\" align=\"absmiddle\" border=\"0\" alt=\"末页\"></a>";
			}
			if(this.curmailid==this.totalsize){
				first = "<a href=\"javascript:toViewMail('" + mailArray[0].mailid + "')\" ><img src=\"" + this.firstImg + "\" align=\"absmiddle\" border=\"0\" alt=\"首页\"></a>"; 
			}
		
		}
		if(this.premailid!=-1){
			pre = "<a href=\"javascript:toViewMail('" + mailArray[premailid].mailid + "')\" ><img src=\"" + this.preImg + "\" align=\"absmiddle\" border=\"0\" alt=\"上一页\"></a>";
		}else{
			pre = "<img src=\"" + this.npreImg + "\" >";
		}
		if(this.nextmailid!=-1){
			next = "<a href=\"javascript:toViewMail('" + mailArray[nextmailid].mailid + "')\" ><img src=\"" + this.nextImg + "\" align=\"absmiddle\" border=\"0\" alt=\"下一页\"></a>";
		}else{
			next = "<img src=\"" + this.nnextImg + "\" >";
		}
		str+= first + "&nbsp;&nbsp;" + next + "&nbsp;&nbsp;" + pre + "&nbsp;&nbsp;" + last + "</DIV>"
		
		
	
		document.write(str);
	
	}
	this.fccWrite = PageWrite;

}
</script>
<script language="JavaScript" for="window" event="onLoad">
    var content = document.forms[0].mailcontent.value;
    planinfo.idToolbar.style.display = "none";
    planinfo.tbmode.style.display = "none";
	planinfo.idEditbox.document.open();
	   
	planinfo.idEditbox.document.write(content);
	
	if (content.indexOf("<DIV><A href")==0) document.getElementById("textid").src = planinfo.idEditbox.document.links(0).href;
	
	planinfo.idEditbox.document.close();
    planinfo.idEditbox.document.designMode = "off";
</script>
<form method="post">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;邮件查看</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15">&nbsp;</td>
    <td><table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
          <tr>
                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;
				<script language="JavaScript">
					var fpage = new FCCPage(curmailid,premailid,nextmailid,mailArray);
					fpage.fccWrite();
				</script>
				</td>
          </tr>
        </table> </td>
      </tr>
    </table>
      <table width="100%" height="5"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="right"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr class="td2">
                <td align="left" class="text"><span id="HeadText">隐藏邮件头</span><input name="" type="checkbox" onClick="showMailHeader('mailHeader')">
                <%if(flag!=null&&flag.equals("desk")){ %>
                
                <%}else{ %>
				<logic:notEqual property="fid" value="3">
                  <input name="Submit1" type="button" class="button_02" value="删除" id="Submit1" onClick="mailtoDustbin()">
				</logic:notEqual>
                  <input name="Submit2" type="button" class="button_03" value="永久删除" onClick="mailtoDel()">
                  <input name="Submit_3" type="button" class="button_02" value="回复" id="Submit_3" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
                  <input name="Submit4" type="button" class="button_02" value="转发" onClick="mailToFW()">
                  <input name="Submit5" type="button" class="button_02" value="返回" id="Submit5" onClick="window.location.href='oa.prPersonOffice.mailreceive.do?fid=0'">&nbsp;
                  <%} %>
                  </td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" height="5"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  <input name="mailcontent" type="hidden" value='<bean:write property="TOOL_Mail/CONTENT"/>'>
		  <html:hidden property="fid"/>
		  <html:hidden property="Order/col1"/>
	      <html:hidden property="Order/col1/@order"/>
		  <html:hidden property="TOOL_Mail/MAILID"/>
		  <html:hidden property="TOOL_Mail/MAILTYPE"/>
		  <html:hidden property="mark"/>
		  <html:hidden property="PageCond/begin"/>
		  </td>
        </tr>
      </table>
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1">
	  <tbody id="mailHeader" style="display:block">
        <tr class="td2"> 
          <td width="9%" height="20" class="text">&nbsp;发件人：</td>
          <td width="32%" align="left" class="text">&nbsp;<bean:write property="TOOL_Mail/POSTUSERNAME" formatClass="username" formatType="userid"/></td>
          <td width="11%" align="right" class="text">收&nbsp;件&nbsp;人：</td>
          <td width="48%">&nbsp;
		  <script language="JavaScript">
		  getTempName('<bean:write property="TOOL_Mail/RECEIVEADDRESS"/>');
		  </script>
		  </td>
        </tr>
        <tr class="td2">
          <td height="20" class="text">&nbsp;抄 &nbsp;送：</td>
          <td align="left" class="text">&nbsp;
		  <script language="JavaScript">
		  getTempName('<bean:write property="TOOL_Mail/COPYSEND"/>');
		  </script>
		  </td>
          <td align="right" class="text">发送时间：</td>
          <td class="text">&nbsp;<bean:write property="TOOL_Mail/SENDDATE"/></td>
        </tr>
		</tbody>
		</table>
		<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1">
        <tr class="td2">
          <td width="9%" height="20" class="text">&nbsp;主&nbsp;&nbsp;题：</td>
          <td width="91%"  colspan="3" align="left" class="text">&nbsp;<bean:write property="TOOL_Mail/TITLE"/>
		  </td>
        </tr>
      </table>
	 <table width="96%" height="10"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><hr size="1"> </td>
        </tr>
      </table>
	  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#efefef">
        <tr class="tdtitle"> 
          <td width="13%" height="20" class="text">&nbsp;正文内容:</td>
        </tr>
        <tr class="tdtitle"> 
          <td height="20" align="center">
		  <iframe height="250" width="100%" name="planinfo" id="textid" src="/internet/scripts/rte.htm"></iframe>
		  </td>
        </tr>
      </table>
	  <table width="96%" height="10"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><hr size="1"> </td>
        </tr>
      </table>
	  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#efefef">
	  <logic:iterate id="attachset" property="list[@type='mailattach']">
        <tr class="tdtitle"> 
          <td width="13%" height="20" class="text">&nbsp;附件：<a href='oa.prPersonOffice.mailAttachDown.do?fbfile/filePath=<bean:write id="attachset" property="TOOL_MailAttch/FILEPATH"/>&fbfile/fileType=<bean:write id="attachset" property="TOOL_MailAttch/REMARK"/>&fbfile/fileName=<bean:write id="attachset" property="TOOL_MailAttch/ATTCHNAME"/>' target="_blank"><bean:write id="attachset" property="TOOL_MailAttch/ATTCHNAME"/></a></td>
        </tr>
	  </logic:iterate>
      </table>
      <table width="100%" height="5"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
	  <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="left"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr class="td2">
                  
                <td align="left" class="text">&nbsp;<span id="HeadText">隐藏邮件头</span> 
                  <input name="" type="checkbox" value="" onClick="showMailHeader('mailHeader')">
                <%if(flag!=null&&flag.equals("desk")){ %>
                <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()">
                <%}else{ %>
				  <logic:notEqual property="fid" value="3">
                  <input name="Submit_3" type="button" class="button_02" value="删除" id="Submit_3" onClick="mailtoDustbin()">
				  </logic:notEqual>
                  <input name="Submit42" type="button" class="button_03" value="永久删除" onClick="mailtoDel()">
                  <input name="Submitfcc_3" type="button" class="button_02" value="回复" id="Submitfcc_3" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
                  <input name="Submit5" type="button" class="button_02" value="转发" onClick="mailToFW()">
                  <input name="Submit_1" type="button" class="button_02" value="返回" id="Submit_1" onClick="history.go(-2)">
                  <%} %>
                </td>
                  
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp; </td>
        </tr>
      </table>      </td>
    <td width="15">&nbsp;</td>
  </tr>
  <div id="mask"></div>
</table>
<div id="menu_3" style="position:absolute; top:377px; width:190px; height:117px; z-index:1; left: 762px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width="104%" height="118"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
       <tr>
           <td>
              <table width="96%" height="105"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                <tr>              
              <td width="27%" align="left" class="text"> &nbsp;<a href="#" onClick="reAnswer(0,0)">回信</a> 
              </td>
              </tr>
              <tr>            
              <td align="left" class="text"> &nbsp;<a href="#" onClick="reAnswer(0,1)">回信（附带原文）</a></td>
              </tr>
              <tr>
              <td align="left" class="text">&nbsp;<a href="#" onClick="reAnswer(1,0)">给所有人回信</a> 
              </td>
              </tr>
              <tr>
              <td align="left" class="text">&nbsp;<a href="#" onClick="reAnswer(1,1)">给所有人回信（附带原文）</a></td>
              </tr>
              </table>
              <span class="text"> </span>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"></table></td>
              <td width="4" bgcolor="#DBDBDB"> </td>
              <td width="1"> </td>
              </tr>
              <tr bgcolor="#A9A9A9"><td height="4" colspan="3"> </td></tr>
              <tr><td height="1" colspan="3"> </td></tr>
</table>
</div>
</form>
<script language="JavaScript">
function showMailHeader(obj){
	var mailheader = document.getElementById(obj);
	var headtext = document.all["HeadText"];
	if(mailheader.style.display=="none"){
		mailheader.style.display = "block";
		headtext[0].innerText = "隐藏邮件头";
		headtext[1].innerText = "隐藏邮件头";
	}else{
		mailheader.style.display = "none";
		
		headtext[0].innerText = "显示邮件头";
		headtext[1].innerText = "显示邮件头";
	}

}

function mailAttachDown(filePath,fileType,fileName){
	var action ="oa.prPersonOffice.mailAttachDown.do"
	var url = "?";
	filePath = filePath.replace("\\","/");
	alert(filePath);
	url+="fbfile/filePath="+filePath+"&";
	url+="fbfile/fileType="+fileType+"&";
	url+="fbfile/fileName="+fileName;
	action+=url;
	window.open(action,"_blank","top=100,left=100");
	
	
}

function mailToFW(){
	var frm = document.forms[0];
	var actionurl = "oa.prPersonOffice.mailToFW.do";
	//if(frm.elements["TOOL_Mail/MAILTYPE"].value=="0") actionurl = "";
	frm.action = actionurl;
	frm.submit();

}

function mailtoDel(){
	var frm = document.forms[0];
	var action = "oa.prPersonOffice.mailonedelete.do";
	
	frm.action = action;
	if(confirm("您真的要删除该邮件吗,该操作不能恢复数据")==false) return;
	frm.submit();
}
function mailtoDustbin(){
	var frm = document.forms[0];
	var action = "oa.prPersonOffice.mailonedustbin.do";
	var url = "?TOOL_Mail/MAILDIRID=3&TOOL_Mail/OLDMAILDIRID=" + frm.elements["fid"].value;
	action += url;
	frm.action = action;
	if(confirm("您真的要删除该邮件吗")==false) return;
	frm.submit();

}

function reAnswer(mailpersonflag,mailcontentflag){
	var frm = document.forms[0];
	var action = "oa.prPersonOffice.mailtoexpand.do";
	var url="?mailpersonflag=" + mailpersonflag + "&mailcontentflag=" + mailcontentflag;
	action += url;
	frm.action = action;
	frm.submit();

}



</script>