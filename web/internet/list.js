function overRow(p) {
	if(p.className=="listRowSelected")
    		return;
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;
	if (selected[p.ownerCase]!=p.sectionRowIndex)
		p.className="listRowHigh";
}
function outRow(p) {
      	if(p.className=="listRowSelected")
    		return;
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;
	if (selected[p.ownerCase]!=p.sectionRowIndex)
		p.className=p.sectionRowIndex%2 ? "listRow2":"listRow1";
}

function single_list_clickRow(p) {

	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;

	var i=p.sectionRowIndex-1,j=selected[p.ownerCase];

	if(p.className != "listRowSelected"){

		var check=document.getElementsByName(p.ownerCase+"_switch")[i];

		var pks=check.value ? check.value.split(','):[];

//		document.getElementsByName(p.ownerCase+"_switch")[j].checked=false;
		p.parentNode.rows[j+1].className=j%2 ? "listRow2":"listRow1";;

		for (var k=0;k<pks.length;k++) {

			var arr=document.getElementsByName(pks[k]);

			arr[j].disabled=true;
			arr[i].disabled=false;
		}

		p.className="listRowSelected";
		check.checked=true;

	}selected[p.ownerCase]=i;
}

function multi_list_clickRow(p) {
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1 )
		return;

	var i=p.sectionRowIndex-1;

	var check=document.getElementsByName(p.ownerCase+"_switch")[i];

	var pks=check.value ? check.value.split(','):[];

        if(check.checked){
        	check.checked = false;
                p.className=i%2 ? "listRow2":"listRow1";

                for (var k=0;k<pks.length;k++) {
                	document.getElementsByName(pks[k])[i].disabled = true;
                }
        }
        else{
        	check.checked = true;
                p.className="listRowSelected";
                for (var k=0;k<pks.length;k++) {
                	document.getElementsByName(pks[k])[i].disabled = false;
                }
        }

}



function moverRow(p) {
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;
	if (!selected[p.ownerCase]["$"+p.sectionRowIndex])
		p.className="listRowHigh";
}
function moutRow(p) {
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;
	if (!selected[p.ownerCase]["$"+p.sectionRowIndex])
		p.className=p.sectionRowIndex%2 ? "listRow2":"listRow1";
}
function mclickRow(p) {
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;
	var i=p.sectionRowIndex,ownerCase=p.ownerCase,sc=selected[ownerCase];
	var switchs=document.getElementsByName(ownerCase+"_switch");
	var pks=switchs[0].value ? switchs[0].value.split(','):[],key="$"+i;
	if (sc[key]) {
			switchs[i].checked=false;
			p.className=i%2 ? "listRow2":"listRow1";
			for (var k=0;k<pks.length;k++)
				document.getElementsByName(pks[k])[i].disabled=true;
			delete sc[key];
	} else {
			switchs[i].checked=true;
			p.className="listRowSelected";
			for (var k=0;k<pks.length;k++)
				document.getElementsByName(pks[k])[i].disabled=false;
			sc[key]=key;
	}
	var m=0;
	for (var n in sc)
		m++;
	document.getElementById(ownerCase+"_switchAll").checked=m==switchs.length;
}

function switchAll(p) {
	var id=p.id;
	var switchs=document.getElementsByName(id.substr(0,id.length-3));
	if (!switchs.length) {
		p.checked=false;
		return;
	}
	var pks=switchs[0].value? switchs[0].value.split(','):[],ownerCase=switchs[0].parentNode.parentNode.ownerCase,sc=selected[ownerCase];
	for (var i=0;i<switchs.length;i++) {
		var j=switchs[i];
		j.checked=p.checked;
		var row=j.parentNode.parentNode;
		var key="$"+i;
		if (p.checked) {
			if (!sc[key]) {
				sc[key]=key;
				row.className="listRowSelected";
				for (var k=0;k<pks.length;k++)
					document.getElementsByName(pks[k])[i].disabled=false;
			}
		} else {
			if (sc[key]) {
				delete sc[key];
				row.className=i%2 ? "listRow2":"listRow1";
				for (var k=0;k<pks.length;k++)
					document.getElementsByName(pks[k])[i].disabled=true;
			}
		}
	}
}
function checkSelectedRows(listName) {
 	var i=selected[listName];
 	if (typeof i=="number") {
 		if (i!=-1)
 			return 1;
 		else
 			return 0;
 	} else {
 		var j=0;
 		for (var key in i)
 			j++;
 		return j;
	}
}
function gotoPage(n, listName) {
	var frm=document.forms('mainForm');
	var fld=frm(listName+".targetPage");
	var num=Number(fld.value);
    switch (n) {
		case 1:
            if(num>1)
				fld.value=num-1;
			break;
		case 2:
			fld.value=1;
			break;
		case 3:
			fld.value=frm(listName+".allPages").value;
			break;
		case 4:
			if(num<Number(frm(listName+".allPages").value))
				fld.value=num+1;
			break;
		default:
			fld.value=n.value;
			break;
	}
	var action=document.getElementById(listName).action;
	commit(action || "search");
}
function setListRowsColor(listName,exp){
	var reg=/F\([\w\.]+\)/g;
	var flds=exp.match(reg),doms=[],indexs=[];
	for (var i=0;i<flds.length;i++)
	{
		var j=flds[i];
		var fldsDom=document.getElementsByName(listName+"."+j.substring(2,j.length-1)+".head");
		if (fldsDom[0].tagName!="TD")
			doms[doms.length]=[j,fldsDom];
		else
			indexs[indexs.length]=[j,fldsDom[0].cellIndex];
	}
	var colorPair=eval(listName+"_colorPair");
	var rows=document.getElementById(listName).tBodies[0].rows;
	for (var i=0;i<rows.length;i++)
	{
		var tmp=exp;
		var row=rows[i];
		for (var j=0;j<doms.length;j++)
		{
			var k=doms[j];
			var index=row.sectionRowIndex;
			tmp=tmp.replace(k[0],k[1][index].value);
		}
		for (var j=0;j<indexs.length;j++)
		{
			var k=indexs[j];
			tmp=tmp.replace(k[0],row.cells[k[1]].innerText);
		}
		if (/[\+\-\*\/]/g.test(tmp) || !isNaN(Number(tmp)))
			tmp=eval(tmp);
		var color=colorPair[tmp];
		if (color)
			row.style.backgroundColor=color;
	}
}
