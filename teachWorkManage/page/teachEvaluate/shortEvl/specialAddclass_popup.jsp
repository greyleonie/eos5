<%@include file="/internet/common.jsp"%>
<title>������������</title>
<script language="javascript">
//init
var screenW = screen.width;
var screenH = screen.height;
var x = screenW/2-100;
var y = screenH/2-95;
var param=window.location.search;
var objname=param.substring(param.indexOf("objname")+8,param.length);

window.moveTo(x,y);

/*
��������
*/

//�ύ������Ŀ
function submit_form() {
var no = getClassLen(objname);
var nextno = no + 1;
var title = document.all.item_name.value;
var evaluactionId = window.opener.document.getElementsByName("Evaluation/EvaluationID")[0].value;
var courseid = document.all.item_courseid.value;

/*if (isNaN(document.all.item_score.value)) {
   alert("�������������͵���Ŀ������");
   return;
} else if(parseInt(document.all.item_score.value)<0) {
   alert("��Ŀ��������С��0�����������룡");
   return;
}*/

document.all["EvaluateItems/EvaluationID"].value=evaluactionId;
document.all["EvaluateItems/OrderNO"].value=nextno;
document.all["EvaluateItems/CourseType"].value=courseid;

//alert(window.opener.name);
document.forms[0].action = window.opener.document.all["spcItemAction"].value;
document.forms[0].target = window.opener.name;
document.forms[0].submit();

}

//�ύ������Ŀ
function item_add() {
var no = getClassLen(objname);
var nextno = no + 1;
var nextObj = objname + nextno;
var nametmp = objname + no;
var trObj = window.opener.document.getElementById("special").insertRow();
var tdObj = window.opener.document.createElement("<td width='30%' bgcolor='#FFFFFF'></td>");
var tableHtml = "<input type='hidden' name='"+nextObj+"' value='' /><input type='hidden' name='"+nextObj+"_id' value='' /><span id='"+nextObj+"_text'></span><br /><span id='"+nextObj+"_topic'></span><br /><table width='100%'><tr><td id='"+nextObj+"_teacher' colspan='3' align='right'></td><tr><td align='center'><a href=javascript:del_class('"+nextObj+"'); class='STYLE11'>ɾ������</a></td><td align='center'><a href=javascript:modify_class('"+nextObj+"'); class='STYLE11'>�޸�����</a></td><td align='center'><a href=javascript:add_specialLev('"+nextObj+"'); class='STYLE11'>�����ȼ�</a></td></tr></table>";
var levTd = window.opener.document.createElement("<td id='"+nextObj+"_lev' width='20%' align='center' valign='middle' bgcolor='#FFFFFF'></td>");
var levTable = "<table id='"+nextObj+"_lev_tb' width='90%' border='0' cellspacing='3' cellpadding='0'></table>";
var suggestObj=window.opener.document.createElement("<td width='50%' align='center' valign='middle' bgcolor='#FFFFFF'>&nbsp;</td>");
var name = document.all.item_name.value;

trObj.id = nextObj+"_tr";
trObj.insertAdjacentElement("beforeEnd", tdObj);
tdObj.insertAdjacentHTML("beforeEnd", tableHtml);
tdObj.insertAdjacentElement("afterEnd", levTd);
levTd.insertAdjacentHTML("beforeEnd", levTable);
levTd.insertAdjacentElement("afterEnd", suggestObj);

window.opener.document.getElementById(nextObj).value = document.all.item_course.value;
window.opener.document.getElementById(nextObj+"_id").value = document.all.item_courseid.value;
window.opener.document.getElementById(nextObj+"_text").innerHTML = document.all.item_course.value + "��";
window.opener.document.getElementById(nextObj+"_topic").innerHTML = document.all.item_name.value;
window.opener.document.getElementById(nextObj+"_teacher").innerHTML = document.all.item_teacher.value;

}

function getClassLen(objname) {

var len=1;
var itemname=objname + "1_tr";

while (window.opener.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname + len + "_tr";
}
len = len-1;

return len;

}

var opentime = 0;
function dispModes() {
   var modex = x;
   var modey = y + 230;
   
   if (opentime == 0) {
      modeWindow = window.open("teachWorkManage.prTeachEvaluate.prEduModeView.do?count=one","mode_window","width=500,height=155");
      modeWindow.moveTo(modex,modey);
	  opentime++;
   }
}

function getCourses() {
var len=1;
var itemname=objname + "1_id";
var str="";

while (window.opener.document.getElementById(itemname)!=null) {
   //alert(window.opener.document.getElementById(itemname).value);
   str = str + window.opener.document.getElementById(itemname).value + ",";
   len = len+1;
   itemname=objname + len + "_id";
}
document.getElementById("selected_course").value = str.substr(0,str.length-1);
//alert(document.getElementById("selected_course").value);

}
</script>

<body>
<table width="200" height="80" align="center">
<form id="addform" method="post" action="">
<tr>
  <td align="center">���ÿγ�
    <input type="text" id="item_course" value="" READONLY/>
	<input type="button" name="popup" value="ѡ�γ�" onClick="dispModes();"/>
    <input type="hidden" id="item_courseid" value=""/>
    <input type="hidden" id="selected_course" value=""/>
    <html:hidden property="EvaluateItems/EvaluationID" />
    <html:hidden property="EvaluateItems/Title" value="�������"/>
    <html:hidden property="EvaluateItems/OrderNO" />
    <html:hidden property="EvaluateItems/CourseType" />
  </td>
  </tr>
<tr>
  <td width="36%" height="100%" align="center">ר������
    <input type="text" id="item_name" value="**********" READONLY/></td>
</tr>
<tr>
  <td width="36%" height="100%" align="center">��ʦ����
    <input type="text" id="item_teacher" value="ĳĳ�쵼" READONLY/></td>
</tr>
<!--<tr>
  <td align="center">��Ŀ�ܷ� <input type="text" id="item_score" value=""/></td>
  </tr>-->
<tr>
  <td align="center" colspan="2"><input type="button" class="button_02" value="����" onclick="submit_form();">
    &nbsp;<input type="button" class="button_02" value="���" onclick="window.close();">
    <IFRAME id="addframe" src="" style="display: none;"></IFRAME></td>
  </tr>
</form>
</table>
<script language="javascript">
getCourses();
</script>
</body>