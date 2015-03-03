<%@include file="/internet/common.jsp"%>
<title>新增评估项目等级</title>

<body>
<table width="200" height="50px" align="center">
<form id="addform" method="post" action="teachWorkManage.prTeachEvaluate.prEvlLevAdd.do">
<tr>
  <td width="50%" height="100%" align="center">等级名称<html:text property="EvaluateItemScore/LevelName" maxlength="5"/></td>
</tr>
<tr>
  <td align="center">等级分数<html:text property="EvaluateItemScore/Score"/></td>
  </tr>
<tr>
  <td align="center"><input type="button" class="button_02" value="新增" onclick="submit_form();">
    &nbsp;<input type="button" value="完成" class="button_02" onclick="window.close();">
    <html:hidden property="EvaluateItemScore/ItemID" />
    <html:hidden property="EvaluateItemScore/OrderNO" />
    <html:hidden property="EvaluateItemScore/EvaluationID" /></td>
  </tr>
<tr>
  <td colspan="2" align="center"></td>
</tr>
</form>
</table>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-60;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

window.moveTo(x,y);
document.all["EvaluateItemScore/ItemID"].value = window.opener.document.getElementById(objname+"_itemId").value;
document.all["EvaluateItemScore/EvaluationID"].value = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;

/*
方法定义
*/

//提交新增等级
function submit_form() {

var itemscore = window.opener.document.getElementById(objname +"_score").value;
var levscore = document.all["EvaluateItemScore/Score"].value;
var no = getLevLen(objname);
var nextno = no + 1;

//检查输入
if (isNaN(levscore)) {
   alert("请输入数字类型的等级分数！");
   return;
} else if(parseInt(levscore)<0) {
   alert("等级分数不能小于0，请重新输入！");
   return;
} else if (parseInt(levscore) > parseInt(itemscore)) {
   alert("等级分数不能大于项目分数，请修改！");
   return;
}

document.all["EvaluateItemScore/OrderNO"].value = nextno;
document.forms[0].target = window.opener.name;
document.forms[0].submit();

}

//提交新增等级
function lev_add() {
var no = getLevLen(objname);
var nextno = no + 1;
var levTd = window.opener.document.getElementById(objname +"_lev_td");
var levInput = window.opener.document.createElement("<input name='"+objname+"_lev" + nextno +"_input' type='hidden' id='"+objname+"_lev" + nextno +"_input' value=''>");
var levText = window.opener.document.createElement("<span id='"+objname+"_lev" + nextno +"_text'></span>");
var scoreInput = window.opener.document.createElement("<input name='"+objname+"_lev" + nextno +"_score' type='hidden' id='"+objname+"_lev" + nextno +"_score' value=''>");
var scoreText = window.opener.document.createElement("<span id='"+objname+"_lev" + nextno + "_scoreText'></span>");
var orderNo = window.opener.document.createElement("<input name='"+objname+"_lev" + nextno +"_no' type='hidden' id='"+objname+"_lev" + nextno +"_no' value='" + nextno + "'>");
var levTable = "<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='1' bgcolor='#000000'><tr height='100%'><td id='"+objname+"_lev1_td' valign='top' align='center' bgcolor='#FFFFFF'></td></tr></table>";
var levTableLink1 = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'><tr id='"+objname+"_lev" + nextno + "_link'><td id='"+objname+"_lev" + nextno + "_modify' align='center'><a href=javascript:modify_lev('"+objname+"_lev"+ nextno+"')>修<br>改</a></td></tr></table>";
var levTableLink2 = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'><tr id='"+objname+"_lev" + nextno + "_link'><td id='"+objname+"_lev"+nextno+"_modify' align='center'><a href=javascript:modify_lev('"+objname+"_lev"+ nextno+"')>修<br>改</a></td><td id='"+objname+"_lev"+nextno+"_del' align='center'><a href=javascript:del_lev('"+objname+"_lev"+ nextno+"')>删<br>除</a></td></tr></table>";
var checkboxRow1Tb = "<table id='row1_"+objname+"_tb' width='100%' border='0'><tr><td align='center'><input type='checkbox' value='checkbox'></td><tr></table>";
var checkboxRow2Tb = "<table id='row2_"+objname+"_tb' width='100%' border='0'><tr><td align='center'><input type='checkbox' value='checkbox'></td><tr></table>";
var checkbox="<input type='checkbox' value='checkbox'>";
var levname = document.all.lev_name.value;
var levscore = document.all.lev_score.value;
var itemscore = window.opener.document.getElementById(objname +"_score").value;

//检查输入
if (isNaN(levscore)) {
   alert("请输入数字类型的等级分数！");
   return;
} else if(parseInt(levscore)<0) {
   alert("等级分数不能小于0，请重新输入！");
   return;
} else if (parseInt(levscore) > parseInt(itemscore)) {
   alert("等级分数不能大于项目分数，请修改！");
   return;
}

if (no <= 0) {

   levTd.insertAdjacentHTML("afterBegin", levTable);
   var lev1Td = window.opener.document.getElementById(objname+"_lev1_td");
   var nextCheckboxTd1 = window.opener.document.getElementById("row1_" + objname + "_checkboxes");
   var nextCheckboxTd2 = window.opener.document.getElementById("row2_" + objname + "_checkboxes");
   var tmpText = "";
   
   lev1Td.valign="top";
   lev1Td.insertAdjacentElement("beforeEnd", levText);
   lev1Td.insertAdjacentElement("beforeEnd", scoreText);
   lev1Td.insertAdjacentElement("beforeEnd", levInput);
   lev1Td.insertAdjacentElement("beforeEnd", scoreInput);
   lev1Td.insertAdjacentElement("beforeEnd", orderNo);
   lev1Td.insertAdjacentHTML("beforeEnd", levTableLink1);
   nextCheckboxTd1.insertAdjacentHTML("beforeEnd",checkboxRow1Tb);
   nextCheckboxTd2.insertAdjacentHTML("beforeEnd",checkboxRow2Tb);
   
   for (var i=0;i<levname.length;i++) {
      tmpText += levname.substr(i, 1) + "<br>"; 
   }
   levText.innerHTML = tmpText;
   levInput.value = levname;
   scoreText.innerHTML = "(" + levscore + ")";
   scoreInput.value = levscore;
   
} else {

   var tmpText = "";
   var checkboxrow1 = window.opener.document.getElementById("row1_" + objname + "_tb");
   var checkboxrow2 = window.opener.document.getElementById("row2_" + objname + "_tb");
   var row1td = checkboxrow1.rows[0].insertCell();
   var row2td = checkboxrow2.rows[0].insertCell();
   var lastlev = window.opener.document.getElementById(objname +"_lev"+no+"_td");
   var nextlev = window.opener.document.createElement("<td id='"+objname+"_lev"+nextno+"_td' valign='top' align='center' bgcolor='#FFFFFF'></td>");
   
   lastlev.insertAdjacentElement("afterEnd", nextlev);
   nextlev.insertAdjacentElement("beforeEnd", levText);
   nextlev.insertAdjacentElement("beforeEnd", scoreText);
   nextlev.insertAdjacentElement("beforeEnd", levInput);
   nextlev.insertAdjacentElement("beforeEnd", scoreInput);
   nextlev.insertAdjacentElement("beforeEnd", orderNo);
   if (no >= 2) {
      nextlev.insertAdjacentHTML("beforeEnd", levTableLink2);
   } else {
      nextlev.insertAdjacentHTML("beforeEnd", levTableLink1);
   }
   
   row1td.align = "center";
   row2td.align = "center";
   row1td.insertAdjacentHTML("beforeEnd", checkbox);
   row2td.insertAdjacentHTML("beforeEnd", checkbox);
   
   for (var i=0;i<levname.length;i++) {
      tmpText += levname.substr(i, 1) + "<br>"; 
   }
   levText.innerHTML = tmpText;
   levInput.value = levname;
   scoreText.innerHTML = "(" + levscore + ")";
   scoreInput.value = levscore;

}

}

function getLevLen(objname) {

var len=1;
var levname=objname+"_lev1_td";

while (window.opener.document.getElementById(levname)!=null) {
   len = len+1;
   levname=objname+"_lev"+len+"_td";
}
len = len-1;

return len;

}
</script>
</body>