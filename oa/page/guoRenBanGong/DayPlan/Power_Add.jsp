<%@ include file="/internet/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function selectViewlMan( ){

	var frm = document.forms[0];
	var height = 500;
	
	var retArr = window.showModalDialog("tools.pr.pr_DoSelectedMan.do",userArray,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	if(retArr!=null){
	var temp = retArr.split("|");
	frm.elements["TOOLS_VIEWRIGHT/MEMBER"].value=temp[0];
	frm.elements["check"].value=temp[1];
	}
	


}
function selectArrangeMan( ){

	var frm = document.forms[0];
	var height = 500;
	
	var retArr = window.showModalDialog("tools.pr.pr_DoSelectedMan1.do","","dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	if(retArr!=null){
	var temp = retArr.split("|");
	frm.elements["TOOLS_ARRANGER/ARRANGE"].value=temp[0];
	frm.elements["arrange"].value=temp[1];
	}
	
	


}
</script>
<script language="JavaScript">
var userArray = new Array();
var  hasViewName ="";
var  hasViewId = "";
var i = 0;
 <logic:iterate id="resultset" property="list[@type='sel']">
   userArray[i++] = "<bean:write id="resultset" property="PERSONS/id" />";
 </logic:iterate>
 
 <logic:iterate id="resultset" property="list[@type='sel']">
  hasViewName+= "<bean:write id="resultset" property="PERSONS/name" />"+",";
</logic:iterate>
 <logic:iterate id="resultset" property="list[@type='sel']">
  hasViewId+= "<bean:write id="resultset" property="PERSONS/id" />"+",";
</logic:iterate>



var userArray1 = new Array()
var hasArrangeName = "";
var hasArrangeId = "";
var j = 0;
 <logic:iterate id="resultset" property="list[@type='sel1']">
   userArray1[j++] = "<bean:write id="resultset" property="PERSONS/id" />";
 </logic:iterate>
 
 <logic:iterate id="resultset" property="list[@type='sel1']">
  hasArrangeName+= "<bean:write id="resultset" property="PERSONS/name" />"+",";
</logic:iterate>
 <logic:iterate id="resultset" property="list[@type='sel1']">
  hasArrangeId+= "<bean:write id="resultset" property="PERSONS/id" />"+",";
</logic:iterate>
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州市外商投资行政服务信息系统</title>
<link href="/internet/theme/style0/style.css"" rel="stylesheet" type="text/css">
</head>

<body>

<table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="where">
  <tr>
    <td>&nbsp;&nbsp; ※&nbsp;您的位置：我的桌面--&gt;常用工具--&gt;日程安排</td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="23"><img src="/internet/images/red_BODY_left.gif" width="23" height="23"></td>
    <td background="/internet/images/red_BODY_bg.gif"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><table height="23"  border="0" cellpadding="0" cellspacing="0">
              <tr align="center">
                <td width="82" class="Column_blue">设置权限</td>
              </tr>
          </table></td>
        </tr>
    </table></td>
    <td width="15"><img src="/internet/images/red_BODY_right.gif" width="15" height="23"></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <form name="form1" method="post" action="tools.pr.pr_DoInsertPower.do">
 <input type="hidden" name ="TOOLS_VIEWRIGHT/MEMBER"/>
 <input type="hidden" name ="TOOLS_ARRANGER/ARRANGE"/>
 <input type="hidden" name="USERACCOUNT" value="<%=request.getParameter("USERACCOUNT")%>"/>
 <input type="hidden" name="year" value="<%=request.getParameter("year")%>"/>
 <input type="hidden" name="month" value="<%=request.getParameter("month")%>"/>
  <tr>
    <td width="15" background="/internet/images/red_BODY_leftbg.gif">&nbsp;</td>
    <td><table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td> </td>
      </tr>
    </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1">
            <tr class="td1">
              <td width="16%" align="right">查看日程：</td>
              <td width="84%">&nbsp;
                <input  readonly="true" name="check" type="text" size="60" value='<logic:iterate id="resultset" property="list[@type='sel']'><bean:write id="resultset" property="PERSONS/name" />,</logic:iterate>">                
                <input name="Submit" type="button" class="button_six" value="选择人员" 
                onClick="javascript:selectViewlMan();">
                </td>
            </tr>
            <tr class="td1">
              <td align="right">安排日程：</td>
              <td>&nbsp; <input name="arrange" type="text" size="60" readonly="true">
                <input name="Submit2" type="button" class="button_six" value="选择人员" onClick="javascript:selectArrangeMan();"></td>
            </tr>
          </table> </td>
        </tr>
      </table>      
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center">             
           <input name="Submit222" type="submit" class="button_six" value="保存并返回">
              <input name="Submit223" type="button" class="button_new" value="返回" onClick="javascript:history.back();">
</td></tr>
      </table></td>
    <td width="15" background="/internet/images/red_BODY_rightbg.gif">&nbsp;</td>
  </tr>
</form>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="18"><img src="/internet/images/red_BODY_downleft.gif" width="24" height="24"></td>
    <td background="/internet/images/red_BODY_downbg.gif">&nbsp;</td>
    <td width="18"><img src="/internet/images/red_BODY_downright.gif" width="24" height="24"></td>
  </tr>
</table>
</body>
</html>
<%@ include file="/internet/commonTail.jsp" %>
<script language="JavaScript">
document.all["check"].value=hasViewName.substring(0,hasViewName.length-1);
document.all["TOOLS_VIEWRIGHT/MEMBER"].value=hasViewId.substring(0,hasViewId.length-1);
document.all["arrange"].value=hasArrangeName.substring(0,hasArrangeName.length-1);
document.all["TOOLS_ARRANGER/ARRANGE"].value=hasArrangeId.substring(0,hasArrangeId.length-1);
</script>
