<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*,java.util.Date,java.math.BigDecimal;"%>
<%
Date time = new Date();
%>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "华文新魏";
	font-size: 16px;
}
.style2 {font-family: "宋体"}
.STYLE3 {
	font-family: "新宋体";
	font-size: 18px;
	font-weight: bold;
}
.STYLE4 {
	font-family: "新宋体";
	font-size: x-large;
	font-weight: bold;
}
.STYLE5 {
	font-family: "新宋体";
	font-size: 16px;
}
.STYLE6 {
	font-family: "新宋体";
	font-size: 20px;
	font-weight: bold;
}
.STYLE11 {font-size: 12px}
.noinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: none;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: block;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showversion {
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	
	.noversion {
	    DISPLAY: none;
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
-->
</style>
<script type="text/javascript">
function submitForm() {

document.forms[0].action = "teachWorkManage.prTeachEvaluate.prUnitReport.do";
document.getElementById("AssignMark/CourseID").selectedIndex=0;
document.forms[0].submit();

}

function exportToWord() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prUnitExport.do";
document.forms[0].target = "_blank";
document.forms[0].submit();
}

	function formatLevText(objname,levname) {
	   var tmpText = "";
	   for (var i=0;i<levname.length;i++) {
         tmpText += levname.substr(i, 1) + "<br>";
       }
       document.getElementById(objname).innerHTML = tmpText;
	}
	
	function formatItemText(objname,itemName) {
	   var name_tmp = "";
	   if (itemName.length <= 8) {
          for (var i=0;i < itemName.length;i++) {
             name_tmp = name_tmp + itemName.substr(i,1) + " ";
          }
          document.getElementById(objname).innerHTML = name_tmp + "<br>";
          return;
       }
       if (itemName.length >= 10) {
          document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
          return;
       }
       document.getElementById(objname).innerHTML = itemName + "<br>";
	}
</script>

<body>
<form>
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="Class/ClassID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;主体班单元汇总</td>
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
          <html:select property="AssignMark/CourseID" onchange="document.forms[0].action = 'teachWorkManage.prTeachEvaluate.prUnitReport.do';document.forms[0].submit();">
			<html:option value="0">&lt;请选择&gt;</html:option>
			<html:options property="list[@type='planUnits']/TeachingPlanUnit/UnitID" labelProperty="list[@type='planUnits']/TeachingPlanUnit/UnitName"/>
		  </html:select>
          <b>
            <input name="B31" type="submit" class="button_02" value="汇 总">
            <input name="B3" type="button" class="button_02" value="导 出" onClick="exportToWord()">
            <input name="B3" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="viewaction">
            </b> </td>
        </tr>
      </table>      
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
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
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
          <td id="item<%=i%>_text" width="25%" height="30">
          <script>formatItemText("item<%=i%>_text","<bean:write id="item" property="unitItems/Title"/>");</script>
          </td>
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
                   out.println(k + "." + TalentFunctions.transformHtmlTags(advice) + "<br>");
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>