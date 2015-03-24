/*
文件说明：这是一个JavaScript脚本文件
功能说明：本脚本程序用来创建TAB选项
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间		    修改人		说明
2006-10-30	冯长春		创建

--------------------------------------------------------------------------- 
使用方法：

*/
var tnum =0;


function TabItem(tabid,tabtitle,url,target,dis) {
	this.tabid = tabid;
	this.tabtitle = tabtitle;
	this.url = url;
	this.target = target;
	this.dis = dis;

}

function TabControl(tabname,snum) {
	var instance = null;
	this.tabname = tabname;
	this.lasttab = 1;
	this.tabarray = [];
	this.tabPad = null;
	this.defaultcsshead = "defaultcsshead";
	this.activecsshead = "activecsshead";
	this.defaultcss = "defaultcss";
	this.activecss = "activecss";
	this.defaultcssother = "defaultcssother";
	this.activecssother = "activecssother";
    this.snum = snum;
}

TabControl.prototype.add = function(tabid,tabtitle,url,target,dis) {
	this.tabarray[this.tabarray.length] = new TabItem(tabid,tabtitle,url,target,dis);
}

TabControl.prototype.init = function() {
	
	if(this.tabarray.length == 0) {
		return;
	}

	instance = this;

	document.write("<div id='" + this.tabname + "div' align='center'></div>");
	this.tabPad = eval("document.all." + this.tabname + "div");
	var tbBoard = document.createElement("table");
	this.tabPad.insertAdjacentElement("beforeEnd",tbBoard);
	tbBoard.style.cssText = "border-collapse: collapse";
	tbBoard.border = "0";
	tbBoard.cellSpacing = "0";
	tbBoard.cellPadding = "0";
	tbBoard.height = "26";
	tbBoard.width = "100%";

	trRow = tbBoard.insertRow(0);
	var t = 0;
	for(var i = 0; i < this.tabarray.length; i++) {

		thCell = trRow.insertCell(t);
		thCell.id = this.tabname + '_tdhead' + (i + 1);
		thCell.className = this.defaultcsshead;
		thCell.width="8";
		thCell.noWrap = true;
		thCell.tabnum = i + 1;
		thCell.onclick = function() {
			instance.doclick(this.tabnum);
		}

		thCell.onmouseover = function(){
			
		}
		thCell.onmouseout=function(){
			
		}

		t++;
		tbCell = trRow.insertCell(t);
		tbCell.id = this.tabname + '_tabbar' + (i + 1);
		
		tbCell.className = this.defaultcss;
		if(this.tabarray[i].dis == 1) {
			tbCell.innerHTML = "<b>"+this.tabarray[i].tabtitle+"&nbsp;"+"</b>";
		}else{
			tbCell.innerHTML = this.tabarray[i].tabtitle+"&nbsp;";
		}
		tbCell.moudul = this.tabarray[i].tabid;
		tbCell.url = this.tabarray[i].url;
		tbCell.target = this.tabarray[i].target;
		
		tbCell.tabnum = i + 1;
		tbCell.noWrap = true;
		tbCell.onclick = function() {
			instance.doclick(this.tabnum);
		}

		tbCell.onmouseover = function(){
			
		}
		tbCell.onmouseout=function(){
			
		}

		t++;
		tdCell = trRow.insertCell(t);
		tdCell.id = this.tabname + '_tdgap' + (i + 1);
		tdCell.className = this.defaultcssother;
		tdCell.width="24";
		tdCell.noWrap = true;
		tdCell.tabnum = i + 1;
		tdCell.onclick = function() {
			instance.doclick(this.tabnum);
		}

		tdCell.onmouseover = function(){
			
		}
		tdCell.onmouseout=function(){
			
		}


		t++;
	}//for

	
	tbCell = trRow.insertCell(t);
	
	tbCell.width = "100%";
	tbCell.noWrap = true;
	tbCell.style.cssText = "border-bottom:1px #DCDCDC solid;";

}


TabControl.prototype.initPage = function(num,frame) {
	if(document.all[frame]) {
		document.all[frame].src = "";
		this.doclick(num);
	}
	
}

TabControl.prototype.doclick = function(num) {
	//alert(num)
	if(this.snum!=0&&tnum==0) {
	  num=this.snum;
	  tnum = 1;
	}
	//alert(num)
	if(document.all[this.tabname + '_tabbar' + num]) {
		document.all[this.tabname + '_tdhead' + this.lasttab].className = this.defaultcsshead;
		document.all[this.tabname + '_tabbar' + this.lasttab].className = this.defaultcss;
		document.all[this.tabname + '_tdgap' + this.lasttab].className = this.defaultcssother;
		this.lasttab = num;

		var tdObjHead = document.all[this.tabname + '_tdhead' + num];
		var tdObj = document.all[this.tabname + '_tabbar' + num];
		var tdObjGap = document.all[this.tabname + '_tdgap' + num];
		tdObjHead.className = this.activecsshead;
		tdObj.className = this.activecss;
		tdObjGap.className = this.activecssother;

		var targetf = tdObj.target;
		var urlf = tdObj.url;

		if(document.all[targetf]) {
			document.all[targetf].src = urlf;
			document.all[targetf].width = document.all[targetf].document.body.offsetWidth * .96;
			document.all[targetf].height = document.all[targetf].document.body.offsetHeight * .9;
		}else{
				
		}
	}
	
}




