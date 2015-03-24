function Check_NotMinusInt(obj,namestr,length)
{
	objvalue=eval(obj).value;
	if(trim(objvalue)=="" ){
		alert("������"+namestr+"!");
      	eval(obj).focus();
	    return false;
    } 
    if(isNaN(objvalue) || parseFloat(objvalue)!=parseInt(parseFloat(objvalue)) || parseInt(objvalue)<0){
		alert(namestr+"�����ǷǸ�������");
		eval(obj).focus();
		return false;
	}	
	if(objvalue.length>parseInt(length)){
		alert(namestr+"���Ȳ��ó���"+length+"λ��");
		eval(obj).focus();
		return false;
	}
	return true;
}

function Check_PlusInt(obj,namestr,length)
{
	objvalue=eval(obj).value;
	if(trim(objvalue)=="" ){
		alert("������"+namestr+"!");
      	eval(obj).focus();
	    return false;
    } 
    if(isNaN(objvalue) || parseFloat(objvalue)!=parseInt(parseFloat(objvalue)) || parseInt(objvalue)<=0){
		alert(namestr+"��������������");
		eval(obj).focus();
		return false;
	}	
	if(objvalue.length>parseInt(length)){
		alert(namestr+"���Ȳ��ó���"+length+"λ��");
		eval(obj).focus();
		return false;
	}
	return true;
}

function Check_Money(obj,namestr,lengthAfterPoint)
{
	objvalue=eval(obj).value;
	if(trim(objvalue)=="" ){
		alert("������"+namestr+"!");
      	eval(obj).focus();
	    return false;
    } 
    if(isNaN(objvalue) || parseFloat(objvalue)<0){
		alert(namestr+"�����ǷǸ�����");
		eval(obj).focus();
		return false;
	}	
	if(objvalue.substring(objvalue.lastIndexOf(".")+1,objvalue.length).length>parseInt(lengthAfterPoint)){
		alert(namestr+"ֻ�ܾ�ȷ��С�����"+lengthAfterPoint+"λ��");
		eval(obj).focus();
		return false;
	}
	return true;
}


function Check_POSTime(obj){
	objvalue=eval(obj).value;
	if(objvalue.length!=4){
		alert("ʱ�䳤�ȱ�����4λ��");
		eval(obj).focus();
		return false;
	}	
   	if(isNaN(objvalue) || parseFloat(objvalue)!=parseInt(parseFloat(objvalue)) || parseInt(objvalue)<0){
		alert("ʱ������ǷǸ�������");
		eval(obj).focus();
		return false;
	}
	if(parseInt(objvalue.substring(0,2))>=24 || parseInt(objvalue.substring(2,4))>=60){
		alert("ʱ���ʽ����ȷ��");
		eval(obj).focus();
		return false;
	}
	return true;
}

function LessThan(obj1,obj2,nameStr1,nameStr2){
	if(parseFloat(eval(obj1).value)>=parseFloat(eval(obj2).value)){
		alert(nameStr1+"����С��"+nameStr2+"��");
		eval(obj1).focus();
		return false;
	}
	return true;
}

function formatSum(_businessmoneySum){
	//�淶����ʽ
	pointindex=_businessmoneySum.toString().indexOf(".");
	len=_businessmoneySum.toString().length;
	if(pointindex>=0 && len>=pointindex+3)//����2λС������������
		_businessmoneySum=_businessmoneySum.toString().substring(0,pointindex+3);
	else if(0>pointindex)//û��С����Ĳ���λС��
		_businessmoneySum=_businessmoneySum.toString()+".00";
	else//�����Ĳ�һλС��
		_businessmoneySum=_businessmoneySum.toString()+"0";
	//
	return _businessmoneySum;
}

//�ж�ʱ���Ƿ����xx:xx:xx��ʽ
function Check_StandardTime(obj){
	objvalue=eval(obj).value;

	if(objvalue.length!=8){
		alert("ʱ�䳤�ȱ�����8λ��");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(2,3)!=':' || objvalue.substring(5,6)!=':'){
		alert("ʱ���ʽ����ȷ��ʱ����֮������á�:��������");
		eval(obj).focus();
		return false;
	}

	var hour=objvalue.substring(0,2);
	var minute=objvalue.substring(3,5);
	var second=objvalue.substring(6,8);

	if(isNaN(hour) || parseInt(hour)>=24 || parseInt(hour)<0){
		alert("ʱ������0��24֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(minute) || parseInt(minute)>=60 || parseInt(minute)<0){
		alert("�ֱ�����0��60֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(second) || parseInt(second)>=60 || parseInt(second)<0){
		alert("�ֱ�����0��60֮�䣡");
		eval(obj).focus();
		return false;
	}
	
	return true;
}

//�ж�ʱ���Ƿ����xxxx-xx-xx yy:yy:yy��ʽ
function Check_StandardDateTime(obj){
	objvalue=eval(obj).value;

	if(objvalue.length!=19){
		alert("ʱ�䳤�Ȳ���ȷ��");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(4,5)!='-' || objvalue.substring(7,8)!='-'){
		alert("���ڸ�ʽ����ȷ��������֮������á�-��������");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(10,11)!=' '){
		alert("���ں�ʱ��֮������ÿո������");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(13,14)!=':' || objvalue.substring(16,17)!=':'){
		alert("ʱ���ʽ����ȷ��ʱ����֮������á�:��������");
		eval(obj).focus();
		return false;
	}

	var year=objvalue.substring(0,4);
	var month=objvalue.substring(5,7);
	var day=objvalue.substring(8,10);
	var hour=objvalue.substring(11,13);
	var minute=objvalue.substring(14,16);
	var second=objvalue.substring(17,19);

	if(isNaN(year) || parseInt(year)<1970 || parseInt(year)>2100){
		alert("�������1970��2100֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(month) || parseInt(month)<0 || parseInt(month)>12){
		alert("�±�����1��12֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(day) || parseInt(day)<0 || parseInt(day)>31){
		alert("�ձ�����1��31֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(hour) || parseInt(hour)>=24 || parseInt(hour)<0){
		alert("ʱ������0��24֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(minute) || parseInt(minute)>=60 || parseInt(minute)<0){
		alert("�ֱ�����0��60֮�䣡");
		eval(obj).focus();
		return false;
	}

	if(isNaN(second) || parseInt(second)>=60 || parseInt(second)<0){
		alert("�ֱ�����0��60֮�䣡");
		eval(obj).focus();
		return false;
	}
	
	return true;
}

function is_chinese(elem){
	var pattern=/[^\x00-\xff]/g;
	if(pattern.test(elem)){
	  //��������
		return true;
	}else{
	  //����������
	  return false;
	}
}

//�ж��Ƿ�ȫ������
function is_chinese(elem){
	var pattern=/^[\u4e00-\u9fa5]+$/g;
	if(!pattern.test(elem)){
      return false;
    }else {
     return true;
    }
}

function is_email(elem){
     var pattern=/^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
     if(pattern.test(elem)){
         return true;
     }else{
         return false;
     }
}

function is_mobilephone(elem){
     var pattern=/13[0-9]{9}/;
     if(pattern.test(elem)){
         return true;
     }else{
         return false;
     }
}