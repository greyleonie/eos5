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
<%@page import="java.util.Date,java.math.BigDecimal" %>
<%
Date time = new Date();

response.setContentType("application/msword;charset=gb2312");
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
<form>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="text">   
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="3">
          <tr>
           <td id="printTable" height="30" align="left" class="text_title">
            <p align="center" class="STYLE3">广 州 行 政 学 院</p>
            <b><p align="center" class="STYLE6"><bean:write property="Class/ClassName"/>教学单元实施情况调查反馈信息汇总</p></b>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;单元名称：<bean:write property="TeachingPlanUnit/UnitName"/></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;负责部门：<bean:write property="TeachingPlanUnit/DepartmentName"/></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;本单元教学时间：<bean:write property="TeachingPlanUnit/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" /> 至 <bean:write property="TeachingPlanUnit/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" /></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;说明：
            <bean:write property="Class/ClassName"/>共
            <bean:write property="Survey/amount"/>人，发放学员意见反馈表
            <bean:write property="Survey/amount"/>份，回收
            <bean:write property="Survey/ballot"/>份，回收率
            <bean:write property="Survey/precent"/>%，意见栏填写
            <bean:write property="Survey/suggest"/>份。有关信息归纳如下：</p>
           </td>
          </tr>
        </table>        
        </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%" border="0" align="center" cellpadding="2" cellspacing="3" bgcolor="#000000" id="listdetail">
        <tr align="center" class="td_title">
          <td width="25%" rowspan="2" align="left" valign="top">
          评价等次("A"为好，"D"为差)<br>
          评<br />价<br />项</td>
          <%int j=0; %>
          <logic:iterate id="level" property="list[@type='unitLevels']">
          <td width="15%" colspan="2"><bean:write id="level" property="unitLevels/LevelName"/></td>
          <% j++; %>
          </logic:iterate>
          <td width="15%" colspan="2">不填</td>
          </tr>
        <tr class="td2">
        <logic:iterate id="level" property="list[@type='unitLevels']">
          <td width="8%" align="center">票数</td>
          <td width="7%" align="center">%</td>
        </logic:iterate>
        <td width="8%" align="center">票数</td>
        <td width="7%" align="center">%</td>
        </tr>
        <%int i=0; %>
        <logic:iterate id="item" property="list[@type='unitItems']">
        <%
        int total=0; 
        int whole=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"Survey/ballot"));
        %>
        <tr <% if (i%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td id="item<%=i%>_text" width="25%" height="30"><bean:write id="item" property="unitItems/Title"/></td>
          <logic:iterate id="level" property="list[@type='unitLevels']">
          <logic:iterate id="report" property="list[@type='unitReports']">
          <%
          int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"item","unitItems/ItemID"));
          int orderNo = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"level","unitLevels/OrderNO"));
          int iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","unitReports/ItemID"));
          int ono = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","unitReports/OrderNO"));
          if (iid==itemId && ono==orderNo) {
             int ballot = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","unitReports/ballot"));
               total = total + ballot;
          %>
          <td width="8%" height="30" align="center"><bean:write id="report" property="unitReports/ballot"/></td>
          <td width="7%" height="30" align="center"><bean:write id="report" property="unitReports/precent"/></td>
          <% } %>
          </logic:iterate>
          </logic:iterate>
          <%
          double precent = 0;
          if (whole != 0) precent=(whole-total) * 100 / whole;
          else precent = 0;
            BigDecimal bd = new BigDecimal(precent);
          double d1 = bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
          %>
          <td width="8%" align="center"><%=(whole-total)%></td>
          <td width="7%" align="center"><%=d1%>%</td>
        </tr>
        <%i++;%>
        </logic:iterate>
        <tr onclick="changeTRBgColor(this)">
           <td class='td2'>意见和建议</td>
           <td colspan="<%=j*2+2%>" class='td1'>
           <logic:iterate id="item" property="list[@type='unitItems']">
           <%
           int itemID = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"item","unitItems/ItemID"));
           int advicelen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"item","unitItems/advicelen"));
           if (advicelen > 0) {
           %>
           ●<bean:write id="item" property="unitItems/Title"/><br>
           <%int k=1; %>
           <logic:iterate id="advice" property="list[@type='unitAdvices']">
           <%
           int itemid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"advice","unitAdvices/itemID"));
           if (itemid == itemID) {
                String advice = base.util.TalentContext.getValue(pageContext,"advice","unitAdvices/Advice");
              if (!"".equals(advice)) {
                   out.println(k + "." + advice + "<br>");
                   k++; 
                }
             }
           %>
           </logic:iterate>
           <% } %>
           </logic:iterate>
           </td>
        </tr>
      </table>
        </td>
    </tr>
  </table>
</form>
</body>