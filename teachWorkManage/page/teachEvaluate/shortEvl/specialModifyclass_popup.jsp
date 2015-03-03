<%@include file="/internet/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改评估类型</title>
</head>

<body>
<table width="50px" height="50px" align="center">
<tr>
  <td align="center">适用课程
    <input type="text" id="item_course" value="" READONLY/>
    <input type="button" name="popup" value="选课程" onClick="dispModes();"/>
    <input type="hidden" id="item_courseid" value=""/>
    <input type="hidden" id="selected_course" value=""/>
  </td>
  </tr>
<tr>
  <td align="center">
    <input type="button" class="button_02" value="修改" onclick="submit_modify();">&nbsp;
    <input type="button" class="button_02" value="还原" onclick="returnData();">&nbsp;
	<input type="button" class="button_02" value="完成" onclick="window.close();">
    <input type="hidden" id="itemId" value="">
	<input type="hidden" id="oldcourse" value="">
	<input type="hidden" id="oldcourseid" value="">
	<input type="hidden" id="oldcourseText" value="">
	<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
	</td>
</tr>
</table>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-50;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

objId=window.opener.document.getElementById(objname + "_itemId");
inputObj=window.opener.document.getElementById(objname);
textObj=window.opener.document.getElementById(objname + "_text");
courseid=window.opener.document.getElementById(objname + "_id");

window.moveTo(x,y);

//保存原始数据
saveOldData();
getCourses();

/*
方法定义
*/

//保存原始数据
function saveOldData() {
document.all.itemId.value = objId.value;
document.all.oldcourse.value = inputObj.value;
document.all.oldcourseid.value = courseid.value;
document.all.oldcourseText.value = textObj.innerHTML;

document.all.item_course.value = inputObj.value;
}

//还原数据
function returnData() {
var now = new Date();
var path = "teachWorkManage.prTeachEvaluate.prEvlItemModify.do?";
var oldcourseid = document.all.oldcourseid.value;

//提交还原数据到系统
path = path + "nowtime=" + now.toUTCString() + "&EvaluateItems/ItemID="+document.all.itemId.value+"&EvaluateItems/CourseType="+oldcourseid;
document.getElementById("modifyframe").src = path;

document.all.item_course.value = document.all.oldcourse.value;
window.opener.document.getElementById(objname + "_text").innerHTML = document.all.oldcourseText.value;
window.opener.document.getElementById(objname).value = document.all.oldcourse.value;
window.opener.document.getElementById(objname + "_id").value = document.all.oldcourseid.value;

}

//提交修改数据
function submit_modify() {
var now = new Date();
var path = "teachWorkManage.prTeachEvaluate.prEvlItemModify.do?";
var courseid = document.all.item_courseid.value;

//提交还原数据到系统
path = path + "nowtime=" + now.toUTCString() + "&EvaluateItems/ItemID="+document.all.itemId.value+"&EvaluateItems/CourseType="+courseid;
document.getElementById("modifyframe").src = path;

window.opener.document.getElementById(objname).value = document.all.item_course.value;
window.opener.document.getElementById(objname+"_id").value = document.all.item_courseid.value;
window.opener.document.getElementById(objname+"_text").innerHTML = document.all.item_course.value + "：";

}

var opentime = 0;
function dispModes() {
   var modex = x;
   var modey = y + 160;
   
   if (opentime == 0) {
      modeWindow = window.open("teachWorkManage.prTeachEvaluate.prEduModeView.do?count=one","mode_window","width=500,height=155");
      modeWindow.moveTo(modex,modey);
	  opentime++;
   }
}

function getCourses() {
var len=1;
var itemname=objname.substr(0,objname.length-1) + "1_id";
var str="";

while (window.opener.document.getElementById(itemname)!=null) {
   //alert(window.opener.document.getElementById(itemname).value);
   if (window.opener.document.getElementById(itemname).value != window.opener.document.getElementById(objname+"_id").value) {
      str = str + window.opener.document.getElementById(itemname).value + ",";
   }
   len = len+1;
   itemname=objname.substr(0,objname.length-1) + len + "_id";
}
//alert(str.substr(0,str.length-1));
document.getElementById("selected_course").value = str.substr(0,str.length-1);

}
</script>
</body>