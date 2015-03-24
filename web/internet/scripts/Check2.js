function Check_NotMinusInt(obj,namestr,length)
{
	objvalue=eval(obj).value;
	if(trim(objvalue)=="" ){
		alert("请输入"+namestr+"!");
      	eval(obj).focus();
	    return false;
    } 
    if(isNaN(objvalue) || parseFloat(objvalue)!=parseInt(parseFloat(objvalue)) || parseInt(objvalue)<0){
		alert(namestr+"必须是非负整数！");
		eval(obj).focus();
		return false;
	}	
	if(objvalue.length>parseInt(length)){
		alert(namestr+"长度不得超过"+length+"位！");
		eval(obj).focus();
		return false;
	}
	return true;
}

function Check_PlusInt(obj,namestr,length)
{
	objvalue=eval(obj).value;
	if(trim(objvalue)=="" ){
		alert("请输入"+namestr+"!");
      	eval(obj).focus();
	    return false;
    } 
    if(isNaN(objvalue) || parseFloat(objvalue)!=parseInt(parseFloat(objvalue)) || parseInt(objvalue)<=0){
		alert(namestr+"必须是正整数！");
		eval(obj).focus();
		return false;
	}	
	if(objvalue.length>parseInt(length)){
		alert(namestr+"长度不得超过"+length+"位！");
		eval(obj).focus();
		return false;
	}
	return true;
}

function Check_Money(obj,namestr,lengthAfterPoint)
{
	objvalue=eval(obj).value;
	if(trim(objvalue)=="" ){
		alert("请输入"+namestr+"!");
      	eval(obj).focus();
	    return false;
    } 
    if(isNaN(objvalue) || parseFloat(objvalue)<0){
		alert(namestr+"必须是非负数！");
		eval(obj).focus();
		return false;
	}	
	if(objvalue.substring(objvalue.lastIndexOf(".")+1,objvalue.length).length>parseInt(lengthAfterPoint)){
		alert(namestr+"只能精确到小数点后"+lengthAfterPoint+"位！");
		eval(obj).focus();
		return false;
	}
	return true;
}


function Check_POSTime(obj){
	objvalue=eval(obj).value;
	if(objvalue.length!=4){
		alert("时间长度必须是4位！");
		eval(obj).focus();
		return false;
	}	
   	if(isNaN(objvalue) || parseFloat(objvalue)!=parseInt(parseFloat(objvalue)) || parseInt(objvalue)<0){
		alert("时间必须是非负整数！");
		eval(obj).focus();
		return false;
	}
	if(parseInt(objvalue.substring(0,2))>=24 || parseInt(objvalue.substring(2,4))>=60){
		alert("时间格式不正确！");
		eval(obj).focus();
		return false;
	}
	return true;
}

function LessThan(obj1,obj2,nameStr1,nameStr2){
	if(parseFloat(eval(obj1).value)>=parseFloat(eval(obj2).value)){
		alert(nameStr1+"必须小于"+nameStr2+"！");
		eval(obj1).focus();
		return false;
	}
	return true;
}

function formatSum(_businessmoneySum){
	//规范金额格式
	pointindex=_businessmoneySum.toString().indexOf(".");
	len=_businessmoneySum.toString().length;
	if(pointindex>=0 && len>=pointindex+3)//多于2位小数的四舍五入
		_businessmoneySum=_businessmoneySum.toString().substring(0,pointindex+3);
	else if(0>pointindex)//没有小数点的补两位小数
		_businessmoneySum=_businessmoneySum.toString()+".00";
	else//其他的补一位小数
		_businessmoneySum=_businessmoneySum.toString()+"0";
	//
	return _businessmoneySum;
}

//判断时间是否符合xx:xx:xx格式
function Check_StandardTime(obj){
	objvalue=eval(obj).value;

	if(objvalue.length!=8){
		alert("时间长度必须是8位！");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(2,3)!=':' || objvalue.substring(5,6)!=':'){
		alert("时间格式不正确，时分秒之间必须用“:”隔开！");
		eval(obj).focus();
		return false;
	}

	var hour=objvalue.substring(0,2);
	var minute=objvalue.substring(3,5);
	var second=objvalue.substring(6,8);

	if(isNaN(hour) || parseInt(hour)>=24 || parseInt(hour)<0){
		alert("时必须在0～24之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(minute) || parseInt(minute)>=60 || parseInt(minute)<0){
		alert("分必须在0～60之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(second) || parseInt(second)>=60 || parseInt(second)<0){
		alert("分必须在0～60之间！");
		eval(obj).focus();
		return false;
	}
	
	return true;
}

//判断时间是否符合xxxx-xx-xx yy:yy:yy格式
function Check_StandardDateTime(obj){
	objvalue=eval(obj).value;

	if(objvalue.length!=19){
		alert("时间长度不正确！");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(4,5)!='-' || objvalue.substring(7,8)!='-'){
		alert("日期格式不正确，年月日之间必须用“-”隔开！");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(10,11)!=' '){
		alert("日期和时间之间必须用空格隔开！");
		eval(obj).focus();
		return false;
	}

	if(objvalue.substring(13,14)!=':' || objvalue.substring(16,17)!=':'){
		alert("时间格式不正确，时分秒之间必须用“:”隔开！");
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
		alert("年必须在1970～2100之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(month) || parseInt(month)<0 || parseInt(month)>12){
		alert("月必须在1～12之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(day) || parseInt(day)<0 || parseInt(day)>31){
		alert("日必须在1～31之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(hour) || parseInt(hour)>=24 || parseInt(hour)<0){
		alert("时必须在0～24之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(minute) || parseInt(minute)>=60 || parseInt(minute)<0){
		alert("分必须在0～60之间！");
		eval(obj).focus();
		return false;
	}

	if(isNaN(second) || parseInt(second)>=60 || parseInt(second)<0){
		alert("分必须在0～60之间！");
		eval(obj).focus();
		return false;
	}
	
	return true;
}

function is_chinese(elem){
	var pattern=/[^\x00-\xff]/g;
	if(pattern.test(elem)){
	  //包含中文
		return true;
	}else{
	  //不包含中文
	  return false;
	}
}

//判断是否全中文字
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