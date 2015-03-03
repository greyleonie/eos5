<script language="JavaScript" src="../../script/public.js"></script>
<script language="JavaScript" src="../../script/fccsort.js"></script>
<script language="JavaScript" src="../../script/fcccalendar.js"></script>
<script language="JavaScript" src="../../script/fccpage.js"></script>
<script language="JavaScript" src="../../script/fccvalidator.js"></script>
<script>
webcontext = "../../";
</script>
<title>广州市委党校信息一体化平台</title>
<link href="../../INDEX.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form>
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<input type="hidden" name="PageCond/begin" value="0">
<input type="hidden" name="PageCond/count" value="65">
<input type="hidden" name="PageCond/length" value="20">
<link href="../../INDEX.css" rel="stylesheet" type="text/css" />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="../../image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;邮件设置</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="98%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr class="tdtitle">
    <td align="left"><input name="Submit" type="button" class="button_02" value="新 增" onclick="pop3add()" />
      <input name="Submit3" type="button" class="button_02" value="删 除" onclick="deleteRows()" />
      <input name="Submit3" type="button" class="button_02" value="查 看" onclick="pop3View()" />
    </td>
  </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
  <tr class="tdtitle">
    <td width="4%" height="20" align="center" class="td_title"><input type="checkbox" name="checkbox" marked="fcc" onclick="eosCheckAll(document.queryForm,this)" /></td>
    <td width="23%" align="center" class="td_title" ondblclick="eosOrderBy('POP3ADDRESS')">POP3服务器</td>
    <td width="15%" align="center" class="td_title" ondblclick="eosOrderBy('INCEPTMAILDIR')">接收邮件夹</td>
    <td width="20%" align="center" class="td_title" ondblclick="eosOrderBy('SMTPSERVER')">>SMTP服务器</td>
    <td width="12%" align="center" class="td_title" ondblclick="eosOrderBy('POP3NAME')">帐号名称</td>
    <td width="12%" align="center" class="td_title" ondblclick="eosOrderBy('DEFAULTFLAG')">帐号状态</td>
    <td width="14%" align="center" nowrap="nowrap" class="td_title" ondblclick="eosOrderBy('DEFAULTFLAG')">操作</td>
  </tr>
  <tr class="td1" >
    <td height="20" align="center"><input type="checkbox" name="list[@name='update']/TOOL_MAILSERVER[@hciTagIndex=&quot;0&quot;]/SERVERID" value="4" class="mycheckbox" /></td>
    <td align="left">218.20.227.21:7001</td>
    <td align="left"> 收件夹 </td>
    <td align="left">:25</td>
    <td align="left">admin</td>
    <td align="left"> 正常 </td>
    <td align="center"><a href="#" onclick="pop3modifyLink('4')">修改</a></td>
  </tr>
  <tr class="td2" >
    <td height="20" align="center"><input type="checkbox" name="list[@name='update']/TOOL_MAILSERVER[@hciTagIndex=&quot;1&quot;]/SERVERID" value="2" class="mycheckbox" /></td>
    <td align="left">pop3.126.com:110</td>
    <td align="left"> 收件夹 </td>
    <td align="left">smtp.126.com:25</td>
    <td align="left">test</td>
    <td align="left"> 正常 </td>
    <td align="center"><a href="#" onclick="pop3modifyLink('2')">修改</a></td>
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
