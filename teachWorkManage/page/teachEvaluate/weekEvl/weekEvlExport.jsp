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
<%@page import="talent.core.*,java.util.*" %>
<%
String begin,end,formto = "";
int score,courseid,itemId,cid,iid,flag = 0;
int hindex=1;
int findex=1;
String className=base.util.TalentContext.getValue(pageContext,null,"Class/ClassName");
String title=className+"学员教学质量评估结果学期末汇总表";
title= new   String(title.getBytes("GBK"),"iso8859-1"); 
if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {
   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
   formto = TalentFunctions.DateForCN(begin) + " - " + TalentFunctions.DateForCN(end);
}
response.setContentType("application/msword;charset=gb2312");
response.setHeader("Content-Disposition", "attachment;filename="+title+".doc");
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
</script>

<body>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="text">
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
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" bgcolor="#000000">
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
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" bgcolor="#000000">
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