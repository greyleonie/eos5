<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<%@ page import="com.primeton.eos.wf.web.util.*" %>
<%@ page import="com.primeton.tp.core.Constants" %>
<%
    /**
     *Add by yuanrongyu ���session�е�EOS_TREE_MENU
     */
    if(session.getAttribute("EOS_TREE_MENU")!=null)
    {
        session.removeAttribute("EOS_TREE_MENU");
    }
    if(session.getAttribute("dropMenuScript")!=null) session.removeAttribute("dropMenuScript");
    
    session.setAttribute("loginURL","/internet/WFCOMMON/login.jsp");
%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�������ͻ���</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 4px;
	margin-right: 0px;
}
-->
</style>
<script language="JavaScript">
	var port;
	var sslport;
	
	port = location.port;
    containerProduct = <%= Constants.CONTAINER_PRODUCT %>;
    if (containerProduct == 0 || containerProduct == 1)
    {
    	sslport = 7002;
    }
    else if (containerProduct == 2 || containerProduct == 3 || containerProduct == 4 || containerProduct == 5)	 
    {
    	sslport = 9443;    
    }
    else if (containerProduct == 6 || containerProduct == 7 || containerProduct == 8)	 
    {
    	sslport = 8081;        	
    }    
</script>
</head>

<body>
<div id=detail style="z-index: 3; position: absolute"></div>
<form name="login" method="post" action="WFCOMMON.pr_automata.login.do" focus="EOSOperator/userID">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="images/logo.gif" width="218" height="44"></td>
    </tr>
    <tr>
      <td class="login_bj">&nbsp;</td>
    </tr>
    <tr>
      <td><table width="800"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="120">&nbsp;</td>
            <td class="eos_server_wz"><img src="images/login/eos_server_v5.0.gif" width="218" height="55"> 
              <%
	String returnCode = EOSWebUtil.getBizAutomataReturnCode(request);
    String title = null;
    String content = null;
    if(returnCode != null && returnCode.length() > 0){
    	if(returnCode.equals("-12")){
			    title = WFErrorConfig.getConfigTitle(returnCode);
				content = WFErrorConfig.getConfigContent(returnCode);
				out.println("<br><font size=\"2\" color=\"#FF0000\">"+content+"</font>");
		}else {
				out.println("<br><font size=\"2\" color=\"#FF0000\">�û����������</font>");
		}
	}
	
%>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
            <td class="login_bk1"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="399"> 
                    <table width="399"  border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="125"><img src="images/login/login_01.gif" width="125" height="113"></td>
                        <td width="229"><img src="images/login/login_02.gif" width="229" height="113"></td>
                        <td width="45"><img src="images/login/login_03.gif" width="45" height="113"></td>
                      </tr>
                      <tr> 
                        <td><img src="images/login/login_04.gif" width="125" height="124"></td>
                        <td valign="top" bgcolor="EEEEEE">
                          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="31%" class="login_css">�û�����</td>
                              <td width="69%" class="login_right">
                                <html:text property="EOSOperator/userID" size="20" style="font-family:tahoma"/>
                              </td>
                            </tr>
                            <tr> 
                              <td class="login_css">�ܡ��룺</td>
                              <td class="login_right">
								<html:password property="EOSOperator/password" size="20" style="font-family:tahoma"/>
								<input type="hidden" name="mode" value="standard">
                              </td>
                            </tr>
                            <tr> 
                              <td class="login_css">&nbsp;</td>
                              <td class="login_right">
                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="50%">
                                      <input name="Submit" type="submit" class="denglu" value="��  ½">
                                    </td>
                                    <td width="50%">&nbsp;</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr> 
                              <td class="login_css">ģ  ʽ��</td>
                              <td id="loginMode" class="login_right"></td>
                            </tr>
                          </table>
                        </td>
                        <td><img src="images/login/login_05.gif" width="45" height="124"></td>
                      </tr>
                      <tr>
                        <td><img src="images/login/login_06.gif" width="125" height="73"></td>
                        <td><img src="images/login/login_07.gif" width="229" height="73"></td>
                        <td><img src="images/login/login_08.gif" width="45" height="73"></td>
                      </tr>
                    </table>
                  </td>
                  <td>
                    <table width="100%" border="0" height="100%" cellspacing="0" cellpadding="0">
                      <tr class="login_css"> 
                        <td align="left" width="30%" class="login_css">ȱʡ�û�:</td>
                        <td align="left" width="70%" class="login_right">tiger</td>
                      </tr>
                      <tr class="login_css"> 
                        <td align="left" width="30%" class="login_css">��&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
                        <td align="left" width="70%" class="login_right">000000</td>
                      </tr >
                      <tr class="login_css"> 
                        <td align="left" colspan="2"><br>
                        </td>
                      </tr >
                      <tr class="login_css"> 
                        <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ͻ���������������<br>
                          �ʹ�������ı�ݹ��ߡ�������Ҫ<br>
                          ������<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--�ҵ�����<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--�ҵ�����<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--��������<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--ҵ�����̵���<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--����ʵ������<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--�߼���ѯ<br>
                          &nbsp;&nbsp;&nbsp;&nbsp;--��Ƽ�� </td>
                      </tr>
                    </table>
                  </td>
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
<script language="javascript">
	document.login.elements['EOSOperator/userID'].focus();
    dStyle = detail.style;
    login.all.loginMode.innerHTML = '�� ׼ | '+'<a href=https://' + location.hostname + ':' + sslport + '/internet/WFCOMMON/login_s.jsp' + '?Port=' + location.port + '>�� ȫ</a>';
</script>
</html:html>
