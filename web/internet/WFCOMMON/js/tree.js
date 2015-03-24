function doCollapse(p,toggle) {
	var id=p.id.substr(0,p.id.length-5);
	
	var next=document.all(id+"sub");
	if (next) {
		if (next.style.display=="none") {
			next.style.display="";
			document.all(id+"node").src="img/t_minus.gif";
			var icon=document.all(id+"icon");
			if (icon){
				if (icon.src.indexOf("img/020.gif") == -1  && icon.src.indexOf("img/021.gif") == -1  && icon.src.indexOf("img/004.gif") == -1)
					icon.src="img/012.gif";
			}
		} else if (toggle){
			next.style.display="none";
			document.all(id+"node").src="img/t_plus.gif";
			var icon=document.all(id+"icon");
			if (icon)
			{
				if (icon.src.indexOf("img/020.gif") == -1  && icon.src.indexOf("img/021.gif") == -1  && icon.src.indexOf("img/004.gif") == -1)
				icon.src="img/003.gif";
			}
		}
	}
}

function list_style_tree_row_focus(p){
    with(p.style){
	if(background != "#FFEE99")
        background="#FFEE99";
        else
	background="#fffef3";
    }
}

function focusItem(p) {

	p.blur();
	var id=p.id,i=id.lastIndexOf("$"),ownerCase=id.substr(0,i);
	var old=selected[ownerCase];
	if (old!=id) {
		if (old){
                	with(document.all(old).style) {
				borderColor="#FFFFFF";
				backgroundColor="transparent";
			}}
		with(p.style) {
			backgroundColor="#FFEE99";
			borderColor="#808080";
		}
		selected[ownerCase]=id;
	}
}

function outItem(p) {
	var id=p.id,i=id.lastIndexOf("$");
	if (selected[id.substr(0,i)]!=id)
		with(p.style) {
			backgroundColor="transparent";
			borderColor="#FFFFFF";
		}
}

function overItem(p) {
	var id=p.id,i=id.lastIndexOf("$");
	if (selected[id.substr(0,i)]!=id)
		with(p.style) {
			backgroundColor="#EFEFEF";
			borderColor="#CCCCCC";
		}
}

function collapse(p) {
	switch (p.tagName) {
		case "IMG":
			var id=p.id,i=id.lastIndexOf("$"),ownerCase=id.substr(0,i);
			var old=selected[ownerCase],obj=document.all(id.substr(0,id.length-4)+'label');
			if (!old.substring(i,old.length-6).indexOf(id.substring(i,id.length-5))) {
				obj.focus();
			}
			doCollapse(obj,true);
			break;
		case "SPAN":
			doCollapse(p,true);
			break;
	}
}

function clickIcon(p) {
	var id=p.id;

	document.all(id.substr(0,id.length-4)+'label').focus();

}


function focusCheckbox(p) {
	p.blur();
}

function checkSub(p,check,ownerCase,arr) {
	var i=1,id=p.id,o;
	p.style.backgroundImage=check ? "url(img/t_check2.gif)":"url(img/t_check0.gif)";
	while (o=document.all(id.substr(0,id.length-9)+"."+i+"_checkbox")) {
		if (o.type=="text") {
			checkSub(o,check);
		} else {
			o.checked=check;
		}
		i++;
	}
	if (ownerCase)
		checkPar(ownerCase,arr,check,check ? p.subItems-p.checkedItems:p.checkedItems);
	p.checkedItems=check ? p.subItems:0;
	p.style.backgroundImage=check ? "url(img/t_check2.gif)":"url(img/t_check0.gif)";
}

function checkPar(ownerCase,arr,check,items) {
	var j=arr.length;
	if (check) {
		while (--j>0) {
			arr=arr.slice(0,j);
			var o=document.getElementById(ownerCase+arr.join(".")+"_checkbox");
			o.checkedItems=Number(o.checkedItems)+items;
			if (o.checkedItems==Number(o.subItems)) {
				o.style.backgroundImage="url(img/t_check2.gif)";
			} else if (o.style.backgroundImage="url(img/t_check0.gif)") {
				o.style.backgroundImage="url(img/t_check1.gif)";
			}
		}
	} else {
		while (--j>0) {
			arr=arr.slice(0,j);
			var o=document.getElementById(ownerCase+arr.join(".")+"_checkbox");
			o.checkedItems=Number(o.checkedItems)-items;
			if (o.checkedItems==0) {
				o.style.backgroundImage="url(img/t_check0.gif)";
			} else if (o.style.backgroundImage="url(img/t_check2.gif)") {
				o.style.backgroundImage="url(img/t_check1.gif)";
			}
		}
	}
}

function clickCheckbox(p) {
	var id=p.id,i=id.lastIndexOf("$"),ownerCase=id.substr(0,i),arr=id.substring(i,id.length-9).split(".");

	if (p.type=="text")
		checkSub(p,p.style.backgroundImage=="url(img/t_check0.gif)",ownerCase,arr);
	else
		checkPar(ownerCase,arr,p.checked,1);
}
