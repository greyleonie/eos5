<%@include file="/internet/common.jsp"%>
<%
String oldversion = base.util.TalentContext.getValue(pageContext,null,"Evaluation/Version");
%>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "������κ";
	font-size: 16px;
}
.style2 {font-family: "����"}
.STYLE3 {
	font-family: "������";
	font-size: 18px;
	font-weight: bold;
}
.STYLE4 {
	font-family: "������";
	font-size: x-large;
	font-weight: bold;
}
.STYLE5 {
	font-family: "������";
	font-size: 16px;
}
.STYLE6 {
	font-family: "������";
	font-size: 16px;
	font-weight: bold;
}
.STYLE11 {font-size: 12px}
.noinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: none;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: block;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showversion {
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	
	.noversion {
	    DISPLAY: none;
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
-->
</style>
<script language="javascript">
function add_item(objname) {

var path = "teachWorkManage.prTeachEvaluate.prCourseItemAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=120");

}

function modify_item(objname) {
var path = "teachWorkManage.prTeachEvaluate.prCourseItemModify.do?objname=" + objname;
modifywindow = window.open(path,"modify_window","width=200,height=200");
}

function del_item(objname) {

var len = getItemLen(objname.substr(0,objname.indexOf("_")));
var no = objname.substr(objname.length-1,1);
var nextno = parseInt(no) + 1;
var nextObj = "allCourse_item" + nextno;
var now = new Date();

//�ύɾ����Ŀ
var path = "teachWorkManage.prTeachEvaluate.prEvlItemDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItems/ItemID="+document.all[objname+"_Id"].value;

if (confirm("ȷ��ɾ����ǰ��Ŀ��")) {
document.getElementById("modifyframe").src = path;

eval(objname + "_tr").removeNode(true);

if (document.getElementById(nextObj) != null) {
   for (var i=nextno;i<=len;i++) {
      var preno = i - 1;
      document.getElementById("allCourse_item"+i).id = "allCourse_item" + preno;
	  document.getElementById("allCourse_item"+i+"_tr").id = "allCourse_item" + preno + "_tr";
	  document.getElementById("allCourse_item"+i+"_td").id = "allCourse_item" + preno + "_td";
	  document.getElementById("allCourse_item"+i+"_text").id = "allCourse_item" + preno + "_text";
	  document.getElementById("allCourse_item"+i+"_no").value = parseInt(document.getElementById("allCourse_item" + i+"_no").value) - 1;
	  document.getElementById("allCourse_item"+i+"_no").id = "allCourse_item" + preno + "_no";
	  document.getElementById("allCourse_item"+i+"_course").id = "allCourse_item" + preno + "_course";
	  document.getElementById("allCourse_item"+i+"_courseid").id = "allCourse_item" + preno + "_courseid";
	  document.getElementById("allCourse_item"+i+"_dellink").href = "javascript:del_item('allCourse_item" + preno +"')";
	  document.getElementById("allCourse_item"+i+"_dellink").id = "allCourse_item" + preno + "_dellink";
	  document.getElementById("allCourse_item"+i+"_fixlink").href = "javascript:modify_item('allCourse_item" + preno +"')";
	  document.getElementById("allCourse_item"+i+"_fixlink").id = "allCourse_item" + preno + "_fixlink";
   }
}
}
}

function add_lev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prCourseLevAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=30");

}

function del_lev(objname) {

var len = getItemLen(objname.substr(0,objname.indexOf("_")));
var levlen = getLevLen(objname);
var no = objname.substr(objname.length-1,1);
var nextno = parseInt(no) + 1;
var nextObj = "allCourse_lev" + nextno;
var now = new Date();

//�ύɾ����Ŀ�ȼ�
var path = "teachWorkManage.prTeachEvaluate.prEvlLevDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItemScore/EvaluationID="+document.all["Evaluation/EvaluationID"].value+ "&EvaluateItemScore/LevelName="+document.all[objname].value;

if (confirm("ȷ��ɾ����ǰ�ȼ���")) {
document.getElementById("modifyframe").src = path;

document.getElementById(objname+"_td").removeNode(true);
for (var i=1;i<=len;i++) {
	var tmpObj = document.getElementById(objname.substring(0,objname.indexOf("_")) + "_item" + i + "_tr");
    tmpObj.deleteCell(objname.substr(objname.length-1,1));
}

if (document.getElementById(nextObj) != null) {
   for (var i=nextno;i<=levlen;i++) {
      var preno = i - 1;
      document.getElementById("allCourse_lev"+i).id = "allCourse_lev" + preno;
	  document.getElementById("allCourse_lev"+i+"_td").id = "allCourse_lev" + preno + "_td";
	  document.getElementById("allCourse_lev"+i+"_tb").id = "allCourse_lev" + preno + "_tb";
	  document.getElementById("allCourse_lev"+i+"_text").id = "allCourse_lev" + preno + "_text";
	  document.getElementById("allCourse_lev"+i+"_no").value = parseInt(document.getElementById("allCourse_lev" + i+"_no").value) - 1;
	  document.getElementById("allCourse_lev"+i+"_no").id = "allCourse_lev" + preno + "_no";
	  document.getElementById("allCourse_lev"+i+"_dellink").href = "javascript:del_lev('allCourse_lev" + preno +"')";
	  document.getElementById("allCourse_lev"+i+"_dellink").id = "allCourse_lev" + preno + "_dellink";
	  document.getElementById("allCourse_lev"+i+"_fixlink").href = "javascript:modify_lev('allCourse_lev" + preno +"')";
	  document.getElementById("allCourse_lev"+i+"_fixlink").id = "allCourse_lev" + preno + "_fixlink";
   }
}
}
}

function modify_lev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prCourseLevModify.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=150");

}

function add_class(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcItemAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=190");

}

function del_class(objname) {
var now = new Date();

//�ύɾ����Ŀ
var path = "teachWorkManage.prTeachEvaluate.prEvlItemDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItems/ItemID="+document.all[objname+"_itemId"].value;
document.getElementById("modifyframe").src = path;
		
document.getElementById(objname+"_tr").removeNode(true);

}

function modify_class(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcItemFix.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=120");

}

function add_specialLev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcLevAdd.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=50");

}

function del_specialLev(objname) {
var now = new Date();
var levlen = getLevLen(objname);
var no = objname.substr(objname.length-1,1);
var nextno = parseInt(no) + 1;
var nextObj = objname.substring(0,objname.indexOf("_")) + "_lev" + nextno;

//�ύɾ���ȼ�
var path = "teachWorkManage.prTeachEvaluate.prEvlLevDel.do?nowtime="+now.toUTCString();
path = path + "&EvaluateItemScore/LevelID="+document.all[objname+"_Id"].value;
document.getElementById("modifyframe").src = path;

document.getElementById(objname+"_tr").removeNode(true);
if (document.getElementById(nextObj) != null) {
   for (var i=nextno;i<=levlen;i++) {
      var preno = i - 1;
	  
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i).id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno;
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_tr").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_tr";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_td").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_td";
	  localno = document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_no").value;
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev" + i + "_no").value = parseInt(localno) - 1;
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_no").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_no";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_checkbox").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_checkbox";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_dellink").href = "javascript:del_specialLev('"+objname.substring(0,objname.indexOf("_")) + "_lev" + preno +"')";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_dellink").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_dellink";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_fixlink").href = "javascript:modify_specialLev('"+objname.substring(0,objname.indexOf("_")) + "_lev" + preno +"')";
	  document.getElementById(objname.substring(0,objname.indexOf("_")) + "_lev"+i+"_fixlink").id = objname.substring(0,objname.indexOf("_")) + "_lev" + preno + "_fixlink";
   }
}

}

function modify_specialLev(objname) {

var path = "teachWorkManage.prTeachEvaluate.prSpcLevFix.do?objname=" + objname;
addwindow = window.open(path,"add_window","width=200,height=150");

}

function getItemLen(objname) {

var len=1;
var itemname=objname + "_item1_tr";

while (window.document.getElementById(itemname)!=null) {
   len = len+1;
   itemname=objname + "_item" + len + "_tr";
}
len = len-1;

return len;

}

function getLevLen(objname) {

var len=1;
var levname=objname.substring(0,objname.indexOf("_"))+"_lev1_td";

while (document.getElementById(levname)!=null) {
   len = len+1;
   levname=objname.substring(0,objname.indexOf("_"))+"_lev"+len+"_td";
}
len = len-1;

return len;

}

function formatLevText(objname,levname) {
   var tmpText = "";
   for (var i=0;i<levname.length;i++) {
       if (i != (levname.length-1))
          tmpText += levname.substr(i, 1) + "<br>";
       else
          tmpText += levname.substr(i, 1);
   }
   document.getElementById(objname).innerHTML = tmpText;
}
	
function formatItemText(objname,itemName) {
	var name_tmp = "";
	if (itemName.length <= 6) {
       for (var i=0;i < itemName.length;i++) {
           name_tmp = name_tmp + itemName.substr(i,1) + " ";
       }
       document.getElementById(objname).innerHTML = name_tmp + "<br>";
       return;
    }
    if (itemName.length > 8) {
       document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
       return;
    }
    document.getElementById(objname).innerHTML = itemName + "<br>";
}

    function fixTitle() {
		document.getElementById("titleText").style.display = "none";
		document.getElementById("Evaluation/Title").className = "showinput";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Title").value;
	}

	function saveTitle() {
	  var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	  var evlId = document.all["Evaluation/EvaluationID"].value;
	  var ov = document.getElementById("oldvalue").value;
	  var nv = document.getElementById("Evaluation/Title").value;
	  
	  if (document.getElementById("Evaluation/Title").value != "") {
		document.getElementById("titleText").innerHTML = document.getElementById("Evaluation/Title").value;
		document.getElementById("titleText").style.display = "inline-block";
		document.getElementById("Evaluation/Title").className = "noinput";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Title=" + document.getElementById("Evaluation/Title").value;
		   document.getElementById("modifyframe").src = path;
		}
	  } else {
	    alert("�������������Ʋ���Ϊ�գ�");
	  }
	}

	function fixRemarks() {
		document.getElementById("remarksText").style.display = "none";
		document.getElementById("Evaluation/Remarks").className = "showinput";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Remarks").value;
	}

	function saveRemarks() {
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    var ov = document.getElementById("oldvalue").value;
	    var nv = document.getElementById("Evaluation/Remarks").value;
	    
		document.getElementById("remarksText").innerHTML = nv;
		document.getElementById("remarksText").style.display = "inline";
		document.getElementById("Evaluation/Remarks").className = "noinput";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Remarks=" + document.getElementById("Evaluation/Remarks").value;
		   document.getElementById("modifyframe").src = path;
		}
	}

	function saveSuggest() {
	    var itemLen = 0;
	    var now = new Date();
	    var suggest = "allCourse_item0_suggest";
		var selObj = document.getElementById("suggest");
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?nowtime=" + now.toUTCString();
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    
	    
	    
		if (selObj.options[selObj.selectedIndex].value=='��') {
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
	    
	    	suggest = "special_item0_suggest";
	    	itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
			
			path = path + "&Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=0";
		    document.getElementById("modifyframe").src = path;
		} else{
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
	    
	    	suggest = "special_item0_suggest";
	    	itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
			
			path = path + "&Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=1";
		    document.getElementById("modifyframe").src = path;
		}
		
	}
	
	function dispSuggest() {
	   var itemLen = 0;
	   var suggest = "allCourse_item0_suggest";
	   var selObj = document.getElementById("suggest");
	   var isuggest = <bean:write property="Evaluation/IsNeedAdvice"/>;
	   
	   if (isuggest == 0) {
	        selObj.options[1].selected = true;
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
	    
	    	suggest = "special_item0_suggest";
	    	itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "none";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
		} else{
		    selObj.options[0].selected = true;
		    while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "allCourse_item" + itemLen + "_suggest";
	    	}
	    
	    	suggest = "special_item0_suggest";
	    	itemLen = 0;
	    	while (document.getElementById(suggest) != null) {
	       		document.getElementById(suggest).style.display = "block";
	       		itemLen = itemLen + 1;
	       		suggest = "special_item" + itemLen + "_suggest";
	    	}
		}
	}
	
	function fixVersion() {
		document.getElementById("version").style.display = "none";
		document.getElementById("Evaluation/Version").className = "showversion";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Version").value;
	}
	
	function saveVersion() {
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    var ov = document.getElementById("oldvalue").value;
	    var nv = document.getElementById("Evaluation/Version").value;
	    
	    document.getElementById("version").innerHTML = "�汾 ��" + document.getElementById("Evaluation/Version").value;
		document.getElementById("version").style.display = "inline-block";
		document.getElementById("Evaluation/Version").className = "noversion";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + document.getElementById("Evaluation/Version").value;
		   document.getElementById("modifyframe").src = path;
		}
	}
</script>

<body>
<form>
<html:hidden property="Evaluation/EvaluationID" />
<html:hidden property="Evaluation/Period" />
<html:hidden property="Evaluation/IsNeedAdvice" />
<html:hidden property="oldVersion" value="<%=oldversion%>"/>
<html:hidden property="status"/>
<input type="hidden" id="oldvalue" value="">
<input type="hidden" id="courseItemAction" value="teachWorkManage.prTeachEvaluate.prAddCourseItem.do">
<input type="hidden" id="courseLevAction" value="teachWorkManage.prTeachEvaluate.prAddCourseLev.do">
<input type="hidden" id="spcItemAction" value="teachWorkManage.prTeachEvaluate.prAddSpcItem.do">
<input type="hidden" id="spcLevAction" value="teachWorkManage.prTeachEvaluate.prAddSpcLev.do">
<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="../../image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ����������&gt;ά���̰��ۺ�������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" align="center"><span class="STYLE3">������ί��У&nbsp;&nbsp;��������ѧԺ</span><br>
        <html:text onblur="saveTitle();" property="Evaluation/Title" attributesText='class="noinput" Msg="�������������Ʋ���Ϊ��"'/>
        <SPAN class="STYLE4" id="titleText" ondblclick="fixTitle();"><bean:write property="Evaluation/Title"/></SPAN><BR>
	    <div align="left" class="STYLE5"><strong>��λѧԱ��</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;
	    <html:text onblur="saveRemarks();" property="Evaluation/Remarks" attributesText='class="noinput"'/>
        <SPAN id="remarksText" ondblclick="fixRemarks();"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">�汾:<bean:write property="Evaluation/Version"/></div>
        <div align="right"><html:text onblur="saveVersion();" property="Evaluation/Version" attributesText='class="noversion"'/></div>
      </td>
    </tr>
    <tr>
      <td class="text" valgin="top"><table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;һ�����Ļ�����Ϣ</span></td>
        </tr>
		<tr>
		  <td><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="10%" bgcolor="#FFFFFF" align="center" valign="middle">���<br />ѧ��</td>
              <td width="40%" bgcolor="#FFFFFF" align="center" valign="middle">
			    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="40%" align="center">��ʿ�о���</td>
                    <td width="10%" align="center"><input type="checkbox" name="checkbox" value="checkbox" /></td>
                    <td width="40%" align="center">��ѧ����</td>
                    <td width="10%" align="center"><input type="checkbox" name="checkbox4" value="checkbox" /></td>
                  </tr>
                  <tr>
                    <td align="center">˶ʿ�о���</td>
                    <td align="center"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
                    <td align="center">��ѧר��</td>
                    <td align="center"><input type="checkbox" name="checkbox5" value="checkbox" /></td>
                  </tr>
                  <tr>
                    <td align="center">��У�о���</td>
                    <td align="center"><input type="checkbox" name="checkbox3" value="checkbox" /></td>
                    <td align="center">&nbsp;</td>
                    <td align="center">&nbsp;</td>
                  </tr>
                </table>
			    </td>
              <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">��<br />
                ��</td>
              <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle">�� 
                <input type="checkbox" name="checkbox6" value="checkbox" />                &nbsp;&nbsp;&nbsp;&nbsp;Ů 
                <input type="checkbox" name="checkbox7" value="checkbox" /></td>
              <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">��<br />
                ��</td>
              <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="60%" align="left">40������</td>
                  <td width="40%" align="center"><input type="checkbox" name="checkbox8" value="checkbox" /></td>
                </tr>
                <tr>
                  <td align="left">40�ꡫ50��</td>
                  <td align="center"><input type="checkbox" name="checkbox9" value="checkbox" /></td>
                </tr>
                <tr>
                  <td align="left">50������</td>
                  <td align="center"><input type="checkbox" name="checkbox10" value="checkbox" /></td>
                </tr>
              </table>
                </td>
            </tr>
          </table></td>
		</tr>
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;�������Ա��ڰ�����������</span>
              <SELECT id="suggest" onchange="saveSuggest();">
				<OPTION value="��" selected>���������</OPTION>
				<OPTION value="��">ȥ�������</OPTION>
			  </SELECT></td></td>
        </tr>
		<tr>
		  <td>
		  <table id="allCourse" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="allCourse_item0_tr">
              <td id="allCourse_lev0_td" width="15%" bgcolor="#FFFFFF"> &nbsp;&nbsp;����̶�
                <input type="button" id="add_item2" class="button_02" value="�����ȼ�" onclick="add_lev('allCourse');"/>
                <br />��<br />��<br />��
                <input type="button" name="allCourse_additem" class="button_02" value="������Ŀ" onclick="add_item('allCourse');"/>
              <% int levLen = 0; %>
              <logic:iterate id="allev" property="list[@type='allCourseLevs']">
              <% levLen++; %>
              <td id="allCourse_lev<%=levLen%>_td" width="10%" align="center" bgcolor="#FFFFFF">
			   <table id="allCourse_lev<%=levLen%>_tb" width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                   <tr valign="middle">
                     <td colspan="2" align="center">
					   <INPUT value="<bean:write id="allev" property="allCourseLevs/LevelID"/>" type="hidden" id="allCourse_lev<%=levLen%>_levId">
                       <input type="hidden" id="allCourse_lev<%=levLen%>" value="<bean:write id="allev" property="allCourseLevs/LevelName"/>" />
                       <input type="hidden" id="allCourse_lev<%=levLen%>_no" value="<bean:write id="allev" property="allCourseLevs/OrderNO"/>" />
					   <span id="allCourse_lev<%=levLen%>_text"><script>formatLevText("allCourse_lev<%=levLen%>_text","<bean:write id="allev" property="allCourseLevs/LevelName"/>");</script></span></td>
                     </tr>
                   <tr valign="bottom">
                     <td width="50%" height="30%" align="center">
					 <a id="allCourse_lev<%=levLen%>_dellink" href=javascript:del_lev('allCourse_lev<%=levLen%>'); class="STYLE11">ɾ</a></td>
                     <td width="50%" height="30%" align="center">
					 <a id="allCourse_lev<%=levLen%>_fixlink" href=javascript:modify_lev('allCourse_lev<%=levLen%>'); class="STYLE11">��</a></td>
                   </tr>
                 </table>
              </td>
              </logic:iterate>
              <td id="allCourse_item0_suggest" width="30%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="allCourseItem" property="list[@type='allCourseItems']">
			<% itemLen++; %>
            <tr id="allCourse_item<%=itemLen%>_tr">
              <td id="allCourse_item<%=itemLen%>_td" width="18%" height="45" align="center" bgcolor="#FFFFFF">
			  <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="1">
                <tr>
                  <td width="80%" rowspan="2" align="center" valign="middle">
                  <span id="allCourse_item<%=itemLen%>_text">
                  <script>formatItemText("allCourse_item<%=itemLen%>_text","<bean:write id="allCourseItem" property="allCourseItems/Title"/>");</script>
                  </span>
                    <INPUT value="<bean:write id="allCourseItem" property="allCourseItems/ItemID"/>" type="hidden" id="allCourse_item<%=itemLen%>_Id">
                    <input type="hidden" id="allCourse_item<%=itemLen%>" value="<bean:write id="allCourseItem" property="allCourseItems/Title"/>" />
                    <input type="hidden" id="allCourse_item<%=itemLen%>_no" value="<bean:write id="allCourseItem" property="allCourseItems/OrderNO"/>" />
					<input type="hidden" id="allCourse_item<%=itemLen%>_course" value="<bean:write id="allCourseItem" property="allCourseItems/Course"/>" />
                    <input type="hidden" id="allCourse_item<%=itemLen%>_courseid" value="<bean:write id="allCourseItem" property="allCourseItems/CourseType"/>" /></td>
                  <td width="20%" height="50%" align="right" valign="middle">
				  <a id="allCourse_item<%=itemLen%>_dellink" href=javascript:del_item('allCourse_item<%=itemLen%>'); class="STYLE11">ɾ</a></td>
                </tr>
                <tr>
                  <td width="20%" height="50%" align="right" valign="middle">
				  <a id="allCourse_item<%=itemLen%>_fixlink" href=javascript:modify_item('allCourse_item<%=itemLen%>'); class="STYLE11">��</a></td>
                </tr>
              </table></td>
              <% for (int i=0;i<levLen;i++) { %>
              <td width="10%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
              <% } %>
              <td id="allCourse_item<%=itemLen%>_suggest" width="42%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;��������ר��ε�����</span>
		      <span class="STYLE5">��������ѡ��Ŀ�ġ������ڴ򡰡̡�����Ըÿ��ⲻ���⣬���á������հ׼��ɣ�</span></td>
        </tr>
		<tr>
		  <td>
		  <table id="special" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="class0_tr">
              <td width="30%" align="center" bgcolor="#FFFFFF">ר�⣨�����ˣ�
			  <div align="right"><a href=javascript:add_class('class'); class="STYLE11">������������</a></div>
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">
			  <span id="class_itemText1">�������</span>
			  <input type="hidden" id="class_item1" value="�������">
			  </td>
              <td id="special_item0_suggest" width="50%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
            </tr>
            <% itemLen = 0; %>
			<logic:iterate id="specialItem" property="list[@type='specialItems']">
			<% 
			  itemLen++;
			  int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialItem","specialItems/ItemID"));
			  int itemLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialItem","specialItems/levlen"));
			%>
            <tr id="class<%=itemLen%>_tr">
              <td width="30%" bgcolor="#FFFFFF">
              <input type="hidden" name="class<%=itemLen%>_itemId" value="<bean:write id="specialItem" property="specialItems/ItemID"/>" />
			  <input type="hidden" name="class<%=itemLen%>" value="<bean:write id="specialItem" property="specialItems/Course"/>" />
			  <input type="hidden" name="class<%=itemLen%>_id" value="<bean:write id="specialItem" property="specialItems/CourseType"/>" />
			  <span id="class<%=itemLen%>_text"><bean:write id="specialItem" property="specialItems/Course"/>��</span><br />
			  2008-6-2<br />
              <span id="class<%=itemLen%>_topic">��Ŀ��**********</span><br />
			  <table width="100%">
			  <tr>
			    <td id="class<%=itemLen%>_teacher" colspan="3" align="right">��ĳĳ�쵼��</td>
			  <tr>
			    <td align="center"><a href=javascript:del_class('class<%=itemLen%>'); class="STYLE11">ɾ������</a></td>
				<td align="center"><a href=javascript:modify_class('class<%=itemLen%>'); class="STYLE11">�޸�����</a></td>
				<td align="center"><a href=javascript:add_specialLev('class<%=itemLen%>'); class="STYLE11">�����ȼ�</a></td>
			  </tr>
			  </table></td>
              <td id="class<%=itemLen%>_lev" width="20%" align="center" bgcolor="#FFFFFF">
			  <table id="class<%=itemLen%>_lev_tb" width="90%" border="0" cellspacing="3" cellpadding="0">
			  <%
				for (int i=1;i<=itemLevLen;i++) {
			  %>
              <logic:iterate id="specialev" property="list[@type='specialLevs']">
              <% 
              int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/ItemID"));
              int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/OrderNO"));
				if (levItemId==itemId && levOrder==i) {
              %>
                <tr id="class<%=itemLen%>_lev<%=i%>_tr">
                  <td width="20%" align="center">
				    <input type="checkbox" id="class<%=itemLen%>_lev<%=i%>_checkbox" value="" />
					<input type="hidden" id="class<%=itemLen%>_lev<%=i%>_Id" value="<bean:write id="specialev" property="specialLevs/LevelID"/>" />
					<input type="hidden" id="class<%=itemLen%>_lev<%=i%>" value="<bean:write id="specialev" property="specialLevs/LevelName"/>" />
					<input type="hidden" id="class<%=itemLen%>_lev<%=i%>_no" value="<bean:write id="specialev" property="specialLevs/OrderNO"/>" /></td>
                  <td id="class<%=itemLen%>_lev<%=i%>_td" width="41%" align="left"><bean:write id="specialev" property="specialLevs/LevelName"/></td>
                  <td width="40%" align="center" valign="middle">
				    <a id="class<%=itemLen%>_lev<%=i%>_dellink" href=javascript:del_specialLev('class<%=itemLen%>_lev<%=i%>') class="STYLE11">ɾ</a>&nbsp;&nbsp;
					<a id="class<%=itemLen%>_lev<%=i%>_fixlink" href=javascript:modify_specialLev('class<%=itemLen%>_lev<%=i%>') class="STYLE11">��</a></td>
                </tr>
              <% } %>
              </logic:iterate>
              <% } %>
              </table></td>
              <td id="special_item<%=itemLen%>_suggest" width="50%" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
		<tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;�ġ�������ε�����</span>
		      <span class="STYLE5">�������Դ˿β����⣬�ɲ��򡰡̡���</span>
		      <BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע������ογ̼��ȼ����ø�ר�����ͬ��
		  </td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
<p align="right" class="STYLE1"> ��ϸ�л���Ĳ�����֧�֣�</p>
<div align="center"><INPUT type="button" class="button_02" value="���" onclick="checkVersion()">&nbsp;
<INPUT type="button" class="button_02" value="����" onclick="delEvlReturn();"></div>
<script language="javascript">
dispSuggest();

function checkVersion() {
var evlId = document.all["Evaluation/EvaluationID"].value;
var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
var newversion = document.forms[0].elements("Evaluation/Version").value;
var version = prompt("�Ƿ�ȷ��ʹ�õ�ǰ�汾�� ��"+newversion+",���������������°汾�ţ���ȷ�����ɣ�",newversion);
//var oldversion = document.forms[0].elements("oldVersion").value;

//if (newversion == oldversion) {
//   if (confirm('�Ƿ�ȷ�ϵ�ǰ�汾�� ��'+newversion)){
//		history.go(-1);
//   }
//} else location.href="teachWorkManage.prTeachEvaluate.prWeekEvlList.do";

if (version==null) location.href="teachWorkManage.prTeachEvaluate.prShortEvlList.do";
else {
   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + version;
   document.getElementById("modifyframe").src = path;
   setTimeout("location.href='teachWorkManage.prTeachEvaluate.prShortEvlList.do';",3000);
}
}

function delEvlReturn() {
var path = "teachWorkManage.prTeachEvaluate.prShortListDel.do?Evaluation/ClassType=2&Evaluation/Period=ÿ��";
var evlId = document.all["Evaluation/EvaluationID"].value;
var status = document.all["status"].value;

if (status == 'add') {
   path = path + "&evlList/Evaluation1/EvaluationID="+evlId;
   if (confirm("ȷ��ȡ��������ǰ�̰���������")) location.href = path;
} else {
   location.href='teachWorkManage.prTeachEvaluate.prShortEvlList.do';
}
}
</script>
</body>