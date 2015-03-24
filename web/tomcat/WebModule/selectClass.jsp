<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@ page import="java.util.*"  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中共广州市委党校</title>
<link href="/css/css.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.STYLE1 {
	color: #F83818;
	font-size: 14px;
	font-weight: bold;
}
.STYLE2 {
	color: #FF0000;
	font-size: 12px;
	
}

.STYLE3 {
	color: #000000;
	font-size: 12px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

-->
</style>
</head><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@include file="common/top.jsp" %></td>
  </tr>
  <tr>
    <td><html:form action="login.do?action=selectClass"  target="_top" onsubmit="return checkLogin()">
<table width="100%" height="400" border="0" cellpadding="0" cellspacing="0" bgcolor="#F8D8B8">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      
        
       
        <tr>
          <td colspan="2" align="center">
          
        <table width="50%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#F8D8B8">
          <tr>
          <td colspan="2" align="left" >&nbsp;
          <logic:present name="errorStr">
          	<span class="STYLE1"><bean:write name="errorStr"/></span>
          </logic:present>
          </td>
        </tr>
        
         <tr>
          <td colspan="2" align="center" height="15">&nbsp;
          
          </td>
        </tr>
       <%
       ArrayList list = (ArrayList) request.getAttribute("classList");
       Iterator it = list.iterator();
       while(it.hasNext()){
       			HashMap map = (HashMap)it.next();
       			String operatorID = (String)map.get("operatorID");
       			String className = (String)map.get("className");
       			Integer isHistoryClass = (Integer)map.get("isHistoryClass");
       			int isHistory = 1;
       			if (isHistoryClass!=null)isHistory = isHistoryClass.intValue();
       			if (className==null||"".equals(className)) className = "以教师身份登陆";
       			
        %>
        <tr class="STYLE3">
          <td align="center"><input type="radio" name="operatorId" value="<%=operatorID %>" onclick="selectClass(this.value)"></td>
          <td align="left"><%=className %><%String className1 = (String)session.getAttribute("className1");
          //Integer i = (Integer)session.getAttribute("j");
          //int isHistory = i.intValue();
          //out.println(isHistory);
          if(isHistory==0){%>
          		<font color="red">(当前班)</font>
          <%}
           %></td>
        </tr>
       <%} %>
      </table> 
          
          </td>
        </tr>
        <tr>
          <td height="60" colspan="2" align="center">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form></td>
  </tr>
  <tr >
    <td valign="top"><%@include file="common/bottom.jsp" %></td>
  </tr>
</table>
<script type="text/javascript">
//选中Radio的值
function getRadioValue(name) {
		var eles = document.getElementsByName(name);
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
				if(obj.checked){
				  return obj.value;
			     }
			i++
		}//while
}

function selectClass(operatorId){
	var frm = document.forms[0];
	frm.action =frm.action+"&operatorId="+operatorId;
	frm.submit();
}



</script>



