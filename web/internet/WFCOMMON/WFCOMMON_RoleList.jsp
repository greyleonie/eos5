<html>
<head>
<title>��ɫ�б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ include file="/internet/common.jsp" %> 
<script type="text/javascript" src="/internet/scripts/pagination.js"></SCRIPT>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
	var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  	for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
function MM_popupMsg(msg) { //v1.0
	  alert(msg);
}

function closeWindow() 
{
	parent.window.close();
}

function addRole()
{
//alert(document.roleFrm.roleID.length);
	if(document.roleFrm.roleID.checked)
	{
		parent.opener.<bean:write property="formName"/>.<bean:write property="selectName"/>.length = 1;
		parent.opener.<bean:write property="formName"/>.<bean:write property="selectName"/>.options[0].value=document.roleFrm.roleID.value;
		parent.opener.<bean:write property="formName"/>.<bean:write property="selectName"/>.options[0].text=document.roleFrm.roleName.value;
		return closeWindow();
	}
	
	for(i=0;document.roleFrm.roleID != null && i<document.roleFrm.roleID.length;i++){
		if(document.roleFrm.roleID[i].checked){
			//alert(document.roleFrm.roleID[i].value);
			//alert(document.roleFrm.roleName[i].value);
			parent.opener.<bean:write property="formName"/>.<bean:write property="selectName"/>.length = 1;
			parent.opener.<bean:write property="formName"/>.<bean:write property="selectName"/>.options[0].value=document.roleFrm.roleID[i].value;
			parent.opener.<bean:write property="formName"/>.<bean:write property="selectName"/>.options[0].text=document.roleFrm.roleName[i].value;
			return closeWindow();
		}
	}
	alert("����ѡ��һ����ɫ!");
	
}

//-->
</script>
</head>

<body topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" text="#000000">
<form name="roleFrm" method="post" action="WFCOMMON.pr_automata.WFCOMMON_P_OpenRoleSel.do" onsubmit="return false;">
  <html:hidden property="PageCond/count"/>
  <html:hidden property="PageCond/length"/>
  <html:hidden property="PageCond/begin"/>
  
  <html:hidden property="formName"/>
  <html:hidden property="selectName"/>
  
  <script>
	var myPage = new page();
	myPage.init("roleFrm", "PageCond/begin", "PageCond/length", "PageCond/count");
  </script>
  <table width="100%" border="0" align="center">
    <tr> 
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
    <tr > 
      <td width="100%" colspan="3"> 
        <div align="left">��ɫ�б�</div>
      </td>
    </tr>
    <tr > 
      <td height="16" align="center" width="20%">ѡ��</td>
      <td height="16" align="center" width="40%">��ɫID</td>
      <td height="16" align="center" width="40%">��ɫ����</td>
    </tr>
    <logic:iterate id="roleList" property="list"> 

    <tr > 
      <td class="detailLabelTD" align="center" height="16"> 
    	<!--html:checkbox styleId="roleid" id="roleList" name="list/RoleParticipant/ID" property="RoleParticipant/ID" indexed="true" /--> 
    	<input type="radio" name="roleID" value="<bean:write id="roleList" property="RoleParticipant/ID"/>">
      </td>
      <td class="detailLabelTD" align="center" height="16"> 
	  <bean:write id="roleList" property="RoleParticipant/ID"/>
      </td>
      <td class="detailLabelTD" align="center" height="16">
	  <bean:write id="roleList" property="RoleParticipant/name"/>
	  <input type="hidden" name="roleName" value="<bean:write id="roleList" property="RoleParticipant/name"/>">
	  </td>
    </tr>
    </logic:iterate> 
	<script>
	var rowNum = <bean:write property="list/@rowNum"/>;
	for(i=0;i<10-rowNum;i++){
		document.write("<tr class=\"result_head\">");
		document.write("<td height=\"16\">&nbsp;</td>");
		document.write("<td height=\"16\">&nbsp;</td>");
		document.write("<td height=\"16\">&nbsp;</td>");
		document.write("</tr>");
	}
	</script>
  </table>	
	
<table border="0">	
    <tr > 
      <td align="center" width="18%"> 
      <input type="button" class="button" value = "ȷ��" onclick="javascript:addRole();">
      </td>
      <td align="center" width="18%">   
        <input type="button" class="button" value = "ȡ��" onclick="javascript:closeWindow();">
      </td>
      
      <td align="center" width="18%"> 
        <input type="button" class="button" value = "��һҳ" onclick="javascript:myPage.previousPage();">
      </td>
              
      <td align="center" width="18%">               
        <input type="button" class="button" value = "��һҳ" onclick="javascript:myPage.nextPage();">
      </td>
      
      <td align="right" width="28%">
        �� 
        <script>document.write(myPage.current)</script>
        ҳ/�� 
        <script>document.write(myPage.total)</script>
        ҳ 
      </td>
    </tr>
  </table>
</form>
</body>
</html>
