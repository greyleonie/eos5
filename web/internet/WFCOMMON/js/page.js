function commit(action){
	var frm=document.forms('mainForm');
        frm("__CURRENT_ACTION").value=action;
	frm.submit();
}
function selectReturn() {
	with(event.srcElement)
		return ((tagName=="INPUT" && (type=="text" || type=="password")) || tagName=="TD");
}
function dragReturn() {
		return event.srcElement.tagName=="TD";
}
function pageInit() {
//	setContainer();
//	if (typeof cellsInit!="undefined") {
//		cellsInit();
//	}
}
function setContainer() {
//	var h=0;
//	if (typeof barContainer!="undefined") {
//		barContainer.style.pixelWidth=document.body.offsetWidth;
//		h=barContainer.offsetHeight;
//	}
//	if (typeof mainContainer!="undefined") {
//		mainContainer.style.pixelWidth=document.body.offsetWidth;
//		mainContainer.style.pixelHeight=document.body.offsetHeight-h;
//	}
}
document.onkeydown=docKeydown;
document.onselectstart=selectReturn;
//window.onload=pageInit;
//window.onresize=setContainer;
document.ondragstart=dragReturn;
function docKeydown() {
	var p=event.srcElement;
	if (event.keyCode==8 &&
		!((p.tagName=="INPUT" && (p.type=="text" || p.type=="password") || p.tagName=="TEXTAREA") && !p.readOnly)
		)
	{
		event.keyCode=0;
		event.returnValue=false;
	}
}
var selected={};
function commit1(action, needCommit) {
	var frm=document.forms('mainForm');
	if (needCommit==null)
		needCommit=event && event.srcElement ? event.srcElement.needCommit!="false":true;
	if (needCommit) {
		var arr=frm.elements;
		var inError=false,inRequired=false;
		for (var i=0;i<arr.length;i++) {
			var j=arr[i];
			if ((j.dtype || j.tagName=="SELECT") && !j.disabled && j.offsetHeight && j.offsetWidth) {
				if (j.tagName=="SELECT") {
					if (j.selectedIndex==0 && j.required && j.required!="false") {
						j.style.backgroundColor="#AACFFE";
						j.title="请填写必填项";
						if (!inRequired)
							inRequired=true;
					}
				} else {
					if (j.value) {
						if (j.title && !inError)
						inError=true;
					} else {
						if (j.required && j.required!="false") {
						j.style.backgroundColor="#AACFFE";
						j.title="请填写必填项";
						if (!inRequired)
							inRequired=true;
						}
					}
				}
			}
		}
		if (inError || inRequired) {
			var msg="页面中包含以下错误：              \n\n",index=1;
			if (inError) {
				msg+=index+"、红色部分的数据错误\n";
				index++;
			}
			if (inRequired) {
				msg+=index+"、蓝色部分必须填写\n";
				index++;
			}
			alert(msg+"\n请修正后重试。");
			return;
		}
		for (var i=0;i<arr.length;i++) {
			var j=arr[i];
			if (j.dtype && j.value)
				j.value=j.realValue;
		}
	}
	if (action)
		frm("ACTION").value=action;
	frm.submit();
}
function resetForm(p) {
	var frm=document.forms('mainForm');
    var arr=frm.elements;
	for (var i=0;i<arr.length;i++) {
		var j=arr[i];
		if (j.name.indexOf(p)==0){
			if (j.dtype) {
				j.value="";
				j.showValue="";
				j.inputValue="";
				if (j.title)
					top.doNormalStyle(j);
			}
			if (j.type=="hidden") {
				j.value="";
			}
			if (j.tagName=="SELECT")
				j.selectedIndex=0;
		}
	}
}
function focusField(p) {
	if (((p.tagName=="INPUT" && (p.type=="text" || p.type=="password")) || p.tagName=="TEXTAREA")) {
		if (p.value) {
			if (!p.title && p.inputValue)
				p.value=p.inputValue;
			p.select();
		}
	} else
		document.selection.empty();
	if (p.className=="gridFld" || p.className=="gridReadOnlyFld") {
		if (!p.readOnly)
			p.style.borderStyle="inset";
		var row=p.parentNode.parentNode;
		var i=row.sectionRowIndex,j=selected[row.ownerCase];
		if (p.dtype && (p.dtype.substr(0,1)=="d" || p.dialog=="true")) {
				var arr=document.getElementsByName(p.name+"_icon");
				if (arr.length)
					arr[i].style.visibility="visible";
		}
		if (j!=i) {
			row.parentNode.rows[j].className="listRow1";
			row.className="listRowSelected";
			selected[row.ownerCase]=i;
		}
	}
}
function blurField(p) {
	if (p.value) {
		if (p.showValue && !p.title)
			p.value=p.showValue;
	}
	if (p.className=="gridFld" || p.className=="gridReadOnlyFld") {
		if (p.dtype && (p.dtype.substr(0,1)=="d" || p.dialog)) {
				var arr=document.getElementsByName(p.name+"_icon");
				if (arr.length)
					arr[p.parentNode.parentNode.sectionRowIndex].style.visibility="hidden";
		}
		if (!p.readOnly)
			p.style.borderStyle="solid";
	}
}
function changeField(p) {
	if (p.tagName=="SELECT") {
		if (p.title) {
			p.style.backgroundColor="transparent";
			p.title="";
		}
	} else
		top.disposeField(p);
}
function keydownField(p) {
	if (event.keyCode==13)
		event.keyCode=9;
	if ((p.className=="gridFld" || p.className=="gridReadOnlyFld") && event.ctrlKey && !event.shiftKey) {
		var cell=p.parentNode,i=cell.cellIndex;
		switch (event.keyCode) {
			case 37:
				var row=cell.parentNode;
				var cells=row.cells;
				if (i!=0) {
					do {
						var nc=row.cells[--i];
						if (nc) {
							var fld=nc.firstChild;
							if (fld && fld.type!="hidden" && fld.nodeName!="#text" && !fld.readOnly)
								break;
						}

					}
					while(nc);
					if (fld && fld.type!="hidden" && fld.nodeName!="#text" && !fld.readOnly)
						fld.focus();
				}
				break;
			case 38:
				var old=cell.parentNode;
				var j=selected[old.ownerCase];
				do {
					var row=old.parentNode.rows[--j];
				}
				while(row && row.style.display=="none" && !row.ownerCase);
				if (row && row.style.display!="none" && row.ownerCase) {
					row.cells[i].firstChild.focus();
				}
				break;
			case 39:
				var row=cell.parentNode;
				var cells=row.cells;
				if (i!=cells.length) {
					do {
						var nc=row.cells[++i];
						if (nc) {
							var fld=nc.firstChild;
							if (fld && fld.type!="hidden" && fld.nodeName!="#text" && !fld.readOnly)
								break;
						}
					}
					while(nc);
					if (fld && fld.type!="hidden" && fld.nodeName!="#text" && !fld.readOnly)
						fld.focus();
				}
				break;
			case 40:
				var old=cell.parentNode;
				var j=selected[old.ownerCase];
				do {
					var row=old.parentNode.rows[++j];
				}
				while(row && row.style.display=="none" && !row.ownerCase);
				if (row && row.style.display!="none" && row.ownerCase) {
					row.cells[i].firstChild.focus();
				}
				break;
		}
		event.keyCode=0;
		event.returnValue=false;
	}
}

function showCalendar(p) {
	var arr=document.getElementsByName(p.bindingFld);
	if (arr.length>1) {
		var index=p.parentNode.parentNode.parentNode.sectionRowIndex;
		var binding=arr[index];
	} else {
		var binding=arr[0];
	}
	
	var v=binding.value ? binding.value.replace(/\-/g,"/"):"";
	if(v!= null && v.indexOf('/')<0 && v!=''){
		v=binding.value.substr(0,4)+'/'+binding.value.substr(4,2)+'/'+binding.value.substr(6,2);
	}
	var mask=binding.dtype.substr(2).split(",")[0];
	var height=(/[hms]+/).exec(mask) ? 248:228;
	var r=window.showModalDialog("/internet/WFCOMMON/Calendar.html",[v,mask,binding.toMax=="true"],"help:0;resizable:0;status:0;center:1;dialogHeight:"+height+"px;dialogWidth:200px");
	if(r=='#'){
		binding.value='';
	}else if (r) {
		binding.value=r;
	}
	binding.focus();
}
function subStrCount(str, substr)
{
	var count = 0,len=substr.length,pos=str.indexOf(substr);
	while(pos!=-1)
	{
		count++;
		str = str.substr(pos+len);
		pos=str.indexOf(substr);
	}
	return count;
}

function showDialog(url,argument,size,file) {
	var ex=150*(size ? Number(size):1);
	var feature="help:0;resizable:0;status:0;center:1;";
	feature+="dialogWidth:"+(300+ex)+"px;dialogHeight:"+(200+ex)+"px;";
	var argu={
		url:url,
		argument:argument,
		unitedInfo:typeof unitedInfo!="undefined" ? unitedInfo:null
	};

	return result=top.showModalDialog("Dialog.html",argu,feature);
}
