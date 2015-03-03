<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*,java.util.*" %>
<%
String begin,end,formto = "";
int score,courseid,itemId,cid,iid,flag = 0;
int hindex=1;
int findex=1;

if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {
   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
   formto = TalentFunctions.DateForCN(begin) + " - " + TalentFunctions.DateForCN(end);
}
%>
<style type="text/css">
<!--
.style2 {font-family: "宋体"}
-->
</style>
<script type="text/javascript">
	function formatLevText(objname,levname) {
	   var tmpText = "";
	   for (var i=0;i<levname.length;i++) {
         tmpText += levname.substr(i, 1) + "<br>";
       }
       document.getElementById(objname).innerHTML = tmpText;
	}
	
	function formatItemText(objname,itemName) {
	   var name_tmp = "";
	   if (itemName.length <= 6) {
          for (var i=0;i < itemName.length;i++) {
             name_tmp = name_tmp + itemName.substr(i,1) + " ";
          }
          document.getElementById(objname).innerHTML = name_tmp + "<br>";
          return;
       }
       if (itemName.length >= 8) {
          document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
          return;
       }
       document.getElementById(objname).innerHTML = itemName + "<br>";
	}
	
function exportToWord() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prWeekDetailExport.do";
document.forms[0].target = "_blank";
document.forms[0].submit();
}

function submitForm() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prWeekDetailReport.do";
document.forms[0].target = "_self";
document.forms[0].submit();
}
</script>

<body>
<form action="teachWorkManage.prTeachEvaluate.prWeekDetailReport.do">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="Class/ClassID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;主体班排名汇总</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <SELECT name="AssignMark/ClassID" id="AssignMark/ClassID">
          <option value="-1">--请选择班级--</option>
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
          <html:text property="week/begin" readonly="readonly" styleClass="input" size="10" /><img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["week/begin"],"yyyy-MM-dd")>
          至<html:text property="week/end" readonly="readonly" styleClass="input" size="10" /><img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["week/end"],"yyyy-MM-dd")>
          <b><input name="B32" type="submit" class="button_02" value="汇 总">
            <input name="B3" type="button" class="button_02" value="导 出" onClick="exportToWord()">
            <input name="B3" type="button" class="button_02" value="打 印" onClick="exportToWord()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="viewaction">
          </b></td>
        </tr>
      </table>      
        <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="4">
          <tr>
            <td align="center" class="text_title"><b>
            <span id="printTable" class="MsoNormalIndent"><bean:write property="Class/ClassName"/>学员教学质量评估结果</span><br>
            学期末汇总表<br>
            <p class="text_red">（<%=formto%>）</p></b></td>
          </tr>
        </table>        
      </td>
    </tr>
    <tr><td class="text">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
    <tr>
      <td class="text">
      <%
        float norm=1;
        int place=1;
         Float tmp = null;
         List normList = new ArrayList();
      %>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="left" class="td1"><td colspan="5">辅导课</td></tr>
        <tr align="center" class="td_title">
          <td width="20%">教员</td>
          <td width="50%">课题</td>
          <td width="10%">回交(份)</td>
          <td width="10%">平均分</td>
          <td width="10%">排名</td>
          </tr>
        <% int fdkLen = 1; %>
        <logic:iterate id="fdk" property="list[@type='fdks']">
        <%
          norm = Float.parseFloat(base.util.TalentContext.getValue(pageContext,"fdk","fdks/norm"));
          tmp = new Float(base.util.TalentContext.getValue(pageContext,"fdk","fdks/norm"));
          normList.add(tmp);
        %>
        <tr <% if (fdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="60"><bean:write id="fdk" property="fdks/TeacherName"/></td>
          <td width="200"><bean:write id="fdk" property="fdks/CourseTitle"/></td>
          <td width="70" align="center"><bean:write id="fdk" property="fdks/ballot"/></td>
          <td width="70" align="center"><bean:write id="fdk" property="fdks/norm"/></td>
          <%
          if (fdkLen-1>0) { 
            float count = ((Float)normList.get(fdkLen-2)).floatValue();
            if (norm != count) place++;
           }
          %>
          <td width="60" align="center"><%=place%></td>
        </tr>
        <% fdkLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
    <tr><td heigth="20"></td></tr>
    <tr>
      <td class="text">
      <%
         norm=1;
         place=1;
         normList.clear();
      %>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr align="left" class="td1"><td colspan="5">互动课</td></tr>
        <tr align="center" class="td_title">
          <td width="20%">教员</td>
          <td width="50%">课题</td>
          <td width="10%">回交（份）</td>
          <td width="10%">平均分</td>
          <td width="10%">排名</td>
          </tr>
        <% int hdkLen = 1; %>
        <logic:iterate id="hdk" property="list[@type='hdks']">
        <%
          norm = Float.parseFloat(base.util.TalentContext.getValue(pageContext,"hdk","hdks/norm"));
          tmp = new Float(base.util.TalentContext.getValue(pageContext,"hdk","hdks/norm"));
          normList.add(tmp);
        %>
        <tr <% if (hdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="60"><bean:write id="hdk" property="hdks/TeacherName"/></td>
          <td width="200"><bean:write id="hdk" property="hdks/CourseTitle"/></td>
          <td width="70" align="center"><bean:write id="hdk" property="hdks/ballot"/></td>
          <td width="70" align="center"><bean:write id="hdk" property="hdks/norm"/></td>
          <%
          if (hdkLen-1>0) { 
            float count = ((Float)normList.get(hdkLen-2)).floatValue();
            if (norm != count) place++;
           }
          %>
          <td width="60" align="center"><%=place%></td>
        </tr>
        <% hdkLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
    </table>
    </td></tr>
  </table>
</form>
</body>