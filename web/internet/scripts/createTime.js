
function minuteControl(name,forObj,fTime,fName) {
 this.name = name;
 x = fName || "mctr_input";
 this.fTime = fTime;
 
 this.timer = null;
 this.fObj = null;
 
 
 this.toString = function() {
  var objDate = new Date();
  if ( this.fTime!=null&&this.fTime!="" )
  {
  	if ( this.fTime.length==6 )
  	{
	  	var h = parseInt(this.fTime.substring(0,2),10);
	  	var m = parseInt(this.fTime.substring(2,4),10);
	  	var s = parseInt(this.fTime.substring(4,6),10);
	  	if ( h<0 || h>23 || m<0 || m>59 || s<0 || s>59 )
	  	{
	  		alert('时间格式不正确');
	  		this.fTime = this.formatTime(objDate.getHours())
	  			+ this.formatTime(objDate.getMinutes())
	  			+ this.formatTime(objDate.getSeconds());
	  	}
		else	
		{
			objDate.setHours(h);
			objDate.setMinutes(m);
			objDate.setSeconds(s);
		}
	}  		
  	if ( this.fTime.length==8 )
  	{
	  var arrTime=new Array();
	
	  arrTime=str2Array(fTime,":");
	  if ( arrTime.length==3 )
	  {
	  	var h = parseInt(arrTime[0],10);
	  	var m = parseInt(arrTime[1],10);
	  	var s = parseInt(arrTime[2],10);
	  	if ( h<0 || h>23 || m<0 || m>59 || s<0 || s>59 )
	  	{
	  		alert('时间格式不正确');
	  		this.fTime = this.formatTime(objDate.getHours())
	  			+ ":" + this.formatTime(objDate.getMinutes())
	  			+ ":" + this.formatTime(objDate.getSeconds());
	  	}
		else	
		{
			objDate.setHours(h);
			objDate.setMinutes(m);
			objDate.setSeconds(s);
		}
	  }
	 }
  }
  else
	{
  		this.fTime = this.formatTime(objDate.getHours())
  			+ ":" + this.formatTime(objDate.getMinutes())
  			+ ":" + this.formatTime(objDate.getSeconds());
	}
  var sMinute_Common = "class=\"mctr_input\" maxlength=\"2\" name=\""+this.fName+"\" onfocus=\""+
   this.name+".setFocusObj(this)\" onblur=\""+this.name+".setTime(this)\" onkeyup=\""+
   this.name+".prevent(this)\" onkeypress=\"if (!/[0-9]/.test(String.fromCharCode(event.keyCode)))event.keyCode=0\" \
   onpaste=\"return false\" ondragenter=\"return false\" style=\"ime-mode:disabled\" onPropertychange=\""+
   this.name+".setForObjValue()\"";
  var sButton_Common = "class=\"mctr_arrow\" onfocus=\"this.blur()\" onmouseup=\""+this.name+".controlTime()\" disabled"
  var str = "";
  
  str +=" <style type=\"text/css\">"
  str +=" .mctr_frameborder {"
  str +="  border-left: 2px inset #D4D0C8;"
  str +="  border-top: 2px inset #D4D0C8;"
  str +="  border-right: 2px inset #FFFFFF;"
  str +="  border-bottom: 2px inset #FFFFFF;"
  str +="  width: 70px;"
  str +="  height: 22px;"
  str +="  background-color: #FFFFFF;"
  str +="  overflow: hidden;"
  str +="  text-align: left;"       //text-align: right;
  str +="  font-family: \"Tahoma\";"
  str +="  font-size: 12px;"
  str +=" }"
  str +=" .mctr_arrow {"
  str +="  width: 16px;"
  str +="  height: 10px;"
  str +="  font-family: \"Webdings\";"
  str +="  font-size: 9px;"
  str +="  line-height: 2px;"
  str +="  padding-left: 2px;"
  str +="  cursor: default;"
  str +=" }"
  str +=" .mctr_input {"
  str +="  width: 18px;"
  str +="  height: 14px;"
  str +="  border: 0px solid black;"
  str +="  font-family: \"Tahoma\";"
  str +="  font-size: 12px;"
  str +="  text-align: right;"
  str +=" }"
  str +=" </style>";
  str += "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
  str += "<tr>"
  str += "<td>"
  str += "<div class=\"mctr_frameborder\">"
  str += "<input radix=\"24\" value=\""+this.formatTime(objDate.getHours())+"\" "+sMinute_Common+"><b>:"
  str += "<input radix=\"60\" value=\""+this.formatTime(objDate.getMinutes())+"\" "+sMinute_Common+">:"
  str += "<input radix=\"60\" value=\""+this.formatTime(objDate.getSeconds())+"\" "+sMinute_Common+">"
  str += "</div>"
  str += "</td>"
  str += "<td>"
  str += "<table border=\"0\" cellspacing=\"2\" cellpadding=\"0\">"
  str += "<tr><td><button id=\""+this.fName+"_up\" "+sButton_Common+">5</button></td></tr>"
  str += "<tr><td><button id=\""+this.fName+"_down\" "+sButton_Common+">6</button></td></tr>"
  str += "</table>"
  str += "</td>"
  
  str += "<td>"
  str += "<input type=\"Text\" name=\""+forObj+"\" id=\""+forObj+"\" value=\""+this.fTime+"\" style=\"display:'none'\">"//开发时一般要将此处的style设为display:'none'
  str += "</td>"
  
  str += "</tr>"
  str += "</table>"
  
  return str;
 }
 this.getNowTime=function(){
  var objDate = new Date();
  return this.formatTime(objDate.getHours())+":"+
    this.formatTime(objDate.getMinutes())+":"+
    this.formatTime(objDate.getSeconds());
 }
 this.play = function() {
  this.timer = setInterval(this.name+".playback()",1000);
 }
 this.formatTime = function(sTime) {
  sTime = ("0"+sTime);
  return sTime.substr(sTime.length-2);
 }
 this.playback = function() {
  var objDate = new Date();
  var arrDate = [objDate.getHours(),objDate.getMinutes(),objDate.getSeconds()];
  var objMinute = document.getElementsByName(this.fName);
  for (var i=0;i<objMinute.length;i++) {
   objMinute[i].value = this.formatTime(arrDate[i])
  }
 }
 this.setForObjValue=function(){
  eval("document.all('"+forObj+"').value=this.getTime()");
 }
 this.prevent = function(obj) {
  clearInterval(this.timer);
  this.setFocusObj(obj);
  var value = parseInt(obj.value,10);
  var radix = parseInt(obj.radix,10)-1;
  if (obj.value>radix||obj.value<0) {
   obj.value = obj.value.substr(0,1);
  }
 }
 this.controlTime = function(cmd) {
  event.cancelBubble = true;
  if (!this.fObj) return;
  clearInterval(this.timer);
  var cmd = event.srcElement.innerText=="5"?true:false;
  var i = parseInt(this.fObj.value,10);
  var radix = parseInt(this.fObj.radix,10)-1;
  if (i==radix&&cmd) {
   i = 0;
  } else if (i==0&&!cmd) {
   i = radix;
  } else {
   cmd?i++:i--;
  }
  this.fObj.value = this.formatTime(i);
  this.fObj.select();
 }
 this.setTime = function(obj) {
  obj.value = this.formatTime(obj.value);
 }
 this.setFocusObj = function(obj) {
  eval("document.all('"+this.fName+"_up"+"')").disabled = eval("document.all('"+this.fName+"_down"+"')").disabled = false;
  this.fObj = obj;
 }
 this.getTime = function() {
  var arrTime = new Array(2);
  for (var i=0;i<document.getElementsByName(this.fName).length;i++) {
   arrTime[i] = document.getElementsByName(this.fName)[i].value;
  }
  return arrTime.join(":")
 }
 this.setInitControl=function(){
  var iTime=eval("document.all('"+forObj+"').value");
  var arrTime=new Array();

  arrTime=str2Array(iTime,":");
  for (var i=0;i<arrTime.length;i++){
   document.getElementsByName(this.fName)[i].value=arrTime[i];
  }
 }
}
//将字符串str按照字符串ch拆分产生数组

function str2Array(str,ch)
{
 var a=new Array();
 var i=0,j=-1,k=0;
 while (i<str.length)
 {  
  j=str.indexOf(ch,j+1);   
  if (j!=-1)
  {
   if (j==0){a[k]="";}else{a[k]=str.substring(i,j);}
   i=j+1;
  }else
  {
   a[k]=str.substring(i,str.length);
   i=str.length;
  }
  k++;
 }
 return a;
}

