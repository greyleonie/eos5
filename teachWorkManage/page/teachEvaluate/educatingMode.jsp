<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>教学模式</title>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="modeTable">
    <tr>
      <td width="5%" align="center"><input type="checkbox" name="mode1" value="1" /></td>
      <td width="16%">考察</td>
      <td width="5%" align="center"><input type="checkbox" name="mode2" value="2" /></td>
      <td width="16%">自学</td>
      <td width="5%" align="center"><input type="checkbox" name="mode3" value="3" /></td>
      <td width="16%">社会调查</td>
      <td width="5%" align="center"><input type="checkbox" name="mode4" value="4" /></td>
      <td width="16%">文体活动</td>
    </tr>
    <tr>
      <td width="5%" align="center"><input type="checkbox" name="mode5" value="5" /></td>
      <td width="16%">专家论坛</td>
      <td width="5%" align="center"><input type="checkbox" name="mode6" value="6" /></td>
      <td width="16%">小组讨论</td>
      <td width="5%" align="center"><input type="checkbox" name="mode7" value="7" /></td>
      <td width="16%">全班交流</td>
      <td width="5%" align="center"><input type="checkbox" name="mode8" value="8" /></td>
      <td width="16%">学员论坛</td>
    </tr>
    <tr>
      <td width="5%" align="center"><input type="checkbox" name="mode9" value="9" /></td>
      <td width="16%">专题辩论</td>
      <td width="5%" align="center"><input type="checkbox" name="mode10" value="10" /></td>
      <td width="16%">专题辅导</td>
      <td width="5%" align="center"><input type="checkbox" name="mode11" value="11" /></td>
      <td width="16%">辅导</td>
      <td width="5%" align="center"><input type="checkbox" name="mode12" value="12" /></td>
      <td width="16%">专题报告</td>
    </tr>
    <tr>
      <td width="5%" align="center"><input type="checkbox" name="mode13" value="13" /></td>
      <td width="16%">市情报告</td>
      <td width="5%" align="center"><input type="checkbox" name="mode14" value="14" /></td>
      <td width="16%">录像报告</td>
      <td width="5%" align="center"><input type="checkbox" name="mode15" value="15" /></td>
      <td width="16%">互动式</td>
      <td width="5%" align="center"><input type="checkbox" name="mode16" value="16" /></td>
      <td width="16%">做作业</td>
    </tr>
    <tr>
      <td width="5%" align="center"><input type="checkbox" name="mode17" value="17" /></td>
      <td width="16%">旁听</td>
      <td width="5%" align="center"><input type="checkbox" name="mode18" value="18" /></td>
      <td width="16%">无</td>
      <td width="5%" align="center"><input type="checkbox" name="mode19" value="19" /></td>
      <td width="16%">其他</td>
     
    </tr>
	<tr>
	  <td colspan="8" align="center">
	  <input type="button" name="submit" value="选择完成" onClick="submit_course();">
	  </td>
	</tr>
</table>
</body>
<script language="javascript">
var param=window.location.search;
var ismore=param.substring(param.indexOf("count")+6,param.length);

setOldCourse();

function submit_course() {
   var i = 1;
   var ids = "";
   var count = 0;
   var names = "";
   var flag = false;
   var objname = "mode1";
   var str = window.opener.document.getElementById("selected_course").value;
   var selected = str.split(",");
   //alert(document.getElementById(objname).parentNode.nextSibling.innerHTML);
   
   while (document.getElementById(objname) != null) {
      if (document.getElementById(objname).checked) {
	     count++;
		 if (ismore == "one") {
		    if (count > 1) {
			   alert("请选择一个适用课程类型！");
			   return;
			} else {
			   for (var j=0;j<selected.length;j++) {
			      if (document.getElementById(objname).value == selected[j])
			         flag = true;
			   }
			   if (flag) {
			      alert("当前选择课程已设置，请选择其它课程！");
			      return;
			   } else {
			      window.opener.document.all.item_course.value = document.getElementById(objname).parentNode.nextSibling.innerHTML;
                  window.opener.document.all.item_courseid.value = document.getElementById(objname).value;
                  window.opener.document.all.item_course.blur();
                  window.opener.opentime = 0;
                  window.close();
               }
			}
		 }
	     ids += document.getElementById(objname).value + ",";
	     names += document.getElementById(objname).parentNode.nextSibling.innerHTML + ",";
	  }
	  i++;
	  objname = "mode" + i;
   }
   
   //alert(ids.substr(0, ids.length-1));
   window.opener.document.all.item_course.value = names.substr(0, names.length-1);
   window.opener.document.all.item_courseid.value = ids.substr(0, ids.length-1);
   window.opener.document.all.item_course.blur();
   window.opener.opentime = 0;
   window.close();
}

function setOldCourse() {
 var namestr = window.opener.document.all.item_course.value;
 var names;
 
 if (namestr == '') {
    return;
 } else if (namestr == "全部") {
    var objname = "mode1";
	var j = 1;
	
	while (document.getElementById(objname) != null) {
	  document.getElementById(objname).checked = true;
	  j++;
	  objname = "mode" + j;
    }
 } else if (namestr.indexOf(",")>0) {
    names = namestr.split(",");
	for (var i=0;i<names.length;i++) {
       var objname = "mode1";
	   var j = 1;
	
	   while (document.getElementById(objname) != null) {
	     var modename = document.getElementById(objname).parentNode.nextSibling.innerHTML;
		 //去除字符串空格
         if (modename.replace( /^\s*/, "").replace( /\s*$/, "")==names[i].replace( /^\s*/, "").replace( /\s*$/, "")) {
	        document.getElementById(objname).checked = true;
	     }
	     j++;
	     objname = "mode" + j;
       }
    }
 } else {
    var objname = "mode1";
	var j = 1;
	
	while (document.getElementById(objname) != null) {
	  var modename = document.getElementById(objname).parentNode.nextSibling.innerHTML;
      if (modename.replace( /^\s*/, "").replace( /\s*$/, "")==namestr.replace( /^\s*/, "").replace( /\s*$/, "")) {
	     document.getElementById(objname).checked = true;
	  }
	  j++;
	  objname = "mode" + j;
    }
 }
}
</script>
</html>