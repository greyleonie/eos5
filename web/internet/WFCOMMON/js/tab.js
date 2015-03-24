var active_start_img="img/tab/top_active_start_tab.gif"
var active_img="img/tab/top_active_tab_button.gif"
var active_left_img="img/tab/top_active_left.gif"
var active_right_img="img/tab/top_active_right.gif"
var active_end_img="img/tab/top_active_end_tab.gif"
var deactive_start_img="img/tab/top_start_tab.gif"
var deactive_img="img/tab/top_tab_button.gif"
var deactive_left_img="img/tab/top_tab.gif"
var deactive_right_img="img/tab/top_tab.gif"
var deactive_end_img="img/tab/top_end_tab.gif"

function settyle(id){
	var length = Panes_tab1.length;
	for (i=0;i<length;i++)
	{
	var tab = "_TAB_ID"+i+".appTab_A";
	var ele=document.getElementById(tab);
	if (ele != null)	
	ele.style.color = "white";
	var tab2 = "_TAB_ID"+i+".handleCtn_A";
	var ele2=document.getElementById(tab2);
	if (ele2 != null)
	ele2.style.color = "white";
	}
	var ele=document.getElementById(id);
	ele.style.color = "black";
}
function showPane(name){

    var id="_PANEL"+name;

    document.getElementById("TAB_ACTIVE_INDEX"+name.substr(name.indexOf("."))).value=name.substr(7);

    hidePanesExcept(id);

    var ele=document.getElementById(id);

    ele.style.visibility = "visible";
    
    ele.style.position = "static";
    var selectCell=document.getElementById(name);
    if(preSelect == null)
  	preSelect=document.getElementById("_TAB_ID0");
    deActiveTab(preSelect);
    setActiveTab(selectCell);
    preSelect = selectCell;
}
function setActiveTab(cell){
	//with(cell.style) {
	//		a.Color="black";
	//}
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
	//with(cell.style) {
	//		a.Color="white";
	//}
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
function hidePanesExcept(id){

    for(var i=0; i<Panes_tab1.length; i++){

	if( Panes_tab1[i]!=id ) {
	var ele=document.getElementById(Panes_tab1[i]);
		ele.style.visibility = "hidden";
		ele.style.position = "absolute";
	}
    }

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
    if( cell.lastTab=="true" ) return true;
    else return false;
}
function cellIsFirstTab(cell){
    if( cell.firstTab=="true" ) return true;
else return false;
}
