<%@include file="/internet/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改评估项目等级</title>
</head>

<body>
<input name="oldlevinput" type="hidden" id="oldlevinput" value="">
<input name="oldlevtext" type="hidden" id="oldlevtext" value="">
<input name="levId" type="hidden" id="levId" value="">
<!--<input name="oldlevscore" type="hidden" id="oldlevscore" value="">-->
<table width="200" height="50px" align="center">
<tr>
  <td width="50%" height="100%" align="center">等级名称<input type="text" id="lev_name" maxlength="5" value=""/></td>
</tr>
<!--<tr>
  <td align="center">等级分数<input type="text" id="lev_score" value=""/></td>
  </tr>-->
<tr>
  <td id="ordertd" align="center">排列顺序
    <select id="orderno" style="width:150px" onChange="modify_order()">
    </select>
    </td>
</tr>
<tr>
  <td align="center"><input type="button" class="button_02" value="修改" onclick="lev_modify();">&nbsp;
  <input type="button" class="button_02" value="还原" onclick="returnData();">&nbsp;
  <input type="button" class="button_02" value="完成" onclick="window.close();">
  <IFRAME id="modifyframe" src="" style="display: none;"></IFRAME></td>
  </tr>
<tr>
  <td colspan="2" align="center"></td>
</tr>
</table>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-75;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);
var levinput = window.opener.document.getElementById(objname);
var levtext = window.opener.document.getElementById(objname + "_text");

saveOldData();
addOrderNo(objname);
window.moveTo(x,y);

/*
方法定义
*/

//保存原始数据
function saveOldData() {
   
   document.all.levId.value = window.opener.document.getElementById(objname + "_levId").value;
   document.all.oldlevinput.value = levinput.value;
   document.all.oldlevtext.value = levtext.innerHTML;
   document.all.lev_name.value = levinput.value;
   
}

//还原数据
function returnData() {

var now = new Date();
var path = "teachWorkManage.prTeachEvaluate.prModifyCourseLev.do?";
var evlId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;

//提交还原数据到系统
path = path + "nowtime=" + now.toUTCString()+"&EvaluateItemScore/EvaluationID="+evlId+"&EvaluateItemScore/LevelID="+document.all.levId.value+"&EvaluateItemScore/LevelName="+document.all.oldlevinput.value+"&EvaluateItemScore/oldLevName="+document.all.lev_name.value;
document.getElementById("modifyframe").src = path;

   document.all.lev_name.value = document.all.oldlevinput.value;
   window.opener.document.getElementById(objname).value = document.all.oldlevinput.value;
   window.opener.document.getElementById(objname + "_text").innerHTML = document.all.oldlevtext.value;

}

//修改等级
function lev_modify() {
   
   var tmpText = "";
   var now = new Date();
   var levname = document.all.lev_name.value;
   var evlId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;
   var path = "teachWorkManage.prTeachEvaluate.prModifyCourseLev.do?";
   
//检查输入
/*if (isNaN(document.all.lev_score.value)) {
   alert("请输入数字类型的等级分数！");
   return;
} else if(parseInt(document.all.lev_score.value)<0) {
   alert("等级分数不能小于0，请重新输入！");
   return;
} else if (parseInt(document.all.lev_score.value) > parseInt(itemscore)) {
   alert("等级分数不能大于项目分数，请修改！");
   return;
}*/

   //提交修改数据到系统
   path = path + "nowtime=" + now.toUTCString()+"&EvaluateItemScore/EvaluationID="+evlId+"&EvaluateItemScore/LevelID="+document.all.levId.value+"&EvaluateItemScore/LevelName="+document.all.lev_name.value+"&EvaluateItemScore/oldLevName="+document.all.oldlevinput.value;
   document.getElementById("modifyframe").src = path;
   
   for (var i=0;i<levname.length;i++) {
      tmpText += levname.substr(i, 1) + "<br>"; 
   }
   window.opener.document.getElementById(objname + "_text").innerHTML = tmpText;
   window.opener.document.getElementById(objname).value = document.all.lev_name.value;
   
}

function modify_order() {

var j=1;
var now = new Date();
var levlen = getLevLen(objname);
var oSelect = document.getElementById("orderno");
var selectNo = oSelect.options[oSelect.selectedIndex].value;
var oldorderno = window.opener.document.getElementById(objname+"_no").value;
var evlId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;
var path = "teachWorkManage.prTeachEvaluate.prFixCourseLevOrder.do?nowtime=" + now.toUTCString();

if (parseInt(selectNo) != parseInt(oldorderno)) { 

if (parseInt(oldorderno) < parseInt(selectNo)) {
while (parseInt(selectNo) != parseInt(oldorderno)) {

var oldtd = window.opener.document.getElementById(objname+"_td");

var nextno = parseInt(oldorderno) + 1;
var newid = getOrderObj(nextno);
var newtd = window.opener.document.getElementById(newid+"_td");
var neworderno = window.opener.document.getElementById(newid+"_no").value;

window.opener.document.getElementById(objname+"_td").replaceNode(newtd.cloneNode(true));

newtd.replaceNode(oldtd.cloneNode(true));

window.opener.document.getElementById(objname+"_no").value = neworderno;
window.opener.document.getElementById(newid+"_no").value = oldorderno;

oldorderno++;

}
} else {

while (parseInt(selectNo) != parseInt(oldorderno)) {
var oldtd = window.opener.document.getElementById(objname+"_td");

var lastno = parseInt(oldorderno) - 1;
var newid = getOrderObj(lastno);
var newtd = window.opener.document.getElementById(newid+"_td");
var neworderno = window.opener.document.getElementById(newid+"_no").value;

window.opener.document.getElementById(objname+"_td").replaceNode(newtd.cloneNode(true));

newtd.replaceNode(oldtd.cloneNode(true));

window.opener.document.getElementById(newid+"_no").value = oldorderno;
window.opener.document.getElementById(objname+"_no").value = neworderno;

oldorderno--;

} } }

for (var i=1;i<=levlen;i++) {
   var levId = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i+"_levId").value;
   var orderNo = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i+"_no").value;
   var name = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i).value;
   //alert(itemId + ":" + orderNo);
   
   path = path + "&evlLevList/EvaluateItemScore"+i+"]/EvaluationID="+evlId+"&evlLevList/EvaluateItemScore"+i+"]/LevelID="+levId+"&evlLevList/EvaluateItemScore"+i+"/OrderNO="+orderNo+"&evlLevList/EvaluateItemScore"+i+"/LevelName="+name;
}
document.getElementById("modifyframe").src = path;

}

function addOrderNo(objname) {

var tmpname = objname.substr(0,objname.length-1);
var len=getLevLen(tmpname);
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

function getLevLen(objname) {

var len=1;
var levname=objname.substring(0,objname.indexOf("_"))+"_lev1_td";

while (window.opener.document.getElementById(levname)!=null) {
   len = len+1;
   levname=objname.substring(0,objname.indexOf("_"))+"_lev"+len+"_td";
}
len = len-1;

return len;

}

function getOrderObj(orderno) {
   var orderbt=objname.substr(0,objname.length-1) + "1_no";
   var objid = "";
   var i=1;
   
   while (window.opener.document.getElementById(orderbt)) {
      if (window.opener.document.getElementById(orderbt).value==orderno) {
		 var tmpid = window.opener.document.getElementById(orderbt).parentElement;
         while (tmpid.tagName!="TD" || tmpid.id.indexOf("_td")<0) { 
	        tmpid = tmpid.parentElement;
         }
         tmpid = tmpid.id;
	     objid = tmpid.substring(0,tmpid.length-3);
		 break;
	  }
	  i++;
	  orderbt = objname.substr(0,objname.length-1) + i + "_no";
   }
   
   return objid;
}
</script>
</body>