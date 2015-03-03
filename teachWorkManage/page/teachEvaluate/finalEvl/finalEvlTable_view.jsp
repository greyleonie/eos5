<%@include file="/internet/common.jsp"%>
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
	font-size: 16px;
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
<script language="javascript">
function formatLevText(objname,levname) {
   var tmpText = "";
   for (var i=0;i<levname.length;i++) {
       if (i != (levname.length-1))
          tmpText += levname.substr(i, 1) + "<br>";
       else
          tmpText += levname.substr(i, 1);
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
    if (itemName.length > 8) {
       document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
       return;
    }
    document.getElementById(objname).innerHTML = itemName + "<br>";
}
	
</script>

<body>
<form>
<html:hidden property="Evaluation/EvaluationID" />
<html:hidden property="Evaluation/Period" />
<html:hidden property="Evaluation/IsNeedAdvice" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="../../image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;新增期末学员意见反馈表</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" align="center">
        <SPAN class="STYLE4" id="titleText"><bean:write property="Evaluation/Title"/></SPAN><BR><BR>
	    <div align="left" class="STYLE5">&nbsp;&nbsp;&nbsp;&nbsp;
        <SPAN id="remarksText"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
      </td>
    </tr>
    <tr>
      <td class="text" valgin="top">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td>
		  <table id="allCourse" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="allCourse_item0_tr">
              <td id="allCourse_lev0_td" width="18%" bgcolor="#FFFFFF"> &nbsp;&nbsp;满意程度
                <br />评<br />价<br />项
              <% int levLen = 0; %>
              <logic:iterate id="allev" property="list[@type='allCourseLevs']">
              <% levLen++; %>
              <td id="allCourse_lev<%=levLen%>_td" width="10%" align="center" bgcolor="#FFFFFF">
			   <table id="allCourse_lev<%=levLen%>_tb" width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                   <tr valign="middle">
                     <td align="center">
					   <span id="allCourse_lev<%=levLen%>_text"><script>formatLevText("allCourse_lev<%=levLen%>_text","<bean:write id="allev" property="allCourseLevs/LevelName"/>");</script></span></td>
                     </tr>
                 </table>
              </td>
              </logic:iterate>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="allCourse_item0_suggest" width="42%" align="center" bgcolor="#FFFFFF">意 见 与 建 议</td>
			  </logic:equal>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="allCourseItem" property="list[@type='allCourseItems']">
			<% itemLen++; %>
            <tr id="allCourse_item<%=itemLen%>_tr">
              <td id="allCourse_item<%=itemLen%>_td" width="18%" height="45" align="center" bgcolor="#FFFFFF">
			  <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="1">
                <tr>
                  <td width="80%" align="center" valign="middle">
                  <span id="allCourse_item<%=itemLen%>_text">
                  <script>formatItemText("allCourse_item<%=itemLen%>_text","<bean:write id="allCourseItem" property="allCourseItems/Title"/>");</script>
                  </span></td>
                </tr>
              </table></td>
              <% for (int i=0;i<levLen;i++) { %>
              <td width="10%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
              <% } %>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="allCourse_item<%=itemLen%>_suggest" width="42%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
			  </logic:equal>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
      </table></td>
    </tr>
  </table>
<div align="center"><INPUT type="button" class="button_02" value="完成" onclick="window.history.go(-1);"></div>
</form>
</body>