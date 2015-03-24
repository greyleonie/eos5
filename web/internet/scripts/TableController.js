function selectRow(thisObject){
    if(selectedRow != null){
        selectedRow.value = "unselected";
        selectedRow.style.backgroundColor = "";
    }
    thisObject.value = "selected";
    //thisObject.style.backgroundColor = "#A5C7DE";
    thisObject.style.backgroundColor = "FFCF00";
    selectedRow = thisObject;
    ///
    try{
	   selectedRow.children[0].children[1].checked="true";
	}
	catch(Exception){}
}

function mouseoverRow(thisRow){
	/*
    thisRow.style.backgroundColor = "#3969E7";
    thisRow.style.color = "";
    */
}

function mouseoutRow(thisRow){
    /*
    if(thisRow.value == "unselected"){
        thisRow.style.backgroundColor = "";
        thisRow.style.color = "";
    }
    if(thisRow.value == "selected"){
        thisRow.style.backgroundColor = "#F5DD12";
        thisRow.style.color = "";
        }
    */
}

function selectCol(thisObject){
    if(selectedCol != null){
        selectedCol.value = "unselected";
        selectedCol.style.backgroundColor = "";
    }
    thisObject.value = "selected";
    thisObject.style.backgroundColor = "#3969E7";
    selectedCol = thisObject;
    try{
	   selectedCol.children[0].children[1].checked="true";
	}
	catch(Exception){}
}

function mouseoverCol(thisCol){
    thisCol.style.backgroundColor = "#3969E7";
    thisCol.style.color = "";
}

function mouseoutCol(thisCol){
    if(thisCol.value == "unselected"){
        thisCol.style.backgroundColor = "";
        thisCol.style.color = "";
    }
    if(thisCol.value == "selected"){
        thisCol.style.backgroundColor = "#3969E7";
        thisCol.style.color = "";
        }
}

function mouseoverTH(thisTH){
    thisTH.style.backgroundImage = "url(../Images/tabletitleover.gif)";
    thisTH.style.color = "#0000ff";
}

function mouseoutTH(thisTH){
    thisTH.style.backgroundImage = "url(../Images/tabletitleout.gif)";
    thisTH.style.color = "";
}