<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*,java.util.Date;" %>
<style type="text/css">
<%
Date time = new Date();
%>
<!--
.style2 {font-family: "宋体"}
-->
</style>
<script type="text/javascript">
function submitForm() {

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
	   if (itemName.length < 6) {
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
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;主体班期末汇总</td>
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
          </SELECT><b>
            <input name="B31" type="submit" class="button_02" value="汇 总">
            <input name="B3" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
            <input name="B3" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="viewaction">
            </b> </td>
        </tr>
      </table>      
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" class="text_title">
            <b><span id="printTable" class="MsoNormalIndent"><bean:write property="Class/ClassName"/>学员意见反馈信息统计</span></b></td>
          </tr>
          <tr>
            <td height="30" align="left" class="text">
            <span class="MsoNormalIndent">
            <bean:write property="Class/ClassName"/>共
            <bean:write property="Survey/amount"/>人，发放学员意见反馈表
            <bean:write property="Survey/amount"/>份，回收
            <bean:write property="Survey/ballot"/>份，回收率
            <bean:write property="Survey/precent"/>%，意见栏填写
            <bean:write property="Survey/suggest"/>份。</span></td>
          </tr>
        </table>        
        </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
        <tr align="center" class="td_title">
          <td rowspan="2">满意程度</td>
          <%int j=0; %>
          <logic:iterate id="level" property="list[@type='finaLevels']">
          <td colspan="2"><bean:write id="level" property="finaLevels/LevelName"/></td>
          <% j++; %>
          </logic:iterate>
          </tr>
        <tr class="td2">
        <logic:iterate id="level" property="list[@type='finaLevels']">
          <td width="10%" align="center">票数</td>
          <td width="9%" align="center">%</td>
        </logic:iterate>
        </tr>
        <%int i=0; %>
        <logic:iterate id="item" property="list[@type='finalItems']">
        <tr <% if (i%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td id="item<%=i%>_text" width="9%">
          <script>formatItemText("item<%=i%>_text","<bean:write id="item" property="finalItems/Title"/>");</script>
          </td>
          <logic:iterate id="level" property="list[@type='finaLevels']">
          <logic:iterate id="report" property="list[@type='finalReports']">
          <%
          int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"item","finalItems/ItemID"));
          int orderNo = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"level","finaLevels/OrderNO"));
          int iid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","finalReports/ItemID"));
          int ono = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","finalReports/OrderNO"));
          if (iid==itemId && ono==orderNo) {
          %>
          <td align="center"><bean:write id="report" property="finalReports/ballot"/></td>
          <td align="center"><bean:write id="report" property="finalReports/precent"/></td>
          <% } %>
          </logic:iterate>
          </logic:iterate>
        </tr>
        <%i++;%>
        </logic:iterate>
        <tr onclick="changeTRBgColor(this)">
           <td class='td2'>意见和建议</td>
           <td colspan="<%=j*2%>" class='td1'>
           <logic:iterate id="item" property="list[@type='finalItems']">
           ●<bean:write id="item" property="finalItems/Title"/><br>
           <%int k=1; %>
           <logic:iterate id="advice" property="list[@type='finalAdvices']">
           <%
           int itemID = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"item","finalItems/ItemID"));
           int itemid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"advice","finalAdvices/itemID"));
           if (itemid == itemID) {
                String advice = base.util.TalentContext.getValue(pageContext,"advice","finalAdvices/Advice");
              if (!"".equals(advice)) {
                    out.println(k + "." + TalentFunctions.transformHtmlTags(advice) + "<br>");
                    k++; 
                }
             }
           %>
           </logic:iterate>
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