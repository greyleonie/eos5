/**
  * ���ܣ��ı�ʱ�����ʾ��ʽ����20050702 �ı�Ϊ 2005-07-02
  * �÷���changeTimeFormat('<bean:write id="ResultSet" property="YW_MEDSTOCKINLIST/IN_DATE"/>' );
  * ���ߣ����µ�
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
  * ���ܣ��õ���ǰ�����ڣ���ʽ�磺2005��7��2��
  * �÷���getCurDate()
  * ���ߣ���־��
  */
function getCurDate()
{
	var curDate = new Date();
	var curYear = curDate.getFullYear();
	var curMonth = curDate.getMonth() + 1;
	var curDay = curDate.getDate();
	document.write("��ǰʱ�䣺" +curYear + "��" + curMonth + "��" + curDay + "��");
}

/**
  * ���ܣ��õ���ǰ�����ڣ���ʽ�磺200500702
  * �÷���getCurDateValue()
  * ��;�������ڿؼ���Ҫ��ǰ���ڵ�ʱ�򣬾Ϳ���ʹ�øú���
  * ���ߣ����µ�
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
  * ���ܣ��õ���ǰ�����ڣ���ʽ�磺2005-07-02
  * �÷���getCurDateValue()
  * ��;�������ڿؼ���Ҫ��ǰ���ڵ�ʱ�򣬾Ϳ���ʹ�øú���
  * ���ߣ����µ�
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
  * ���ܣ��õ���ǰ������ʱ�䣬��ʽ�磺2005-07-02 20:42:30
  * �÷���getCurDateTimeValue()
  * ���ߣ����µ�
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
  * ���ܣ�ȫѡ��ѡ��
  * �÷������б�ҳ���'ѡ��'��Ϊ
  *		 '<input type="checkbox" name="chkall" value="ON"  onClick="javascript:CheckAll(this.form)">ȫѡ'
  * ���ߣ���־��
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
  * ������Ϣ�л�ʱ�����Ӧ�¼�
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
  * ҳ�浼��
  * ������
  *     strURL -- Ŀ�ĵ�ַ
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
  * ���ܣ�ʵ�ֶβ�ѯ��ģ����ѯ
  * �÷���
  		  �����ѯ��queryForm ��inputForm ���������£�
  		  <form action="" name="queryForm">
  		    <html:hidden property="YW_MEDINFO/PRICE_B[@criteria='between']"/>
  		    <html:hidden property="YW_MEDINFO/MED_NO[@criteria='like']"/>
  		    <html:hidden property="YW_MEDINFO/MED_CAT"/>
  		  </form>
  		  <form action="" name="inputForm">
  		    ��<html:text styleClass="input_text" name="YW_MEDINFO/PRICE_S_FROM" size="6" />
            ��<html:text styleClass="input_text" name="YW_MEDINFO/PRICE_S_TO" size="6" />
            
            <html:text styleClass="input_text" name="YW_MEDINFO/MED_NO" size="12" />
            <dict:select businTypeId="YWYX_MedType" property="YW_MEDINFO/MED_CAT" />
  		  </form>
  		  ��ô���ڲ�ѯ��ʱ���÷����£�
  		  var inputForm = document.inputForm;
    	  var queryForm = document.queryForm;
    	  // �β�ѯ
		  setBetweenValue(inputForm, queryForm, "YW_MEDINFO/PRICE_B");
    	  // ģ����ѯ
    	  setLikeValue(inputForm, queryForm, "YW_MEDINFO/MED_NO");
    	  // �򵥵ؽ�inputForm�еĿؼ���ֵ����queryForm�У�������ģ����ѯ��ֻҪ��ȷ��ѯ
    	  // ������һЩselect�ؼ�������Ҫ��ȷ��ѯ���ֶ�
    	  setCommonValue(inputForm, queryForm, "YW_MEDINFO/MED_CAT");
  * ע�⣺�β�ѯ������input text������Ӧ�÷ֱ��� ***_FROM �� ***_TO ����ʽ
  * ���ߣ����µ�
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
  * ���ܣ�ʵ��һ����Χ�Ĳ�ѯ
  * �÷���
  * setDateRangeValue��ʵ�����ڷ�Χ��ѯ
  * setDateTimeRangeValue��ʵ������ʱ�䷶Χ��ѯ
  * setRangeValue��ʵ����ͨ���ݵķ�Χ��ѯ
  * ���ߣ����µ�
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
  * ���ܣ�ȥ���ַ���ǰ��Ŀո�
  * �÷���str = trim(str)
  * ���ߣ����µ�
  */
function trim(str) { 
  str = str.replace(/(^\s*)|(\s*$)/g, "");
  return str; 
}

