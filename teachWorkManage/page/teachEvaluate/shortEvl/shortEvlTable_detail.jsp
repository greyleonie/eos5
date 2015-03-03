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
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;新增短班综合评估表</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" align="center"><span class="STYLE3">广州市委党校&nbsp;&nbsp;广州行政学院</span><br>
        <SPAN class="STYLE4" id="titleText"><bean:write property="Evaluation/Title"/></SPAN><BR>
	    <div align="left" class="STYLE5"><strong>各位学员：</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;
        <SPAN id="remarksText"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
      </td>
    </tr>
    <tr>
      <td class="text" valgin="top"><table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;一、您的基本信息</span></td>
        </tr>
		<tr>
		  <td><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="10%" bgcolor="#FFFFFF" align="center" valign="middle">最高<br />学历</td>
              <td width="40%" bgcolor="#FFFFFF" align="center" valign="middle">
			    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="40%" align="center">博士研究生</td>
                    <td width="10%" align="center"><input type="checkbox" name="checkbox" value="checkbox" /></td>
                    <td width="40%" align="center">大学本科</td>
                    <td width="10%" align="center"><input type="checkbox" name="checkbox4" value="checkbox" /></td>
                  </tr>
                  <tr>
                    <td align="center">硕士研究生</td>
                    <td align="center"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
                    <td align="center">大学专科</td>
                    <td align="center"><input type="checkbox" name="checkbox5" value="checkbox" /></td>
                  </tr>
                  <tr>
                    <td align="center">党校研究生</td>
                    <td align="center"><input type="checkbox" name="checkbox3" value="checkbox" /></td>
                    <td align="center">&nbsp;</td>
                    <td align="center">&nbsp;</td>
                  </tr>
                </table>
			    </td>
              <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">性<br />
                别</td>
              <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle">男 
                <input type="checkbox" name="checkbox6" value="checkbox" />                &nbsp;&nbsp;&nbsp;&nbsp;女 
                <input type="checkbox" name="checkbox7" value="checkbox" /></td>
              <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">年<br />
                龄</td>
              <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="60%" align="left">40岁以下</td>
                  <td width="40%" align="center"><input type="checkbox" name="checkbox8" value="checkbox" /></td>
                </tr>
                <tr>
                  <td align="left">40岁～50岁</td>
                  <td align="center"><input type="checkbox" name="checkbox9" value="checkbox" /></td>
                </tr>
                <tr>
                  <td align="left">50岁以上</td>
                  <td align="center"><input type="checkbox" name="checkbox10" value="checkbox" /></td>
                </tr>
              </table>
                </td>
            </tr>
          </table></td>
		</tr>
		<tr>
		  <td>
		  <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="18%" bgcolor="#FFFFFF"> &nbsp;&nbsp;满意程度
                <br />评<br />价<br />项
              <% int levLen = 0; %>
              <logic:iterate id="allev" property="list[@type='allCourseLevs']">
              <% levLen++; %>
              <td width="10%" align="center" bgcolor="#FFFFFF">
			   <table width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                   <tr valign="middle">
                     <td align="center">
					   <span id="allCourse_lev<%=levLen%>_text"><script>formatLevText("allCourse_lev<%=levLen%>_text","<bean:write id="allev" property="allCourseLevs/LevelName"/>");</script></span></td>
                     </tr>
                 </table>
              </td>
              </logic:iterate>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td width="42%" align="center" bgcolor="#FFFFFF">意 见 与 建 议</td>
			  </logic:equal>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="allCourseItem" property="list[@type='allCourseItems']">
			<% itemLen++; %>
            <tr>
              <td width="18%" height="45" align="center" bgcolor="#FFFFFF">
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
              <td width="42%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
			  </logic:equal>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;三、您对专题课的评价</span>
		      <span class="STYLE5">（请在所选项目的“□”内打“√”，如对该课题不满意，则让“□”空白即可）</span></td>
        </tr>
		<tr>
		  <td>
		  <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="30%" align="center" bgcolor="#FFFFFF">专题（主讲人）
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">评教类别</td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td width="50%" align="center" bgcolor="#FFFFFF">意 见 和 建 议</td>
			  </logic:equal>
            </tr>
            <% itemLen = 0; %>
			<logic:iterate id="ztk" property="list[@type='ztks']">
			<% 
			  itemLen++;
			  int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"ztk","ztks/ItemID"));
			  int itemLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"ztk","ztks/levlen"));
			%>
            <tr>
              <td width="30%" bgcolor="#FFFFFF" valign="top"><bean:write id="ztk" property="ztks/Course"/> ：<br />
              题目：<bean:write id="ztk" property="ztks/CourseTitle"/><br />
			  <div align="right">（<bean:write id="ztk" property="ztks/TeacherName"/>）</div>
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">
			  <table width="90%" border="0" cellspacing="3" cellpadding="0">
			  <%
				for (int i=1;i<=itemLevLen;i++) {
			  %>
              <logic:iterate id="specialev" property="list[@type='specialLevs']">
              <% 
              int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/ItemID"));
              int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/OrderNO"));
				if (levItemId==itemId && levOrder==i) {
              %>
                <tr>
                  <td width="30%" align="center">
				    <input type="checkbox" value="" /></td>
                  <td width="70%" align="left"><bean:write id="specialev" property="specialLevs/LevelName"/></td>
                </tr>
              <% } %>
              </logic:iterate>
              <% } %>
              </table></td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td width="50%" bgcolor="#FFFFFF">&nbsp;</td>
			  </logic:equal>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
		<tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;四、对外请课的评价</span>
		      <span class="STYLE5">（若您对此课不满意，可不打“√”）</span>
		  </td>
        </tr>
        <tr>
		  <td>
		  <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="30%" align="center" bgcolor="#FFFFFF">专题（主讲人）
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">评教类别</td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td width="50%" align="center" bgcolor="#FFFFFF">意 见 和 建 议</td>
			  </logic:equal>
            </tr>
            <% itemLen = 0; %>
			<logic:iterate id="wqk" property="list[@type='wqks']">
			<% 
			  itemLen++;
			  int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"wqk","wqks/ItemID"));
			  int itemLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"wqk","wqks/levlen"));
			%>
            <tr>
              <td width="30%" bgcolor="#FFFFFF" valign="top"><bean:write id="wqk" property="wqks/Course"/> ：<br />
              题目：<bean:write id="wqk" property="wqks/CourseTitle"/><br />
			    <div align="right">（<bean:write id="wqk" property="wqks/TeacherName"/>）</div>
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">
			  <table width="90%" border="0" cellspacing="3" cellpadding="0">
			  <%
				for (int i=1;i<=itemLevLen;i++) {
			  %>
              <logic:iterate id="specialev" property="list[@type='specialLevs']">
              <% 
              int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/ItemID"));
              int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/OrderNO"));
				if (levItemId==itemId && levOrder==i) {
              %>
                <tr>
                  <td width="30%" align="center">
				    <input type="checkbox" value="" /></td>
                  <td width="70%" align="left"><bean:write id="specialev" property="specialLevs/LevelName"/></td>
                </tr>
              <% } %>
              </logic:iterate>
              <% } %>
              </table></td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td width="50%" bgcolor="#FFFFFF">&nbsp;</td>
			  </logic:equal>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
      </table></td>
    </tr>
  </table>
</form>
<p align="right" class="STYLE1"> 真诚感谢您的参与与支持！</p>
</body>