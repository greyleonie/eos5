<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*" %>
<%
int wk=0,ordertype=0,i=0,j=0,k=0,total=0,hasevl,noevl=0,norec=0;
String dsc="",week="",url="",status="";
%>
<head>
<style type="text/css">
<!--
.style2 {font-family: "����"}
-->
</style>
<script type="text/javascript">
function submitForm() {
var obj = document.getElementById("planweeks");

if (obj.options[obj.selectedIndex].value.indexOf("-")>=0) {
var str = obj.options[obj.selectedIndex].value.split("-");
var begin = str[0].trim();
var end = str[1].trim();

document.getElementById("week/begin").value = begin;
document.getElementById("week/end").value = end;

document.forms[0].submit();
} else {
document.forms[0].submit();
}

}

function viewEvlDetail() {
var i = 1;
var j = 0;
var path = "";
var classId = document.getElementById("Class/ClassID").value;

while (document.getElementById("checkbox"+i) != undefined) {
   if (document.getElementById("checkbox"+i).checked == true) {
      j++;
      var type = document.getElementById("checkbox"+i).value;
      var begin = document.getElementById("begin"+i).value;
      var end = document.getElementById("end"+i).value;
      if (type == '3') {
         path = "teachWorkManage.prTeachEvaluate.prExtraEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      } else if (type == '4') {
         path = "teachWorkManage.prTeachEvaluate.prFinalEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      } else if (type == '5') {
         path = "teachWorkManage.prTeachEvaluate.prShortEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      } else if (type == '1'){
         //var week = document.getElementById("week"+i).value;
         path = "teachWorkManage.prTeachEvaluate.prWeekEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      }else if (type == '2') {
         path = "teachWorkManage.prTeachEvaluate.prUnitEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      }
   } 
   i++;
}
if (j == 0) {
   alert("��ѡ������һ����������в鿴��");
   return;
} else if (j > 1) {
   alert("��ѡ������һ����������в鿴��");
   return;
} else {
   window.location.href = path;
}

}

function evlDetail(i) {
var path = "";
var classId = document.getElementById("Class/ClassID").value;


      var type = document.getElementById("checkbox"+i).value;
      var begin = document.getElementById("begin"+i).value;
      var end = document.getElementById("end"+i).value;
      if (type == '3') {
         path = "teachWorkManage.prTeachEvaluate.prExtraEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      } else if (type == '4') {
         path = "teachWorkManage.prTeachEvaluate.prFinalEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      } else if (type == '5') {
         path = "teachWorkManage.prTeachEvaluate.prShortEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      } else if (type == '1'){
         //var week = document.getElementById("week"+i).value;
         path = "teachWorkManage.prTeachEvaluate.prWeekEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      }else if (type == '2') {
         path = "teachWorkManage.prTeachEvaluate.prUnitEvlDetail.do?Class/ClassID="+classId+"&begin="+begin+"&end="+end;
      }
      window.location.href = path;
}

function getEvlDetail(id,title) {
	var current = new Date();
	var refresh = current.getTime();
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 250 ;
	var frm = document.forms[0];
      var classId = frm.elements("Class/ClassID").value;
      var className = frm.elements("Class/ClassName").value;
      var classTypeId = frm.elements("Class/ClassTypeID").value;
	  var type = document.getElementById("checkbox"+id).value;
      var begin = document.getElementById("begin"+id).value;
      var end = document.getElementById("end"+id).value;
      if (type == '3') {
         path = "teachWorkManage.prTeachEvaluate.prQueryEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=�����&begin="+begin+"&end="+end;
      } else if (type == '4') {
         path = "teachWorkManage.prTeachEvaluate.prQueryEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=��ĩ&begin="+begin+"&end="+end;
      } else if (type == '5') {
         path = "teachWorkManage.prTeachEvaluate.prQueryEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=ÿ��&begin="+begin+"&end="+end;
      } else if (type == '1'){
         path = "teachWorkManage.prTeachEvaluate.prQueryEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=ÿ��&begin="+begin+"&end="+end;
      }else if (type == '2') {
         path = "teachWorkManage.prTeachEvaluate.prQueryEvlDetail.do?classId="+classId+"&classType="+classTypeId+"&period=��Ԫ&begin="+begin+"&end="+end;
      }
      path += "&title=" + className + title;
	  path += "&refresh=" + refresh;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//��ʱ����һ��
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+path+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="280px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}
</script>
</head>

<body>
<form>
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="Class/ClassID" />
<html:hidden property="Class/ClassTypeID" />
<html:hidden property="Class/ClassName" />
<html:hidden property="week/begin" />
<html:hidden property="week/end" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ����������&gt;<span id="printTable">������鿴</span></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">�༶�� 
          <SELECT name="AssignMark/ClassID" id="AssignMark/ClassID" onchange="submitForm();">
          <option value="-1">--��ѡ��༶--</option>
          <logic:iterate id="class" property="list[@type='studentclass']">
          <%
            String classno = base.util.TalentContext.getValue(pageContext,null,"Class/ClassID");
            String classid = base.util.TalentContext.getValue(pageContext,"class","Class/ClassID");
          if (classid.equals(classno)) {
          %>
          <option value="<bean:write id="class" property="Class/ClassID"/>" selected><bean:write id="class" property="Class/ClassName"/></option>
          <% } else { %>
          <option value="<bean:write id="class" property="Class/ClassID"/>"><bean:write id="class" property="Class/ClassName"/></option>
          <% } %>
          </logic:iterate>
          </SELECT>
          <%j=1; %>
          <SELECT name="planweeks" id="planweeks" onchange="submitForm();">
          <option value="0">��ѡ����</option>
          <logic:iterate id="week" property="list[@type='planweek']">
          <%
            String planweek = request.getParameter("planweeks");
            String fromto = base.util.TalentContext.getValue(pageContext,null,"Class/ClassID");
            wk = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"week","planweek/wk"));
            if (fromto.equals(planweek)) {
          %>
          <option value="<bean:write id="week" property="planweek/fromto"/>" selected><%=TalentFunctions.getNumForCn(j)%></option>
          <% } else { %>
          <option value="<bean:write id="week" property="planweek/fromto"/>"><%=TalentFunctions.getNumForCn(j)%></option>
          <% }
          j++;%>
          </logic:iterate>
          </SELECT>
          <input name="B32" type="button" class="button_02" value="�� ѯ" onclick="submitForm();">
          </td>
        </tr>
        <tr>
          <td height="30" class="text">
            <input name="B333" type="button" class="button_eight" value="�鿴������" onclick="viewEvlDetail();">&nbsp;
            <!--<input name="B33" type="button" class="button_eight" value="�鿴�������" onclick="queryEvlDetail();">&nbsp;-->
            <!--<input name="B33" type="button" class="button_02" value="������ֹ">-->
            <input name="B34" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">&nbsp;
            <input name="B3" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="dataEntity/_order/col1/field2" value="me">
            <input type="hidden" name="dataEntity/_order/col1/asc2" value="ASC">
          </td>
        </tr>
      </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" id="listdetail">
      <tr><td>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" id="weekTitle">
      <tr class='td1'><td>ÿ�������� ��</td></tr>
      </table>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="weekDetail">
          <tr align="center" class="td_title">
            <td align="center"><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)"></td>
            <td>��</td>
            <td>ʱ��</td>
            <td>״̬</td>
            <td>���շ���</td>
            <td>δ���շ���</td>
            <td>Ӧ������</td>
          </tr>
          <% i=0; %>
          <logic:iterate id="weekevl" property="list[@type='evlList']">
		  <%
		    total = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/amount"));
		    hasevl = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/ballot"));
            wk = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/week"));
            ordertype = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/ordertype"));
            dsc = base.util.TalentContext.getValue(pageContext,"weekevl","evlList/dsc");
            status = base.util.TalentContext.getValue(pageContext,"weekevl","evlList/status");
            week = TalentFunctions.getNumForCn(wk);
          if ("δ����".equals(status)) {
               noevl = total;
               norec = 0;
            } else {
               noevl = 0;
               norec = total - hasevl;
            }
          if (ordertype == 1) {
               i++; 
          %>
		  <tr <%if (i % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)" ondblclick="evlDetail('<%=i%>')">
            <td width="5%" align="center">
               <input type="checkbox" id="checkbox<%=i%>" value="<%=ordertype%>">
               <input type="hidden" id="begin<%=i%>" value="<bean:write id="weekevl" property="evlList/bg"/>">
               <input type="hidden" id="end<%=i%>" value="<bean:write id="weekevl" property="evlList/ed"/>">
            </td>
            <td width="10%" align="center"><%=week%></td>
            <td width="23%" align="center"><bean:write id="weekevl" property="evlList/bg"/>--<bean:write id="weekevl" property="evlList/ed"/></td>
            <td width="10%" align="center"><bean:write id="weekevl" property="evlList/status"/></td>
            <td width="10%" align="center">
            <SCRIPT>
            	var total=<%=total %>;
            	var ballot=<bean:write id="weekevl" property="evlList/ballot"/>;
            	var status="<%=status %>";
            	if(total==ballot&&status=="δ����"){
            		document.write(0);
            	}else{
            		document.write(ballot);
            	}
            </SCRIPT>
            </td>
            <td width="10%" align="center"><a href="#" onmousedown="getEvlDetail('<%=i%>','��<%=week%>��')"><%=norec%></a></td>
            <td width="10%" align="center"><%=total%></td>
            <!--<td width="10%" align="center"><a href="#" onmousedown="getEvlDetail('<%=i%>','��<%=week%>��')"><%=noevl%></a></td>-->
          </tr>
          <% } %>
          </logic:iterate>
        </table>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" id="unitTitle">
        <tr class='td1'><td>��Ԫ������ ��</td></tr>
        </table>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="unitDetail">
          <tr align="center" class="td_title">
            <td align="center"><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)"></td>
            <td>��Ԫ</td>
            <td>����</td>
            <td>ʱ��</td>
            <td>״̬</td>
            <td>���շ���</td>
            <td>δ���շ���</td>
            <td>Ӧ������</td>
          </tr>
          
          <logic:iterate id="weekevl" property="list[@type='evlList']">
		  <%
		    total = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/amount"));
		    hasevl = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/ballot"));
            wk = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/week"));
            ordertype = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/ordertype"));
            dsc = base.util.TalentContext.getValue(pageContext,"weekevl","evlList/dsc");
            status = base.util.TalentContext.getValue(pageContext,"weekevl","evlList/status");
            week = dsc;
          if ("δ����".equals(status)) {
               noevl = total - hasevl;
               norec = 0;
            } else {
               noevl = 0;
               norec = total - hasevl;
            }
          if (ordertype == 2) {
               j++;
               i++;
          %>
		  <tr <%if (j % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)" ondblclick="evlDetail('<%=i%>')">
            <td width="5%" align="center">
               <input type="checkbox" id="checkbox<%=i%>" value="<%=ordertype%>">
               <input type="hidden" id="begin<%=i%>" value="<bean:write id="weekevl" property="evlList/bg"/>">
               <input type="hidden" id="end<%=i%>" value="<bean:write id="weekevl" property="evlList/ed"/>">
            </td>
            <td width="10%" align="center"><%=week%></td>
            <td width="22%" align="center"><bean:write id="weekevl" property="evlList/title"/></td>
            <td width="23%" align="center"><bean:write id="weekevl" property="evlList/bg"/>--<bean:write id="weekevl" property="evlList/ed"/></td>
            <td width="10%" align="center"><bean:write id="weekevl" property="evlList/status"/></td>
            <td width="10%" align="center"><bean:write id="weekevl" property="evlList/ballot"/></td>
            <td width="10%" align="center"><a href="#" onmousedown="getEvlDetail('<%=i%>','<bean:write id="weekevl" property="evlList/title"/>��Ԫ')"><%=norec%></a></td>
            <td width="10%" align="center"><%=total%></td>
            <!--<td width="10%" align="center"><a href="#" onmousedown="getEvlDetail('<%=i%>','<bean:write id="weekevl" property="evlList/title"/>��Ԫ')"><%=noevl%></a></td>-->
          </tr>
          <% }%>
          </logic:iterate>
        </table>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" id="otherTitle">
        <tr class='td1'><td>���������� ��</td></tr>
        </table>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="otherDetail">
          <tr align="center" class="td_title">
            <td align="center"><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)"></td>
            <td>����</td>
            <td>ʱ��</td>
            <td>״̬</td>
            <td>���շ���</td>
            <td>δ���շ���</td>
            <td>Ӧ������</td>
          </tr>
          <% k=0; %>
          <logic:iterate id="weekevl" property="list[@type='evlList']">
		  <%
		    total = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/amount"));
		    hasevl = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/ballot"));
            wk = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/week"));
            ordertype = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/ordertype"));
            dsc = base.util.TalentContext.getValue(pageContext,"weekevl","evlList/dsc");
            status = base.util.TalentContext.getValue(pageContext,"weekevl","evlList/status");
          if (dsc != null) week = dsc; else week="��ѵ��";
          if ("δ����".equals(status)) {
               noevl = total - hasevl;
               norec = 0;
            } else {
               noevl = 0;
               norec = total - hasevl;
            }
          if (ordertype != 1 && ordertype != 2) {
               k++; 
               i++;
          %>
		  <tr <%if (k % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)" ondblclick="evlDetail('<%=i%>')">
            <td width="5%" align="center">
               <input type="checkbox" id="checkbox<%=i%>" value="<%=ordertype%>">
               <input type="hidden" id="begin<%=i%>" value="<bean:write id="weekevl" property="evlList/bg"/>">
               <input type="hidden" id="end<%=i%>" value="<bean:write id="weekevl" property="evlList/ed"/>">
            </td>
            <td width="10%" align="center"><%=week%></td>
            <td width="23%" align="center"><bean:write id="weekevl" property="evlList/bg"/>--<bean:write id="weekevl" property="evlList/ed"/></td>
            <td width="10%" align="center"><bean:write id="weekevl" property="evlList/status"/></td>
            <td width="10%" align="center"><bean:write id="weekevl" property="evlList/ballot"/></td>
            <td width="10%" align="center"><a href="#" onmousedown="getEvlDetail('<%=i%>','<%=week%>')"><%=norec%></a></td>
            <td width="10%" align="center"><%=total%></td>
            <!--<td width="10%" align="center"><a href="#" onmousedown="getEvlDetail('<%=i%>','<%=week%>')"><%=noevl%></a></td>-->
          </tr>
          <% }%>
          </logic:iterate>
        </table>
        </td></tr></table>
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;      </td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
<%if (i==0) {%>
document.getElementById("weekTitle").style.display = "none";
document.getElementById("weekDetail").style.display = "none";
<% } 
if (j==0) {
%>
document.getElementById("unitTitle").style.display = "none";
document.getElementById("unitDetail").style.display = "none";
<% } 
if (k==0) {
%>
document.getElementById("otherTitle").style.display = "none";
document.getElementById("otherDetail").style.display = "none";
<% } %>
</script>