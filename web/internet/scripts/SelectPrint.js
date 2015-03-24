function SelectPrint(objectName, displayId, printPaper, fontSize, pageLines, data, titles)
{
	// 记录对象状态
	this.objectName = objectName;
	this.displayId = displayId;
	this.printPaper = printPaper;
	this.fontSize = fontSize;
	this.pageLines = pageLines;
	this.data = data;
	this.titles = titles;
	this.totalLines = data.length;
	this.totalPages = parseInt("" + ((this.totalLines - 1) / pageLines)) + 1;
	this.startPage = 1;
	this.endPage = this.totalPages;
	// 发布公有方法
	this.layout = SelectPrint_layout;
	this.pageLinesChanged = SelectPrint_pageLinesChanged;
	this.sizeRadioChecked = SelectPrint_sizeRadioChecked;
	this.startPrint = SelectPrint_startPrint;
	this.splitPrint = SelectPrint_splitPrint;
	this.getFontSize = SelectPrint_getFontSize;
	this.getPageLines = SelectPrint_getPageLines;
	this.getTotalPages = SelectPrint_getTotalPages;
	this.getStartPage = SelectPrint_getStartPage;
	this.getEndPage = SelectPrint_getEndPage;
	this.getTitleStyle = SelectPrint_getTitleStyle;
	this.getTextStyle = SelectPrint_getTextStyle;
	this.getTableTitleStyle = SelectPrint_getTableTitleStyle;
	this.getTableTextStyle = SelectPrint_getTableTextStyle;
	this.selectorChecked = SelectPrint_selectorChecked;
}

function SelectPrint_layout()
{
	var doc = "";
	//doc += "<table border=1 align=center width=90%><tr>";
	doc += "<table width=98% bgcolor='#E8ECEF' border=0 cellspacing=1 cellpadding=0 align='center' style='border-collapse:collapse;font-size:13px;'><tr>";
	doc += "<td nowrap class='text' colspan=4 align=left height=23 valign='middle'>【选择要打印的列】</td>"
	for (var index = 0; index < this.titles.length; index++) {
		if (index % 4 == 0)	doc += "</tr><tr>";
		var indexStr = (index<10) ? ("0"+index) : (""+index);
		doc += "<td nowrap class='text' width='25%'><input type='checkbox' id='__selector_" + indexStr + "' " + ((this.titles[index][1]) ? "checked" : "") + " onClick='" + this.objectName + ".selectorChecked(" + index + ")'>" + this.titles[index][0] + "</td>";
	}
	while (index % 4 != 0)	{
		doc += "<td nowrap class='text' width='25%'></td>";
		index++;
	}

	doc += "</tr><tr><td class='text' colspan=3  height=23 valign='middle'>【页数】&nbsp打印第&nbsp<input type='text' name='__startPage' value=" + this.startPage + " size=3 maxlength=4>&nbsp页至第&nbsp<input type='text' name='__endPage' value=" + this.endPage + " size=3 maxlength=4>&nbsp页，每页打印&nbsp<input type='text' name='__pageLines' value=" + this.pageLines + " size=3 maxlength=4 onKeyUp='" + this.objectName + ".pageLinesChanged()' onChange='" + this.objectName + ".pageLinesChanged()'>&nbsp行</td>";
	doc += "<td width='25%' align=center class='text' rowspan=3>";
	doc += "<input type='button' value='取&nbsp&nbsp消' onClick='print()'><br><br>";
	doc += "<input type='button' value='打&nbsp&nbsp印' onClick='" + this.objectName + ".startPrint()'>";
	doc += "</td></tr>"
	doc += "<tr><td class='text' colspan=3  height=23 valign='middle'>【字体】&nbsp";
	doc += "<input type='radio' id='__sizeRadio_0' " + ((this.fontSize == 0) ? "checked" : "") + " onClick='" + this.objectName + ".sizeRadioChecked(0)'>&nbsp标准打印字体&nbsp&nbsp";
	doc += "<input type='radio' id='__sizeRadio_1' " + ((this.fontSize == -1) ? "checked" : "") + " onClick='" + this.objectName + ".sizeRadioChecked(1)'>&nbsp小号打印字体&nbsp&nbsp";
	doc += "<input type='radio' id='__sizeRadio_2' " + ((this.fontSize == 1) ? "checked" : "") + " onClick='" + this.objectName + ".sizeRadioChecked(2)'>&nbsp大号打印字体";
	doc += "</td></tr>";
	doc += "<tr><td class='text' colspan=3  height=23 valign='middle'>【备注】&nbsp" + this.printPaper + "</td></tr>";
	doc += "</table>"
	document.all.item(this.displayId).innerHTML = doc;
}

function SelectPrint_pageLinesChanged()
{
	this.pageLines = parseInt(document.all.item("__pageLines").value);
	if (isNaN(this.pageLines) || this.pageLines <= 0)  return;
	this.totalPages = 0;
	if (this.totalLines > 0)  this.totalPages = parseInt("" + ((this.totalLines - 1) / this.pageLines)) + 1;
	//if (isNaN(this.startPage) || this.startPage > this.totalPages)  
	document.all.item("__startPage").value =1; //this.totalPages;
	//if (isNaN(this.endPage) || this.endPage > this.totalPages)  
	document.all.item("__endPage").value = this.totalPages;
	this.startPage = parseInt(document.all.item("__startPage").value);
	this.endPage = parseInt(document.all.item("__endPage").value);
}

function SelectPrint_sizeRadioChecked(num)
{
	for (var index = 0; index <= 2; index++) {
		if (index == num)  document.all.item("__sizeRadio_" + index).checked = true;
		else  document.all.item("__sizeRadio_" + index).checked = false;
	}
}

function SelectPrint_selectorChecked(num)
{
	var indexStr = (num<10) ? ("0"+num) : (""+num);
	var idStr = "__selector_" + indexStr;

	if (document.all.item(idStr).checked) {
		this.titles[num][1] = true;
	} else {
		this.titles[num][1] = false;
	}
}

function SelectPrint_startPrint()
{
	// 检查是否至少选了一个列用于打印
	for (var index = 0; index < this.titles.length; index++) {
		if (this.titles[index][1]) break;
	}
	if (index >= this.titles.length) {
		window.alert("至少要选择一列用于打印！");
		document.all.item("__selector_00").focus();
		return;
	}
	// 保证每页打印行数正确
	this.pageLines = parseInt(document.all.item("__pageLines").value);
	if (isNaN(this.pageLines) || this.pageLines <= 0) {
		window.alert("指定的每页打印行数必须为正数！");
		document.all.item("__pageLines").focus();
		return;
	}
	document.all.item("__pageLines").value = this.pageLines;
	// 保证起止打印页号输入正确
	this.startPage = parseInt(document.all.item("__startPage").value);
	this.endPage = parseInt(document.all.item("__endPage").value);
	if (isNaN(this.startPage) || this.startPage <= 0) {
		window.alert("起始打印页号必须为正数！");
		document.all.item("__startPage").focus();
		return;
	}
	document.all.item("__startPage").value = this.startPage;
	if (isNaN(this.endPage) || this.endPage <= 0) {
		window.alert("终止打印页号必须为正数！");
		document.all.item("__endPage").focus();
		return;
	}
	document.all.item("__endPage").value = this.endPage;
	if (this.startPage > this.endPage) {
		window.alert("起始打印页号不可大于终止打印页号！");
		document.all.item("__startPage").focus();
		return;
	}
	// 保证根据当前每页打印行数的设置终止页号不越界
	this.totalPages = 0;
	if (this.totalLines > 0)  this.totalPages = parseInt("" + ((this.totalLines - 1) / this.pageLines)) + 1;
	if (this.endPage > this.totalPages) {
		window.alert("终止打印页号不可超过最大的可打印页号(" + this.totalPages + ")！");
		document.all.item("__endPage").focus();
		return;
	}
	// 打印字体选择
	this.fontSize = 0;
	if (document.all.item("__sizeRadio_1").checked)  this.fontSize = -1;
	else if (document.all.item("__sizeRadio_2").checked)  this.fontSize = 1;
	// 调用打印程序
	var printWindow = window.open("", "PrintWindow", "menubar=1,toolbar=0,location=0,directories=0,status=0,scrollbars=1,resizable=1");
	this.splitPrint(printWindow);
}

function SelectPrint_splitPrint(printWindow)
{
	// 输出标准的HTML头部
	printWindow.document.write("<html><head>");
	printWindow.document.write("<title>打印结果</title>");
	printWindow.document.write("<link rel=StyleSheet type='text/css' href='/utilities/css/printer.css'>");
	printWindow.document.write("</head><body>");
	// 逐行打印明细清单
	for (var row = 0; row < this.totalLines; row++) {
		// 跳过非指定的打印范围
		var currentPage = row / this.pageLines + 1;
		var currentPage = parseInt("" + (row / this.pageLines)) + 1;
		if ((currentPage < this.startPage) || (currentPage > this.endPage))  continue;
		// 自动分页时处理表头
		if (row % this.pageLines == 0) {
			// 开启一个打印页面（注意，最后的页不必以page-break封闭）
			if (currentPage != this.endPage)  printWindow.document.write("<div style='page-break-after: always'>");
			// 单据大标题
			printWindow.document.write(printHeader());
			// 表格的列头
			printWindow.document.write("<table width=100% align=center class='PrintTableStyle' border=1 cellspacing=0 style='border-collapse: collapse' bordercolor='#111111'>");
			printWindow.document.write("<thead class='" + this.getTableTitleStyle() + "'><tr>" + printTitle(this.titles) + "</tr></thead>");
			// 开启表体
			printWindow.document.write("<tbody align='center'>");
		}
		// 向表体中写入一行记录
		printWindow.document.write(printLine(this.data, row, this.titles));
		// 自动分页时处理表尾
		if ((row % this.pageLines == this.pageLines - 1) || (row == this.totalLines - 1)) {
			// 封闭表体和表格
			printWindow.document.write("</tbody></table>");
			// 单据脚注
			if(row == this.totalLines - 1)printWindow.document.write(printFooter());
			// 添加打印时间及页号作为尾注
			var date = (new Date());
			var printTime = date2string(date) + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
			if (currentPage == this.endPage) printWindow.document.write("<br>");
			printWindow.document.write("<table border=0 align=center width=95%><tr>");
			  printWindow.document.write("<td nowrap align=left class='PrintTableSmallTextStyle'>打印时间：" + printTime + "</td>");
			  printWindow.document.write("<td nowrap align=right class='PrintTableSmallTextStyle'>第 " + currentPage + "/" + this.totalPages + " 页</td>");
			printWindow.document.write("<tr></table>");
			// 封闭整个打印页面			
			if (currentPage != this.endPage)  printWindow.document.write("</div>");
		}
	}
	// 封闭HTML文档
	printWindow.document.write("</body></html>");
}

function SelectPrint_getFontSize()
{
	return this.fontSize;
}

function SelectPrint_getPageLines()
{
	return this.pageLines;
}

function SelectPrint_getTotalPages()
{
	return this.totalPages;
}

function SelectPrint_getStartPage()
{
	return this.startPage;
}

function SelectPrint_getEndPage()
{
	return this.endPage;
}

function SelectPrint_getTitleStyle()
{
	var style = "PrintTitleStyle";
	if (this.fontSize == -1)  style = "PrintSmallTitleStyle";
	else if (this.fontSize == 1)  style = "PrintBigTitleStyle";
	return style;
}

function SelectPrint_getTextStyle()
{
	var style = "PrintTextStyle";
	if (this.fontSize == -1)  style = "PrintSmallTextStyle";
	else if (this.fontSize == 1)  style = "PrintBigTextStyle";
	return style;
}

function SelectPrint_getTableTitleStyle()
{
	var style = "PrintTableTitleStyle";
	if (this.fontSize == -1)  style = "PrintTableSmallTitleStyle";
	else if (this.fontSize == 1)  style = "PrintTableBigTitleStyle";
	return style;
}

function SelectPrint_getTableTextStyle()
{
	var style = "PrintTableTextStyle";
	if (this.fontSize == -1)  style = "PrintTableSmallTextStyle";
	else if (this.fontSize == 1)  style = "PrintTableBigTextStyle";
	return style;
}

function printTitle(titles)
{
	var returnString="";
	for (var index = 0; index < titles.length; index++) {
		if (titles[index][1])returnString+=("<th>"+titles[index][0]+"</th>");
	}
	return returnString;
}

function printLine(data,row,titles)
{
	var returnString="<tr>";	
	for (var index = 0; index < titles.length; index++) {
		if (titles[index][1]){			
			returnString+=("<td>"+data[row][index]+"</td>");
		}
	}
	returnString+="</tr>";
	return returnString;
}
