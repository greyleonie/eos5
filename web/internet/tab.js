var active_start_img="images/top_active_start_tab.gif";
var active_img="images/top_active_tab_button.gif";
var active_left_img="images/top_active_left.gif";
var active_right_img="images/top_active_right.gif";
var active_end_img="images/top_active_end_tab.gif";

var deactive_start_img="images/top_start_tab.gif";
var deactive_img="images/top_tab_button.gif";
var deactive_left_img="images/top_tab.gif";
var deactive_right_img="images/top_tab.gif";
var deactive_end_img="images/top_end_tab.gif";

function setActivePane(ele){	
	ele.style.visibility = "visible";
	ele.style.position = "static";	
}

function deActivePane(ele){	
	ele.style.visibility = "hidden";
	ele.style.position = "absolute";	
}

function setActiveTab(cell){
	setCellBackground(cell,active_img);

	var row=getRowByCell(cell);
	
	var prev=getCellByIndex(row,cell.cellIndex-1);	
	var next=getCellByIndex(row,cell.cellIndex+1);
		
	
	if( cellIsFirstTab(cell) )
		setCellChildImgSrc(prev,0,active_start_img);
	else
		setCellChildImgSrc(prev,0,active_left_img);
	
	if( cellIsLastTab(cell) )
		setCellChildImgSrc(next,0,active_end_img);
	else
		setCellChildImgSrc(next,0,active_right_img);
}

function deActiveTab(cell){
	setCellBackground(cell,deactive_img);

	var row=getRowByCell(cell);
	
	var prev=getCellByIndex(row,cell.cellIndex-1);	
	var next=getCellByIndex(row,cell.cellIndex+1);
		
	
	if( cellIsFirstTab(cell) )
		setCellChildImgSrc(prev,0,deactive_start_img);
	else
		setCellChildImgSrc(prev,0,deactive_left_img);
	
	if( cellIsLastTab(cell) )
		setCellChildImgSrc(next,0,deactive_end_img);
	else
		setCellChildImgSrc(next,0,deactive_right_img);	
}

function getRowByCell(cell){
	return cell.parentElement;
}

function getCellByIndex(row,index){
	return row.cells[index];
}

function setCellBackground(cell,img_url){
	cell.background=img_url;	
}

function setCellChildImgSrc(cell,child_index,img_url){
	if( cell.children.length>child_index ){
		cell.children[child_index].src = img_url;
	}
}

function cellIsLastTab(cell){
	var row = getRowByCell(cell);
	var _cell = getCellByIndex(row,cell.cellIndex+2);
	if( _cell.id=="last" ) return true;
	else return false;
}

function cellIsFirstTab(cell){
	var row = getRowByCell(cell);
	var _cell = getCellByIndex(row,cell.cellIndex-2);
	if( !_cell ) return true;
	
	else return false;	
}