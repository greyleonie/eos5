
<html>

<head>
<title>�ѽ��ն���Ϣ</title>
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
alert("��ѡ��Ҫɾ���ļ�¼");
}
else{
if(confirm("���Ҫɾ����Щ��Ϣ�𣿣�")){
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
alert("��ѡ��Ҫ�ظ��ļ�¼");
}
if(x1>1){
alert("�ظ�ʱֻ��ѡ��һ����¼��");
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
		alert("��ѡ��Ҫ�ظ��ļ�¼");
		return false;
	}

	if(x1>1){
		alert("�ظ�ʱֻ��ѡ��һ����¼��");
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
			alert("��ѡ��Ҫ�ظ��ļ�¼");
			return false;
		}

		if(x1>1){
			alert("�ظ�ʱֻ��ѡ��һ����¼��");
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
	tabbox1.add('1','�����ڲ��ʼ�','faSongNeiBuYouJian.htm','testframe',0)
	tabbox1.add('2','�����ⲿ�ʼ�','faSongWeiBuYouJian.htm','testframe',0)
	tabbox1.add('3','�ռ���','shuoJianXiang.htm','testframe',0)
	tabbox1.add('4','������','faJianXiang.htm','testframe',0)
	tabbox1.add('5','�ݸ���','caoGaoXiang.htm','testframe',0)
	tabbox1.add('6','�ļ��й���','wenJianJia.htm','testframe',0)
	tabbox1.add('7','����POP3�ʼ�','POP3.htm','testframe',0)
	tabbox1.add('8','�ʼ�����','youJianSheZhi.htm','testframe',0)

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
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;�ʼ�����</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr class="text">
    <td width="43%" align="left"><input name="Submit3" type="button" class="button_02" value="ɾ ��" onClick="deleteRows()" />
      <input name="Submit32" type="button" class="button_02" value="�� ��" onClick="deleteRows()" />
      <input name="Submit33" type="button" class="button_02" value="ת ��" onClick="deleteRows()" /></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#A2C4DC" class="small">
  <tr class="td1">
    <td width="7%" align="center" nowrap class="td_title">ѡ��</td>
      <td width="10%" align="center" nowrap class="td_title">���</td>
      <td width="15%" align="center" nowrap class="td_title">������</td>
      <td width="51%" align="center" nowrap class="td_title">����</td>
      <td align="center" nowrap class="td_title">����ʱ��</td>
  </tr>
    
    <tr class="td2">
      <td align="center" ><input type="checkbox"  name="checkone" value="604"></td>
 <td align="center" ><div align="left">
       �ظ���Ϣ</td>
      <td  align="center">����Ƽ,</td>
      <td title="�յ�" style="cursor:hand">�յ�
</td>
      <td nowrap width="17%">2006-10-27 10:57:54.0</td>  
    </tr>
	
    <tr class="td1">
      <td align="center" ><input type="checkbox"  name="checkone" value="603"></td>
 <td align="center" ><div align="left">����Ϣ</td>
      <td  align="center">��Сƽ,</td>
      <td title="����!!!" style="cursor:hand">����!!!
</td>
      <td nowrap width="17%">2006-07-10 15:57:58.0</td>
    </tr>
	
    <tr class="td2">
      <td align="center" ><input type="checkbox"  name="checkone" value="599"></td>
 <td align="center" ><div align="left">
       �ظ���Ϣ</td>
      <td  align="center">��Сƽ,</td>
      <td title="ϵͳ����Ա���㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!" style="cursor:hand"><a href="#">ϵͳ����Ա���㷢������Ϣ����!�㷢������Ϣ����!�㷢������Ϣ����!�㷢������...</a></td>
      <td nowrap width="17%">2006-06-12 11:21:44.0</td>  
    </tr>
	
    <tr class="td1">
      <td align="center" ><input type="checkbox"  name="checkone" value="598"></td>
 <td align="center" ><div align="left">
       ����Ϣ</td>
      <td  align="center">��Сƽ,</td>
      <td title="�������!!!!" style="cursor:hand">�������!!!!
</td>
      <td nowrap width="17%">2006-06-12 11:13:54.0</td>
    </tr>
	
    <tr class="td2">
      <td align="center" ><input type="checkbox"  name="checkone" value="592"></td>
 <td align="center" ><div align="left">
       �ظ���Ϣ</td>
      <td  align="center">ϵͳ����Ա,</td>
      <td title="����" style="cursor:hand">����
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

