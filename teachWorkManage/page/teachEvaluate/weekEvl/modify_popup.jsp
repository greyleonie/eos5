<%@include file="/internet/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸�������Ŀ</title>
</head>

<body>
<input type="hidden" id="itemId" value="">
<input type="hidden" id="oldname" value="">
<input type="hidden" id="oldText" value="">
<input type="hidden" id="olddesc" value="">
<input type="hidden" id="olddescText" value="">
<input type="hidden" id="oldscore" value="">
<input type="hidden" id="oldscoreText" value="">
<table width="50px" height="50px" align="center">
<tr>
  <td align="center">��Ŀ����<input type="text" id="item_name" value=""/></td>
</tr>
<tr>
  <td align="center">��Ŀ����<input type="text" id="item_desc" value=""/></td>
</tr>
<tr>
  <td align="center">��Ŀ�ܷ�<input type="text" id="item_score" value=""/></td>
</tr>
<tr>
  <td id="ordertd" align="center">����˳��
    <select id="orderno" style="width:150px" onChange="modify_order()">
    </select>
    </td>
</tr>
<tr>
  <td align="center">
    <input type="button" class="button_02" value="�޸�" onclick="submit_modify();">&nbsp;
    <input type="button" class="button_02" value="��ԭ" onclick="returnData();">&nbsp;
	<input type="button" class="button_02" value="���" onclick="window.close();">
	<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
	</td>
</tr>
</table>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-125;
var y = screenH/2-145;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

objId=window.opener.document.getElementById(objname + "_itemId");
textObj=window.opener.document.getElementById(objname + "_text");
inputObj=window.opener.document.getElementById(objname + "_input");
descInput=window.opener.document.getElementById(objname + "_desc");
descText=window.opener.document.getElementById(objname + "_descText");
scoreText=window.opener.document.getElementById(objname + "_scoreText");
scoreInput=window.opener.document.getElementById(objname + "_score");
courseidInput=window.opener.document.getElementById(objname + "_courseid");

window.moveTo(x,y);

//����ԭʼ����
saveOldData();
addOrderNo(objname);

/*
��������
*/

//����ԭʼ����
function saveOldData() {
document.all.itemId.value = objId.value;
document.all.oldname.value = inputObj.value;
document.all.item_name.value = inputObj.value;
document.all.oldText.value = textObj.innerHTML;
if (descInput.value != '') {
   document.all.olddesc.value = descInput.value;
   document.all.item_desc.value = descInput.value;
   document.all.olddescText.value = descText.innerHTML;
}
document.all.oldscore.value = scoreInput.value;
document.all.item_score.value = scoreInput.value;
document.all.oldscoreText.value = scoreText.innerHTML;
}

//��ԭ����
function returnData() {
var now = new Date();
var path = "teachWorkManage.prTeachEvaluate.prEvlItemModify.do?";
var title = document.all.oldname.value + ":" + document.all.olddesc.value;

//�ύ��ԭ���ݵ�ϵͳ
path = path + "nowtime=" + now.toUTCString() + "&EvaluateItems/ItemID="+document.all.itemId.value+"&EvaluateItems/Title="+title+"&EvaluateItems/Score="+document.all.oldscore.value;
document.getElementById("modifyframe").src = path;

document.all.item_name.value = document.all.oldname.value;
document.all.item_desc.value = document.all.olddesc.value;
document.all.item_score.value = document.all.oldscore.value;
window.opener.document.getElementById(objname + "_text").innerHTML = document.all.oldText.value;
window.opener.document.getElementById(objname + "_input").value = document.all.oldname.value;
if (descInput.value != '') {
   window.opener.document.getElementById(objname + "_desc").value = document.all.olddesc.value;
   window.opener.document.getElementById(objname + "_descText").innerHTML = document.all.olddescText.value;
}
window.opener.document.getElementById(objname + "_scoreText").innerHTML = document.all.oldscoreText.value;
window.opener.document.getElementById(objname + "_score").value = document.all.oldscore.value;
}

//�ύ�޸�����
function submit_modify() {
var path = "teachWorkManage.prTeachEvaluate.prEvlItemModify.do?";
var name = document.all.item_name.value;
var name_tmp = "";
var now = new Date();
var title = document.all.item_name.value + ":" + document.all.item_desc.value;

//�������
if (title.length>150) {
   alert("��Ŀ���ƺ��������������ܳ��Ȳ��ܳ���150��");
   return false;
}
if (isNaN(document.all.item_score.value)) {
   alert("�������������͵���Ŀ������");
   return;
} else if(parseInt(document.all.item_score.value)<0) {
   alert("��Ŀ��������С��0�����������룡");
   return;
}

//�ύ�޸����ݵ�ϵͳ
path = path + "nowtime=" + now.toUTCString() + "&EvaluateItems/ItemID="+document.all.itemId.value+"&EvaluateItems/Title="+title+"&EvaluateItems/Score="+document.all.item_score.value;
document.getElementById("modifyframe").src = path;

if (name.length <= 6) { //�Ű���Ŀ���ƣ�С������������ʱÿ���á� �����
   for (var i=0;i < name.length;i++) {
      name_tmp = name_tmp + name.substr(i,1) + " ";
   }
   window.opener.document.getElementById(objname + "_text").innerHTML = name_tmp + "<br>";
}
if (name.length > 8) { //�Ű���Ŀ���ƣ����ڰ˸�������ʱ������ʾ
   window.opener.document.getElementById(objname + "_text").innerHTML = name.substring(0,Math.floor(name.length/2)) + "<br>" + name.substring(Math.floor(name.length/2),name.length) + "<br>";
}
window.opener.document.getElementById(objname + "_input").value = document.all.item_name.value;
if (document.all.item_desc.value != '') {
   window.opener.document.getElementById(objname + "_desc").value = document.all.item_desc.value;
   window.opener.document.getElementById(objname + "_descText").innerHTML = document.all.item_desc.value + "<br>";
}
window.opener.document.getElementById(objname + "_scoreText").innerHTML = "(" + document.all.item_score.value + ")<br>";
window.opener.document.getElementById(objname + "_score").value = document.all.item_score.value;

}

//����
function modify_order() {

var j=1;
var now = new Date();
var itemLen = getItemLen(objname);
var oldorderno = window.opener.document.getElementById(objname+"_no").value;
var oSelect = document.getElementById("orderno");
var selectNo = oSelect.options[oSelect.selectedIndex].value;

if (parseInt(selectNo) != parseInt(oldorderno)) { 

if (parseInt(oldorderno) < parseInt(selectNo)) {
while (parseInt(selectNo) != parseInt(oldorderno)) {

var oldtd = window.opener.document.getElementById(objname+"_td");
var oldlevtd = window.opener.document.getElementById(objname+"_lev_td");
var oldrow1td = window.opener.document.getElementById("row1_"+objname+"_checkboxes");
var oldrow2td = window.opener.document.getElementById("row2_"+objname+"_checkboxes");

var nextno = parseInt(oldorderno) + 1;
var newid = getOrderObj(nextno);
var newtd = window.opener.document.getElementById(newid+"_td");
var newlevtd = window.opener.document.getElementById(newid+"_lev_td");
var newrow1td = window.opener.document.getElementById("row1_"+newid+"_checkboxes");
var newrow2td = window.opener.document.getElementById("row2_"+newid+"_checkboxes");
var neworderno = window.opener.document.getElementById(newid+"_no").value;

window.opener.document.getElementById(objname+"_td").replaceNode(newtd.cloneNode(true));
window.opener.document.getElementById(objname+"_lev_td").replaceNode(newlevtd.cloneNode(true));
window.opener.document.getElementById("row1_"+objname+"_checkboxes").replaceNode(newrow1td.cloneNode(true));
window.opener.document.getElementById("row2_"+objname+"_checkboxes").replaceNode(newrow2td.cloneNode(true));

newtd.replaceNode(oldtd.cloneNode(true));
newlevtd.replaceNode(oldlevtd.cloneNode(true));
newrow1td.replaceNode(oldrow1td.cloneNode(true));
newrow2td.replaceNode(oldrow2td.cloneNode(true));

window.opener.document.getElementById(objname+"_no").value = neworderno;
window.opener.document.getElementById(newid+"_no").value = oldorderno;

oldorderno++;

}
} else {

while (parseInt(selectNo) != parseInt(oldorderno)) {
var oldtd = window.opener.document.getElementById(objname+"_td");
var oldlevtd = window.opener.document.getElementById(objname+"_lev_td");
var oldrow1td = window.opener.document.getElementById("row1_"+objname+"_checkboxes");
var oldrow2td = window.opener.document.getElementById("row2_"+objname+"_checkboxes");

var lastno = parseInt(oldorderno) - 1;
var newid = getOrderObj(lastno);
var newtd = window.opener.document.getElementById(newid+"_td");
var newlevtd = window.opener.document.getElementById(newid+"_lev_td");
var newrow1td = window.opener.document.getElementById("row1_"+newid+"_checkboxes");
var newrow2td = window.opener.document.getElementById("row2_"+newid+"_checkboxes");
var neworderno = window.opener.document.getElementById(newid+"_no").value;

window.opener.document.getElementById(objname+"_td").replaceNode(newtd.cloneNode(true));
window.opener.document.getElementById(objname+"_lev_td").replaceNode(newlevtd.cloneNode(true));
window.opener.document.getElementById("row1_"+objname+"_checkboxes").replaceNode(newrow1td.cloneNode(true));
window.opener.document.getElementById("row2_"+objname+"_checkboxes").replaceNode(newrow2td.cloneNode(true));

newtd.replaceNode(oldtd.cloneNode(true));
newlevtd.replaceNode(oldlevtd.cloneNode(true));
newrow1td.replaceNode(oldrow1td.cloneNode(true));
newrow2td.replaceNode(oldrow2td.cloneNode(true));

window.opener.document.getElementById(newid+"_no").value = oldorderno;
window.opener.document.getElementById(objname+"_no").value = neworderno;

oldorderno--;

} } } 

var path = "teachWorkManage.prTeachEvaluate.prItemOrderModify.do?nowtime=" + now.toUTCString();

for (var i=1;i<=itemLen;i++) {
   var itemId = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i+"_itemId").value;
   var orderNo = window.opener.document.getElementById(objname.substr(0,objname.length-1)+i+"_no").value;
   //alert(itemId + ":" + orderNo);
   
   path = path + "&evlItemList/EvaluateItems"+i+"/ItemID="+itemId+"&evlItemList/EvaluateItems"+i+"/OrderNO="+orderNo;
}
path = path + "&promptWord=������Ŀ˳���޸ĳɹ���";
document.getElementById("modifyframe").src = path;

}

function addOrderNo(objname) {

var len=getItemLen(objname);
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
//alert(objname.substr(0,objname.length-1)+"1_td");
var itemname=objname.substr(0,objname.length-1)+"1_td";

while (window.opener.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname.substr(0,objname.length-1)+len+"_td";
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
	     tmpid = window.opener.document.getElementById(orderbt).parentElement.id;
	     objid = tmpid.substring(0,tmpid.indexOf("_"));
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