<%@include file="/internet/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Primeton EOS v5.1</title>
<!-- Add a progrss bar script -->
<script language='javascript' src='/internet/scripts/progress.js' type='text/javascript'> </script>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css">

</head>

<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"> 
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td width="20%"><img src="/internet/WFCOMMON/images/logo.gif" width="221" height="44"></td>
        <td width="80%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td width="70"><a href="forward.do?nextPage=/internet/welcome.jsp"><img src="/internet/WFCOMMON/images/home.gif" width="58" height="22" border="0"></a></td>
            <td width="70"><a href="/internet/logout.jsp"><img src="/internet/WFCOMMON/images/zx.gif" width="58" height="22" border="0"></a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2" class="top_meun">
		<!-- MENU BEGIN -->
		<!--
		ʹ��˵����
			startTop	 [�˵�top����]
			startLeft	 [�˵�left����]
			lineMenuCount[ÿ�п�����ʾ�Ĳ˵�����]
			menuTextLen	 [ÿ���˵���������ʾ���ֽ���]
			menuWidth	 [���˵����]
			subMenuWidth [�Ӳ˵����]
		
		�˵��ܿ�� (1000-startLeft) = lineMenuCount * menuWidth
		�������˵���Ҫע�⣬���lineMenuCount��menuWidth����һ���趨(����ΪmenuWidth)����һ��Ӧ�ð���ʽ(750/menuWidth)
		����ó�
		-->
		<eos:dropMenu startTop="44" startLeft="0" lineMenuCount="8" menuTextLen="16" menuWidth="124" subMenuWidth="124"/>
		<script type='text/javascript' src='/internet/config_var.js'></script>
		<script type='text/javascript' src='/internet/menu_com.js'></script>
		<!-- MENU END -->
		</td>
      </tr>
      <tr>
          <td colspan="2" class="heise"><b>Welcome, <bean:write property="SessionEntity/userID"/> |&nbsp;From:<bean:write property="SessionEntity/remoteAddr"/></b></td>
      </tr>
    </table>
	  <table width="100%" height="99%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp; </td>
        </tr>
        <tr>
          <td height="100%">
            <table width="100%" height="99%" border="0" cellspacing="0" cellpadding="0" align="right">
              <tr> 
                <td valign="top" >
	     
  	 
	            
