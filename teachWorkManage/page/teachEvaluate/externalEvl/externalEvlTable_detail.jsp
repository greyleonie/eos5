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
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;新增外请课评教表</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td height="20" align="center"><span class="STYLE3">广州市委党校&nbsp;&nbsp;广州行政学院</span><br>
        <SPAN class="STYLE4" id="titleText"><bean:write property="Evaluation/Title"/></SPAN><BR>（第**期局级领导干部进修班）<BR>
	    <div align="left" class="STYLE5">&nbsp;&nbsp;&nbsp;&nbsp;
        <SPAN id="remarksText"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
      </td>
    </tr>
		<tr>
		  <td>
		  <table id="special" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="class0_tr">
              <td width="30%" align="center" bgcolor="#FFFFFF">专题（主讲人）
			  <div align="right"><a href=javascript:add_class('class'); class="STYLE11">新增评价类型</a></div>
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">
			  <span id="class_itemText1">评教类别</span>
			  <input type="hidden" id="class_item1" value="评教类别">
			  </td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="special_item0_suggest" width="50%" align="center" bgcolor="#FFFFFF">意 见 和 建 议</td>
			  </logic:equal>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="wqk" property="list[@type='wqks']">
			<% 
			  itemLen++;
			  int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"wqk","wqks/ItemID"));
			  int itemLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"wqk","wqks/levlen"));
			%>
            <tr id="class<%=itemLen%>_tr">
              <td width="30%" bgcolor="#FFFFFF">
              <bean:write id="wqk" property="wqks/Course"/> ：<br />
              题目：<bean:write id="wqk" property="wqks/CourseTitle"/><br />
			  <table width="100%">
			  <tr>
			    <td colspan="3" align="right">
			    <SCRIPT>
			    	var tname='<bean:write id="wqk" property="wqks/TeacherName"/>';
			    	var otname='<bean:write id="wqk" property="wqks/Outsider"/>';
			    	var post='<bean:write id="wqk" property="wqks/OutSidePost"/>';
			    	var org='<bean:write id="wqk" property="wqks/OutSideOrg"/>';
			    	if(tname!='')
			    		document.write("("+tname+")");
			    	else
			    		document.write("("+otname+")<br/>"+post+"<br/>"+org);
			    </SCRIPT>
			    </td>
			  </tr>
			  </table></td>
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
                  <td width="70%" align="left">
				  <bean:write id="specialev" property="specialLevs/LevelName"/></td>
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