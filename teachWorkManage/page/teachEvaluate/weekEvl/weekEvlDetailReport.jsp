<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*" %>
<%
String begin,end,formto = "";
int score,courseid,itemId,levId,levItemId,cid,iid,lid,flag = 0;
int hindex=1;
int findex=1;

//if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {
//   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
//   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
//   formto = TalentFunctions.DateForCN(begin) + " - " + TalentFunctions.DateForCN(end);
//}
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
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prWDetailExport.do";
document.forms[0].target = "_blank";
document.forms[0].submit();
}

function submitForm() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prWDetailReport.do";
document.forms[0].target = "_self";
document.forms[0].submit();
}
</script>

<body>
<form action="">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="Class/ClassID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;课题数据分析</td>
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
          <SELECT name="AssignMark/ClassID" id="AssignMark/ClassID" onchange="submitForm();">
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
          <!--<html:text property="week/begin" readonly="readonly" styleClass="input" size="10" />
          <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["week/begin"],"yyyy-MM-dd")>
          至<html:text property="week/end" readonly="readonly" styleClass="input" size="10" />
          <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["week/end"],"yyyy-MM-dd")>-->
          <b>
            <input name="B32" type="submit" class="button_02" value="汇 总" onclick="submitForm()">
            <input name="B3" type="button" class="button_02" value="导 出" onClick="exportToWord()">
            <input name="B3" type="button" class="button_02" value="打 印" onClick="exportToWord()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="viewaction">
            </b> </td>
        </tr>
      </table>      
        <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="4">
          <tr>
            <td align="center" class="text_title">
            <span id="printTable" class="MsoNormalIndent"><b><p><bean:write property="Class/ClassName"/></p>
            <p>课题得分具体数据</p></b></span></td>
          </tr>
        </table>        
      </td>
    </tr>
    <tr><td class="text">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
    <tr align="left" class="td2"><td>辅导课</td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="center" class="td_title">
          <td width="20%" class="td1">评价项目</td>
          <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
          <td id="fdk<logic:iterateIndex/>_text" width="12%" colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>" align="center">
          <bean:write id="fdkItem" property="fdkItems/Name"/><br>(<bean:write id="fdkItem" property="fdkItems/Score"/>)
          </td>
          </logic:iterate>
          <td width="5%" rowspan="3">总分</td>
          <td width="20%" rowspan="3">具体意见和建议</td>
        </tr>
        <tr class="td1">
        <td rowspan="2" class="text">各项平均分及比例<br>
        教师<br>及课题
        </td>
        <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
        <td width="12%" class="td1" colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>">&nbsp;&nbsp;</td>
        </logic:iterate>
        </tr>
        <tr class="td1">
        <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
        <logic:iterate id="fdkLev" property="list[@type='fdkLevs']">
        <%
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/ItemID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkLev","fdkLevs/ItemID"));
            if (iid == itemId) {
        %>
        <td width="3%" align="center" class="text"><bean:write id="fdkLev" property="fdkLevs/Name"/></td>
        <% } %>
        </logic:iterate>
        </logic:iterate>
        </tr>
        <%int fdkLen=0; %>
        <logic:iterate id="fdk" property="list[@type='fdks']">
        <%double total = 0;%>
        <tr <% if (fdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="20%" align="left" class="text" rowspan="2"><bean:write id="fdk" property="fdks/TeacherName"/>老师：<br>
          <bean:write id="fdk" property="fdks/CourseTitle"/></td>
          <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
          <%flag = 0;%>
          <logic:iterate id="fdkScore" property="list[@type='fdkScores']">
          <%
            score = 0;
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdk","fdks/CourseID"));
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/ItemID"));
            cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkScore","fdkScores/CourseID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkScore","fdkScores/ItemID"));
            if (cid == courseid && iid == itemId) {
                 flag = 1;
                 Double tmp = new Double(base.util.TalentContext.getValue(pageContext,"fdkScore","fdkScores/Score"));
                 total += tmp.doubleValue();
                 total = Math.round(total * 100) / 100.0;
          %>
          <td colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>" align="center" width="12%" class="text"><bean:write id="fdkScore" property="fdkScores/Score"/></td>
          <% } %>
          </logic:iterate>
          <% if (flag != 1) { %>
          <td colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>" width="12%" align="center">0</td>
          <% } %>
          </logic:iterate>
          <td width="10" rowspan="2" align="center"><%=total%></td>
          <td width="150" rowspan="2">
          <%findex=1; %>
          <logic:iterate id="advice" property="list[@type='allSuggest']">
          <%
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdk","fdks/CourseID"));
          int fcid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"advice","allSuggest/CourseID"));
          if (fcid == courseid) {
          %>
          (<%=findex%>) <bean:write id="advice" property="allSuggest/Advice"/><br>
          <% findex++; } %>
          </logic:iterate>
          </td>
        </tr>
        <tr <% if (fdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
          <logic:iterate id="fdkLev" property="list[@type='fdkLevs']">
          <% 
            flag = 0;
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdk","fdks/CourseID"));
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/ItemID"));
            levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkLev","fdkLevs/ItemID"));
            levId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkLev","fdkLevs/LevelID"));
           if (levItemId==itemId) {
          %>
          <logic:iterate id="fdkLevScore" property="list[@type='fdkLevScores']">
          <%
            cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkLevScore","fdkLevScores/CourseID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkLevScore","fdkLevScores/ItemID"));
            lid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkLevScore","fdkLevScores/LevelID"));
            if (cid == courseid && iid == itemId && lid==levId) {
                 flag = 1;
          %>
          <td align="center" width="3%" class="text"><bean:write id="fdkLevScore" property="fdkLevScores/ballot"/>%</td>
          <% } %>
          </logic:iterate>
          <% if (flag != 1) { %>
          <td width="3%" align="center" class="text">0%</td>
          <% } }%>
          </logic:iterate>
          </logic:iterate>
        </tr>
        <% fdkLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
    <tr><td heigth="20"></td></tr>
    <tr align="left" class="td2"><td>互动课</td></tr>
    <tr>
      <td class="text">
      <table width="1000" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="center" class="td_title">
          <td width="20%" class="td1">评价项目</td>
          <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
          <td id="hdk<logic:iterateIndex/>_text" width="12%" colspan="<bean:write id="hdkItem" property="hdkItems/Levlen"/>" align="center">
          <bean:write id="hdkItem" property="hdkItems/Name"/><br>(<bean:write id="hdkItem" property="hdkItems/Score"/>)
          </td>
          </logic:iterate>
          <td width="20%" rowspan="3">具体意见和建议</td>
        </tr>
        
        <tr class="td1">
        <td rowspan="2" class="text">各项平均分及比例<br>
        教师<br>及课题
        </td>
        <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
        <td width="12%" class="td1" colspan="<bean:write id="hdkItem" property="hdkItems/Levlen"/>">&nbsp;&nbsp;</td>
        </logic:iterate>
        </tr>
        <tr class="td1">
        <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
        <logic:iterate id="hdkLev" property="list[@type='hdkLevs']">
        <%
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/ItemID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkLev","hdkLevs/ItemID"));
            if (iid == itemId) {
        %>
        <td width="3%" align="center" class="text"><bean:write id="hdkLev" property="hdkLevs/Name"/></td>
        <% } %>
        </logic:iterate>
        </logic:iterate>
        </tr>

        
        <%int hdkLen=0; %>
        <logic:iterate id="hdk" property="list[@type='hdks']">
        <tr <% if (hdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="20%" align="left" class="text" rowspan="2"><bean:write id="hdk" property="hdks/TeacherName"/>老师：<br>
          <bean:write id="hdk" property="hdks/CourseTitle"/></td>
          <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
          <% flag = 0; %>
          <logic:iterate id="hdkScore" property="list[@type='hdkScores']">
          <%
            score = 0;
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdk","hdks/CourseID"));
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/ItemID"));
            cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkScore","hdkScores/CourseID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkScore","hdkScores/ItemID"));
            if (cid == courseid && iid == itemId) {
                 flag = 1;
          %>
          <td colspan="<bean:write id="hdkItem" property="hdkItems/Levlen"/>" align="center" width="12%" class="text"><bean:write id="hdkScore" property="hdkScores/Score"/></td>
          <% } %>
          </logic:iterate>
          <% if (flag != 1) { %>
          <td colspan="<bean:write id="hdkItem" property="hdkItems/Levlen"/>" width="12%" align="center">0</td>
          <% } %>
          </logic:iterate>
          
          <td width="150" rowspan="2">
          <%findex=1; %>
          <logic:iterate id="advice" property="list[@type='allSuggest']">
          <%
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdk","hdks/CourseID"));
          int hcid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"advice","allSuggest/CourseID"));
          if (hcid == courseid) {
          %>
          (<%=findex%>) <bean:write id="advice" property="allSuggest/Advice"/><br>
          <% findex++; } %>
          </logic:iterate>
          </td>
        </tr>
        <tr <% if (hdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
          <logic:iterate id="hdkLev" property="list[@type='hdkLevs']">
          <% 
            flag = 0;
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdk","hdks/CourseID"));
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/ItemID"));
            levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkLev","hdkLevs/ItemID"));
            levId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkLev","hdkLevs/LevelID"));
           if (levItemId==itemId) {
          %>
          <logic:iterate id="hdkLevScore" property="list[@type='hdkLevScores']">
          <%
            cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkLevScore","hdkLevScores/CourseID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkLevScore","hdkLevScores/ItemID"));
            lid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkLevScore","hdkLevScores/LevelID"));
            if (cid == courseid && iid == itemId && lid==levId) {
                 flag = 1;
          %>
          <td align="center" width="3%" class="text"><bean:write id="hdkLevScore" property="hdkLevScores/ballot"/>%</td>
          <% } %>
          </logic:iterate>
          <% if (flag != 1) { %>
          <td width="3%" align="center" class="text">0%</td>
          <% } }%>
          </logic:iterate>
          </logic:iterate>
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