<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改评估项目</title>
</head>

<body>
<input type="hidden" id="itemId" value="">
<input type="hidden" id="oldname" value="">
<input type="hidden" id="oldText" value="">
<input type="hidden" id="oldscore" value="">
<input type="hidden" id="oldscoreText" value="">
<input type="hidden" id="oldcourse" value="">
<input type="hidden" id="oldcourseid" value="">
<table width="50px" height="50px" align="center">
<tr>
  <td align="center">项目名称<input type="text" id="item_name" maxlength="50" value=""/></td>
</tr>
<tr>
  <td align="center">适用课程
    <input type="text" id="item_course" value="全部" READONLY/>
    <input type="hidden" id="item_courseid" value=""/>
  </td>
  </tr>
<!--<tr>
  <td align="center">项目总分<input type="text" id="item_score" value=""/></td>
</tr>-->
<tr>
  <td id="ordertd" align="center">排列顺序
    <select id="orderno" style="width:150px" onChange="modify_order()">
    </select>
    </td>
</tr>
<tr>
  <td align="center">
    <input type="button" class="button_02" value="修改" onclick="submit_modify();">&nbsp;
    <input type="button" class="button_02" value="还原" onclick="returnData();">&nbsp;
	<input type="button" class="button_02" value="完成" onclick="window.close();">
	<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
	</td>
</tr>
</table>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-100;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);


textObj=window.opener.document.getElementById(objname + "_text");
inputObj=window.opener.document.getElementById(objname);
courseInput=window.opener.document.getElementById(objname + "_course");
courseidInput=window.opener.document.getElementById(objname + "_courseid");

window.moveTo(x,y);

//保存原始数据
saveOldData();
addOrderNo(objname);

/*
方法定义
*/

//保存原始数据
function saveOldData() {
document.all.itemId.value=window.opener.document.getElementById(objname + "_Id").value;
document.all.oldname.value = inputObj.value;
document.all.item_name.value = inputObj.value;
document.all.oldText.value = textObj.innerHTML;
document.all.oldcourse.value = courseInput.value;
document.all.item_course.value = courseInput.value;
document.all.oldcourseid.value = courseidInput.value;
}

//还原数据
function returnData() {

var now = new Date();
var path = "teachWorkManage.prTeachEvaluate.prEvlItemModify.do?";

//提交还原数据到系统
path = path + "nowtime=" + now.toUTCString() + "&EvaluateItems/ItemID="+document.all.itemId.value+"&EvaluateItems/Title="+document.all.oldname.value;
document.getElementById("modifyframe").src = path;

document.all.item_name.value = document.all.oldname.value;
window.opener.document.getElementById(objname + "_text").innerHTML = document.all.oldText.value;
window.opener.document.getElementById(objname).value = document.all.oldname.value;
window.opener.document.getElementById(objname + "_course").value = document.all.oldcourse.value;
window.opener.document.getElementById(objname + "_courseid").value = document.all.oldcourseid.value;

}

//提交修改数据
function submit_modify() {
var path = "teachWorkManage.prTeachEvaluate.prEvlItemModify.do?";
var name = document.all.item_name.value;
var now = new Date();
var name_tmp = "";

//检查输入
/*if (isNaN(document.all.item_score.value)) {
   alert("请输入数字类型的项目分数！");
   return;
} else if(parseInt(document.all.item_score.value)<0) {
   alert("项目分数不能小于0，请重新输入！");
   return;
}*/

//提交还原数据到系统
path = path + "nowtime=" + now.toUTCString() + "&EvaluateItems/ItemID="+document.all.itemId.value+"&EvaluateItems/Title="+name;
document.getElementById("modifyframe").src = path;

if (name.length < 6) { //排版项目名称，小于六个中文字时每字用‘ ’相隔
   for (var i=0;i < name.length;i++) {
      name_tmp = name_tmp + name.substr(i,1) + " ";
   }
   window.opener.document.getElementById(objname + "_text").innerHTML = name_tmp + "<br>";
}
if (name.length > 8) { //排版项目名称，大于八个中文字时分行显示
   window.opener.document.getElementById(objname + "_text").innerHTML = name.substring(0,Math.floor(name.length/2)) + "<br>" + name.substring(Math.floor(name.length/2),name.length) + "<br>";
} else {
   window.opener.document.getElementById(objname + "_text").innerHTML = document.all.item_name.value;
}
window.opener.document.getElementById(objname).value = document.all.item_name.value;
window.opener.document.getElementById(objname + "_course").value = document.all.item_course.value;
window.opener.document.getElementById(objname + "_courseid").value = document.all.item_courseid.value;
}

function modify_order() {

var j=1;
var now = new Date();
var itemLen = getItemLen(objname.substr(0,objname.length-1));
var oldorderno = window.opener.document.getElementById(objname+"_no").value;
var oSelect = document.getElementById("orderno");
var selectNo = oSelect.options[oSelect.selectedIndex].value;

if (parseInt(selectNo) != parseInt(oldorderno)) { 

if (parseInt(oldorderno) < parseInt(selectNo)) {
while (parseInt(selectNo) != parseInt(oldorderno)) {

var oldtd = window.opener.document.getElementById(objname+"_tr");

var nextno = parseInt(oldorderno) + 1;
var newid = getOrderObj(nextno);
var newtd = window.opener.document.getElementById(newid+"_tr");
var neworderno = window.opener.document.getElementById(newid+"_no").value;

window.opener.document.getElementById(objname+"_tr").replaceNode(newtd.cloneNode(true));

newtd.replaceNode(oldtd.cloneNode(true));

window.opener.document.getElementById(objname+"_no").value = neworderno;
window.opener.document.getElementById(newid+"_no").value = oldorderno;

oldorderno++;

}
} else {

while (parseInt(selectNo) != parseInt(oldorderno)) {
var oldtd = window.opener.document.getElementById(objname+"_tr");

var lastno = parseInt(oldorderno) - 1;
var newid = getOrderObj(lastno);
var newtd = window.opener.document.getElementById(newid+"_tr");
var neworderno = window.opener.document.getElementById(newid+"_no").value;

window.opener.document.getElementById(objname+"_tr").replaceNode(newtd.cloneNode(true));

newtd.replaceNode(oldtd.cloneNode(true));

window.opener.document.getElementById(newid+"_no").value = oldorderno;
window.opener.document.getElementById(objname+"_no").value = neworderno;

oldorderno--;

} } } 

var path = "teachWorkManage.prTeachEvaluate.prItemOrderModify.do?nowtime=" + now.toUTCString();

for (var i=1;i<=itemLen;i++) {
   var itemId = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i+"_Id").value;
   var orderNo = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i+"_no").value;
   //alert(itemId + ":" + orderNo);
   
   path = path + "&evlItemList/EvaluateItems"+i+"/ItemID="+itemId+"&evlItemList/EvaluateItems"+i+"/OrderNO="+orderNo;
}
path = path + "&promptWord=评估项目顺序修改成功！";
document.getElementById("modifyframe").src = path;

}

function addOrderNo(objname) {

//2010-5-26更改
if(objname.length == 15){
	var tmpname = objname.substr(0,objname.length-1);
}else{
	var tmpname = objname.substr(0,objname.length-2);
}
/////
var len=getItemLen(tmpname);
var oSelect=document.getElementById("orderno");
var oldorderno = window.opener.document.getElementById(objname+"_no").value;

for (var i=1;i<=len;i++) {
   var oOption = document.createElement("option");
   oSelect.options.add(oOption);
   oOption.innerText = i;
   oOption.value = i;
   if (parseInt(i) == parseInt(oldorderno)) {
      oOption.selected = true;
   }
}

}

function getItemLen(objname) {

var len=1;
var itemname=objname+"1_tr";

while (window.opener.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname+len+"_tr";
}
len = len-1;

return len;

}

function getOrderObj(orderno) {
   var orderbt=objname.substr(0,objname.length-1) + "1_no";
   var objid = "";
   var i=1;
   
   while (window.opener.document.getElementById(orderbt)!=null) {
      if (window.opener.document.getElementById(orderbt).value==orderno) {
	     tmpid = window.opener.document.getElementById(orderbt).parentElement;
	     while (tmpid.tagName!="TR" || tmpid.id.indexOf("_tr")<0) { 
	        tmpid = tmpid.parentElement;
		 }
		 tmpid = tmpid.id;
	     objid = tmpid.substring(0,tmpid.indexOf("_tr"));
		 break;
	  }
	  i++;
	  orderbt = objname.substr(0,objname.length-1) + i + "_no";
   }
   
   return objid;
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
</body>
</html>