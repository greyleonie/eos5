<%@include file="/internet/common.jsp"%>
<title>新增评估项目等级</title>
</head>

<body>
<table width="200" height="50px" align="center">
<form id="addform" method="post" action="">
<tr>
  <td width="50%" height="100%" align="center">等级名称<html:text property="EvaluateItemScore/LevelName" maxlength="5"/></td>
</tr>
<!--<tr>
  <td align="center">等级分数<input type="text" id="lev_score" value=""/></td>
  </tr>-->
<tr>
  <td align="center"><input type="button" class="button_02" value="新增" onclick="submit_form();">
    &nbsp;<input type="button" class="button_02" value="完成" onclick="window.close();">
    <html:hidden property="EvaluateItemScore/ItemID" />
    <html:hidden property="EvaluateItemScore/OrderNO" />
    <html:hidden property="EvaluateItemScore/EvaluationID" /></td>
  </tr>
</form>
</table>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-25;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);


window.moveTo(x,y);

/*
方法定义
*/

//提交新增等级
function submit_form() {

//var itemscore = window.opener.document.getElementById(objname +"_score").value;
//var levscore = document.all["EvaluateItemScore/Score"].value;
var no = getLevLen(objname);
var nextno = no + 1;

//检查输入
/*if (isNaN(levscore)) {
   alert("请输入数字类型的等级分数！");
   return;
} else if(parseInt(levscore)<0) {
   alert("等级分数不能小于0，请重新输入！");
   return;
} else if (parseInt(levscore) > parseInt(itemscore)) {
   alert("等级分数不能大于项目分数，请修改！");
   return;
}*/

document.all["EvaluateItemScore/OrderNO"].value = nextno;
document.all["EvaluateItemScore/ItemID"].value = window.opener.document.getElementById(objname+"_itemId").value;
document.all["EvaluateItemScore/EvaluationID"].value = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;

document.forms[0].action = window.opener.document.all["spcLevAction"].value;
document.forms[0].target = window.opener.name;
document.forms[0].submit();

}

//提交新增等级
function lev_add() {
var tmpText = "";
var no = getLevLen(objname);
var nextno = no + 1;
var levname = document.all.lev_name.value;
var levTb = window.opener.document.getElementById(objname+"_lev_tb");
var nextTr;
var inputTd = window.opener.document.createElement("<td width='21%' align='center'></td>");
var inputs = "<input type='checkbox' id='"+objname+"_lev"+nextno+"_checkbox'/><input type='hidden' id='"+objname+"_lev"+nextno+"' value='' /><input type='hidden' id='"+objname+"_lev"+nextno+"_no' value='"+nextno+"' />";
var textTd = window.opener.document.createElement("<td id='"+objname+"_lev"+nextno+"_td' width='41%' align='left' valign='middle'></td>");
var linkTd = window.opener.document.createElement("<td width='38%' align='center' valign='middle'></td>");
var links = "<a id='"+objname+"_lev"+nextno+"_dellink' href=javascript:del_specialLev('"+objname+"_lev"+nextno+"');  class='STYLE11'>删</a>&nbsp;&nbsp;<a id='"+objname+"_lev"+nextno+"_fixlink' href=javascript:modify_specialLev('"+objname+"_lev"+nextno+"'); class='STYLE11'>改</a>";

//检查输入
/*if (isNaN(levscore)) {
   alert("请输入数字类型的等级分数！");
   return;
} else if(parseInt(levscore)<0) {
   alert("等级分数不能小于0，请重新输入！");
   return;
} else if (parseInt(levscore) > parseInt(itemscore)) {
   alert("等级分数不能大于项目分数，请修改！");
   return;
}*/

   nextTr = levTb.insertRow();
   nextTr.id = objname + "_lev" + nextno + "_tr";
   nextTr.insertAdjacentElement("beforeEnd", inputTd);
   inputTd.insertAdjacentHTML("beforeEnd", inputs);
   nextTr.insertAdjacentElement("beforeEnd", textTd);
   nextTr.insertAdjacentElement("beforeEnd", linkTd);
   linkTd.insertAdjacentHTML("beforeEnd", links);
   
   window.opener.document.getElementById(objname+"_lev"+nextno).value = levname;
   textTd.innerHTML = levname;

}

function getLevLen(objname) {

var len=1;
var levname=objname+"_lev1_tr";

while (window.opener.document.getElementById(levname)!=null) {
   len = len+1;
   levname=objname+"_lev"+len+"_tr";
}
len = len-1;

return len;

}
</script>
</body>