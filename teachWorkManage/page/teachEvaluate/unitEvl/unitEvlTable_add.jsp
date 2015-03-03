<%@include file="/internet/common.jsp"%>
<%
String oldversion = base.util.TalentContext.getValue(pageContext,null,"Evaluation/Version");
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
	font-size: 24px;
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
function add_item(objname) {

var path = "teachWorkManage.prTeachEvaluate.prCourseItemAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=120");

}

function modify_item(objname) {
var path = "teachWorkManage.prTeachEvaluate.prCourseItemModify.do?objname=" + objname;
modifywindow = window.open(path,"modify_window","width=200,height=200");
}

function del_item(objname) {

var len = getItemLen(objname.substr(0,objname.indexOf("_")));
var no = objname.substr(objname.length-1,1);
var nextno = parseInt(no) + 1;
var nextObj = "allCourse_item" + nextno;
var now = new Date();

//提交删除项目
var path = "teachWorkManage.prTeachEvaluate.prEvlItemDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItems/ItemID="+document.all[objname+"_Id"].value;

if (confirm("确认删除当前项目吗？")) {
document.getElementById("modifyframe").src = path;

eval(objname + "_tr").removeNode(true);

if (document.getElementById(nextObj) != null) {
   for (var i=nextno;i<=len;i++) {
      var preno = i - 1;
      document.getElementById("allCourse_item"+i).id = "allCourse_item" + preno;
	  document.getElementById("allCourse_item"+i+"_tr").id = "allCourse_item" + preno + "_tr";
	  document.getElementById("allCourse_item"+i+"_td").id = "allCourse_item" + preno + "_td";
	  document.getElementById("allCourse_item"+i+"_text").id = "allCourse_item" + preno + "_text";
	  document.getElementById("allCourse_item"+i+"_no").value = parseInt(document.getElementById("allCourse_item" + i+"_no").value) - 1;
	  document.getElementById("allCourse_item"+i+"_no").id = "allCourse_item" + preno + "_no";
	  document.getElementById("allCourse_item"+i+"_course").id = "allCourse_item" + preno + "_course";
	  document.getElementById("allCourse_item"+i+"_courseid").id = "allCourse_item" + preno + "_courseid";
	  document.getElementById("allCourse_item"+i+"_dellink").href = "javascript:del_item('allCourse_item" + preno +"')";
	  document.getElementById("allCourse_item"+i+"_dellink").id = "allCourse_item" + preno + "_dellink";
	  document.getElementById("allCourse_item"+i+"_fixlink").href = "javascript:modify_item('allCourse_item" + preno +"')";
	  document.getElementById("allCourse_item"+i+"_fixlink").id = "allCourse_item" + preno + "_fixlink";
   }
}
}
}

function add_lev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prCourseLevAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=30");

}

function del_lev(objname) {

var len = getItemLen(objname.substr(0,objname.indexOf("_")));
var levlen = getLevLen(objname);
var no = objname.substr(objname.length-1,1);
var nextno = parseInt(no) + 1;
var nextObj = "allCourse_lev" + nextno;
var now = new Date();

//提交删除项目等级
var path = "teachWorkManage.prTeachEvaluate.prEvlLevDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItemScore/EvaluationID="+document.all["Evaluation/EvaluationID"].value+ "&EvaluateItemScore/LevelName="+document.all[objname].value;

if (confirm("确认删除当前等级吗？")) {
document.getElementById("modifyframe").src = path;

document.getElementById(objname+"_td").removeNode(true);
for (var i=1;i<=len;i++) {
	var tmpObj = document.getElementById(objname.substring(0,objname.indexOf("_")) + "_item" + i + "_tr");
    tmpObj.deleteCell(objname.substr(objname.length-1,1));
}

if (document.getElementById(nextObj) != null) {
   for (var i=nextno;i<=levlen;i++) {
      var preno = i - 1;
      document.getElementById("allCourse_lev"+i).id = "allCourse_lev" + preno;
	  document.getElementById("allCourse_lev"+i+"_td").id = "allCourse_lev" + preno + "_td";
	  document.getElementById("allCourse_lev"+i+"_tb").id = "allCourse_lev" + preno + "_tb";
	  document.getElementById("allCourse_lev"+i+"_text").id = "allCourse_lev" + preno + "_text";
	  document.getElementById("allCourse_lev"+i+"_no").value = parseInt(document.getElementById("allCourse_lev" + i+"_no").value) - 1;
	  document.getElementById("allCourse_lev"+i+"_no").id = "allCourse_lev" + preno + "_no";
	  document.getElementById("allCourse_lev"+i+"_dellink").href = "javascript:del_lev('allCourse_lev" + preno +"')";
	  document.getElementById("allCourse_lev"+i+"_dellink").id = "allCourse_lev" + preno + "_dellink";
	  document.getElementById("allCourse_lev"+i+"_fixlink").href = "javascript:modify_lev('allCourse_lev" + preno +"')";
	  document.getElementById("allCourse_lev"+i+"_fixlink").id = "allCourse_lev" + preno + "_fixlink";
   }
}
}
}

function modify_lev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prCourseLevModify.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=150");

}

function getItemLen(objname) {

var len=1;
var itemname=objname + "_item1_tr";

while (window.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname + "_item" + len + "_tr";
}
len = len-1;

return len;

}

function getLevLen(objname) {

var len=1;
var levname=objname.substring(0,objname.indexOf("_"))+"_lev1_td";

while (document.getElementById(levname)!=null) {
   len = len+1;
   levname=objname.substring(0,objname.indexOf("_"))+"_lev"+len+"_td";
}
len = len-1;

return len;

}

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

    function fixTitle() {
		document.getElementById("titleText").style.display = "none";
		document.getElementById("Evaluation/Title").className = "showinput";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Title").value;
	}

	function saveTitle() {
	  var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	  var evlId = document.all["Evaluation/EvaluationID"].value;
	  var ov = document.getElementById("oldvalue").value;
	  var nv = document.getElementById("Evaluation/Title").value;
	  
	  if (document.getElementById("Evaluation/Title").value != "") {
		document.getElementById("titleText").innerHTML = document.getElementById("Evaluation/Title").value;
		document.getElementById("titleText").style.display = "inline-block";
		document.getElementById("Evaluation/Title").className = "noinput";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Title=" + document.getElementById("Evaluation/Title").value;
		   document.getElementById("modifyframe").src = path;
		}
	  } else {
	    alert("评估表类型名称不能为空！");
	  }
	}

	function fixRemarks() {
		document.getElementById("remarksText").style.display = "none";
		document.getElementById("Evaluation/Remarks").className = "showinput";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Remarks").value;
	}

	function saveRemarks() {
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    var ov = document.getElementById("oldvalue").value;
	    var nv = document.getElementById("Evaluation/Remarks").value;
	    
		document.getElementById("remarksText").innerHTML = nv;
		document.getElementById("remarksText").style.display = "inline";
		document.getElementById("Evaluation/Remarks").className = "noinput";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Remarks=" + document.getElementById("Evaluation/Remarks").value;
		   document.getElementById("modifyframe").src = path;
		}
	}

	function saveSuggest() {
	    var itemLen = 0;
	    var now = new Date();
	    var suggest = "allCourse_item0_suggest";
		var selObj = document.getElementById("suggest");
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?nowtime=" + now.toUTCString();
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    
	    
	    
		if (selObj.options[selObj.selectedIndex].value=='否') {
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
			
			path = path + "&Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=0";
		    document.getElementById("modifyframe").src = path;
		} else{
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
			
			path = path + "&Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=1";
		    document.getElementById("modifyframe").src = path;
		}
		
	}
	
	function dispSuggest() {
	   var itemLen = 0;
	   var suggest = "allCourse_item0_suggest";
	   var selObj = document.getElementById("suggest");
	   var isuggest = <bean:write property="Evaluation/IsNeedAdvice"/>;
	   
	   if (isuggest == 0) {
	        selObj.options[1].selected = true;
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
		} else{
		    selObj.options[0].selected = true;
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
		}
	}
	
	function fixVersion() {
		document.getElementById("version").style.display = "none";
		document.getElementById("Evaluation/Version").className = "showversion";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Version").value;
	}
	
	function saveVersion() {
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    var ov = document.getElementById("oldvalue").value;
	    var nv = document.getElementById("Evaluation/Version").value;
	    
	    document.getElementById("version").innerHTML = "版本 ：" + document.getElementById("Evaluation/Version").value;
		document.getElementById("version").style.display = "inline-block";
		document.getElementById("Evaluation/Version").className = "noversion";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + document.getElementById("Evaluation/Version").value;
		   document.getElementById("modifyframe").src = path;
		}
	}
</script>

<body>
<form>
<html:hidden property="Evaluation/EvaluationID" />
<html:hidden property="Evaluation/Period" />
<html:hidden property="Evaluation/IsNeedAdvice" />
<html:hidden property="oldVersion" value="<%=oldversion%>"/>
<html:hidden property="status"/>
<input type="hidden" id="oldvalue" value="">
<input type="hidden" id="courseItemAction" value="teachWorkManage.prTeachEvaluate.prAddUnitItem.do">
<input type="hidden" id="courseLevAction" value="teachWorkManage.prTeachEvaluate.prAddUnitLev.do">
<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="../../image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;维护主体班单元评估表</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" align="center">
        <p class="STYLE3">广 州 行 政 学 院</p>
        <html:text onblur="saveTitle();" property="Evaluation/Title" attributesText='class="noinput" Msg="评估表类型名称不能为空"'/>
        <SPAN class="STYLE4" id="titleText" ondblclick="fixTitle();"><bean:write property="Evaluation/Title"/></SPAN><BR><BR>
	    <br><div align="left" class="STYLE5">各位学员：<br>&nbsp;&nbsp;
	    <html:text onblur="saveRemarks();" property="Evaluation/Remarks" attributesText='class="noinput"'/>
        <SPAN id="remarksText" ondblclick="fixRemarks();"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
        <div align="right"><html:text onblur="saveVersion();" property="Evaluation/Version" attributesText='class="noversion"'/></div>
      </td>
    </tr>
    <tr><td>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;单元名称：******　</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;负责部门：******</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;本单元教学时间：2007.01.01 至 2007.01.16</p>
    </td></tr>
    <tr>
      <td class="text" valgin="top">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td><SELECT id="suggest" onchange="saveSuggest();">
				<OPTION value="是" selected>保留意见栏</OPTION>
				<OPTION value="否">去除意见栏</OPTION>
			  </SELECT></td></td>
        </tr>
		<tr>
		  <td>
		  <table id="allCourse" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="allCourse_item0_tr">
              <td id="allCourse_lev0_td" width="20%" bgcolor="#FFFFFF">评价等次
                <input type="button" id="add_item2" class="button_02" value="新增等级" onclick="add_lev('allCourse');"/>
                <br>("A"为好，"D"为差)
                <br />评<br />价<br />项
                <input type="button" name="allCourse_additem" class="button_02" value="新增项目" onclick="add_item('allCourse');"/>
              <% int levLen = 0; %>
              <logic:iterate id="allev" property="list[@type='allCourseLevs']">
              <% levLen++; %>
              <td id="allCourse_lev<%=levLen%>_td" width="10%" align="center" bgcolor="#FFFFFF">
			   <table id="allCourse_lev<%=levLen%>_tb" width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                   <tr valign="middle">
                     <td colspan="2" align="center">
					   <INPUT value="<bean:write id="allev" property="allCourseLevs/LevelID"/>" type="hidden" id="allCourse_lev<%=levLen%>_levId">
                       <input type="hidden" id="allCourse_lev<%=levLen%>" value="<bean:write id="allev" property="allCourseLevs/LevelName"/>" />
                       <input type="hidden" id="allCourse_lev<%=levLen%>_no" value="<bean:write id="allev" property="allCourseLevs/OrderNO"/>" />
					   <span id="allCourse_lev<%=levLen%>_text"><script>formatLevText("allCourse_lev<%=levLen%>_text","<bean:write id="allev" property="allCourseLevs/LevelName"/>");</script></span></td>
                     </tr>
                   <tr valign="bottom">
                     <td width="50%" height="30%" align="center">
					 <a id="allCourse_lev<%=levLen%>_dellink" href=javascript:del_lev('allCourse_lev<%=levLen%>'); class="STYLE11">删</a></td>
                     <td width="50%" height="30%" align="center">
					 <a id="allCourse_lev<%=levLen%>_fixlink" href=javascript:modify_lev('allCourse_lev<%=levLen%>'); class="STYLE11">改</a></td>
                   </tr>
                 </table>
              </td>
              </logic:iterate>
              <td id="allCourse_item0_suggest" width="42%" align="center" bgcolor="#FFFFFF">意 见 与 建 议</td>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="allCourseItem" property="list[@type='allCourseItems']">
			<% itemLen++; %>
            <tr id="allCourse_item<%=itemLen%>_tr">
              <td id="allCourse_item<%=itemLen%>_td" width="18%" height="45" align="center" bgcolor="#FFFFFF">
			  <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="1">
                <tr>
                  <td width="80%" rowspan="2" align="center" valign="middle">
                  <span id="allCourse_item<%=itemLen%>_text">
                  <script>formatItemText("allCourse_item<%=itemLen%>_text","<bean:write id="allCourseItem" property="allCourseItems/Title"/>");</script>
                  </span>
                    <INPUT value="<bean:write id="allCourseItem" property="allCourseItems/ItemID"/>" type="hidden" id="allCourse_item<%=itemLen%>_Id">
                    <input type="hidden" id="allCourse_item<%=itemLen%>" value="<bean:write id="allCourseItem" property="allCourseItems/Title"/>" />
                    <input type="hidden" id="allCourse_item<%=itemLen%>_no" value="<bean:write id="allCourseItem" property="allCourseItems/OrderNO"/>" />
					<input type="hidden" id="allCourse_item<%=itemLen%>_course" value="<bean:write id="allCourseItem" property="allCourseItems/Course"/>" />
                    <input type="hidden" id="allCourse_item<%=itemLen%>_courseid" value="<bean:write id="allCourseItem" property="allCourseItems/CourseType"/>" /></td>
                  <td width="20%" height="50%" align="right" valign="middle">
				  <a id="allCourse_item<%=itemLen%>_dellink" href=javascript:del_item('allCourse_item<%=itemLen%>'); class="STYLE11">删</a></td>
                </tr>
                <tr>
                  <td width="20%" height="50%" align="right" valign="middle">
				  <a id="allCourse_item<%=itemLen%>_fixlink" href=javascript:modify_item('allCourse_item<%=itemLen%>'); class="STYLE11">改</a></td>
                </tr>
              </table></td>
              <% for (int i=0;i<levLen;i++) { %>
              <td width="10%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
              <% } %>
              <td id="allCourse_item<%=itemLen%>_suggest" width="42%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
      </table></td>
    </tr>
  </table>
</form>
<div align="center"><INPUT type="button" class="button_02" value="完成" onclick="checkVersion()">&nbsp;
<INPUT type="button" class="button_02" value="返回" onclick="delEvlReturn();"></div>
<script language="javascript">
dispSuggest();

function checkVersion() {
var evlId = document.all["Evaluation/EvaluationID"].value;
var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
var newversion = document.forms[0].elements("Evaluation/Version").value;
var version = prompt("是否确认使用当前版本号 ："+newversion+",否则在下面输入新版本号，按确定即可！",newversion);
//var oldversion = document.forms[0].elements("oldVersion").value;

//if (newversion == oldversion) {
//   if (confirm('是否确认当前版本号 ：'+newversion)){
//		history.go(-1);
//   }
//} else location.href="teachWorkManage.prTeachEvaluate.prWeekEvlList.do";

if (version==null) location.href="teachWorkManage.prTeachEvaluate.prUnitEvlList.do";
else {
   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + version;
   document.getElementById("modifyframe").src = path;
   setTimeout("location.href='teachWorkManage.prTeachEvaluate.prUnitEvlList.do';",3000);
}
}

function delEvlReturn() {
var path = "teachWorkManage.prTeachEvaluate.prUnitListDel.do?Evaluation/ClassType=1&Evaluation/Period=单元";
var evlId = document.all["Evaluation/EvaluationID"].value;
var status = document.all["status"].value;

if (status == 'add') {
   path = path + "&evlList/Evaluation1/EvaluationID="+evlId;
   if (confirm("确定取消新增当前单元评估表吗？")) location.href = path;
} else {
   location.href='teachWorkManage.prTeachEvaluate.prUnitEvlList.do';
}
}
</script>
</body>