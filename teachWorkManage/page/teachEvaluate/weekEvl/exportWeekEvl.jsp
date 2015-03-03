<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-pagecom.tld" prefix="pagecom" %>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="workflow" %>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<%@ taglib uri="/WEB-INF/hci-richclient.tld" prefix="richclient" %>
<%@ taglib uri="/WEB-INF/hci-datacell.tld" prefix="datacell" %>
<%@page import="talent.core.*"%>
<%
int hindex=1;
int findex=1;
response.setContentType("application/msword;charset=gb2312");
%>
<%
		String begin, end, formto = "";
       int score,courseid,itemId,levId,levItemId,cid,iid,lid,flag = 0;
%>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-FACE-COLOR: #D4D0C8 ;
 	SCROLLBAR-HIGHLIGHT-COLOR: #FFFFFF;
	SCROLLBAR-SHADOW-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR: #5385A5;
	SCROLLBAR-ARROW-COLOR: #000000;
	SCROLLBAR-TRACK-COLOR: #efefef;
	SCROLLBAR-DARKSHADOW-COLOR: #5385A5;
}

.text {
	font-size: 12px;
	color: #000000;
	line-height: 20px;
}
.textb {
	font-size: 12px;
	color: #000000;
	line-height: 20px;
	font-weight: bold;
}
.text_wirte {
	font-size: 12px;
	color: #FFFFFF;
}
.text_red {
	font-size: 12px;
	color: #ff0000;
}
.table {
	border: 1px solid #DCDCDC;
}
.td_title {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 26px;
	color: #000000;
}
.td1 {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.td2 {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
-->
</style>
<body>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" class="text_title"><span id="printTable" class="MsoNormalIndent"><b>
			<p><bean:write property="Class/ClassName"/></p>
            <p>课题得分具体数据</p></b></span></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
    <tr align="left" class="td2"><td>辅导课</td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="2" cellspacing="3" bgcolor="#000000">
        <tr align="center" class="td_title">
          <td width="20%" class="td1">评价项目</td>
          <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
          <td id="fdk<logic:iterateIndex/>_text" width="12%" colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>" align="center">
          <bean:write id="fdkItem" property="fdkItems/Name"/><br>(<bean:write id="fdkItem" property="fdkItems/Score"/>)
          </td>
          </logic:iterate>
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
        <tr <% if (fdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="20%" align="left" class="text" rowspan="2"><bean:write id="fdk" property="fdks/TeacherName"/>老师：<br>
          <bean:write id="fdk" property="fdks/CourseTitle"/></td>
          <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
          <% flag = 0; %>
          <logic:iterate id="fdkScore" property="list[@type='fdkScores']">
          <%
            score = 0;
            courseid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdk","fdks/CourseID"));
            itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/ItemID"));
            cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkScore","fdkScores/CourseID"));
            iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkScore","fdkScores/ItemID"));
            if (cid == courseid && iid == itemId) {
                 flag = 1;
          %>
          <td colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>" align="center" width="12%" class="text"><bean:write id="fdkScore" property="fdkScores/Score"/></td>
          <% } %>
          </logic:iterate>
          <% if (flag != 1) { %>
          <td colspan="<bean:write id="fdkItem" property="fdkItems/Levlen"/>" width="12%" align="center">0</td>
          <% } %>
          </logic:iterate>
          
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
      <table width="1000" border="0" align="center" cellpadding="2" cellspacing="3" bgcolor="#000000">
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
</body>