function doCollapse(p,toggle) {
	var id=p.id.substr(0,p.id.length-5);
	var next=document.all(id+"sub");
	if (next) {
		if (next.style.display=="none") {
			next.style.display="";
			document.all(id+"node").src="/internet/images/t_minus.gif";
			var icon=document.all(id+"icon");
			if (icon)
				icon.src="/internet/images/t_openfolder.gif";
		} else if (toggle){
			next.style.display="none";
			document.all(id+"node").src="/internet/images/t_plus.gif";
			var icon=document.all(id+"icon");
			if (icon)
				icon.src="/internet/images/t_folder.gif";
		}
	}
}

function list_style_tree_row_focus(p){
    with(p.style){
	if(background != "#d7eff8")
        background="#d7eff8";
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
//王锋添加
function expandByID(id) {
	//var tag = "$"+id+'_label';
	var tagarr = id.split(".");
	
	for (i=0;i<tagarr.length;i++)
	{
		var temp ="";
		for (j=0;j<=i;j++)
		{
			if (j>0) temp=temp+".";
			temp = temp + tagarr[j];
		}
		//alert(temp);
		var tmpid = "$"+temp+'_label';
		var obj=document.all(tmpid);
		doExpand(obj,true);
	}

}
function doExpand(p,toggle) {
	var id=p.id.substr(0,p.id.length-5);
	var next=document.all(id+"sub");
	if (next) {
		if (next.style.display=="none") {
			next.style.display="";
			document.all(id+"node").src="/internet/images/t_minus.gif";
			var icon=document.all(id+"icon");
			if (icon)
				icon.src="/internet/images/t_openfolder.gif";
		} 
		/**
		else if (toggle){
			next.style.display="none";
			document.all(id+"node").src="/internet/images/t_plus.gif";
			var icon=document.all(id+"icon");
			if (icon)
				icon.src="/internet/images/t_folder.gif";
		}
		**/
	}
}
//------------------- End---------------------------------------
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

function init()
{
//	alert("init");
	var obj = document.getElementsByName("treemenu_checkbox");
	for (i=0;i<obj.length;i++)
	{
		var objtmp = obj[i];
		if (objtmp.checked )
		{
			clickCheckbox(objtmp);
		}
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
//	alert("ownerCase="+ownerCase);
//	p.style.backgroundImage=check ? "url(/internet/images/t_check2.gif)":"url(/internet/images/t_check0.gif)";
//	p.checkedItems=check ? p.subItems:0;
	while (o=document.all(ownerCase+id.substr(0,id.length-9)+"."+i+"_checkbox")) {
//		alert("id="+id+"   "+id.substr(0,id.length-9)+"."+i+"_checkbox");
		if (o.type=="text") {
			checkSub(o,check,ownerCase);
		} else {
			if (o.checked!=check)
			{
			var oid=o.id,oi=oid.lastIndexOf("$"),oownerCase=oid.substr(0,oi),oarr=oid.substring(oi,oid.length-9).split(".");
            o.checked=check;
			checkPar(oownerCase,oarr,check,1);
			}
			//			o.checked=check;
		}
		i++;
	}
}

function checkPar(ownerCase,arr,check,items) {
	var j=arr.length;
	var allflag=false;
//	alert(j);
	if (check) {
		while (--j>0) {
			//周明修改----begin 2004/12/23
			var co = document.getElementById(ownerCase+arr.join(".")+"_checkbox");
			arr=arr.slice(0,j);
			var o=document.getElementById(ownerCase+arr.join(".")+"_checkbox");
			if (co.type=="text"){
               if(co.style.backgroundImage=="url(/internet/images/t_check2.gif)") o.checkedItems=Number(o.checkedItems)+items;
			}
			else{
				o.checkedItems=Number(o.checkedItems)+items;
			}
//if (o.id=="$1_checkbox")			alert(co.checkedItems+"==+++++++++c0="+Number(co.subItems));
//if (o.id=="$1_checkbox")			alert(o.checkedItems+"=+++++++++o="+Number(o.subItems));
	        //周明修改----end
//             alert("o.id="+o.id);
//			alert(o.checkedItems+"=="+Number(o.subItems));
			if (o.checkedItems==Number(o.subItems)) {
				o.style.backgroundImage="url(/internet/images/t_check2.gif)";
			} else if (o.style.backgroundImage="url(/internet/images/t_check0.gif)") {
				o.style.backgroundImage="url(/internet/images/t_check1.gif)";
			}
		}
	} else {
		while (--j>0) {
			//周明修改----begin 2004/12/23
//			alert(arr);
			var co = document.getElementById(ownerCase+arr.join(".")+"_checkbox");
///			alert(ownerCase+arr.join(".")+"_checkbox");
			arr=arr.slice(0,j);
			var o=document.getElementById(ownerCase+arr.join(".")+"_checkbox");
//			alert(o.id);
//			if (o.id=="$1_checkbox") alert("个个个个个----------个");
			if (co.type=="text"){
//if (o.id=="$1_checkbox")	alert(co.checkedItems+"-co-"+Number(co.subItems));
//if (o.id=="$1_checkbox")	alert(o.checkedItems+"-o-"+Number(o.subItems));
               //当前的节点刚从全部选中状态到一部分选中状态。
               if(allflag)
				{o.checkedItems=Number(o.checkedItems)-items;
			    allflag=false;
//if (o.id=="$1_checkbox")	 alert("taaaaaext");
				}
			}
			else {
				o.checkedItems=Number(o.checkedItems)-items;
			}
			//周明修改----end
//			alert(co.id+co.checkedItems+"=="+Number(co.subItems));
 //            alert("o.id="+o.id);
//			alert(o.checkedItems+"=="+Number(o.subItems));
			if (o.style.backgroundImage=="url(/internet/images/t_check2.gif)") allflag=true;
			if (o.checkedItems==0 ) {
//				if (o.style.backgroundImage=="url(/internet/images/t_check2.gif)") allflag=true;
				var t=1;
				o.style.backgroundImage="url(/internet/images/t_check0.gif)";
				while (tmpo=document.all(o.id.substr(0,o.id.length-9)+"."+t+"_checkbox")) {
//					alert(o.id.substr(0,o.id.length-9)+"."+t+"_checkbox");
					if (tmpo.type=="text") {
						if (tmpo.style.backgroundImage=="url(/internet/images/t_check1.gif)")
						{
							o.style.backgroundImage="url(/internet/images/t_check1.gif)";
						}
					} 
		            t++;
				}
			} else if (o.style.backgroundImage="url(/internet/images/t_check2.gif)") {
				o.style.backgroundImage="url(/internet/images/t_check1.gif)";
			}
		}
	}
}

function clickCheckbox(p) {
	var id=p.id,i=id.lastIndexOf("$"),ownerCase=id.substr(0,i),arr=id.substring(i,id.length-9).split(".");
//	alert("arr"+arr);
	if (p.type=="text"){
//			var flag ;
//		    if (p.style.backgroundImage=="url(/internet/images/t_check2.gif)") flag =true;
//             alert("texttexttexttext"+ownerCase);
	      	checkSub(p,p.style.backgroundImage!="url(/internet/images/t_check1.gif)" && p.style.backgroundImage!="url(/internet/images/t_check2.gif)",ownerCase,arr);
//			alert("p.checkedItems="+p.checkedItems);
//			var po=document.all(id.substr(0,id.length-11)+"_checkbox")
//			if (p.checkedItems==0 && flag){ 
//				alert("onc p.id="+p.id);
//				po.checkedItems=po.checkedItems-1;
//			}
//		    checkPar(ownerCase,arr,!(p.style.backgroundImage!="url(/internet/images/t_check1.gif)" && p.style.backgroundImage!="url(/internet/images/t_check2.gif)"),1);
	}
	else
		checkPar(ownerCase,arr,p.checked,1);
}

function  processOnClick(p) {
	var id=p.id
	alert(id);
	
}

function gotourl(url,targ)
	{
		if (targ == null || targ=="")
			parent.location=url;
		else
		{
			if (eval("parent."+targ) == null)
			{
				window.open(url);
			}
			else 
				eval("parent."+targ+".location=\""+url+"\"");
		}
}