
<html>

<head>
<title>已接收短信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<script language="javascript">
function del(){
var element=document.getElementsByName("checkone");
var p1="";
for(i=0;i<element.length;i++){
if(element[i].checked==true){
  var k1=element[i].value;
  p1=p1+"checkone="+k1+"&";
}
}
if(p1==""){
alert("请选择要删除的记录");
}
else{
if(confirm("真的要删除这些信息吗？！")){
window.location.href="/Email_Note/delete_allsms.jsp?flag=aflag&DEL_TYPE=1&"+p1;
}
return false;
}}

function return_sms1()
{

var element=document.getElementsByName("checkone");
var b1="";
var x1=0;
for(i=0;i<element.length;i++){
if(element[i].checked==true){
  var k1=element[i].value;
  b1=b1+k1+",";
  x1++;
}
}
if(p1==""){
alert("请选择要回复的记录");
}
if(x1>1){
alert("回复时只能选择一条记录！");
}
else{
window.location.href="/Email_Note/pnote_write2.jsp?b1="+b1;
}
}
function return_sms()
{
	var element=document.getElementsByName("checkone");
	var b1="";
	var x1=0;

	for(i=0;i<element.length;i++){
		if(element[i].checked==true){
			var k1=element[i].value;
			b1=b1+k1+",";
			x1++;
		}
	}

	if(b1==""){
		alert("请选择要回复的记录");
		return false;
	}

	if(x1>1){
		alert("回复时只能选择一条记录！");
		return false;
	} else {
		window.location.href="/Email_Note/pnote_write2.jsp?b1="+b1;
	}	
}
function return_sms2() {
		var element=document.getElementsByName("checkone");
		var b1="";
		var x1=0;

		for(i=0;i<element.length;i++){
			if(element[i].checked==true){
				var k1=element[i].value;
				b1=b1+k1+",";
				x1++;
			}
		}

		if(b1==""){
			alert("请选择要回复的记录");
			return false;
		}

		if(x1>1){
			alert("回复时只能选择一条记录！");
			return false;
		} else {
			alert("b1:" + b1);
			window.location.href="/Email_Note/pnote_downindex3.jsp?b1="+b1;
		}
	}
</script>
<link href="../../INDEX.css" rel="stylesheet" type="text/css">
<script src="../../script/fccnewtab.js"></script>
<script>
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','发送内部邮件','faSongNeiBuYouJian.htm','testframe',0)
	tabbox1.add('2','发送外部邮件','faSongWeiBuYouJian.htm','testframe',0)
	tabbox1.add('3','收件箱','shuoJianXiang.htm','testframe',0)
	tabbox1.add('4','发件箱','faJianXiang.htm','testframe',0)
	tabbox1.add('5','草稿箱','caoGaoXiang.htm','testframe',0)
	tabbox1.add('6','文件夹管理','wenJianJia.htm','testframe',0)
	tabbox1.add('7','接收POP3邮件','POP3.htm','testframe',0)
	tabbox1.add('8','邮件设置','youJianSheZhi.htm','testframe',0)

</script>
<script language="JavaScript" src="../../script/public.js"></script>
<script language="JavaScript" src="../../script/fccsort.js"></script>
<script language="JavaScript" src="../../script/fcccalendar.js"></script>
<script language="JavaScript" src="../../script/fccpage.js"></script>
<script language="JavaScript" src="../../script/fccvalidator.js"></script>
<script>
webcontext = "../../";
</script>
</head>

<body>
<form>
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<input type="hidden" name="PageCond/begin" value="0">
<input type="hidden" name="PageCond/count" value="65">
<input type="hidden" name="PageCond/length" value="20">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="../../image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;邮件管理</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr class="text">
    <td width="43%" align="left"><input name="Submit3" type="button" class="button_02" value="删 除" onClick="deleteRows()" />
      <input name="Submit32" type="button" class="button_02" value="回 复" onClick="deleteRows()" />
      <input name="Submit33" type="button" class="button_02" value="转 发" onClick="deleteRows()" /></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#A2C4DC" class="small">
  <tr class="td1">
    <td width="7%" align="center" nowrap class="td_title">选择</td>
      <td width="10%" align="center" nowrap class="td_title">类别</td>
      <td width="15%" align="center" nowrap class="td_title">发送人</td>
      <td width="51%" align="center" nowrap class="td_title">内容</td>
      <td align="center" nowrap class="td_title">发送时间</td>
  </tr>
    
    <tr class="td2">
      <td align="center" ><input type="checkbox"  name="checkone" value="604"></td>
 <td align="center" ><div align="left">
       回复信息</td>
      <td  align="center">吴秋萍,</td>
      <td title="收到" style="cursor:hand">收到
</td>
      <td nowrap width="17%">2006-10-27 10:57:54.0</td>  
    </tr>
	
    <tr class="td1">
      <td align="center" ><input type="checkbox"  name="checkone" value="603"></td>
 <td align="center" ><div align="left">新消息</td>
      <td  align="center">刘小平,</td>
      <td title="测试!!!" style="cursor:hand">测试!!!
</td>
      <td nowrap width="17%">2006-07-10 15:57:58.0</td>
    </tr>
	
    <tr class="td2">
      <td align="center" ><input type="checkbox"  name="checkone" value="599"></td>
 <td align="center" ><div align="left">
       回复信息</td>
      <td  align="center">刘小平,</td>
      <td title="系统管理员：你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信息已收!" style="cursor:hand"><a href="#">系统管理员：你发来的信息已收!你发来的信息已收!你发来的信息已收!你发来的信...</a></td>
      <td nowrap width="17%">2006-06-12 11:21:44.0</td>  
    </tr>
	
    <tr class="td1">
      <td align="center" ><input type="checkbox"  name="checkone" value="598"></td>
 <td align="center" ><div align="left">
       新消息</td>
      <td  align="center">刘小平,</td>
      <td title="集体测试!!!!" style="cursor:hand">集体测试!!!!
</td>
      <td nowrap width="17%">2006-06-12 11:13:54.0</td>
    </tr>
	
    <tr class="td2">
      <td align="center" ><input type="checkbox"  name="checkone" value="592"></td>
 <td align="center" ><div align="left">
       回复信息</td>
      <td  align="center">系统管理员,</td>
      <td title="可以" style="cursor:hand">可以
</td>
      <td nowrap width="17%">2005-12-28 19:00:16.0</td>  
    </tr>
	
</table>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" class="text"><script>
				PageCond(document.forms[0]);
		     </script>
    </td>
  </tr>
</table>
</form>
</body>
</html>

