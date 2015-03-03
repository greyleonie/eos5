<%@include file="/internet/common.jsp"%>
<title>新增评估项目</title>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-60;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

window.moveTo(x,y);

/*
方法定义
*/

//提交新增项目
function submit_form() {
var no = getItemLen(objname);
//alert(no);
var nextno = no + 1;
var title = document.all.item_name.value;
var evaluactionId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;

/*if (isNaN(document.all.item_score.value)) {
   alert("请输入数字类型的项目分数！");
   return;
} else if(parseInt(document.all.item_score.value)<0) {
   alert("项目分数不能小于0，请重新输入！");
   return;
}*/

document.all["EvaluateItems/Title"].value=title;
document.all["EvaluateItems/EvaluationID"].value=evaluactionId;
document.all["EvaluateItems/OrderNO"].value=nextno;
document.all["EvaluateItemScore/ItemID"].value=window.opener.document.getElementById(objname+"_item"+no+"_Id").value;

//alert(window.opener.name);
document.forms[0].action = window.opener.document.all["courseItemAction"].value;
document.forms[0].target = window.opener.name;
document.forms[0].submit();

}

//提交新增项目
function item_add() {
var no = getItemLen(objname);
var nextno = no + 1;
var nextObj = objname + "_item" + nextno;
var nametmp = objname + "_item" + no;
var trObj = window.opener.document.getElementById("allCourse").insertRow();
var tdObj = window.opener.document.createElement("<td id='"+nextObj+"_td' width='18%' height='45' align='center' bgcolor='#FFFFFF'></td>");
var tableHtml = "<table width='100%' height='100%' border='0' cellpadding='1' cellspacing='1'><tr><td width='80%' rowspan='2' align='center' valign='middle'><span id='"+nextObj+"_text'></span> <br /><input type='hidden' id='"+nextObj+"' value='' /><input type='hidden' id='"+nextObj+"_no' value='"+nextno+"' /><input type='hidden' id='"+nextObj+"_course' value='' /><input type='hidden' id='"+nextObj+"_courseid' value='' /></td><td width='20%' align='right' valign='middle'><a id='"+nextObj+"_dellink' href=javascript:del_item('"+nextObj+"'); class='STYLE11'>删</a></td></tr><tr><td width='20%' align='right' valign='middle'><a id='"+nextObj+"_fixlink' href=javascript:modify_item('"+nextObj+"'); class='STYLE11'>改</a></td></tr></table>";
var tdsObj=window.opener.document.createElement("<td id='"+nextObj+"_lev1_td' width='10%' align='center' valign='middle' bgcolor='#FFFFFF'>&nbsp;</td>");
var suggestObj=window.opener.document.createElement("<td width='42%' align='center' valign='middle' bgcolor='#FFFFFF'>&nbsp;</td>");
var name = document.all.item_name.value;
var name_tmp = "";
var levLen = getLevLen();

/*if (isNaN(document.all.item_score.value)) {
   alert("请输入数字类型的项目分数！");
   return;
} else if(parseInt(document.all.item_score.value)<0) {
   alert("项目分数不能小于0，请重新输入！");
   return;
}*/
trObj.id = nextObj+"_tr";
trObj.insertAdjacentElement("beforeEnd", tdObj);
tdObj.insertAdjacentHTML("beforeEnd", tableHtml);
tmpObj = tdObj.insertAdjacentElement("afterEnd", tdsObj);
for (var i=2;i<=levLen;i++) {
   var tdsObj=window.opener.document.createElement("<td id='"+nextObj+"_lev"+i+"_td' width='10%' align='center' valign='middle' bgcolor='#FFFFFF'>&nbsp;</td>");
   tmpObj=tmpObj.insertAdjacentElement("afterEnd", tdsObj);
   if (i == levLen) tmpObj.insertAdjacentElement("afterEnd", suggestObj);
}

if (name.length <= 6) {
   for (var i=0;i < name.length;i++) {
      name_tmp = name_tmp + name.substr(i,1) + " ";
   }
   window.opener.document.getElementById(nextObj+"_text").innerHTML = name_tmp + "<br>";
}
if (name.length > 8) {
   window.opener.document.getElementById(nextObj+"_text").innerHTML = name.substring(0,Math.floor(name.length/2)) + "<br>" + name.substring(Math.floor(name.length/2),name.length) + "<br>";
}
window.opener.document.getElementById(nextObj).value = document.all.item_name.value;
//scoreText.innerHTML = "(" + document.all.item_score.value + ")<br>";
//scoreInput.value = document.all.item_score.value;
window.opener.document.getElementById(nextObj+"_course").value = document.all.item_course.value;
window.opener.document.getElementById(nextObj+"_courseid").value = document.all.item_courseid.value;

}

function getItemLen(objname) {

var len=1;
var itemname=objname + "_item1_tr";

while (window.opener.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname + "_item" + len + "_tr";
}
len = len-1;

return len;

}

function getLevLen() {

var len=1;
var itemname=objname + "_lev1_td";

while (window.opener.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname + "_lev" + len + "_td";
}
len = len-1;

return len;

}

var opentime = 0;
function dispModes() {
   var x = window.screenLeft + 255;
   var y = window.screenTop - 32;
   
   if (opentime == 0) {
      modeWindow = window.open("educatingMode.html","mode_window","width=500,height=150");
      modeWindow.moveTo(x,y);
	  opentime++;
   }
}
</script>

<body>
<table width="200" height="50" align="center">
<form id="addform" method="post" action="">
<tr>
  <td width="36%" height="100%" align="center">项目名称
    <input type="text" id="item_name" maxlength="50" value=""/>
    <html:hidden property="EvaluateItems/EvaluationID" />
    <html:hidden property="EvaluateItems/Title" />
    <html:hidden property="EvaluateItems/OrderNO" />
    <html:hidden property="EvaluateItemScore/ItemID" />
    <html:hidden property="EvaluateItemScore/LevelName" />
    <html:hidden property="EvaluateItemScore/OrderNO" />
  </td>
</tr>
<tr>
  <td align="center">适用课程
    <input type="text" id="item_course" value="全部" READONLY/>
  </td>
  </tr>
<!--<tr>
<td align="center">项目总分 <input type="text" id="item_score" value=""/></td>
  </tr>-->
<tr>
  <td align="center" colspan="2"><input type="button" class="button_02" value="新增" onclick="submit_form();">
    &nbsp;<input type="button" value="完成" class="button_02" onclick="window.close();"></td>
  </tr>
<tr>
  <td colspan="2" align="center"></td>
</tr>
</form>
</table>
</body>