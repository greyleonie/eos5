<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@page import="com.talent.hibernate.Score"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.talent.common.TalentFunction"%>
<html>
<head><%String score_path=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中共广州市委党校</title>
<link href="<%=score_path%>/css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" height="224" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="18"></td>
  </tr>
  <tr>
    <td width="100%" height="31" class="text_red">学习成绩</td>
  </tr>
  <tr>
    <td width="100%" height="10"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
      <tr>
        <td width="11%" align="center" class="td">序号</td>
        <td width="64%" align="center" class="td">学习科目</td>
        <td width="12%" align="center" class="td">学时</td>
        <td width="13%" align="center" class="td">成绩</td>
      </tr>
      <logic:present name="scoreList">
      <logic:iterate id="thescore" name="scoreList">
      <tr>
        <td width="11%" align="center" class="td1"><logic:present name="thescore" property="classSubject">
		  			<bean:write  name="thescore" property="classSubject.subjectNo"/>
		   	</logic:present></td>
        <td width="64%" class="td1"><logic:present name="thescore" property="classSubject">
		  			<bean:write  name="thescore" property="classSubject.subject"/>
		   	</logic:present></td>
        <td width="12%" align="center" class="td1">
        
       
        <logic:present name="thescore" property="classSubject">
		  			<bean:write  name="thescore" property="classSubject.classHours"/>
		   	</logic:present>
		   	
		   	</td>
        <td width="13%" align="center" class="td1"><bean:write name="thescore"  property="score"/></td>
      </tr>
      </logic:iterate>
      </logic:present>
    </table></td>
  </tr>
  <tr>
    <td width="100%" height="32" class="text_red">出勤情况</td>
  </tr>
  <tr>
    <td width="100%" height="25"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
      <tr>
      <%
      HashMap kqMap=(HashMap) request.getAttribute("kqMap");
       %>
        <td width="10%" align="right" class="td">正常： </td>
        <td width="10%" class="td1"><%=TalentFunction.getInt(kqMap.get("count0")) %></td>
        <td width="10%" align="right" class="td">迟到：</td>
        <td width="10%" class="td1"><%=TalentFunction.getInt(kqMap.get("count1")) %></td>
        <td width="10%" align="right" class="td">缺课：</td>
        <td width="10%" class="td1"><%=TalentFunction.getInt(kqMap.get("count2")) %></td>
        <td width="10%" align="right" class="td">公假：</td>
        <td width="10%" class="td1"><%=TalentFunction.getInt(kqMap.get("count3")) %></td>
        <td width="10%" align="right" class="td">事假：</td>
        <td width="10%" class="td1"><%=TalentFunction.getInt(kqMap.get("count4")) %></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="100%" height="27" class="text_red">鉴定及奖励</td>
  </tr>
  <tr>
    <td width="100%" height="63" class="text"></td>
  </tr>
  <tr>
    <td width="100%" height="18"></td>
  </tr>
</table>
</body>
</html>
