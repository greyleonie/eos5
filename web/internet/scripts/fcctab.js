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


function TabComponent(tabname) {
	var instance = null;
	this.tabname = tabname;
	this.lasttab = 1;
	this.tabarray = [];
	this.tabPad = null;
	

}


function tabItem(tabid,caption,dis,url) {
	this.tabid = tabid;
	this.caption = caption;
	this.url = url;
	this.dis = dis;
}

TabComponent.prototype.add = function(tabid,caption,dis,url) {
	
	this.tabarray[this.tabarray.length] = new tabItem(tabid,caption,dis,url);
}

TabComponent.prototype.output = function(info) {
	alert(info);
}

TabComponent.prototype.init = function() {
	if(this.tabarray.length == 0) {
		this.output("对不起，你没有TAB项！");
		return;
	}
	instance = this;
	document.write("<div id='" + this.tabname + "div'></div>");
	this.tabPad = eval("document.all." + this.tabname + "div");
	var tbBoard = document.createElement("table");
	this.tabPad.insertAdjacentElement("beforeEnd",tbBoard);
	tbBoard.style.cssText = "border-collapse: collapse";
	tbBoard.border = "0";
	tbBoard.cellSpacing = "0";
	tbBoard.cellPadding = "0";
	tbBoard.height = "24";
	tbBoard.width = "100%";
	trRow = tbBoard.insertRow(0);
	trRow.height="3";

	var tl = 0;
	tbCell = trRow.insertCell(tl);
	tbCell.id = this.tabname+'_tabbar1';
	tbCell.rowSpan = "2";
	tbCell.className = "tbottom3";
	tbCell.width = "3";
	tbCell.noWrap = true;

	tl++;
	tbCell = trRow.insertCell(tl);
	tbCell.id = this.tabname + '_tabtop1';
	tbCell.noWrap = true;

	for (i=1;i<this.tabarray.length;i++){
		tl++;
		tbCell = trRow.insertCell(tl);
		tbCell.id = this.tabname + '_tabbar' + (i + 1);
		tbCell.rowSpan = "2";
		tbCell.className = "tbottom";
		tbCell.width = "3";
		tbCell.noWrap = true;
		   
		tl++;
		tbCell = trRow.insertCell(tl)
		tbCell.id = this.tabname + '_tabtop' + (i + 1);
		tbCell.noWrap = true;
	}//for

	tl++
	tbCell=trRow.insertCell(tl)
	tbCell.id=this.tabname + '_tabbar'+(this.tabarray.length + 1)
	tbCell.rowSpan="2"
	tbCell.className="tbottom2"
	tbCell.width="3"
	tbCell.noWrap=true
		 
	tl++;
	tbCell = trRow.insertCell(tl);
	tbCell.rowSpan = "2"  ;
	tbCell.width = "100%";
	tbCell.noWrap = true;
	tbCell.style.cssText = "border-bottom:1px #000000 solid;";
		 
	trRow = tbBoard.insertRow(1);

	for (i=0;i<this.tabarray.length;i++){

		tbCell = trRow.insertCell(i);
		tbCell.id = this.tabname+'_tabcon'+(i+1);
		tbCell.className = "lostfouce";
		tbCell.url = this.tabarray[i].url;
		if (this.tabarray[i].dis == 1){
			tbCell.innerHTML = "<b>"+this.tabarray[i].caption+"&nbsp;"+"</b>";
		}else{
			tbCell.innerHTML = this.tabarray[i].caption+"&nbsp;";
		}
		tbCell.tabnum = i + 1;
		tbCell.noWrap = true;

		tbCell.onclick = function(){
			instance.doclick(this.url,this.tabnum);
		}

		tbCell.onmouseover = function(){
			instance.doover(this);
		}
		tbCell.onmouseout=function(){
			instance.doout(this);
		}

	}

}

TabComponent.prototype.inithidetab = function(num) {
	for (i = 0;i < this.tabarray.length;i++){
		  eval(this.tabarray[i].tabid).style.display = "none";
	}//for

	this.doclick('',1);

}


TabComponent.prototype.doclick = function(url,num,action){
	lastbar1 = eval(this.tabname + "_tabbar" + this.lasttab)
	nlasttab = this.lasttab + 1;
	lastbar2 = eval(this.tabname + "_tabbar"+nlasttab)

	tpbar1 = eval(this.tabname + "_tabbar" + 1)
	tpbar2 = eval(this.tabname + "_tabbar" + (this.tabarray.length + 1))

	tabtop = eval(this.tabname+"_tabtop"+this.lasttab)
	tabcon = eval(this.tabname+"_tabcon"+this.lasttab)

	tabtop.className = ""
	tabcon.className = "lostfouce"
	//alert(lastbar2.className)
	lastbar1.className = 'tbottom';
	lastbar2.className = 'tbottom';
	tpbar1.className = 'tbottom3';
	tpbar2.className = 'tbottom2';
	eval(this.tabarray[this.lasttab-1].tabid).style.display = "none";
	  
	lastbar1 = eval(this.tabname + "_tabbar" + num);
	nnum = num + 1;
	lastbar2 = eval(this.tabname + "_tabbar" + nnum);
	tabtop=eval(this.tabname + "_tabtop" + num);
	tabcon=eval(this.tabname + "_tabcon" + num);
	lastbar1.className = 'tleft';
	lastbar2.className = 'tright';    
	tabtop.className = "ttop";
	tabcon.className = "getfouce";
	//alert(this.tabarray[num-1].tabid)
	eval(this.tabarray[num-1].tabid).style.display = "block";
	eval(url);

	this.lasttab = num;
}


TabComponent.prototype.doover=function(obj){
	if (obj.className=="lostfouce") {
		obj.className = "lostfouce_over"
	}

}

TabComponent.prototype.doout=function(obj){
	if (obj.className=="lostfouce_over") {
		obj.className = "lostfouce"
	}

}
