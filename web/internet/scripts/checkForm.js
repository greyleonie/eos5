/*
-------------------------------------------------------------------------------
�ļ����ƣ�checkForm.js
˵    ����JavaScript�ű�����֤���е�������
��    ����1.0
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��		�޸���		˵��
2003-2-26	zhangcun		����
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
		type = obj.attributes.item("type").nodeValue;
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