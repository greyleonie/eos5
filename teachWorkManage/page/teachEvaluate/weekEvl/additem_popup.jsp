<%@include file="/internet/common.jsp"%>
<title>新增评估项目</title>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-125;
var y = screenH/2-80;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

window.moveTo(x,y);

/*
方法定义
*/

//提交新增项目
function submit_form() {
var no = getItemLen(objname);
var nextno = no + 1;
var title = document.all.item_name.value + ":" + document.all.item_desc.value;
var evaluactionId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;

if (title.length>50) {
   alert("项目名称和描述加起来的总长度不能超过50！");
   return false;
}
if (isNaN(document.all["EvaluateItems/Score"].value)) {
   alert("请输入数字类型的项目分数！");
   return false;
} else if(parseInt(document.all["EvaluateItems/Score"].value)<0) {
   alert("项目分数不能小于0，请重新输入！");
   return false;
}

if (objname == 'tutorship') {
   document.all["EvaluateItems/CourseType"].value = '辅导';
} else {
   document.all["EvaluateItems/CourseType"].value = '互动';
}

document.all["EvaluateItems/Title"].value=title;
document.all["EvaluateItems/EvaluationID"].value=evaluactionId;
document.all["EvaluateItems/OrderNO"].value=nextno;

//alert(window.opener.name);
document.forms[0].target = window.opener.name;
document.forms[0].submit();

}

//提交新增项目
function item_add() {
var name_tmp = "";
var now = new Date();
var courseType = "";
var no = getItemLen(objname);
var nextno = no + 1;
var nextObj = objname + nextno;
var nametmp = objname+no;
var title = document.all.item_name.value + ":" + document.all.item_desc.value;
var evaluactionId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;
//var addButton = window.opener.document.getElementById(nametmp + "_additem");
var tdObj = window.opener.document.createElement("<td id='"+nextObj+"_td' align='center'></td>");
var levObj = window.opener.document.createElement("<td id='"+nextObj+"_lev_td' align='center'></td>");
var checkboxTd1 = window.opener.document.createElement("<td id='row1_"+nextObj+"_checkboxes' align='center' width='18%' bgcolor='#FFFFFF'></td>");
var checkboxTd2 = window.opener.document.createElement("<td id='row2_"+nextObj+"_checkboxes' align='center' width='18%' bgcolor='#FFFFFF'></td>");
var inputObj = window.opener.document.createElement("<input name='"+nextObj+"_input' type='hidden' id='"+nextObj+"_input' value=''>");
var textObj = window.opener.document.createElement("<span id='"+nextObj+"_text'></span>");
var descInput = window.opener.document.createElement("<input name='"+nextObj+"_desc' type='hidden' id='"+nextObj+"_desc' value=''>");
var descText = window.opener.document.createElement("<span id='"+nextObj+"_descText'></span>");
var scoreInput = window.opener.document.createElement("<input name='"+nextObj+"_score' type='hidden' id='"+nextObj+"_score' value=''>");
var scoreText = window.opener.document.createElement("<span id='"+nextObj+"_scoreText'></span>");
var courseInput = window.opener.document.createElement("<input name='"+nextObj+"_course' type='hidden' id='"+nextObj+"_course' value=''>");
var courseidInput = window.opener.document.createElement("<input name='"+nextObj+"_courseid' type='hidden' id='"+nextObj+"_courseid' value=''>");
var orderNo = window.opener.document.createElement("<input name='"+nextObj+"_no' type='hidden' id='"+nextObj+"_no' value='"+nextno+"'>");
var linkTable = "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'><tr id='"+nextObj+"_item_link'><td id='"+nextObj+"_add_td' align='center'><a id='"+nextObj+"_add_link' href=javascript:add_lev('"+nextObj+"');>新增等级</a></td><td id='"+nextObj+"_modify_td' align='center'><a id='"+nextObj+"_modify_link' href=javascript:modify_item('"+nextObj+"');>修改</a></td><td id='"+nextObj+"_del_td' align='center'><a id='"+nextObj+"_del_link' href=javascript:del_item('"+nextObj+"');>删除</a></td></tr></table>";
var name = document.all.item_name.value;
var path = "teachWorkManage.prTeachEvaluate.prEvlItemAdd.do?";

if (isNaN(document.all.item_score.value)) {
   alert("请输入数字类型的项目分数！");
   return;
} else if(parseInt(document.all.item_score.value)<0) {
   alert("项目分数不能小于0，请重新输入！");
   return;
}


if (objname == 'tutorship') {
   courseInput.value = '辅导';
   courseidInput.value = '12';
   courseType = '12';
} else {
   courseInput.value = '互动式';
   courseidInput.value = '16';
   courseType = '16';
}

window.opener.document.getElementById(nametmp + "_td").insertAdjacentElement("afterEnd", tdObj);
window.opener.document.getElementById(nametmp + "_lev_td").insertAdjacentElement("afterEnd", levObj);
window.opener.document.getElementById("row1_" + nametmp + "_checkboxes").insertAdjacentElement("afterEnd", checkboxTd1);
window.opener.document.getElementById("row2_" + nametmp + "_checkboxes").insertAdjacentElement("afterEnd", checkboxTd2);

tdObj.bgColor = "#FFFFFF";
tdObj.width = "18%";
tdObj.align = "center";
levObj.bgColor = "#FFFFFF";
levObj.align = "center";
tdObj.insertAdjacentElement("beforeEnd", inputObj);
tdObj.insertAdjacentElement("beforeEnd", textObj);
tdObj.insertAdjacentElement("beforeEnd", descInput);
tdObj.insertAdjacentElement("beforeEnd", descText);
tdObj.insertAdjacentElement("beforeEnd", scoreInput);
tdObj.insertAdjacentElement("beforeEnd", scoreText);
tdObj.insertAdjacentElement("beforeEnd", orderNo);
tdObj.insertAdjacentElement("beforeEnd", courseInput);
tdObj.insertAdjacentElement("beforeEnd", courseidInput);
tdObj.insertAdjacentHTML("beforeEnd", linkTable);

if (name.length <= 6) {
   for (var i=0;i < name.length;i++) {
      name_tmp = name_tmp + name.substr(i,1) + " ";
   }
   textObj.innerHTML = name_tmp + "<br>";
}
if (name.length > 8) {
   textObj.innerHTML = name.substring(0,Math.floor(name.length/2)) + "<br>" + name.substring(Math.floor(name.length/2),name.length) + "<br>";
}
inputObj.value = document.all.item_name.value;
if (document.all.item_desc.value != "") {
   descInput.value = document.all.item_desc.value;
   descText.innerHTML = document.all.item_desc.value + "<br>";
}
scoreText.innerHTML = "(" + document.all.item_score.value + ")<br>";
scoreInput.value = document.all.item_score.value;

}

function getItemLen(objname) {

var len=1;
var itemname=objname+"1_td";

while (window.opener.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname+len+"_td";
}
len = len-1;

return len;

}

var opentime = 0;
function dispModes() {
   var x = window.screenLeft + 255;
   var y = window.screenTop - 32;
   
   if (opentime == 0) {
      modeWindow = window.open("educatingMode.html","mode_window","width=500,height=155");
      modeWindow.moveTo(x,y);
	  opentime++;
   }
}
</script>
</head>

<body>
<table width="200" height="50" align="center">
<form id="addform" method="post" action="teachWorkManage.prTeachEvaluate.prEvlItemAdd.do">
<tr>
  <td width="36%" height="100%" align="center">项目名称
    <input type="text" id="item_name" value=""/>
    <html:hidden property="EvaluateItems/EvaluationID" />
    <html:hidden property="EvaluateItems/Title" />
    <html:hidden property="EvaluateItems/OrderNO" />
    <html:hidden property="EvaluateItems/CourseType" />
  </td>
</tr>
<tr>
  <td align="center">项目描述 
    <input type="text" id="item_desc" maxlength="50" value=""/></td>
  </tr>
<tr>
  <td align="center">项目总分 <html:text property="EvaluateItems/Score"/></td>
  </tr>
<tr>
  <td align="center" colspan="2"><input type="button" class="button_02" value="新增" onclick="submit_form();">
    &nbsp;<input type="button" class="button_02" value="完成" onclick="window.close();">
    <IFRAME id="addframe" src="" style="display: none;"></IFRAME></td>
  </tr>
<tr>
  <td colspan="2" align="center"></td>
</tr>
</form>
</table>
</body>