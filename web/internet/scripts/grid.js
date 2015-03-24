function goverRow(p) {
	var src=event.srcElement;
	if (src && (src.tagName=="INPUT" && src.parentNode.rowSpan>1) || (src.tagName=="TD" && src.rowSpan>1))
		return;
	if (selected[p.ownerCase]!=p.sectionRowIndex)
		p.className="listRowHigh";
}
function goutRow(p) {
	var src=event.srcElement;
	if (src && (src.tagName=="INPUT" && src.parentNode.rowSpan>1) || (src.tagName=="TD" && src.rowSpan>1))
		return;
	if (selected[p.ownerCase]!=p.sectionRowIndex)
		p.className="listRow1";
}
function gclickRow(p) {
	var src=event.srcElement;
	if (src && src.tagName=="TD" && src.rowSpan>1)
		return;
	var i=p.sectionRowIndex,j=selected[p.ownerCase];
	if (j!=i) {
		p.parentNode.rows[j].className="listRow1";
		p.className="listRowSelected";
		selected[p.ownerCase]=i;
	}
}
function gridAddRow(p,q,b) {
	var tbody=document.getElementById(p).tBodies[0];
	var pt=selected[p];
	var oldRow=tbody.rows[pt];
	var newRow=oldRow.cloneNode(true);
	var cols=q || window[p+"Columns"];
	for (var i in cols) {
		var fld=newRow.all(p+"."+i);
		fld.value=cols[i];
		if (fld.onchange)
			fld.onchange();
	}
	if (b) {
		oldRow.insertAdjacentElement("beforeBegin",newRow);
		oldRow.className="listRow1";
		var n=pt,m=Number(oldRow.all(p+"._seqnum").innerText);
	} else {
		tbody.insertAdjacentElement("beforeEnd",newRow);
		newRow.onclick();
		var n=0,m=1;
	}
	var indexs=document.getElementsByName(p+"._seqnum");
	for (;n<indexs.length;n++) {
		var t=indexs[n];
		if (t.parentNode.style.display!="none") {
			t.innerText=m++;
		}
	}
	var i=0,cells=newRow.cells;
	for (var i=0;i<cells.length;i++) {
		var cell=cells[i];
		var fld=cell.firstChild;
		if (fld && (fld.type=="text" || fld.tagName=="TEXTAREA") && fld.nodeName!="#text" && !fld.readOnly) {
			break;
		}
	}
	if (fld && (fld.type=="text" || fld.tagName=="TEXTAREA") && fld.nodeName!="#text" && !fld.readOnly)
		fld.focus();
}
function gridInsertRow(p,q) {
	gridAddRow(p,q,true);
}
function gridDeleteRow(p) {
	var tbody=document.getElementById(p).tBodies[0];
	var i=selected[p];
	var oldRow=tbody.rows[i];
	doDeleteRow(p,oldRow,i,tbody);
}
function gridReset(p) {
	var tbody=document.getElementById(p).tBodies[0];
	var rows=tbody.rows,len=rows.length;
	for (var i=0;i<len;i++) {
		var row=rows[i];
		if (row.all(p+"._deltag").value!="true") {
			doDeleteRow(p,row,i,tbody);
		}
	}
}
function doDeleteRow(p,oldRow,i,tbody) {
	var m;
	do {
		var newRow=tbody.rows[++i];
	}
	while(newRow && newRow.className=="listRow1" && newRow.style.display=="none");
	if (newRow)
		m=Number(oldRow.all(p+"._seqnum").innerText);
	else {
		i=selected[p];
		do {
			var newRow=tbody.rows[--i];
		}
		while(newRow && newRow.className=="listRow1" && newRow.style.display=="none");
	}
	if (newRow) {
		m=m || Number(newRow.all(p+"._seqnum").innerText);
		newRow.onclick();
		oldRow.all(p+"._deltag").value="true";
		oldRow.style.display="none";
		var indexs=document.getElementsByName(p+"._seqnum");
		for (var n=i;n<indexs.length;n++) {
			var t=indexs[n];
			if (t.parentNode.style.display!="none") {
				t.innerText=m++;
			}
		}
	} else {
		gridAddRow(p);
		oldRow.onclick();
		gridDeleteRow(p);
	}
}