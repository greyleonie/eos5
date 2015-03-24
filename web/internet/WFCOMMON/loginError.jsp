<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<%
    /**
     *Add by yuanrongyu 清空session中的EOS_TREE_MENU
     */
    if(session.getAttribute("EOS_TREE_MENU")!=null)
    {
        session.removeAttribute("EOS_TREE_MENU");
    }
    if(session.getAttribute("dropMenuScript")!=null) session.removeAttribute("dropMenuScript");
%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>工作流客户端</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 4px;
	margin-right: 0px;
}
-->
</style></head>

<body>
<form name="login" method="post" action="WFCOMMON.pr_automata.login.do" focus="EOSOperator/userID">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="/internet/images/logo.gif" width="218" height="44"></td>
    </tr>
    <tr>
      <td class="login_bj">&nbsp;</td>
    </tr>
    <tr>
      <td><table width="800"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="120">&nbsp;</td>
          <td class="eos_server_wz">
		  	<img src="/internet/WFCOMMON/images/login/eos_server_v5.0.gif" width="222" height="55">
			<font size="4" color="#FF0000">用户名或密码错误，请您重新登录。</font>
		  </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
            <td class="login_bk1"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="50%">
                    <table width="399"  border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="125"><img src="/internet/WFCOMMON/images/login/login_01.gif" width="125" height="113"></td>
                        <td width="229"><img src="/internet/WFCOMMON/images/login/login_02.gif" width="229" height="113"></td>
                        <td width="45"><img src="/internet/WFCOMMON/images/login/login_03.gif" width="45" height="113"></td>
                      </tr>
                      <tr> 
                        <td><img src="/internet/WFCOMMON/images/login/login_04.gif" width="125" height="124"></td>
                        <td valign="top" bgcolor="EEEEEE"> 
                          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="31%" class="login_css">用户名：</td>
                              <td width="69%" class="login_right">
                                <html:text property="EOSOperator/userID" size="20" style="font-family:tahoma"/></td>
                            </tr>
                            <tr> 
                              <td class="login_css">密　码：</td>
                              <td class="login_right">
                                <html:password property="EOSOperator/password" size="20" style="font-family:tahoma"/></td>
                            </tr>
                            <tr> 
                              <td class="login_css">&nbsp;</td>
                              <td class="login_right"> 
                                <input name="Submit" type="submit" class="denglu" value="登  陆">
                              </td>
                            </tr>
                            <tr> 
                              <td class="login_css">模　式：</td>
                              <td class="login_right">标准 | 安全</td>
                            </tr>
                          </table>
                        </td>
                        <td><img src="/internet/WFCOMMON/images/login/login_05.gif" width="45" height="124"></td>
                      </tr>
                      <tr> 
                        <td><img src="/internet/WFCOMMON/images/login/login_06.gif" width="125" height="73"></td>
                        <td><img src="/internet/WFCOMMON/images/login/login_07.gif" width="229" height="73"></td>
                        <td><img src="/internet/WFCOMMON/images/login/login_08.gif" width="45" height="73"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="50%"> 
                    <table width="100%" border="0" height="100%" cellspacing="0" cellpadding="0">
                      <tr class="login_css"> 
                        <td align="right" width="30%" class="login_css">缺省用户:</td>
                        <td align="left" width="70%" class="login_right"> tiger</td>
                      </tr>
                      <tr class="login_css"> 
                        <td align="right" width="30%" class="login_css">密码:</td>
                        <td align="left" width="70%" class="login_right">000000</td>
                      </tr >
                      <tr class="login_css"> 
                        <td align="left" colspan="2">&nbsp;</td>
                      </tr >
                      <tr class="login_css"> 
                        <td align="left" colspan="2">&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="copyright">Copyright 


 (c) 2005 Primeton Technologies Ltd. All right reserved.</td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html:html>
<script language="javascript">
	document.forms[0].elements['EOSOperator/userID'].focus();
</script>
