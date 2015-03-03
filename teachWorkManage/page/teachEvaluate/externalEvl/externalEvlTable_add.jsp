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
function add_class(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcItemAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=250");

}

function del_class(objname) {
var now = new Date();

//提交删除项目
var path = "teachWorkManage.prTeachEvaluate.prEvlItemDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItems/ItemID="+document.all[objname+"_itemId"].value;

if (confirm("确认删除当前项目吗？")) {
document.getElementById("modifyframe").src = path;
		
document.getElementById(objname+"_tr").removeNode(true);
}
}

function modify_class(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcItemFix.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=120");

}

function add_specialLev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcLevAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=50");

}

function del_specialLev(objname) {
var now = new Date();
var levlen = getLevLen(objname);
var no = objname.substr(objname.length-1,1);
var nextno = parseInt(no) + 1;
var nextObj = objname.substring(0,objname.indexOf("_")) + "_lev" + nextno;

//提交删除等级
var path = "teachWorkManage.prTeachEvaluate.prEvlLevDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItemScore/LevelID="+document.all[objname+"_Id"].value;

if (confirm("确认删除当前等级吗？")) {
document.getElementById("modifyframe").src = path;

document.getElementById(objname+"_tr").removeNode(true);
if (document.getElementById(nextObj) != null) {
   for (var i=nextno;i<=levlen;i++) {
      var preno = i - 1;
	  
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i).id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno;
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_tr").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_tr";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_td").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_td";
	  localno = document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_no").value;
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev" + i + "_no").value = parseInt(localno) - 1;
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_no").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_no";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_checkbox").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_checkbox";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_dellink").href = "javascript:del_specialLev('"+objname.substring(0,objname.indexOf("_")) + "_lev" + preno +"')";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_dellink").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_dellink";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_fixlink").href = "javascript:modify_specialLev('"+objname.substring(0,objname.indexOf("_")) + "_lev" + preno +"')";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_fixlink").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_fixlink";
   }
}
}
}

function modify_specialLev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcLevFix.do?objname=" + objname;
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
	    var suggest = "special_item0_suggest";
		var selObj = document.getElementById("suggest");
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?nowtime=" + now.toUTCString();
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    
	    
	    
		if (selObj.options[selObj.selectedIndex].value=='否') {
		    itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
			
			path = path + "&Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=0";
		    document.getElementById("modifyframe").src = path;
		} else{
		    itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
			
			path = path + "&Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=1";
		    document.getElementById("modifyframe").src = path;
		}
		
	}
	
	function dispSuggest() {
	   var itemLen = 0;
	   var suggest = "special_item0_suggest";
	   var selObj = document.getElementById("suggest");
	   var isuggest = <bean:write property="Evaluation/IsNeedAdvice"/>;
	   
	   if (isuggest == 0) {
	        selObj.options[1].selected = true;
	    
	    	itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
		} else{
		    selObj.options[0].selected = true;
		    
            itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
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
<input type="hidden" id="spcItemAction" value="teachWorkManage.prTeachEvaluate.prAddExtraItem.do">
<input type="hidden" id="spcLevAction" value="teachWorkManage.prTeachEvaluate.prAddExtraLev.do">
<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="../../image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;维护外请课评教表</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td height="20" align="center"><span class="STYLE3">广州市委党校&nbsp;&nbsp;广州行政学院</span><br>
        <html:text onblur="saveTitle();" property="Evaluation/Title" attributesText='class="noinput" Msg="评估表类型名称不能为空"'/>
        <SPAN class="STYLE4" id="titleText" ondblclick="fixTitle();"><bean:write property="Evaluation/Title"/></SPAN><BR>（第**期局级领导干部进修班）<BR>
	    <div align="left" class="STYLE5">&nbsp;&nbsp;&nbsp;&nbsp;
	    <html:text onblur="saveRemarks();" property="Evaluation/Remarks" attributesText='class="noinput"'/>
        <SPAN id="remarksText" ondblclick="fixRemarks();"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
        <div align="right"><html:text onblur="saveVersion();" property="Evaluation/Version" attributesText='class="noversion"'/></div>
      </td>
    </tr>
    <tr>
          <td><SELECT id="suggest" onchange="saveSuggest();">
				<OPTION value="是" selected>保留意见栏</OPTION>
				<OPTION value="否">去除意见栏</OPTION>
			  </SELECT></td>
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
              <td id="special_item0_suggest" width="50%" align="center" bgcolor="#FFFFFF">意 见 和 建 议</td>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="specialItem" property="list[@type='specialItems']">
			<% 
			  itemLen++;
			  int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialItem","specialItems/ItemID"));
			  int itemLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialItem","specialItems/levlen"));
			%>
            <tr id="class<%=itemLen%>_tr">
              <td width="30%" bgcolor="#FFFFFF">
              <input type="hidden" name="class<%=itemLen%>_itemId" value="<bean:write id="specialItem" property="specialItems/ItemID"/>" />
			  <input type="hidden" name="class<%=itemLen%>" value="<bean:write id="specialItem" property="specialItems/Course"/>" />
			  <input type="hidden" name="class<%=itemLen%>_id" value="<bean:write id="specialItem" property="specialItems/CourseType"/>" />
			  <span id="class<%=itemLen%>_text"><bean:write id="specialItem" property="specialItems/Course"/>：</span><br />
			  2008-6-2<br />
              <span id="class<%=itemLen%>_topic">题目：**********</span><br />
			  <table width="100%">
			  <tr>
			    <td id="class<%=itemLen%>_teacher" colspan="3" align="right">（某某领导）</td>
			  <tr>
			    <td align="center"><a href=javascript:del_class('class<%=itemLen%>'); class="STYLE11">删除类型</a></td>
				<td align="center"><a href=javascript:modify_class('class<%=itemLen%>'); class="STYLE11">修改类型</a></td>
				<td align="center"><a href=javascript:add_specialLev('class<%=itemLen%>'); class="STYLE11">新增等级</a></td>
			  </tr>
			  </table></td>
              <td id="class<%=itemLen%>_lev" width="20%" align="center" bgcolor="#FFFFFF">
			  <table id="class<%=itemLen%>_lev_tb" width="90%" border="0" cellspacing="3" cellpadding="0">
			  <%
				for (int i=1;i<=itemLevLen;i++) {
			  %>
              <logic:iterate id="specialev" property="list[@type='specialLevs']">
              <% 
              int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/ItemID"));
              int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/OrderNO"));
				if (levItemId==itemId && levOrder==i) {
              %>
                <tr id="class<%=itemLen%>_lev<%=i%>_tr">
                  <td width="21%" align="center">
				    <input type="checkbox" id="class<%=itemLen%>_lev<%=i%>_checkbox" value="" />
					<input type="hidden" id="class<%=itemLen%>_lev<%=i%>_Id" value="<bean:write id="specialev" property="specialLevs/LevelID"/>" />
					<input type="hidden" id="class<%=itemLen%>_lev<%=i%>" value="<bean:write id="specialev" property="specialLevs/LevelName"/>" />
					<input type="hidden" id="class<%=itemLen%>_lev<%=i%>_no" value="<bean:write id="specialev" property="specialLevs/OrderNO"/>" /></td>
                  <td id="class<%=itemLen%>_lev<%=i%>_td" width="41%" align="left"><bean:write id="specialev" property="specialLevs/LevelName"/></td>
                  <td width="38%" align="center" valign="middle">
				    <a id="class<%=itemLen%>_lev<%=i%>_dellink" href=javascript:del_specialLev('class<%=itemLen%>_lev<%=i%>') class="STYLE11">删</a>&nbsp;&nbsp;
					<a id="class<%=itemLen%>_lev<%=i%>_fixlink" href=javascript:modify_specialLev('class<%=itemLen%>_lev<%=i%>') class="STYLE11">改</a></td>
                </tr>
              <% } %>
              </logic:iterate>
              <% } %>
              </table></td>
              <td id="special_item<%=itemLen%>_suggest" width="50%" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
      </table></td>
    </tr>
  </table>
</form>
<p align="right" class="STYLE1"> 真诚感谢您的参与与支持！</p>
<div align="center"><INPUT type="button" class="button_02" value="保存" onclick="checkVersion()">&nbsp;
<INPUT type="button" class="button_02" value="返回" onclick="delEvlReturn()"></div>
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

if (version==null) location.href="teachWorkManage.prTeachEvaluate.prExtraEvlList.do";
else {
   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + version;
   document.getElementById("modifyframe").src = path;
   setTimeout("location.href='teachWorkManage.prTeachEvaluate.prExtraEvlList.do';",3000);
}
}

function delEvlReturn() {
var path = "teachWorkManage.prTeachEvaluate.prExtraListDel.do?Evaluation/ClassType=1&Evaluation/Period=外请课";
var evlId = document.all["Evaluation/EvaluationID"].value;
var status = document.all["status"].value;

if (status == 'add') {
   path = path + "&evlList/Evaluation1/EvaluationID="+evlId;
   if (confirm("确定取消新增当前主体班外请课评估表吗？")) location.href = path;
} else {
   location.href='teachWorkManage.prTeachEvaluate.prWeekEvlList.do';
}
}
</script>
</body>