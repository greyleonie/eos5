<%@include file="/internet/common.jsp"%>
<title>����������Ŀ�ȼ�</title>
</head>

<body>
<table width="200" height="50px" align="center">
<form id="addform" method="post" action="">
<tr>
  <td colspan="2" height="10" align="center"></td>
</tr>
<tr>
  <td width="50%" height="100%" align="center">�ȼ�����<html:text property="EvaluateItemScore/LevelName" maxlength="5"/></td>
</tr>
<!--<tr>
  <td align="center">�ȼ�����<input type="text" id="lev_score" value=""/></td>
  </tr>-->
<tr>
  <td align="center"><input type="button" class="button_02" value="����" onclick="submit_form();">
    &nbsp;<input type="button" class="button_02" value="���" onclick="window.close();">
    <html:hidden property="EvaluateItemScore/OrderNO" />
    <html:hidden property="EvaluateItems/ItemID" />
    <html:hidden property="EvaluateItems/EvaluationID" />
    <html:hidden property="EvaluateItems/where" value="CourseType IS NULL"/></td>
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
var y = screenH/2-15;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

window.moveTo(x,y);
/*
��������
*/

//�ύ�����ȼ�
function submit_form() {

//var itemscore = window.opener.document.getElementById(objname +"_score").value;
//var levscore = document.all["EvaluateItemScore/Score"].value;
var evaluactionId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;
var no = getLevLen(objname);
var nextno = no + 1;

//�������
/*if (isNaN(levscore)) {
   alert("�������������͵ĵȼ�������");
   return;
} else if(parseInt(levscore)<0) {
   alert("�ȼ���������С��0�����������룡");
   return;
} else if (parseInt(levscore) > parseInt(itemscore)) {
   alert("�ȼ��������ܴ�����Ŀ���������޸ģ�");
   return;
}*/
document.all["EvaluateItems/EvaluationID"].value = evaluactionId;
document.all["EvaluateItemScore/OrderNO"].value = nextno;

document.forms[0].action = window.opener.document.all["courseLevAction"].value;
document.forms[0].target = window.opener.name;
document.forms[0].submit();

}

//�ύ�����ȼ�
function lev_add() {
var tmpText = "";
var len = getItemLen(objname);
var no = getLevLen(objname);
var nextno = no + 1;
var levname = document.all.lev_name.value;
var levTd = window.opener.document.getElementById(objname+"_lev"+no+"_td");
var nextTd = window.opener.document.createElement("<td id='"+objname+"_lev"+nextno+"_td' width='10%' align='center' bgcolor='#FFFFFF'>");
var levTable = "<table id='"+objname+"_lev"+nextno+"_tb' width='100%' height='100%' border='0' align='center' cellpadding='1' cellspacing='1'><tr valign='middle'><td colspan='2' align='center'><input type='hidden' id='"+objname+"_lev"+nextno+"' value='' /><input type='hidden' id='"+objname+"_lev"+nextno+"_no' value='"+nextno+"' /><span id='"+objname+"_lev"+nextno+"_text'></span></td></tr><tr valign='bottom'><td width='50%' height='30%' align='center'><a id='"+objname+"_lev"+nextno+"_dellink' href=javascript:del_lev('"+objname+"_lev"+nextno+"'); class='STYLE11'>ɾ</a></td><td width='50%' height='30%' align='center'><a  id='"+objname+"_lev"+nextno+"_fixlink' href=javascript:modify_lev('"+objname+"_lev"+nextno+"'); class='STYLE11'>��</a></td></tr></table>";

//�������
/*if (isNaN(levscore)) {
   alert("�������������͵ĵȼ�������");
   return;
} else if(parseInt(levscore)<0) {
   alert("�ȼ���������С��0�����������룡");
   return;
} else if (parseInt(levscore) > parseInt(itemscore)) {
   alert("�ȼ��������ܴ�����Ŀ���������޸ģ�");
   return;
}*/

   levTd.insertAdjacentElement("afterEnd", nextTd);
   nextTd.insertAdjacentHTML("afterBegin", levTable);
   for (var i=1;i<=len;i++) {
	  var tmpObj = window.opener.document.getElementById(objname + "_item" + i + "_tr");
      var cellObj = tmpObj.insertCell(tmpObj.cells.length-1);
	  cellObj.bgColor="#FFFFFF";
	  cellObj.width="10%";
	  cellObj.align="center";
	  cellObj.valign="middle";
   }
   for (var i=0;i<levname.length;i++) {
      tmpText += levname.substr(i, 1) + "<br>"; 
   }
   window.opener.document.getElementById(objname+"_lev"+nextno+"_text").innerHTML = tmpText;
   window.opener.document.getElementById(objname+"_lev"+nextno).value = levname;
   //scoreText.innerHTML = "(" + levscore + ")";
   //scoreInput.value = levscore;

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

function getLastLev(objname) {

var len = getLevLen(objname);
var levname = "";
var lastLev;

for (var i=1;i<=len;i++) {
   var tmpname = objname+"_lev"+len+"_no";
   if (window.opener.document.getElementById(tmpname).value == len) {
      levname = tmpname;
      break;
   }
}
var tmpid = window.opener.document.getElementById(levname).parentElement;
while (tmpid.tagName!="TD" || tmpid.id.indexOf("_td")<0) { 
	tmpid = tmpid.parentElement;
}
lastLev = tmpid;

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
</script>
</body>
</html>