/*
-------------------------------------------------------------------------------
�ļ����ƣ�check.js
˵    ����JavaScript�ű������ڼ����ҳ�ύ������������
��    ����1.0
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��		�޸���		˵��
2002-8-29	libo		����
2004-03-08  xueyishan    �޸�,����checkMobile()
2005-06-01  zhouming    �޸���isDate()��֧�ָ�ʽ
------------------------------------------------------------------------------- 	
*/

/*
��;��У��ip��ַ�ĸ�ʽ
���룺strIP��ip��ַ
���أ����ͨ����֤����true,���򷵻�false��	
*/
function isIP(strIP) { 
        if (isNull(strIP)) return false;
	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //ƥ��IP��ַ��������ʽ
	if(re.test(strIP))
	{
	 if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) return true;
	}
	return false; 
} 

/*
��;����������ַ����Ƿ�Ϊ�ջ���ȫ�����ǿո�
���룺str
���أ�
	���ȫ�ǿշ���true,���򷵻�false
*/
function isNull( str ){
	if ( str == "" ) return true;
	var regu = "^[ ]+$";
	var re = new RegExp(regu);
	return re.test(str);
}


/*
��;�������������ֵ�Ƿ����������ʽ
���룺str ������ַ���
���أ����ͨ����֤����true,���򷵻�false	
*/
function isInteger( str ){  
	var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(str);
}

/*
��;����������ֻ������Ƿ���ȷ
���룺
	s���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
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
��;����������ַ����Ƿ������������ʽ
���룺
	s���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
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
��;����������ַ����Ƿ��Ǵ�С�������ָ�ʽ,�����Ǹ���
���룺
	s���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
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
��;�������������ֵ�Ƿ���϶˿ںŸ�ʽ
���룺str ������ַ���
���أ����ͨ����֤����true,���򷵻�false	
*/
function isPort( str ){  
	return (isNumber(str) && str<65536);
}

/*
��;�������������ֵ�Ƿ����E-Mail��ʽ
���룺str ������ַ���
���أ����ͨ����֤����true,���򷵻�false	
*/
function isEmail( str ){  
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/; 
	if(myReg.test(str)) return true; 
	return false; 
}

/*
��;����������ַ����Ƿ���Ͻ���ʽ
	��ʽ����Ϊ��С����������С����������λ
���룺
	s���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
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
��;����������ַ����Ƿ�ֻ��Ӣ����ĸ�����ֺ��»������
���룺
	s���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function isNumberOr_Letter( s ){    //�ж��Ƿ������ֻ���ĸ
	var regu = "^[0-9a-zA-Z\_]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}
/*
��;����������ַ����Ƿ�ֻ��Ӣ����ĸ���������
���룺
	s���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function isNumberOrLetter( s ){    //�ж��Ƿ������ֻ���ĸ
	var regu = "^[0-9a-zA-Z]+$";
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}
 /*
��;����������ַ����Ƿ�ֻ�ɺ��֡���ĸ���������
���룺
	value���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function isChinaOrNumbOrLett( s ){    //�ж��Ƿ��Ǻ��֡���ĸ���������
	var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";   
	var re = new RegExp(regu);
	if (re.test(s)) {
	  return true;
	}else{
	  return false;
	}
}

/*
��;���ж��Ƿ�������
���룺date�����ڣ�fmt�����ڸ�ʽ
���أ����ͨ����֤����true,���򷵻�false
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
��;���ַ�1�Ƿ����ַ���2����
���룺str1���ַ�����str2�����������ַ���
���أ����ͨ����֤����true,���򷵻�false	
*/
function isLastMatch(str1,str2)
{  
   var index = str1.lastIndexOf(str2);
   if(str1.length==index+str2.length) return true;
   return false;
}


/*
��;���ַ�1�Ƿ����ַ���2��ʼ
���룺str1���ַ�����str2�����������ַ���
���أ����ͨ����֤����true,���򷵻�false	
*/
function isFirstMatch(str1,str2)
{  
   var index = str1.indexOf(str2);
   if(index==0) return true;
   return false;
}

/*
��;���ַ�1�ǰ����ַ���2
���룺str1���ַ�����str2�����������ַ���
���أ����ͨ����֤����true,���򷵻�false	
*/
function isMatch(str1,str2)
{  
   var index = str1.indexOf(str2);
   if(index==-1) return false;
   return true;
}


/*
��;������������ֹ�����Ƿ���ȷ������Ϊ�������ڵĸ�ʽ��ȷ��
	�ҽ�������>=��ʼ����
���룺
	startDate����ʼ���ڣ��ַ���
	endDate���������ڣ��ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function checkTwoDate( startDate,endDate ) {
	if( !isDate(startDate) ) {
		alert("��ʼ���ڲ���ȷ!");
		return false;
	} else if( !isDate(endDate) ) {
		alert("��ֹ���ڲ���ȷ!");
		return false;
	} else if( startDate > endDate ) {
		alert("��ʼ���ڲ��ܴ�����ֹ����!");
		return false;
	}
	return true;
}

/*
��;����������Email�����ʽ�Ƿ���ȷ
���룺
	strEmail���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function checkEmail(strEmail) { 
	//var emailReg = /^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/; 
	var emailReg = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	if( emailReg.test(strEmail) ){
		return true; 
	}else{
		alert("�������Email��ַ��ʽ����ȷ��");
		return false; 
	}
}

/*
��;���������ĵ绰�����ʽ�Ƿ���ȷ
���룺
	strPhone���ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function checkPhone( strPhone ) { 
	var phoneRegWithArea = /^[0][1-9]{2,3}-[0-9]{5,10}$/; 
	var phoneRegNoArea = /^[1-9]{1}[0-9]{5,8}$/; 
	var prompt = "������ĵ绰���벻��ȷ!"
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
��;����鸴ѡ��ѡ�е���Ŀ
���룺
	checkboxID���ַ���
���أ�
	���ظø�ѡ���б�ѡ�е���Ŀ	
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
��;������������ֹ�����Ƿ���ȷ������Ϊ�������ڵĸ�ʽ��ȷ��Ϊ��
	�ҽ�������>=��ʼ����
���룺
	startDate����ʼ���ڣ��ַ���
	endDate��  �������ڣ��ַ���
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function checkPeriod( startDate,endDate ) {
	if( !checkDate(startDate) ) {
		alert("��ʼ���ڲ���ȷ!");
		return false;
	} else if( !checkDate(endDate) ) {
		alert("��ֹ���ڲ���ȷ!");
		return false;
	} else if( startDate > endDate ) {
		alert("��ʼ���ڲ��ܴ�����ֹ����!");
		return false;
	}
	return true;
}

/*
��;�����֤ȯ�����Ƿ���ȷ
���룺
	secCode:֤ȯ����
���أ�
	���ͨ����֤����true,���򷵻�false	
*/
function checkSecCode( secCode ) {
	if( secCode.length !=6 ){
		alert("֤ȯ���볤��Ӧ��Ϊ6λ");
		return false;
	}
	
	if(!isNumber( secCode ) ){
		alert("֤ȯ����ֻ�ܰ�������");		
		return false;
  	 }
	return true;
}

/****************************************************
function	:	cTrim(sInputString,iType)
description	:	�ַ���ȥ�ո�ĺ���
parameters	:	iType��	1=ȥ���ַ�����ߵĿո�
						2=ȥ���ַ�����ߵĿո�
						0=ȥ���ַ�����ߺ��ұߵĿո�
return value:	ȥ���ո���ַ���
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
˵    ����JavaScript�ű�����֤���е�������  begin
------------------------------------------------------------------------------- 	
*/
function checkForm(objFrm){
	var len = 0;
	len = objFrm.elements.length;

	var i = 0;
	var objCheck;
	//�ı���
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="text" && !f_checkTextValid(objCheck) ){
			return false;			
		}
	}
	//������
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="select-one" && !f_checkSelectValid(objCheck) ){
			return false;			
		}
	}
	//ʱ�����Ч
	if( f_checkStartAndEndDate(objFrm) == false) return false;
	
	return true;
}
function f_checkSelectValid(obj){
	//alert("check select");
	if(obj.options.length <= 0){
		alert("����ѡ��������!");
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
	//����Ϊ��
	if(obj.getAttribute("isNeed") != null){
		if(f_isNotNull(obj) == false) return false;
	}
	//���ܳ�������
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
		f_alert(obj, " ������Ϊ��ֵ��");
		return false;
	}
	return true;
}

function f_isNumber(obj){
	if(isNaN(obj.value)){
		 f_alert(obj," ӦΪ��ֵ����");
		return false;		
	}
	return true;

}
function f_checkDate(obj) {
	if(checkDate(obj.value) ==false){
		 f_alert(obj," ���ǺϷ����ڸ�ʽ��");
		return false;		
	}
	return true;
}

function f_checkLength(obj){
	if(getTotalBytes(obj) > Math.abs( obj.getAttribute("maxlength") ) ){
		 f_alert(obj," ������������!");
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
	//����: �Ѿ��������������ж�
	
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
		//����
		if(pric==0){
			numReg =/[\.]/;
			//alert(numReg.test(value));
			if(numReg.test(value) == true){
				f_alert(obj, "�������Ϊ��������!");
				return false;	
			}			
		}
		
		if(strValueTemp.indexOf(".") < 0 ){
			//alert("lennth==" + strValueTemp);		
			if(strValueTemp.length >( len - pric)){
				f_alert(obj, "����λ���ܳ���"+ (len - pric) +"λ");
				return false;
			}
		
		}else{
			strInt = strValueTemp.substr( 0, strValueTemp.indexOf(".") );		
			//alert("lennth==" + strInt);		
			if(strInt.length >( len - pric)){
				f_alert(obj, "����λ���ܳ���"+ (len - pric) +"λ");
				return false;
			}		

			strDec = strValueTemp.substr( (strValueTemp.indexOf(".")+1), strValueTemp.length );		
			//alert("pric==" + strDec);		
			if(strDec.length > pric){
				f_alert(obj, "С��λ���ܳ���"+  pric +"λ");
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
		f_alert(obj, "����Ϊ����!");
		return false;
	}
	return true;
	
}


/*
function selectedCheckboxCount(form)
����˵������Form��ѡ�еĿ�ѡ�����

����˵����
form:ָ���ı�
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

//�õ��ֽڳ���
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
˵����
1.�������е�����(0.0 �� 0)
2.���cell��û�����ݣ����Զ�����һ���ո�
3.����հ��е�checkbox

������
clearzero:�Ƿ����"0"��"0.0"��false�������true�����Ĭ��Ϊtrue��
tablename:Ҫ����ı�����֣�Ĭ��ΪsortTable
*/
function clear_table(clearzero,tablename)
{
	var tobject;
	if(tablename==null)
		tobject=gmobj("sortTable");
	else
		tobject=gmobj(tablename);
	//���tableδ���壬�򲻽��й���
	
	if(tobject==null)
		return;
		
	
	//����������ò���Ϊ�գ���ʾҪ���0��0.0����֮����Ҫ���0��0.0��
	var clear = (clearzero==null)?true:clearzero;

	//���0��0.0����ո�
	var rows = tobject.rows;
	var j=0;
	for(var i=0;i<rows.length;i++)
	{
		//ȡ�õ�һ��cell������clear�����Ϊ1����ʾ����û�����ݣ������������������
		
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
˵    ����JavaScript�ű�����֤���е�������  end
------------------------------------------------------------------------------- 	
*/

/*
��;����������ַ����Ƿ��Ǵ�С�������ָ�ʽ,�����Ǹ���(��������涨�ľ���)
���룺str���ַ���
            l����λ��
           d��С�����λ��
���أ�
	���ͨ����֤����true,���򷵻�false	
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
