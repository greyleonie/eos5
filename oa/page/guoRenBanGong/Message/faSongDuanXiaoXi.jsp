<%@include file="/internet/common.jsp"%>
<%
java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Date date=new java.util.Date();
String today=df.format(date);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script>
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

function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
 function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function setValue(value) {
inputobj.value = inputobj.value + value;
}

function save(){
    	var frm = document.messForm;
       if(frm("RECACCOUNT").value=="")
       {alert("接收人不能为空！");
         return false;
       }
       if(frm("InnerNote/CONTENT").value=="")
       {alert("信息内容不能为空！");
         return false;
       }
       if(frm("InnerNote/RECACCOUNT").value.length>1024)
       {alert("接收人太多！");
         return false;
       }
      if(frm("InnerNote/CONTENT").value.length>256)
       {alert("信息内容太多");
         return false;
       }
        frm.action="oa.prPersonOffice.addInnerNote.do";
       
    	frm.submit();   	
}

function returnParent(){
    var frm = document.messForm;
  
    frm.action="oa.prPersonOffice.queryInnerNote.do";
       
    frm.submit();   	
}
</script>
</head>

<body>
<form name="messForm" method="post">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="InnerNote/MSGTYPE" value="2"/>
<html:hidden property="InnerNote/ISREAD" value="0"/>
<html:hidden property="type"/>
<html:hidden property="InnerNote/SENDACCOUNT" property="SessionEntity/userID" />
<html:hidden property="InnerNote/SENDDATE[@pattern='yyyyMMddHHmmss']"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;内部短消息</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#A2C4DC">
  <tr>
    <td width="20%" height="30" class="td2"><p align="right">接收人：</td>
    <td width="80%" height="30" class="td1">&nbsp;&nbsp;<html:text property="RECACCOUNT"/>
    <input name="receiver" type="button" class="button_03" value="选择" elname="InnerNote/RECACCOUNT,RECACCOUNT" onClick="selectSysUser();">
    <html:hidden property="InnerNote/RECACCOUNT"/></td>
  </tr>
  <tr>
    <td width="20%" height="30" align="right" class="td2">消息标题：</td>
    <td width="80%" height="30" align="right" class="td1"><p align="left">&nbsp;
      <html:text property="InnerNote/MSGTITLE" size="30"/>
    </td>
  </tr>
  <tr>
    <td width="20%" height="117" align="right" class="td2">消息内容：</td>
    <td width="80%" height="117" align="right" class="td1"><p align="left">&nbsp;
      <html:textarea property="InnerNote/CONTENT" cols="50" rows="6" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
    </td>
  </tr>
</table>
<table width="98%" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <td width="100%" height="18">
      <p align="center"><input name="B3" type="button" class="button_02" value="发 送" onClick="save()">&nbsp;  
      <input name="B3" type="button" class="button_02" value="重 置"></td>
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