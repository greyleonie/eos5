/*
-------------------------------------------------------------------------------
文件名称：check.js
说    明：JavaScript脚本，用于检查网页提交表单的输入数据
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间		修改人		说明
2002-8-29	libo		创建
2004-03-08  xueyishan    修改,加入checkMobile()
2005-06-01  zhouming    修改了isDate()，支持格式
------------------------------------------------------------------------------- 	
*/

/*
用途：校验ip地址的格式
输入：strIP：ip地址
返回：如果通过验证返回true,否则返回false；	
*/
function isIP(strIP) { 
        if (isNull(strIP)) return false;
	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //匹配IP地址的正则表达式
	if(re.test(strIP))
	{
	 if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) return true;
	}
	return false; 
} 

/*
用途：检查输入字符串是否为空或者全部都是空格
输入：str
返回：
	如果全是空返回true,否则返回false
*/
function isNull( str ){
	if ( str == "" ) return true;
	var regu = "^[ ]+$";
	var re = new RegExp(regu);
	return re.test(str);
}


/*
用途：检查输入对象的值是否符合整数格式
输入：str 输入的字符串
返回：如果通过验证返回true,否则返回false	
*/
function isInteger( str ){  
	var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(str);
}

/*
用途：检查输入手机号码是否正确
输入：
	s：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function checkMobile( s ){   
	var regu =/^[1][3][0-9]{9}$/;
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}
 
 
/*
用途：检查输入字符串是否符合正整数格式
输入：
	s：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function isNumber( s ){   
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	if (s.search(re) != -1) {
	   return true;
	} else {
	   return false;
	}
}

/*
用途：检查输入字符串是否是带小数的数字格式,可以是负数
输入：
	s：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function isDecimal( str ){   
         if(isInteger(str)) return true;
	var re = /^[-]{0,1}(\d+)[\.]+(\d+)$/;
	if (re.test(str)) {
	   if(RegExp.$1==0&&RegExp.$2==0) return false;
	   return true;
	} else {
	   return false;
	}
}

/*
用途：检查输入对象的值是否符合端口号格式
输入：str 输入的字符串
返回：如果通过验证返回true,否则返回false	
*/
function isPort( str ){  
	return (isNumber(str) && str<65536);
}

/*
用途：检查输入对象的值是否符合E-Mail格式
输入：str 输入的字符串
返回：如果通过验证返回true,否则返回false	
*/
function isEmail( str ){  
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/; 
	if(myReg.test(str)) return true; 
	return false; 
}

/*
用途：检查输入字符串是否符合金额格式
	格式定义为带小数的正数，小数点后最多三位
输入：
	s：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function isMoney( s ){   
	var regu = "^[0-9]+[\.][0-9]{0,3}$";
	var re = new RegExp(regu);
	if (re.test(s)) {
	   return true;
	} else {
	   return false;
	}
}
/*
用途：检查输入字符串是否只由英文字母和数字和下划线组成
输入：
	s：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function isNumberOr_Letter( s ){    //判断是否是数字或字母
	var regu = "^[0-9a-zA-Z\_]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}
/*
用途：检查输入字符串是否只由英文字母和数字组成
输入：
	s：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function isNumberOrLetter( s ){    //判断是否是数字或字母
	var regu = "^[0-9a-zA-Z]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}
 /*
用途：检查输入字符串是否只由汉字、字母、数字组成
输入：
	value：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function isChinaOrNumbOrLett( s ){    //判断是否是汉字、字母、数字组成
	var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";   
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}

/*
用途：判断是否是日期
输入：date：日期；fmt：日期格式
返回：如果通过验证返回true,否则返回false
*/
function isDate( date, fmt ) {
    if (fmt==null) fmt="yyyyMMdd";
    var yIndex = fmt.indexOf("yyyy");
    if(yIndex==-1) return false;
   var year = date.substring(yIndex,yIndex+4);
   var mIndex = fmt.indexOf("MM");
    if(mIndex==-1) return false;
   var month = date.substring(mIndex,mIndex+2);
   var dIndex = fmt.indexOf("dd");
    if(dIndex==-1) return false;
   var day = date.substring(dIndex,dIndex+2);
    if(!isNumber(year)||year>"2100" || year< "1900") return false;
    if(!isNumber(month)||month>"12" || month< "01") return false;
    if(day>getMaxDay(year,month) || day< "01") return false;
    return true;
}

function getMaxDay(year,month) {
	if(month==4||month==6||month==9||month==11)
		return "30";
	if(month==2)
		if(year%4==0&&year%100!=0 || year%400==0)
			return "29";
		else
			return "28";
	return "31";
}

/*
用途：字符1是否以字符串2结束
输入：str1：字符串；str2：被包含的字符串
返回：如果通过验证返回true,否则返回false	
*/
function isLastMatch(str1,str2)
{  
   var index = str1.lastIndexOf(str2);
   if(str1.length==index+str2.length) return true;
   return false;
}


/*
用途：字符1是否以字符串2开始
输入：str1：字符串；str2：被包含的字符串
返回：如果通过验证返回true,否则返回false	
*/
function isFirstMatch(str1,str2)
{  
   var index = str1.indexOf(str2);
   if(index==0) return true;
   return false;
}

/*
用途：字符1是包含字符串2
输入：str1：字符串；str2：被包含的字符串
返回：如果通过验证返回true,否则返回false	
*/
function isMatch(str1,str2)
{  
   var index = str1.indexOf(str2);
   if(index==-1) return false;
   return true;
}


/*
用途：检查输入的起止日期是否正确，规则为两个日期的格式正确，
	且结束如期>=起始日期
输入：
	startDate：起始日期，字符串
	endDate：结束如期，字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function checkTwoDate( startDate,endDate ) {
	if( !isDate(startDate) ) {
		alert("起始日期不正确!");
		return false;
	} else if( !isDate(endDate) ) {
		alert("终止日期不正确!");
		return false;
	} else if( startDate > endDate ) {
		alert("起始日期不能大于终止日期!");
		return false;
	}
	return true;
}

/*
用途：检查输入的Email信箱格式是否正确
输入：
	strEmail：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function checkEmail(strEmail) { 
	//var emailReg = /^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/; 
	var emailReg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	if( emailReg.test(strEmail) ){
		return true; 
	}else{
		alert("您输入的Email地址格式不正确！");
		return false; 
	}
}

/*
用途：检查输入的电话号码格式是否正确
输入：
	strPhone：字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function checkPhone( strPhone ) { 
	var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,10}$/; 
	var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
	var prompt = "您输入的电话号码不正确!"
	if( strPhone.length > 9 ) {
		if( phoneRegWithArea.test(strPhone) ){
			return true; 
		}else{
			alert( prompt );
			return false; 
		}
	}else{
		if( phoneRegNoArea.test( strPhone ) ){
			return true; 
		}else{
			alert( prompt );
			return false; 
		}		
	}
}
 

/*
用途：检查复选框被选中的数目
输入：
	checkboxID：字符串
返回：
	返回该复选框中被选中的数目	
*/	
function checkSelect( checkboxID ) {
	var check = 0;
	var i=0;
	if( document.all(checkboxID).length > 0 ) { 
		for(  i=0; i<document.all(checkboxID).length; i++ ) {
			if( document.all(checkboxID).item( i ).checked  ) {
				check += 1;
			}				
		}
	}else{
		if( document.all(checkboxID).checked )
			check = 1;
	}
	return check;
}

function getTotalBytes(varField) {
	if(varField == null)
		return -1;
	
	var totalCount = 0;
	for (i = 0; i< varField.value.length; i++) {
		if (varField.value.charCodeAt(i) > 127) 
			totalCount += 2;
		else
			totalCount++ ;
	}
	return totalCount;
}

function getFirstSelectedValue( checkboxID ){
	var value = null;
	var i=0;
	if( document.all(checkboxID).length > 0 ){ 
		for(  i=0; i<document.all(checkboxID).length; i++ ){
			if( document.all(checkboxID).item( i ).checked ){
				value = document.all(checkboxID).item(i).value;
				break;
			}
		}
	} else {
		if( document.all(checkboxID).checked )
			value = document.all(checkboxID).value;
		}
	return value;
}	

function getFirstSelectedIndex( checkboxID ){
	var value = -2;
	var i=0;
	if( document.all(checkboxID).length > 0 ){ 
		for(  i=0; i<document.all(checkboxID).length; i++ ) {
			if( document.all(checkboxID).item( i ).checked  ) {
				value = i;
				break;
			}
		}
	} else {
		if( document.all(checkboxID).checked )
			value = -1;
	}
	return value;
}
	
function selectAll( checkboxID,status )	{
	if( document.all(checkboxID) == null)
		return;

	if( document.all(checkboxID).length > 0 ){ 
		for(  i=0; i<document.all(checkboxID).length; i++ )	{
			document.all(checkboxID).item( i ).checked = status;
		}
	} else {
		document.all(checkboxID).checked = status;
	}
}

function selectInverse( checkboxID ) {
	if( document.all(checkboxID) == null)
		return;

	if( document.all(checkboxID).length > 0 ) { 
		for(  i=0; i<document.all(checkboxID).length; i++ ) {
			document.all(checkboxID).item( i ).checked = !document.all(checkboxID).item( i ).checked;
		}
	} else {
		document.all(checkboxID).checked = !document.all(checkboxID).checked;
	}
}

function checkDate( value ) {
	if(value=='') return true;
	if(value.length!=8 || !isNumber(value)) return false;  
	var year = value.substring(0,4);
	if(year>"2100" || year< "1900")	return false;
	
	var month = value.substring(4,6);
	if(month>"12" || month< "01") return false;
	
	var day = value.substring(6,8);
	if(day>getMaxDay(year,month) || day< "01") return false;
	
	return true;  
}

/*
用途：检查输入的起止日期是否正确，规则为两个日期的格式正确或都为空
	且结束日期>=起始日期
输入：
	startDate：起始日期，字符串
	endDate：  结束日期，字符串
返回：
	如果通过验证返回true,否则返回false	
*/
function checkPeriod( startDate,endDate ) {
	if( !checkDate(startDate) ) {
		alert("起始日期不正确!");
		return false;
	} else if( !checkDate(endDate) ) {
		alert("终止日期不正确!");
		return false;
	} else if( startDate > endDate ) {
		alert("起始日期不能大于终止日期!");
		return false;
	}
	return true;
}

/*
用途：检查证券代码是否正确
输入：
	secCode:证券代码
返回：
	如果通过验证返回true,否则返回false	
*/
function checkSecCode( secCode ) {
	if( secCode.length !=6 ){
		alert("证券代码长度应该为6位");
		return false;
	}
	
	if(!isNumber( secCode ) ){
		alert("证券代码只能包含数字");		
		return false;
  	 }
	return true;
}

/****************************************************
function	:	cTrim(sInputString,iType)
description	:	字符串去空格的函数
parameters	:	iType：	1=去掉字符串左边的空格
						2=去掉字符串左边的空格
						0=去掉字符串左边和右边的空格
return value:	去掉空格的字符串
****************************************************/
function cTrim(sInputString,iType)
{
	var sTmpStr = ' ';
	var i = -1;
	
	if(iType == 0 || iType == 1)
	{
		while(sTmpStr == ' ')
		{
			++i;
			sTmpStr = sInputString.substr(i,1);
		}
		sInputString = sInputString.substring(i);
	}	
	if(iType == 0 || iType == 2)
	{
		sTmpStr = ' ';
		i = sInputString.length;
		while(sTmpStr == ' ')
		{
			--i;
			sTmpStr = sInputString.substr(i,1);
		}
		sInputString = sInputString.substring(0,i+1);
	}
	return sInputString;
}

/*
-------------------------------------------------------------------------------
说    明：JavaScript脚本，验证表单中的数据项  begin
------------------------------------------------------------------------------- 	
*/
function checkForm(objFrm){
	var len = 0;
	len = objFrm.elements.length;

	var i = 0;
	var objCheck;
	//文本框
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="text" && !f_checkTextValid(objCheck) ){
			return false;			
		}
	}
	//下拉框
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="select-one" && !f_checkSelectValid(objCheck) ){
			return false;			
		}
	}
	//时间段有效
	if( f_checkStartAndEndDate(objFrm) == false) return false;
	
	return true;
}
function f_checkSelectValid(obj){
	//alert("check select");
	if(obj.options.length <= 0){
		alert("下拉选框无数据!");
		return false;	
	} 
	return true;
}
function f_checkStartAndEndDate(frm){
	var len = frm.elements.length;
	if(len == null && len == 0) return true;
	var i=0;
	var temp;
	var objCheck;
	var objStartDate;
	var objEndDate;
	//alert("start date period check");
	try{
		for(i=0; i< len ; i++){
			objCheck = frm.elements[i];
			temp = objCheck.name;
			if( temp.indexOf("startDate") >0 ||temp.indexOf("beginDate")>0 )
				objStartDate = objCheck;
			if( temp.indexOf("endDate") > 0 )
				objEndDate = objCheck;
				
		}
		//alert(objStartDate.value);
		//alert(objEndDate.value);
		if(objStartDate.value==null || objStartDate.value =="" || objStartDate.value ==null || objStartDate.value ==""){
			return true;
		}
		return checkTwoDate(objStartDate.value, objEndDate.value);	
		//alert("end date period check");
	}catch(E){}
	return true;
}

function f_checkTextValid(obj){
	//不能为空
	if(obj.getAttribute("isNeed") != null){
		if(f_isNotNull(obj) == false) return false;
	}
	//不能超过长度
	if(obj.getAttribute("maxlength") != null){
		if(f_checkLength(obj) == false) return false;
	}
	var checkType ="";
	checkType = obj.getAttribute("checkType");
	if(checkType==null||checkType=="") return true;
	//
	if (checkType.indexOf("number") >=0){
		if(f_isNumber(obj) == false)  return false;
		if(f_checkNumType(obj,checkType) == false)  return false;
		
	}
	//
	if (checkType.indexOf("positive") >=0){
		if(f_isNumber(obj) == false)  return false;
		if(f_isPositive(obj)==false)  return false;
		if(f_checkNumType(obj,checkType) == false)  return false;
		
	}
	if (checkType.indexOf("date") >=0){
		if(f_checkDate(obj) == false) return false;
		
	}
	
	/*
	switch(checkType){
		case "number": if(f_isNumber(obj) == false) return false;break;
		case "date": if(f_checkDate(obj) == false) return false;break;
		default:
	}
	*/
	return true;
}

function f_isNotNull(obj){
	if(obj.value == ""){
		f_alert(obj, " 不允许为空值！");
		return false;
	}
	return true;
}

function f_isNumber(obj){
	if(isNaN(obj.value)){
		 f_alert(obj," 应为数值类型");
		return false;		
	}
	return true;

}
function f_checkDate(obj) {
	if(checkDate(obj.value) ==false){
		 f_alert(obj," 不是合法日期格式！");
		return false;		
	}
	return true;
}

function f_checkLength(obj){
	if(getTotalBytes(obj) > Math.abs( obj.getAttribute("maxlength") ) ){
		 f_alert(obj," 超出长度限制!");
		return false;		
	}
	return true;
	
}

function  f_alert(obj,alertStr){
	var fielName = obj.getAttribute("fieldName");
	if(fielName == null)
		fielName = "";
	alert(fielName + "\n" +alertStr);
	obj.select();
	obj.focus();
}

function f_checkNumType(obj, numType){
	//假设: 已经进行数字类型判断
	
	var strTemp;
	var numpric;
	var numLen;
	var strArr;
	var defaultLen = 19;
	var defaultpric = 5;

	try{
		if(numType == null|| numType =="") return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		if(numType.indexOf("(") < 0 || numType.indexOf(")") < 0 ) return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		strTemp = numType.substr( numType.indexOf("(") + 1 ,numType.indexOf(")") - numType.indexOf("(") -1 );
		if(strTemp == null||strTemp =="") return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		strArr = strTemp.split(",");	
		numLen = Math.abs( strArr[0] ); 
		numpric = Math.abs( strArr[1] );	
		return f_checkNumLenPrec(obj,numLen, numpric);
	}catch(e){
		alert("in f_checkNumType = " + e);
		 return f_checkNumLenPrec(obj,defaultLen, defaultpric);
	}

}

function f_checkNumLenPrec(obj, len, pric){
	var numReg;
	var value = obj.value;
	var strValueTemp, strInt, strDec;	
	//alert(value + "=====" + len + "====="+ pric);
	try{	
		
		numReg =/[\-]/;
		strValueTemp = value.replace(numReg, "");
		strValueTemp = strValueTemp.replace(numReg, "");
		//整数
		if(pric==0){
			numReg =/[\.]/;
			//alert(numReg.test(value));
			if(numReg.test(value) == true){
				f_alert(obj, "输入必须为整数类型!");
				return false;	
			}			
		}
		
		if(strValueTemp.indexOf(".") < 0 ){
			//alert("lennth==" + strValueTemp);		
			if(strValueTemp.length >( len - pric)){
				f_alert(obj, "整数位不能超过"+ (len - pric) +"位");
				return false;
			}
		
		}else{
			strInt = strValueTemp.substr( 0, strValueTemp.indexOf(".") );		
			//alert("lennth==" + strInt);		
			if(strInt.length >( len - pric)){
				f_alert(obj, "整数位不能超过"+ (len - pric) +"位");
				return false;
			}		

			strDec = strValueTemp.substr( (strValueTemp.indexOf(".")+1), strValueTemp.length );		
			//alert("pric==" + strDec);		
			if(strDec.length > pric){
				f_alert(obj, "小数位不能超过"+  pric +"位");
				return false;
			}		
		}
		
		return true;
	}catch(e){
		alert("in f_checkNumLenPrec = " + e);
		return false;
	}	
}

function f_isPositive(obj){
	var numReg =/[\-]/;
	if(numReg.test(obj.value) == true){
		f_alert(obj, "必须为正数!");
		return false;
	}
	return true;
	
}


/*
function selectedCheckboxCount(form)
功能说明：对Form中选中的可选项计数

参数说明：
form:指定的表单
*/
function selectedCheckboxCount(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
//		type = obj.attributes.item("type").nodeValue;
        type = obj.type;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}

//得到字节长度
function getByteLen(str)
{
        var l = str.length;
        var n = l;
        for ( var i=0; i<l; i++ )
				
                if ( str.charCodeAt(i) <0 || str.charCodeAt(i) >255 )
                        n=n+1;
        return n
}

/*
说明：
1.清除表格中的数据(0.0 和 0)
2.如果cell中没有数据，则自动加上一个空格
3.清除空白行的checkbox

参数：
clearzero:是否清除"0"、"0.0"，false不清除、true清除（默认为true）
tablename:要清除的表格名字，默认为sortTable
*/
function clear_table(clearzero,tablename)
{
	var tobject;
	if(tablename==null)
		tobject=gmobj("sortTable");
	else
		tobject=gmobj(tablename);
	//如果table未定义，则不进行过滤
	
	if(tobject==null)
		return;
		
	
	//如果函数调用参数为空，表示要清除0、0.0；反之，不要清除0、0.0。
	var clear = (clearzero==null)?true:clearzero;

	//清除0、0.0，填补空格
	var rows = tobject.rows;
	var j=0;
	for(var i=0;i<rows.length;i++)
	{
		//取得第一个cell的属性clear，如果为1，表示该行没有数据，则清除该行所有数据
		
			while(tobject.rows[i].cells[j] != null)
			{
				if(clear)
				{
					if(tobject.rows[i].cells[j].innerHTML==0 ||tobject.rows[i].cells[j].innerHTML==0.0||tobject.rows[i].cells[j].innerHTML=="")
						tobject.rows[i].cells[j].innerText=" ";
				}
				else
				{
					if (tobject.rows[i].cells[j].innerHTML=="")
						tobject.rows[i].cells[j].innerText=" ";
				}
				j++;
			}
			j=0;
		
	}
    return true;
}

function gmobj(mtxt)  /* Get object by object name */
{
  if (document.getElementById) {
      m=document.getElementById(mtxt);
  } else if (document.all) {
      m=document.all[mtxt];
  } else if (document.layers) {
      m=document.layers[mtxt];
  }
  return m;
}
/*
-------------------------------------------------------------------------------
说    明：JavaScript脚本，验证表单中的数据项  end
------------------------------------------------------------------------------- 	
*/

/*
用途：检查输入字符串是否是带小数的数字格式,可以是负数(并且满足规定的精度)
输入：str：字符串
            l：总位数
           d：小数点后位数
返回：
	如果通过验证返回true,否则返回false	
*/
function isDecimal( str,l,d ){   
         if(isInteger(str)) {
			 if (l==null)  return true;
			 if (str<0) l--;
		    if (str.length<=l) return true;
         }

         var re = /^[-]{0,1}(\d+)[\.]+(\d+)$/;
       if (re.test(str)) {
		if (l==null)  return true;
		if (d==null) d=0;
        if(RegExp.$1==0&&RegExp.$2==0) return false;
		if (RegExp.$1.length+RegExp.$2.length<=l
			&& RegExp.$2.length<=d)  return true;
    }
	return false;
}
