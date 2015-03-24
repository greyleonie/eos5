<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %> 
<html>
<head>
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script language="JavaScript" type="text/JavaScript">
<!--
caller = window.dialogArguments;
formName="<bean:write property="formName"/>";
selectName="<bean:write property="selectName"/>";
tabIndex="<bean:write property="tabIndex"/>";
countTabIndex=eval("caller."+formName+".elements['"+selectName+"'].length");
var multiSelectObj=false;
if(countTabIndex > 1 ){
	multiSelectObj = true;
	if(tabIndex == "")
		tabIndex = 0;
}
function addOpener() {
	if(<bean:write property="needMultiple"/>==false){
		if(window.selForm.sel_posi.options.length > 1){
			alert("只允许选择一项数据");
			return;
		}
	}
	if(!multiSelectObj){
		eval("caller."+formName+".elements['"+selectName+"'].options.length = 0;");
		eval("caller."+formName+".elements['"+selectName+"'].options.length = window.selForm.sel_posi.options.length;");	
	}else {
		eval("caller."+formName+".elements['"+selectName+"']["+tabIndex+"].options.length = 0;");
		eval("caller."+formName+".elements['"+selectName+"']["+tabIndex+"].options.length = window.selForm.sel_posi.options.length;");	
	}
	for (var i=0; i<window.selForm.sel_posi.options.length; i++) {
		if(!multiSelectObj){
			eval("caller."+formName+".elements['"+selectName+"'].options[i].value = window.selForm.sel_posi.options[i].value;");
			eval("caller."+formName+".elements['"+selectName+"'].options[i].text = window.selForm.sel_posi.options[i].text;");
		}else {
			eval("caller."+formName+".elements['"+selectName+"']["+tabIndex+"].options[i].value = window.selForm.sel_posi.options[i].value;");
			eval("caller."+formName+".elements['"+selectName+"']["+tabIndex+"].options[i].text = window.selForm.sel_posi.options[i].text;");
		}
	}
	closeWindow();
}
			
function closeWindow() {
	parent.window.close();
}
		
function deleteOptions() {
	var iCnt = window.selForm.sel_posi.options.length;
	var delCnt = 0;
	var tmpOption = new Option("","");
	for (var i=0; i<iCnt; i++) {
		if (window.selForm.sel_posi.options[i].selected) {
			delCnt++;
			for (var j=i; j<iCnt-1; j++) {
				textTemp=window.selForm.sel_posi.options[j+1].text;
				valueTemp=window.selForm.sel_posi.options[j+1].value;
				window.selForm.sel_posi.options[j+1].text = window.selForm.sel_posi.options[j].text;
				window.selForm.sel_posi.options[j+1].value = window.selForm.sel_posi.options[j].value;
				window.selForm.sel_posi.options[j].text = textTemp;
				window.selForm.sel_posi.options[j].value = valueTemp;
			}
		}
	}
	window.selForm.sel_posi.options.length = window.selForm.sel_posi.options.length - delCnt;
	window.selForm.sel_posi.options.selectedIndex = -1;
}

function getOldPosi() {
	if(!multiSelectObj){
		for (var i=0; i< eval("caller."+formName+".elements['"+selectName+"'].options.length"); i++) {
			eval("addBottomList(caller."+formName+".elements['"+selectName+"'].options[i].value,caller."+formName+".elements['"+selectName+"'].options[i].text);");
		}
	}else {
		for (var i=0; i< eval("caller."+formName+".elements['"+selectName+"']["+tabIndex+"].options.length"); i++) {
			eval("addBottomList(caller."+formName+".elements['"+selectName+"']["+tabIndex+"].options[i].value,caller."+formName+".elements['"+selectName+"']["+tabIndex+"]"+".options[i].text);");
		}
	}
}
function addBottomList(posi_id,posi_name) {
	if (checkPosi(posi_id)) {
		parent.bottomFrame.window.selForm.sel_posi.options.length = parent.bottomFrame.window.selForm.sel_posi.options.length + 1;
		parent.bottomFrame.window.selForm.sel_posi.options[parent.bottomFrame.window.selForm.sel_posi.options.length-1] = new Option(posi_name,posi_id);
	} else {
		alert("该用户已存在");
	}
}
function checkPosi(posi) {
	var rtn = true;
	for (var i=0; i<parent.bottomFrame.window.selForm.sel_posi.options.length; i++) {
		if (parent.bottomFrame.window.selForm.sel_posi.options[i].value == posi) {
			rtn = false;
			break;
		}
	}
	return rtn;
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" onLoad="getOldPosi();">
<input type="hidden" name="mul" value="<bean:write property="needMultiple"/>"/> 
<form name="selForm" action="" method="POST">
  <table width="350" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td align="center"> 
	    <eos:tableTab name="已选项" style="tab">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td> 
			  <logic:equal property="needMultiple" value="false"> 
				  <select style="width:350" name="sel_posi" multiple size="1">
				  </select>
              </logic:equal> 
			  <logic:equal property="needMultiple" value="true"> 
	              <select style="width:350" name="sel_posi" multiple size="5">
	              </select>
              </logic:equal> 
			</td>
          </tr>
          <tr>
            <td align="center" height="30" valign="middle"> 
              <input type="button" value="确 定" name="btSubmit" onClick="javascript:addOpener();" class="button">
              <input type="button" value="移 除" name="btMoveOut" onClick="javascript:deleteOptions();" class="button">
              <input type="button" value="取 消" name="btCancel" onClick="javascript:closeWindow();" class="button">
            </td>
          </tr>
        </table>
	   </eos:tableTab>
	  </td>
    </tr>
  </table>
</form>
</body>
</html>
