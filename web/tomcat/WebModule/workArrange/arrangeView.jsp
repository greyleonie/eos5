<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>
<body>
<html:form action="/arrange.do?action=replyDo" method="post">
<html:hidden property="arrangeId"  name="arrange" />
<table border="0" width="98%" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="100%" >
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8" id="detail">
        <tr >
            <td width="10%" align="right" class="td">�������ڣ�</td>
             <td width="40%" align="center" class="td1" ><bean:write property="calendarDate"  name="arrange"/></td>
            <td width="10%" align="right" class="td">�ƶ��ˣ�</td>
              <td  width="40%" align="center" class="td1"><bean:write property="userName" name="arrange"/></td>
        </tr>
         <tr>
            <td  align="right" class="td">������Ҫ��</td>
             <td align="center" class="td1" colspan="3"><bean:write property="tasksum"  name="arrange"/></td>
    
        </tr>
         <tr>
            <td align="right" class="td">�������ݣ�</td>
             <td align="center" class="td1" colspan="3"><bean:write property="taskcontent"  name="arrange"/></td>
    
        </tr>
                 <tr>
            <td align="right" class="td">�ظ����ݣ�</td>
             <td align="center" class="td1" colspan="3"><bean:write property="reply"  name="replay"/></td>
    
        </tr>
      </table>   
      
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" >
        <tr >
             <td align="center" class="td1" >
             <logic:equal value="0" property="type"  name="arrange">
             <input type="button" value="�� ��" onclick="reply()" id="replyBtn"/>
             <input type="button" value="ȷ ��" onclick="replyDo()" style="display: none;" id="okBtn"/>
             </logic:equal>
             <input type="button" value="�� ��" onclick="history.go(-1)"/></td>
        </tr>
         
      </table>   
      
       </td>
  </tr>
</table>
</html:form>
</body>
<script type="text/javascript">
<!--
function reply(){
	var formHTML= "";
	var oTable =document.getElementById("detail");
	var tableHTML = oTable.innerHTML;
	tableHTML = tableHTML.replace("<TBODY>", "");
	tableHTML = tableHTML.replace("</TBODY>", "");
	formHTML += "<table width=\"98%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#D8D8D8\" id=\"detail\">";
	formHTML += tableHTML;
	formHTML += "<tr >";
	formHTML += "<td align=\"right\" class=\"td\">�ظ����ݣ�</td><td class=\"td1\" colspan=\"3\">";
	formHTML += "<textarea  name=\"replyContent\"   cols=\"80\" rows=\"5\" />";
	//formHTML += "</td></tr></table>";
	oTable.outerHTML = formHTML;
	document.getElementById("replyBtn").style.display="none";
  document.getElementById("okBtn").style.display="";
}

function replyDo(){
	var frm = document.forms[0];
	var arrangeID = frm.arrangeId.value;
	frm.action="/arrange.do?action=replyDo&arrangeID="+arrangeID;
	frm.submit();
}
//-->
</script>
