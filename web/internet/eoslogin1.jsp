<%@ page import="com.primeton.tp.core.Constants" %>
<%@include file="/internet/common.jsp"%>
<%
	/**
	*Add by yuanrongyu 清空session中的EOS_TREE_MENU
	*/
	if(session.getAttribute("EOS_TREE_MENU")!=null)
	{
		session.removeAttribute("EOS_TREE_MENU");
	}
	if(session.getAttribute("sessionContext")!=null){
		session.removeAttribute("sessionContext");
	}

	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String model = request.getParameter("model");
	if( model==null ) model = "normal";

	session.setAttribute("model",model);
	String prePort = request.getParameter("port");
	if( prePort==null || "".equals(prePort) ) prePort = "null";
	if( !model.equals("normal") ) session.setAttribute("port",prePort);
	
	session.setAttribute("loginURL","/internet/login.jsp?model="+model+"&port="+prePort);
%>
<html:html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>primeton EOS5.1</title>
		<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
		<link rel="stylesheet" href="/internet/css/login_css.css"  type="text/css">		
	</head>
	<script language="JavaScript">
		var port;
		var sslport;
		var m;
		m='<%= model%>';
		if( m!='normal' ) port = <%=prePort%>;
		if( port==null ) port = location.port;

		containerProduct = <%= Constants.CONTAINER_PRODUCT %>;

		if (containerProduct == 0 || containerProduct == 1){
			sslport = 7002;
		}else if (containerProduct == 2 || containerProduct == 3 || containerProduct == 4 || containerProduct == 5){
			sslport = 9443;    
		}else if (containerProduct == 6 || containerProduct == 7 || containerProduct == 8){
			sslport = 8081;        	
		}    

		
	</script>
	<body style="margin-left:0px;margin-top:4px;margin-right:0px">
		<form name="login" method="post" action="ROLE.pr_automata.login.do" focus="EOSOperator/userID" onsubmit="javascript:return false;">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="/internet/images/logo.gif" width="218" height="44"></td>
				</tr>
				<tr>
					<td class="login_bj">&nbsp;</td>
				</tr>
				<tr>
					<td>
						<table width="800"  border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="120">&nbsp;</td>
								<td class="eos_server_wz">
									<%if( model.equals("normal") ){%>
									<img src="images/eos_server_v5.0.gif" width="222" height="55">
									<%}else{%>
									<img src="images/eos_server_v5.0s.gif" width="222" height="55">
									<%}%>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td class="login_bk1">
									<table width="399"  border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="112"><img src="/internet/images/login_01.gif" width="125" height="113"></td>
											<td width="154"><img src="/internet/images/login_02.gif" width="229" height="113"></td>
											<td width="133"><img src="/internet/images/login_03.gif" width="45" height="113"></td>
										</tr>
										<tr>
											<td><img src="/internet/images/login_04.gif" width="125" height="124"></td>
											<td valign="top" bgcolor="EEEEEE"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
										</tr>
										<tr>
											<td width="31%" class="login_css">用户名：</td>
											<td width="69%" class="login_right"><html:text property="EOSOperator/userID" size="15"/></td>
										</tr>
										<tr>
											<td class="login_css">密　码：</td>
											<td class="login_right"><html:password property="EOSOperator/password" size="15"/></td>
										</tr>
										<tr>
											<td class="login_css">&nbsp;</td>
											<td class="login_right">
												<input name="button1" type="submit" class="denglu" value="登 录" onclick="javascript:_login();"/>
												<%if( !model.equals("normal") ){%><img src="images/lock.gif"><%}%>
											</td>
										</tr>
										<tr>
											<td class="login_css">模  式：</td>
											<td id="loginMode" class="login_right"></td>
										</tr>
									</table>
								</td>
								<td><img src="/internet/images/login_05.gif" width="45" height="124"></td>
							</tr>
							<tr>
								<td><img src="/internet/images/login_06.gif" width="125" height="73"></td>
								<td><img src="/internet/images/login_07.gif" width="229" height="73"></td>
								<td><img src="/internet/images/login_08.gif" width="45" height="73"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="copyright">Copyright (c) 2005 Primeton Technologies Ltd. All right reserved.</td>
				</tr>
			</table>		
			</form>
			
			<script type='text/javascript' src='/internet/scripts/check.js'></script>
			<script language="javascript">
				if( m=='normal' ){		
					var str = '标准 | <a href=\"https://' + location.hostname + ':' + sslport + location.pathname + '?model=professional&port='+port+'\">安全</a>';
					loginMode.innerHTML = str;
				}else{
					loginMode.innerHTML = '<a href=\"http://' + location.hostname + ':' + port + location.pathname + '?model=normal&port='+sslport+'\">标准</a> | 安全';
				}

				document.forms[0].elements['EOSOperator/userID'].focus();
			
				function _login(){
					var frm = document.login;
					frm.target="_parent"
					

					if(frm.elements["EOSOperator/userID"].value =="") {
						alert("请输入用户登录名");
						frm.elements["EOSOperator/userID"].focus();
						return;
					}
					if(getTotalBytes(frm.elements["EOSOperator/userID"])>64) {
						alert("用户登录名不能超过64个字节，请重新输入！");
						return;
					}	
					if(frm.elements["hciPasswordTypeEOSOperator/password"].value =="") {
						alert("请输入密码");
						frm.elements["hciPasswordTypeEOSOperator/password"].focus();
						return;
					}
					if(frm.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || 	frm.elements["hciPasswordTypeEOSOperator/password"].value.length > 20) {
						alert("密码长度请在6--20位之间");
						frm.elements["hciPasswordTypeEOSOperator/password"].focus();
						return;
					}
					frm.submit();
				}
			</script>
		</body>	
</html:html>