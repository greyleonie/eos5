/**
  * 功能：改变时间的显示方式，由20050702 改变为 2005-07-02
  * 用法：changeTimeFormat('<bean:write id="ResultSet" property="YW_MEDSTOCKINLIST/IN_DATE"/>' );
  * 作者：陈勇德
  */
function changeTimeFormat(timeValue) { 
	if(timeValue == null || timeValue == "")
	{
		document.write("&nbsp;");
		return;
	}
	var year = timeValue.substr(0, 4);
	var month = timeValue.substr(4, 2);
	var day = timeValue.substr(6, 2);
	document.write(year + "-" + month + "-" + day);
}
function changeTimeFormat2(timeValue) { 
	if(timeValue == null || timeValue == "")	
		return "";
	var year = timeValue.substr(0, 4);
	var month = timeValue.substr(4, 2);
	var day = timeValue.substr(6, 2);
	var date = year + "-" + month + "-" + day
	return date;
}

/**
  * 功能：得到当前的日期，形式如：2005年7月2日
  * 用法：getCurDate()
  * 作者：房志刚
  */
function getCurDate()
{
	var curDate = new Date();
	var curYear = curDate.getFullYear();
	var curMonth = curDate.getMonth() + 1;
	var curDay = curDate.getDate();
	document.write("当前时间：" +curYear + "年" + curMonth + "月" + curDay + "日");
}

/**
  * 功能：得到当前的日期，形式如：200500702
  * 用法：getCurDateValue()
  * 用途：当日期控件需要当前日期的时候，就可以使用该函数
  * 作者：陈勇德
  */
function getCurDateValue()
{
	var curDate = new Date();
	var curYear = curDate.getFullYear();
	var curMonth = curDate.getMonth() + 1;
	var curDay = curDate.getDate();
	if (parseInt(curMonth) < 10)
		curMonth = "0" + curMonth;
	if (parseInt(curDay) < 10)
		curDay = "0" + curDay;	
	return (curYear + curMonth + curDay);
}

/**
  * 功能：得到当前的日期，形式如：2005-07-02
  * 用法：getCurDateValue()
  * 用途：当日期控件需要当前日期的时候，就可以使用该函数
  * 作者：陈勇德
  */
function getCurDateValue2()
{
	var curDate = new Date();  
	var curYear = curDate.getFullYear();
	var curMonth = curDate.getMonth() + 1;
	var curDay = curDate.getDate();  
	if (parseInt(curMonth) < 10)
		curMonth = "0" + curMonth;
	if (parseInt(curDay) < 10)
		curDay = "0" + curDay;	
	return (curYear + "-" + curMonth + "-" + curDay);
}

/**
  * 功能：得到当前的日期时间，形式如：2005-07-02 20:42:30
  * 用法：getCurDateTimeValue()
  * 作者：陈勇德
  */
function getCurDateTimeValue()
{
	var curDate = new Date();  
	var curYear = curDate.getFullYear();
	var curMonth = curDate.getMonth() + 1;
	var curDay = curDate.getDate();  
	var curHour = curDate.getHours(); 
	var curMinute = curDate.getMinutes(); 
	var curSecond = curDate.getSeconds();
	if (parseInt(curMonth) < 10)
		curMonth = "0" + curMonth;
	if (parseInt(curDay) < 10)
		curDay = "0" + curDay;	
	if (parseInt(curHour) < 10)
		curHour = "0" + curHour;
	if (parseInt(curMinute) < 10)
		curMinute = "0" + curMinute;
	if (parseInt(curSecond) < 10)
		curSecond = "0" + curSecond;	
	return (curYear + "-" + curMonth + "-" + curDay + " " + curHour + ":" + curMinute + ":" + curSecond);
}

/**
  * 功能：全选复选框
  * 用法：将列表页面的'选择'改为
  *		 '<input type="checkbox" name="chkall" value="ON"  onClick="javascript:CheckAll(this.form)">全选'
  * 作者：房志刚
  */
function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if (e.type == "checkbox" && e.name != 'chkall') {
		  e.checked = form.chkall.checked;
		}
	}
}

/**
  * 多项信息切换时鼠标响应事件
  *
  */
function mouseOver(thisObject){  
	thisObject.style.cursor = "hand";
}

function mouseOut(thisObject){  
	thisObject.style.cursor = "default";
}

function mouseDown(thisObject){  
	thisObject.style.cursor = "inherit";
}

function mouseClick(thisObject){
	
	thisObject.style.cursor = "inherit";
}

/**
  * 页面导航
  * 参数：
  *     strURL -- 目的地址
  *
  */
function changeURL(strURL){
	window.navigate(strURL);
}

function changeURL(strURL,thisObject){	
	thisObject.style.cursor = "pointer";
	window.navigate(strURL);
}

/**
  * 功能：实现段查询和模糊查询
  * 用法：
  		  假设查询的queryForm 和inputForm 的内容如下：
  		  <form action="" name="queryForm">
  		    <html:hidden property="YW_MEDINFO/PRICE_B[@criteria='between']"/>
  		    <html:hidden property="YW_MEDINFO/MED_NO[@criteria='like']"/>
  		    <html:hidden property="YW_MEDINFO/MED_CAT"/>
  		  </form>
  		  <form action="" name="inputForm">
  		    从<html:text styleClass="input_text" name="YW_MEDINFO/PRICE_S_FROM" size="6" />
            到<html:text styleClass="input_text" name="YW_MEDINFO/PRICE_S_TO" size="6" />
            
            <html:text styleClass="input_text" name="YW_MEDINFO/MED_NO" size="12" />
            <dict:select businTypeId="YWYX_MedType" property="YW_MEDINFO/MED_CAT" />
  		  </form>
  		  那么，在查询的时候，用法如下：
  		  var inputForm = document.inputForm;
    	  var queryForm = document.queryForm;
    	  // 段查询
		  setBetweenValue(inputForm, queryForm, "YW_MEDINFO/PRICE_B");
    	  // 模糊查询
    	  setLikeValue(inputForm, queryForm, "YW_MEDINFO/MED_NO");
    	  // 简单地将inputForm中的控件的值传到queryForm中，但不用模糊查询，只要精确查询
    	  // 适用于一些select控件或者是要精确查询的字段
    	  setCommonValue(inputForm, queryForm, "YW_MEDINFO/MED_CAT");
  * 注意：段查询的两个input text的名称应该分别是 ***_FROM 和 ***_TO 的形式
  * 作者：陈勇德
  */
function setBetweenValue(inputForm, queryForm, elementName) {
	var fromName = elementName + "_FROM";
	var toName = elementName + "_TO";
	var objName = elementName + "[@criteria='between']";
	var fromValue = inputForm.elements[fromName].value;
	var toValue = inputForm.elements[toName].value;
	
	if(fromValue!=null && fromValue!="" && toValue!=null && toValue!="")
		queryForm.elements[objName].value=fromValue+":"+toValue;
	else if((fromValue==null || fromValue=="") && (toValue==null || toValue=="")) 
		queryForm.elements[objName].value="";
	else if(toValue==null || toValue=="")
		queryForm.elements[objName].value=fromValue+":"+fromValue;		
	else if(fromValue==null || fromValue=="")
		queryForm.elements[objName].value=toValue+":"+toValue;
}
function setLikeValue(inputForm, queryForm, elementName) {
	var objName = elementName + "[@criteria='like']";
	var elementValue = inputForm.elements[elementName].value;
	
	if(elementValue!=null && elementValue!="")
		queryForm.elements[objName].value="%"+elementValue+"%";    	
	else
		queryForm.elements[objName].value="";   
}
function setCommonValue(inputForm, queryForm, elementName) {
	var elementValue = inputForm.elements[elementName].value;
	
    if(elementValue!=null && elementValue!="")
    	queryForm.elements[elementName].value = elementValue;
    else
    	queryForm.elements[elementName].value = "";
}
function setLengthValue(inputForm, queryForm, elementName) {
	var elementValue = inputForm.elements[elementName].value;
	
    if(elementValue!=null && elementValue!="") {
    	queryForm.elements[elementName].value = elementValue;
    }
    else {
    	queryForm.elements[elementName].value = "10";
    }
}

function setDateBetweenValue(inputForm, queryForm, elementName) {
	var fromName = elementName + "_FROM";
	var toName = elementName + "_TO";
	var objName = elementName + "[@criteria='between'][@pattern='yyyy-MM-dd'][@criteriaPattern='yyyy-MM-dd']";
	var fromValue = inputForm.elements[fromName].value;
	var toValue = inputForm.elements[toName].value;

	if(fromValue!=null && fromValue!="" && 
	toValue!=null && toValue!="")
		queryForm.elements[objName].value=fromValue+":"+toValue;
	else if((fromValue==null || fromValue=="") && 
	(toValue==null || toValue=="")) 
		queryForm.elements[objName].value="";
	else if(toValue==null || toValue=="")
		queryForm.elements[objName].value=fromValue+":"+fromValue;		
	else if(fromValue==null || fromValue=="")
		queryForm.elements[objName].value=toValue+":"+toValue;

}


/**
  * 功能：实现一个范围的查询
  * 用法：
  * setDateRangeValue：实现日期范围查询
  * setDateTimeRangeValue：实现日期时间范围查询
  * setRangeValue：实现普通数据的范围查询
  * 作者：陈勇德
  **/
function setDateRangeValue(inputForm, queryForm, elementName) {
	var fromName = elementName + "_FROM";
	var toName = elementName + "_TO";
	var fromName2 = elementName + "[@criteria='>='][@pattern='yyyy-MM-dd'][@criteriaPattern='yyyy-MM-dd']";
	var toName2 = elementName + "[@criteria='<='][@pattern='yyyy-MM-dd'][@criteriaPattern='yyyy-MM-dd']";
	var fromValue = inputForm.elements[fromName].value;
	var toValue = inputForm.elements[toName].value;

	if(fromValue!=null)
		queryForm.elements[fromName2].value = fromValue;
	if(toValue!=null)
		queryForm.elements[toName2].value = toValue;
}

function setDateTimeRangeValue(inputForm, queryForm, elementName) {
	var fromName = elementName + "_FROM";
	var toName = elementName + "_TO";
	var fromName2 = elementName + "[@criteria='>='][@pattern='yyyy-MM-dd hh:mm:ss'][@criteriaPattern='yyyy-MM-dd hh:mm:ss']";
	var toName2 = elementName + "[@criteria='<='][@pattern='yyyy-MM-dd hh:mm:ss'][@criteriaPattern='yyyy-MM-dd hh:mm:ss']";
	var fromValue = inputForm.elements[fromName].value;
	var toValue = inputForm.elements[toName].value;

	if(fromValue!=null)
		queryForm.elements[fromName2].value = fromValue;
	if(toValue!=null)
		queryForm.elements[toName2].value = toValue;
}

function setRangeValue(inputForm, queryForm, elementName) {
	var fromName = elementName + "_FROM";
	var toName = elementName + "_TO";
	var fromName2 = elementName + "[@criteria='>=']";
	var toName2 = elementName + "[@criteria='<=']";
	var fromValue = inputForm.elements[fromName].value;
	var toValue = inputForm.elements[toName].value;

	if(fromValue!=null)
		queryForm.elements[fromName2].value = fromValue;
	if(toValue!=null)
		queryForm.elements[toName2].value = toValue;
}

/**
  * 功能：去除字符串前后的空格
  * 用法：str = trim(str)
  * 作者：陈勇德
  */
function trim(str) { 
  str = str.replace(/(^\s*)|(\s*$)/g, "");
  return str; 
}

