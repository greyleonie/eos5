/*
文件说明：这是一个JavaScript脚本文件
功能说明：所有公用部分
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间		    修改人		说明
2006-10-30	冯长春		创建

--------------------------------------------------------------------------- 
使用方法：

*/

var flag = false;


//点击改变和TR的颜色
function changeTRBgColor(obj) {
 	if(obj.tagName!="TR") return;
	var tableObj = obj.parentNode.parentNode;
	for(var i = 1; i < tableObj.rows.length; i++) {
		tableObj.rows[i].style.backgroundColor = (tableObj.rows[i] == obj ? "#FFCB5B" : "");
	}
		
}

//点击改变TD的颜色  add by csd 
function changeTDBgColor(obj) {
 	if(obj.tagName!="TD") return;
	var tableObj = obj.parentNode.parentNode.parentNode;
	for(var i = 0; i < tableObj.rows.length; i++) {
		var trObj=tableObj.rows[i];
		for(var j = 0; j < trObj.cells.length; j++) {
			trObj.cells[j].style.backgroundColor = (trObj.cells[j] == obj ? "#FFCB5B" : "");
		}
	}	
}

//选中所有的checkbox
function eosCheckAll(objFrm,objChk){ 
 	var len = 0;
	len = objFrm.elements.length;

	var i = 0;
	var objCheck;

	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="checkbox" && !objCheck.disabled && objCheck.getAttribute("marked")==null ){ //&& objCheck.value.indexOf('list\\')
           objCheck.checked = objChk.checked;
				
		}
	}

}

//选中checkbox个数，但不包括本身
function chechedCount(form){
		
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  count++;
			     }
			}
			i++;
		}
		return count;
}

//选中checkbox的值
function getChechedValue(form) {
	
		var eles = form.elements;
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  return obj.value;
			     }
			}
			i++
		}//while
	
	

}


//选中Radio的值
function getRadioValue(name) {
		var eles = document.getElementsByName(name);
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
				if(obj.checked){
				  return obj.value;
			     }
			i++
		}//while
}


function selRadioByValue(name,newValue) {
		var eles = document.getElementsByName(name);
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
				if(obj.value==newValue){
				  obj.checked=true;
			     }
			i++
		}//while
}

//新增
function talentadd() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value;
   	frm.submit();

}

//修改
function talentmodify() {
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
    	}
		if(chechedCount(frm)==1){
			id = getChechedValue(frm);
    		frm.action = frm.elements["modifyaction"].value;
    		frm.action += "?fid=" + id;
			frm.submit();		
    	}
		

}


//删除操作
function talentdelete(){
    	var frm =document.forms[0];
		
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
    	
    	if(confirm("是否确定删除指定记录？")==false){
			return ;
		}    	 
    
    	frm.action = frm.elements["deleteaction"].value;
    	frm.submit();
}

//点击按钮查看
function talentview() {

	
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
	    	alert("至少必须选择一行！");
	    	return ;
	    }
		if(chechedCount(frm)>1){
	   		alert("只能选择一行！");
	    	return ;
	   	}
		id = getChechedValue(frm)
		//alert(id)
	   	frm.action = frm.elements["viewaction"].value;
	   	frm.action += "?fid=" + id;
		frm.submit();	
		
   	
}

//双击查看
function talentviewf(id,authority) {
	if(authority == "true") {
		var frm =document.forms[0];
		
		
		
	   	frm.action = frm.elements["viewaction"].value;
	   	frm.action += "?fid=" + id;
		frm.submit();		
    } 	
}

//查询
function talentquery() {
	var frm =document.forms[0];
	processError(frm);
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}

}

//查询不去掉，
function talentsearch() {
	var frm =document.forms[0];
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}

}


//确定在服务端排序
function servertoorder() {
	if(event.srcElement.checked) {
		serverorder = true;
	}else{
		serverorder = false;
	}
	
}

function iePrint() {
	var printTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var url = "/internet/scripts/print.htm?printTime=" + printTime;
	var printwin = window.open(url,"fccprint","status=no,toolbar=no,menubar=no,location=no,left=0,top=0,scrollbars=yes,width=" + pwidth + ",height=" + pheight );
	
}

function iePrint2() {
	var printTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var url = "/internet/scripts/print2.htm?printTime=" + printTime;
	var printwin = window.open(url,"fccprint","status=no,toolbar=no,menubar=no,location=no,left=0,top=0,scrollbars=yes,width=" + pwidth + ",height=" + pheight );
	
}

function iePrint3() {
	var printTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var url = "/internet/scripts/print3.htm?printTime=" + printTime;
	var printwin = window.open(url,"fccprint","status=no,toolbar=no,menubar=no,location=no,left=0,top=0,scrollbars=yes,width=" + pwidth + ",height=" + pheight );
	
}

function iePrint4() {
	var printTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var url = "/internet/scripts/print4.htm?printTime=" + printTime;
	var printwin = window.open(url,"fccprint","status=no,toolbar=no,menubar=no,location=no,left=0,top=0,scrollbars=yes,width=" + pwidth + ",height=" + pheight );
	
}
/*
比较大字体的打印
*/
function iePrint5() {
	var printTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var url = "/internet/scripts/print5.htm?printTime=" + printTime;
	var printwin = window.open(url,"fccprint","status=no,toolbar=no,menubar=no,location=no,left=0,top=0,scrollbars=yes,width=" + pwidth + ",height=" + pheight );
	
}

function exporttoexcel() {
	var exportTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var etitle = "";
	var exml = "";
	var reportTitle = document.all.printTable;
	var reportTable = document.all.listdetail;
	//var reportFileName = document.all.reportFileName
	if(reportTitle.tagName == "TABLE" || reportTitle.tagName == "table") {
		etitle = printTable.rows(0).innerText;
	}else if(reportTitle.tagName == "SELECT" || reportTitle.tagName == "select") {
		var tempValue = reportTitle.value;
		for(var i = 0; i < reportTitle.options.length; i++) {
			if(reportTitle.options[i].value == tempValue) {
				etitle = reportTitle.options[i].text;
				break;
			}
		}
	}else{
		etitle = reportTitle.innerText;
	}
	
	exml = tabletoxml(reportTable);
	

	var frm = document.forms[1];
	if(!frm) {
		alert("不能导出，没有导出form");
		return;
	}
	frm.elements["title"].value = etitle
	frm.elements["xmlfcc"].value = exml;
	
	var url = "common.pr.domtoexcel.do?exportTime=" + exportTime;
	frm.action = url;
	//frm.target = "_top";
	frm.submit();
}
//导出为word文件   add by csd   
function domToDoc() {
	var exportTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var etitle = "";
	var exml = "";
	var reportTitle = document.all.printTable;
	var reportTable = document.all.listdetail;

	if(reportTitle.tagName == "TABLE" || reportTitle.tagName == "table") {
		etitle = printTable.rows(0).innerText;
	}else if(reportTitle.tagName == "SELECT" || reportTitle.tagName == "select") {
		var tempValue = reportTitle.value;
		for(var i = 0; i < reportTitle.options.length; i++) {
			if(reportTitle.options[i].value == tempValue) {
				etitle = reportTitle.options[i].text;
				break;
			}
		}
	}else{
		etitle = reportTitle.innerText;
	}
	
	exml = tabletoxml(reportTable);
	

	var frm = document.forms[1];
	if(!frm) {
		alert("不能导出，没有导出form");
		return;
	}
	frm.elements["title"].value = etitle
	frm.elements["xmlfcc"].value = exml;
	
	var url = "common.pr.domToDoc.do?exportTime=" + exportTime;
	frm.action = url;
	//frm.target = "_top";
	frm.submit();
}

function tabletoxml(tableObj) {
	var result = "<table>";
	var allrows = tableObj.rows;
	for(var i = 0; i < allrows.length; i++) {
		var somerow = allrows[i];
		result += "<tr";
		if(somerow.className!=null ) result += " class=\"" + somerow.className + "\"";
		result +=">";
		for(var j = 0; j < somerow.cells.length; j++) {
			var somecell = somerow.cells[j];
			var somecellvalue = somecell.innerHTML;
			re=/(< *a [^>]*>)|(< *\/ *a *>)/gi;   //去除文字上面的链接
			somecellvalue = somecellvalue.replace(re,"");
			//somecellvalue = somecellvalue.replace(/(< *FONT [^>]*>)/gi,"");
			somecellvalue = somecellvalue.replace(/(< *FONT [^>]*>)|(< *\/ *FONT *>)/gi,"");
			if(i == 0 ) {
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,"序号");
				somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"序号");
			}else{
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				somecellvalue = somecellvalue.replace(/<input\s+type=hidden.*?>/gi,"");
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,i);
				somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"");
			}

			somecellvalue = somecellvalue.replace(/&nbsp;/gi,"");
			result += "<td";
			if(somecell.getAttribute("colspan")!=null && somecell.getAttribute("colspan")!=1) result += " colspan=\"" + somecell.getAttribute("colspan") + "\"";
			if(somecell.getAttribute("rowspan")!=null && somecell.getAttribute("rowspan")!=1) result += " rowspan=\"" + somecell.getAttribute("rowspan") + "\"";

			result += ">";
			result += somecellvalue;
			result += "</td>"
		}//for j
		result +="</tr>";
	}//for i

	result += "</table>";
	return result;

}


function createWindow(url,top,left,width,height) {
	var curTime = new Date().getTime();
	if(url.indexOf("?") < 0) {
		url += "?curTime=" + curTime;
	}else{
		url += "&curTime=" + curTime;
	}

	var style = "top=" + top + ",";
	style += "left=" + left + ",";
	style += "width=" + width + ",";
	style += "height=" + height + ",";
	style += "status=no,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes";

	var newwindow = window.open(url,"",style);


}


function createModalWindow(url,top,left,width,height) {
	var curTime = new Date().getTime();
	if(url.indexOf("?") < 0) {
		url += "?curTime=" + curTime;
	}else{
		url += "&curTime=" + curTime;
	}
	var style = "dialogTop:" + top + "px;";
	style += "dialogLeft:" + left + "px;";
	style += "dialogWidth:" + width + "px;";
	style += "dialogHeight:" + height + "px;";
	style += "center:no;help:no;resizable:no;status:no;scroll:yes;edge:raised;unadorned:yes;";
	window.showModalDialog(url,curTime,style)
}



function firstLinkHot(className) {
	var linkObj = document.links[0];
	if(linkObj) {
		var tdObj = linkObj.children[0];
		
		if(parent.main.document.location.href!=document.links[0].href) {
			linkObj.click();
		}
		tdObj.className = className;
	
	}
	
	
	

}



//table上点击事件
function menu3(t) {
    for (var i=0; i<t.rows.length; i++){
    	for (var j=0; j<t.rows[i].cells.length; j++){
    		t.rows[i].cells[j].className= t.rows[i].cells[j] == event.srcElement ? 'menu32' : 'menu31';
			t.rows[i].cells[j] == event.srcElement ? t.rows[i].cells[j].setAttribute("state","3") : t.rows[i].cells[j].setAttribute("state","0");
		}
	}
}

function overAction(aObject) {
	//alert("over")
	var tObject = aObject.childNodes[0];
	if(tObject.getAttribute("state") && tObject.getAttribute("state") == "3") {
		tObject.className = "menu32";
	}else{
		tObject.className = "menu33";
		tObject.setAttribute("state","0");
	}
	

}

function outAction(aObject) {
	//alert("out")
	var tObject = aObject.childNodes[0];
	
	if(tObject.getAttribute("state") && tObject.getAttribute("state") == "3") {
		tObject.className = "menu32";
	}else{
		tObject.setAttribute("state","0");
		tObject.className = "menu31";
	}
}

function clickAction(aObject) {
	//alert("click")
	var tObject = aObject.childNodes[0];
	tObject.setAttribute("state","3");
	tObject.className = "menu32";
	
}


//固定表头
//window.onload = function(){
//	fixTableHeader();
//}
//<table width="100%" border="0" id="beforefixtable1" style="position:relative; left:0px; top:0px; width:100%;z-index:100;">
//<tr><td></td></tr>
//<table>
//

function fixTableHeader(tableObjf,tablestartf) {
	if(tableObjf==null) tableObjf = "listdetail";
	if(!document.getElementById("listdetail")) return;
	if(tablestartf==null) {
		var basename = "beforefixtable";
		var basenameArray = new Array();
		for(var b = 1; b <= 100; b++) {
			basenameArray[basenameArray.length] = basename + b;
		}
		tablestartf = basenameArray;
	}
	if(typeof(tablestartf.length) == "undefined") {
		if(document.getElementById(tablestartf)){
			document.getElementById(tablestartf).style.cssText = 'position:relative; left:0px; top:0px; width:100%;z-index:100;background-color:#ffffff;'
			
		}
	}else{
		for(var i = 0; i < tablestartf.length; i++) {
			if(document.getElementById(tablestartf[i])){
				document.getElementById(tablestartf[i]).style.cssText = 'position:relative; left:0px; top:0px; width:100%;z-index:100;background-color:#ffffff;'
				
			}
		}
	}
	try{
		var tableObj = document.getElementById(tableObjf);
		tableObj.rows[0].style.position = "relative";
		tableObj.rows[0].style.zIndex = "100";
		//tableObj.rows[0].style.filter = "alpha(opacity=0)";
		for(var r = 1; r < tableObj.rows.length; r++) {
			tableObj.rows[r].style.cssText = 'z-index:-100;';
		}
		document.body.onscroll = function() {
			var newbodytop = document.body.scrollTop;
			var differ = (newbodytop - srcbodytop);
			
			
			if(typeof(tablestartf.length) == "undefined") {
				if(document.getElementById(tablestartf)){
					//document.getElementById(tablestartf).cssText = 'position:relative; left:0px; top:0px; width:100%;z-index:100;'
					document.getElementById(tablestartf).style.pixelTop += differ;
					//document.getElementById(tablestartf).style.pixelTop = document.getElementById(tablestartf).style.pixelTop + (differ+22)/5;
				}
			}else{
				for(var i = 0; i < tablestartf.length; i++) {
					if(document.getElementById(tablestartf[i])){
						//document.getElementById(tablestartf[i]).cssText = 'position:relative; left:0px; top:0px; width:100%;z-index:100;'
						document.getElementById(tablestartf[i]).style.pixelTop += differ;
						//document.getElementById(tablestartf[i]).style.pixelTop = document.getElementById(tablestartf[i]).style.pixelTop + (differ+22)/5;
					}
				}
			}
			tableObj.rows[0].style.pixelTop += differ;
			//tableObj.rows[0].style.pixelTop = tableObj.rows[0].style.pixelTop + (differ+22)/5;
			srcbodytop = newbodytop;
		}
	}catch(exception) {
		alert(exception.message);
		
	}

}

//验证处理不规则符号
function processError(frm) {
	var pattern = /[\s|,|'|\$|\^|%|\*|\.|\?]/gi;
	if(frm) {
		var eles = frm.elements;
		for(var i = 0; i < eles.length; i++) {
			if(!eles[i].disabled && eles[i].type.toLowerCase() == "text") {
				var oldValue = eles[i].value;
				eles[i].value = oldValue.replace(pattern,"");
			}
		}
	}

}


//点击TD变成<input type="text">
var ops = [];
function toEditable() {
	var pattern = /&nbsp;/gi;
	var tdObj = event.srcElement;//td
	var parentObj = tdObj.parentElement;//tr
	if(parentObj.tagName!="TR") return;
	var firstTd = parentObj.cells[0];
	if(firstTd.childNodes[0].disabled) return;
	var tdObjIndex = tdObj.cellIndex;
	var trProName = "cell" + tdObjIndex;

	var tdObjValue = tdObj.innerHTML.replace(pattern,"");//td的内容
	//alert(tdObjValue)
	var trProValue = parentObj.getAttribute(trProName);//tr 的属性
	if(trProValue == null) {
		parentObj.setAttribute("modify","no");
	}

	if(trProValue == null || trProValue!=tdObjValue) {
		parentObj.setAttribute(trProName,tdObjValue)
	}
	
	var edittype = tdObj.getAttribute("edittype");//编辑类型
	if(edittype==null) {
		tdObj.setAttribute("edittype","text");
	}

	var str = '<input type="' + tdObj.getAttribute("edittype") + '" style="width:95%;border:1 soild;background-color:#FFFCF0" value="' + parentObj.getAttribute(trProName) + '" onBlur="toPlain()" >';

	if(tdObj.getAttribute("edittype")!="text") {
		str = '<select name="select" style="width:95%;border:1 soild;background-color:#FFFCF0" onChange="toPlain()" onBlur="toPlain()">'
		for(var i = 0; i < ops.length; i++) {
			str += '<option value="' + ops[i] + '"';
			if(parentObj.getAttribute(trProName)==ops[i]) str += ' selected ';
			str += '>'  + ops[i] + '</option>';
		}
		str += '</select>'
	}
	tdObj.innerHTML = str;
	tdObj.firstChild.focus();
    //flag = true;

}

//点击TD变成<select></select>    add by csd
//参数 :options 数组
function toEditSelect(options) {
	var pattern = /&nbsp;/gi;
	var tdObj = event.srcElement;//td
	var parentObj = tdObj.parentElement;//tr
	if(parentObj.tagName!="TR") return;
	var firstTd = parentObj.cells[0];
	if(firstTd.childNodes[0].disabled) return;
	var tdObjIndex = tdObj.cellIndex;
	var trProName = "cell" + tdObjIndex;

	var tdObjValue = tdObj.innerHTML.replace(pattern,"");//td的内容
	//alert(tdObjValue)
	var trProValue = parentObj.getAttribute(trProName);//tr 的属性
	if(trProValue == null) {
		parentObj.setAttribute("modify","no");
	}

	if(trProValue == null || trProValue!=tdObjValue) {
		parentObj.setAttribute(trProName,tdObjValue)
	}
	
		
		str = '<select name="select" style="width:95%;border:1 soild;background-color:#FFFCF0" onChange="toPlain()" onBlur="toPlain()">'
		for(var i = 0; i < options.length; i++) {
			str += '<option value="' + options[i] + '"';
			if(parentObj.getAttribute(trProName).trim()==options[i]) str += ' selected ';
			str += '>'  + options[i] + '</option>';
		}
		str += '</select>'
	
	
	tdObj.innerHTML = str;
	tdObj.firstChild.focus();


}

//把输入或选择域变成文本
function toPlain() {
	var t = event.srcElement;
	var v= t.value;
	var tdObj = t.parentNode;
	var parentObj = tdObj.parentElement;
	var tdObjIndex = tdObj.cellIndex;
	var trProName = "cell" + tdObjIndex;
	if(v!=parentObj.getAttribute(trProName)) {
		parentObj.setAttribute("modify","yes");
		parentObj.setAttribute(trProName,v);
	}
	
	tdObj.innerHTML = '';
	tdObj.innerHTML = '&nbsp;'  + v;
	
}

//在列表页面修改并保存
function modifySave(tableName) {
   // if(!flag){
    //	alert("请在需要修改的文字上点击,直接修改后保存!");
	//	return ;

   // }
	var tableObj = document.getElementById(tableName);
	var frm = document.forms[0];
	var haslist = false;
	if(!tableObj) return;
	var rowsObj = tableObj.rows;
	for(var i = 1; i < rowsObj.length; i++) {
     
     
		if(rowsObj[i].getAttribute("modify")!=null && rowsObj[i].getAttribute("modify") == "yes") {
			haslist = true;
			var tds = rowsObj[i].cells;
			for(var j = 0; j < tds.length; j++) {
				var elementName = "listfcc/fccentity" + i + "/field" +j;//元素名
				if(j == 0) {
					var checkBoxObj = tds[j].childNodes[0];
					
					var newElemnt = document.createElement("<input type='hidden' name='"+elementName+"' value='" + checkBoxObj.value + "'>");
					frm.appendChild(newElemnt);
				}else{
					var pattern1 = /&nbsp;/gi;
					var pattern2 = /<INPUT .*?>/gi;
					var pattern3 = /(< *IMG [^>]*>)/gi;
					var tdObjValue = tds[j].innerText.replace(pattern1,"");
					tdObjValue = tdObjValue.replace(pattern2,"");
					tdObjValue = tdObjValue.replace(pattern3,"");
					var newElemnt = document.createElement("<input type='hidden' name='"+elementName+"' value='" + tdObjValue + "'>");
					frm.appendChild(newElemnt);
				}
			}//for
		}else{

		}//if
	}//for
	if(!haslist) {
		var newElemnt = document.createElement("<input type='hidden' name='listfcc'>");
		frm.appendChild(newElemnt);
	}
  	frm.action = frm.elements["modifytoSave"].value;
	frm.submit();
  
  }


//人员选择，根据参数single='yes'为单个人选择，否则为多个人选择
  function selectSysUser(single){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	if(single == null) single = "no";
	url = "common.pr.manselect.do?fccargs=" + fccargs + "&single=" + single;
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}
	


}

//人员选择，可定义默认部门ID,根据参数single='yes'为单个人选择，否则为多个人选择
  function selectSysUserWithOrg(single,orgID){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	if(single == null) single = "no";
	url = "common.pr.manselect.do?fccargs=" + fccargs + "&single=" + single+"&orgID="+orgID;
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}
	


}

//会议室选择
  function selectMeetingRoom(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	
	url = "oa.prMeetingManage.selectMeetingRoom.do";
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
			
		}
	}
}

//签到机选择
  function selectConferencePOT(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	
	url = "oa.prMeetingManage.selectConferencePOT.do";
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
			
		}
	}
}

//司机选择
  function selectDriver(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "oa.prCarManage.selectDriver.do";
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	}
}

//车辆选择
  function selectCar(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "oa.prCarManage.selectCar.do";
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	}
}

//部门选择，根据参数single='yes'为单个部门选择，否则为多个部门选择
function selectSysOrg(single){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 450;
	if(single == null) single = "no";
	url = "common.pr.orgselect.do?fccargs=" + fccargs + "&single=" + single;
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}
	


}

//获得选中checkbox中某一属性的值（为数字）之和   
// add by csd
function chechedAttributeCount(form,att){
		
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var str = obj.getAttribute(att);
				    if(str!=null && str!="")
				    	count=count+parseInt(str);
			     }
			}
			i++;
		}
		return count;
}

function string2date(str)
{
	var amount = 0;

	// 判断长度与分隔符是否合法
	if (str.length != 10)  return null;
	var delimit1 = str.charAt(4);
	if (delimit1 != '.' && delimit1 != '/' && delimit1 != '-')  return null;
	var delimit2 = str.charAt(7);
	if (delimit2 != '.' && delimit2 != '/' && delimit2 != '-')  return null;
	// 处理小数后的位数
	var yyyy = parseInt("1" + str.substring(0, 4)) - 10000;
	if ((yyyy < 1000) || (yyyy > 3000))  return null;
	var mm = parseInt("1" + str.substring(5, 7)) - 100 - 1;
	if ((mm < 0) || (mm > 11))  return null;
	var dd = parseInt("1" + str.substring(8, 10)) - 100;
	if ((dd < 1) || (dd > 31))  return null;
	return new Date(yyyy, mm, dd, 0, 0, 0);
}

function string2float(str, precision)
{
	var result = 0;

	// 仅将合法的字符串转换为数量
	if ((!isNaN(str)) && (str != ""))  result = parseFloat(str);
	// 处理小数后的位数
	var isPositive = true;
	if (result < 0) {
		isPositive = false;
		result = -result;
	}
	var radix = 1;
	for (var ptr = 0; ptr < precision; ptr++)  radix *= 10;
	result = parseInt("" + (result * radix + 0.5)) / radix;
	if (!isPositive)  result = -result;
	return result;
}

function string2money(str)
{
	var amount = 0;

	// 仅将合法的字符串转换为金额
	if (!isNaN(str) && (str != ""))  amount = parseFloat(str);
	// 处理小数后的位数
	var isPositive = true;
	if (amount < 0) {
		isPositive = false;
		amount = -amount;
	}
	amount = parseInt("" + (amount * 100 + 0.5)) / 100;
	if (!isPositive)  amount = -amount;
	return amount;
}

function date2string(dateObject)
{
	var str = (dateObject.getFullYear() + 10000).toString().substring(1, 5);
	str += "-" + (dateObject.getMonth() + 1 + 100).toString().substring(1, 3);
	str += "-" + (dateObject.getDate() + 100).toString().substring(1, 3);
	return str;
}


function money2string(amount)
{
	// 处理为0的情况
	if (amount == 0)  return "";
	// 处理负数情况（转换为正数处理）
	var isPositive = true;
	if (amount < 0) {
		isPositive = false;
		amount = -amount;
	}
	// 首先将金额转换为带2位小数的字符串
	var temp = (amount + 0.0001).toString();
	var str = ".00";
	var point = temp.indexOf(".");
	if (point > 0) {
		str = temp.substring(point, point + 3);    // 记录小数部分（精确到角分位）
		temp = temp.substring(0, point);    // 保留整数部分
	}
	// 为整数部分添加逗号
	for (var ptr = 0; ptr <= temp.length - 1; ptr++) {
		if ((ptr > 0) && (ptr % 3 == 0))  str = "," + str;
		str = temp.charAt((temp.length - 1) - ptr) + str;
	}
	// 为负数添加符号
	if (!isPositive)  str = "-" + str;
	return str;
}

//去掉空格
function trim(str)
{
    if (str == null)  return "";
    for (var index = 0; index < str.length; index++) if (str.charAt(index) != ' ')  break;
    var target = str.substring(index);
    if (target.length > 0) {
        for (var index = target.length - 1; index >= 0; index--) if (target.charAt(index) != ' ')  break;
        target = target.substring(0, index + 1);
    }
    return target;
}

//按照分割符划分字符串
function unmarshalItems(expression,delimiter)
{
    if(expression==null) return null;
    var items=new Array();
    var index=-1;
    var s=0;
    var i=0;
    do{
        index=expression.indexOf(delimiter,index+1);
        if(index>0){
            str=expression.substring(s,index);
            expression=expression.substring(index+1,expression.length);
            items[i++]=str;
        }else if(expression.length){
            items[i]=expression;
            break;
        }else{
            break;
        }
        s=index+1;
    }while(index>0&&expression.length>0);
    return items;
}


//字义转换
function escape(str)
{
	var result = "";

	if (str == null)  return null;
	for (var index = 0; index < str.length; index++) {
		var ch = str.charAt(index);
		if ((ch == '\"') || (ch == '\'') || (ch == '\\'))  result = result + '\\';
		result = result + ch;
	}
	return result;
}

	
function AutoNavigate()
{
    setTimeout("AutoForword();",10000);
}
function AutoNavigateToClose()
{
    setTimeout("AutoClose();",10000);
}
function AutoNavigateToForword()
{
    setTimeout("AutoForword();",12000);
}



//工作流选人
function selectParticipant(processInstID,processDefID,maxPartiNum,inputName,hiddenName) {
	var url = "WFWEBCOMP.prExSelPerson.SelectActParticipant.do?isSelOrg=false&isSelRole=false&isSelPerson=true";
	var frm = document.forms[0];
	var frmName = frm.name;
	var activityDefID = "";
	var v_radios = frm.elements["Flow/nextNode"];
	if(typeof(v_radios.length) == "undefined") {
		activityDefID = v_radios.value;
	}else{
		for(var i = 0; i < v_radios.length; i++) {
			if(v_radios[i].checked) {
				activityDefID = v_radios[i].value;
				break;
			}
		}
	
	}
	if(!maxPartiNum) maxPartiNum = 10000;
	url += "&processInstID=" + processInstID + "&processDefID=" + processDefID + "&activityDefID=" + activityDefID;
	url += "&formName=" + frmName + "&inputName=" + inputName + "&hiddenName=" + hiddenName;
	url += "&hiddenType=ID_SPLIT" + "&maxPartiNum=" + maxPartiNum;
	
	var wparam = "dialogHeight:430px;dialogWidth:500px;center:yes";
	
	window.showModalDialog(url,frm,wparam);
	//window.open(url,"","width=500,height=430");
	
}


//工作流选人
function selectParticipantById(actDefID,processInstID,processDefID,maxPartiNum,inputName,hiddenName) {
	var url = "WFWEBCOMP.prExSelPerson.SelectActParticipant.do?isSelOrg=false&isSelRole=false&isSelPerson=true";
	var frm = document.forms[0];
	var frmName = frm.name;
	var activityDefID = actDefID;
	var v_radios = frm.elements["Flow/nextNode"];
	
	if(!maxPartiNum) maxPartiNum = 10000;
	url += "&processInstID=" + processInstID + "&processDefID=" + processDefID + "&activityDefID=" + activityDefID;
	url += "&formName=" + frmName + "&inputName=" + inputName + "&hiddenName=" + hiddenName;
	url += "&hiddenType=ID_SPLIT" + "&maxPartiNum=" + maxPartiNum;
	
	var wparam = "dialogHeight:430px;dialogWidth:500px;center:yes";
	
	window.showModalDialog(url,frm,wparam);
	//window.open(url,"","width=500,height=430");
	
}



//取得页面流程数据
function getWFData(frm) {
	if(!frm) frm = document.forms[0];
	if(!frm.elements["WFWorkItem/activityDefID"]) {
		alert("不能确定当前流程是哪个节点名");
		return;
	}
	var currentActivity = frm.elements["WFWorkItem/activityDefID"].value;	
	var eles = frm.elements;
	var hasData = false;
	for(var i = 0; i < eles.length; i++) {
	    if (eles[i].getAttribute("wfnode") != undefined) {
		if(!eles[i].disabled && eles[i].getAttribute("wfnode").indexOf(currentActivity)>=0) {
			hasData = true;
			var tempEle = eles[i];

			var wfkey = tempEle.name;
			var wfval = tempEle.value;
			var wfnode = eles[i].getAttribute("domwfnode");

			var elementKeyName = "listwf/FlowData" + i + "/elementKey";//表单元素名
			var elementValueName = "listwf/FlowData" + i + "/elementValue";//表单元素值
			var activityDefIDName = "listwf/FlowData" + i + "/activityDefID";//环节定义名

			var elementKey = document.createElement("<input type='hidden' name='"+elementKeyName+"' value='" + wfkey + "'>");
			frm.appendChild(elementKey);
			var elementValue = document.createElement("<input type='hidden' name='"+elementValueName+"' value='" + wfval + "'>");
			frm.appendChild(elementValue);
			var activityDefID = document.createElement("<input type='hidden' name='"+activityDefIDName+"' value='" + wfnode + "'>");
			frm.appendChild(activityDefID);

		
		} }//if
	
	}//for
	if(!hasData) {
		var listwfName = document.createElement("<input type='hidden' name='listwf'>");
		frm.appendChild(listwfName);
	}

}


var newrowIndex = 100;
//流程日志
function getWfLog(processInstID,title) {
	var url = "oa.pr.getAllWorkItemByInstID.do?WFWorkItem/processInstID=" + processInstID;
	url += "&title=" + title
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 250 ;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//临时插入一行
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="280px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}
//隐藏流程日志
function divWfLogDisplay(bool){
	if (document.getElementById("tmpWLog")) {
		if (bool==1){
		   document.getElementById("tmpWLog").style.display = "";
		}
		else{
		   document.getElementById("tmpWLog").removeNode(true);
	    }
	}
}

//流程监控
function getWfImg(url) {
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 250;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//临时插入一行
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="250px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}

function TR_GetX(e) {
    var l = e.offsetLeft;
    while (e = e.offsetParent) {
      l += e.offsetLeft;
    }
  
    return l;
  }
function TR_GetY(e) {
    var t = e.offsetTop;
    while (e = e.offsetParent) {
      t += e.offsetTop;
    }
   
    return t;
}

function getTdForTr(e) {
   var count = 0;
   
   for (var i=0;i<e.cells.length;i++) {
       if (e.cells[i].colspan != undefined) {
          count += e.cells[i].colspan;
       } else {
          count++;
       }
   }
   
   return count;
}
//督办
function toWfSupervise(processInstID,participant) {
	var url = "oa.pr.wfSupervise.do?WFWorkItem/workItemID=" + processInstID;
	url += "&participant=" + participant
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	createWindow(url,150,150,700,370);

}


//流程图查看
function getWfImage(processInstID,title,tableName) {
	var url = "oa.pr.getWfImageForRollback.do?WFWorkItem/processInstID=" + processInstID;
	url += "&title=" + title;
	url += "&tableName=" + tableName;
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 255 ;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//临时插入一行
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="255px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}

//流程图查看
function getWfView(requestID) {
	var url = "OMM.prRequest.prRequestView.do?OMM_Request/RequestID=" + requestID;
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 255 ;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//临时插入一行
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = 450 + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="450px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}

//流程图查看
function getRoom4Day(buildingid,layerno) {
	var url = "ICCard.prField.guestRoom4Day.do?op=null&input/BuildingID="+buildingid+"&input/LayerNO="+layerno;
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 255 ;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//临时插入一行
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = 450 + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="450px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}

//将数字金额转成大写
function chineseMoney(money){
	var money1 = new Number(money);
	if(money1> 1000000000000000000) {
		alert("你输入的数字太大，重新输入！");
	return "" ;
	}
	var monee = Math.round(money1*100).toString(10)
	var i,j;
	j=0;
	var leng = monee.length;
	var monval="";
	for( i=0;i<leng;i++){
		monval= monval + chineseMoney_upper(monee.charAt(i)) + chineseMoney_mon(leng-i-1);
	}
	return	chineseMoney_repace(monval);
}
function chineseMoney_upper(a){
	switch(a){
		case '0' : return '零'; break;
		case '1' : return '壹'; break;
		case '2' : return '贰'; break;
		case '3' : return '叁'; break;
		case '4' : return '肆'; break;
		case '5' : return '伍'; break;
		case '6' : return '陆'; break;
		case '7' : return '柒'; break;
		case '8' : return '捌'; break;
		case '9' : return '玖'; break;
		default: return '' ;
	}
}
function chineseMoney_mon(a){
	if(a>10){ 
		a=a - 8;
		return(chineseMoney_mon(a));
	}
	switch(a){
		case 0 : return '分'; break;
		case 1 : return '角'; break;
		case 2 : return '元'; break;
		case 3 : return '拾'; break;
		case 4 : return '佰'; break;
		case 5 : return '仟'; break;
		case 6 : return '万'; break;
		case 7 : return '拾'; break;
		case 8 : return '佰'; break;
		case 9 : return '仟'; break;
		case 10 : return '亿'; break;
	}
}
function chineseMoney_repace(Money){
	Money=Money.replace("零分","");
	Money=Money.replace("零角","零");
	var yy;
	var outmoney;
	outmoney=Money;
	yy=0;
	while(true){
		var lett= outmoney.length;
		outmoney= outmoney.replace("零元","元");
		outmoney= outmoney.replace("零万","万");
		outmoney= outmoney.replace("零亿","亿");
		outmoney= outmoney.replace("零仟","零");
		outmoney= outmoney.replace("零佰","零");
		outmoney= outmoney.replace("零零","零");
		outmoney= outmoney.replace("零拾","零");
		outmoney= outmoney.replace("亿万","亿零");
		outmoney= outmoney.replace("万仟","万零");
		outmoney= outmoney.replace("仟佰","仟零");
		yy= outmoney.length;
		if(yy==lett) break;
	}
	yy = outmoney.length;
	if (outmoney.charAt(yy-1)=='零'){
		outmoney=outmoney.substring(0,yy-1);
	}
	yy = outmoney.length;
	if (outmoney.charAt(yy-1)=='元'){
		outmoney=outmoney +'整';
	}
	return outmoney;
}	




