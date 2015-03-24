String.prototype.trim=function(){
    return this.replace(/(^\s*)|(\s*$)/g,"");
}
String.prototype.getLength=function(){
	var arr=escape(this).match(/%u/g);
	return arr ? this.length+arr.length*2:this.length;
}
String.prototype.getSize=function(){
	var arr=escape(this).match(/%u/g);
	return arr ? this.length+arr.length:this.length;
}
Number.prototype.split=function(){
	var integer=this<0 ? Math.ceil(this):Math.floor(this);
	return [integer,Math.abs(this-integer)];
}
Number.prototype.format=function(dec) {
	if (dec) {
		var iC=dec.indexOf('$')==0;
		dec=iC ? (dec.length>1 ? Number(dec.substr(1)):2):Number(dec);
	}
	if (!dec)
		return Math.round(this);
	var b=this>=0;
	var s=(Math.round((b?this:-this)*Math.pow(10,dec))/Math.pow(10,dec)+Math.pow(10,-dec-1))+"";
	var r=(b?"":"-")+s.substr(0,s.indexOf(".")+dec+1);
	if (iC) {
		var i=r.indexOf(".");
		var integer=r.substr(0,i);
		var tmp=r.substr(i);
		while (integer.length>3) {
			tmp=","+integer.substr(integer.length-3)+tmp;
			integer=integer.substr(0,integer.length-3);
		}
		r=integer+tmp;
	}
	return r;
}
var regExps={
	date:[/Y+/,/M+/,/D+/,/h+/,/m+/,/s+/,/星期/,/week/],
	weekCN:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
	weekEN:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],
	tele:/((\([0-9]+\))(\-)[0-9]+)|([0-9]+(\-)[0-9]+)|((\([0-9]+\))[0-9]+)|([0-9]+)/g,
	mobile:/[0-9]+/g,
	email:/[\w\-\.]+@(\w+[\.]{1})+\w+/g
}
Date.prototype.doMask=function(mask){
	var str=[];
	var re=regExps.date;
	var _Y=re[0].exec(mask);
	var _M=re[1].exec(mask);
	var _D=re[2].exec(mask);
	var _h=re[3].exec(mask);
	var _m=re[4].exec(mask);
	var _s=re[5].exec(mask);
	var _wcn=re[6].exec(mask);
	var _wen=re[7].exec(mask);
	if (_Y)
		str[0]=(this.getFullYear()+"").substr(4-_Y.toString().length);
	if (_M){
		var monStr=this.getMonth()+1+"";
		str[1]=monStr.length<_M.toString().length ? "0"+monStr:monStr;
	}
	if (_D){
		var dayStr=this.getDate()+"";
		str[2]=dayStr.length<_D.toString().length ? "0"+dayStr:dayStr;
	}
	if (_h){
		var hourStr=this.getHours()+"";
		str[3]=hourStr.length<_h.toString().length ? "0"+hourStr:hourStr;
	}
	if (_m){
		var minStr=this.getMinutes()+"";
		str[4]=minStr.length<_m.toString().length ? "0"+minStr:minStr;
	}
	if (_s){
		var secStr=this.getSeconds()+"";
		str[5]=secStr.length<_s.toString().length ? "0"+secStr:secStr;
	}
	if (_wcn)
		str[6]=this.base.weekCN[this.getDay()];
	if (_wen)
		str[7]=this.base.weekEN[this.getDay()];
	for (var i in re)
		mask=mask.replace(re[i],str[i]);
	return mask;
}
function disposeField(p) {
	var value=p.value;
	p.inputValue=value;
	value=value.trim();
	p.value=value;
	if (value) {
		var dtype=p.dtype,type=dtype.substr(0,1),par=dtype.substring(2,dtype.length-1);
		switch (type) {
			case "i":
			case "f":
			case "c":
			case "p":
				switch (type) {
					case "c":
						var v=Number(value.replace(/\,/g,""));
						break;
					case "p":
						var v=Number(value.replace(/%/g,""));
						break;
					default:
						var v=Number(value);
				}
				if (isNaN(v))
					return doErrorStyle(p,"错误：包含非法字符");
				var arr=par.split(","),mask=arr[0],arr2=arr[2];
				var len=type=="i" ? Number(mask):Math.floor(mask);
				var min=arr[1] || 0;
				if (!arr2 || arr2=="null") {
					var seq=mask.indexOf(".");
					if (seq!=-1)
						var max=Number(Math.pow(10,mask.substr(0,seq))-1) + "." + (Math.pow(10,mask.substr(seq+1))-1);
					else
						var max=Number(Math.pow(10,mask)-1);
				} else
					var max=arr2.indexOf("F")!=-1 ? calc(max,p.document):Number(arr2);
				if (min!="null") {
					min=isNaN(min) && min.indexOf("F")!=-1 ? calc(min,p.document):Number(min);
					if (v<min)
						return doErrorStyle(p,"错误：超出数值边界（最小值："+min+"）");
				}
				if (v>max)
					return doErrorStyle(p,"错误：超出数值边界（最大值："+max+"）");
				switch (type) {
					case "i":
						v=Math.round(v);
						p.showValue=v;
						break;
					case "f":
						var pt=mask.indexOf('.');
						var dem=pt!=-1 ? mask.substr(pt+1):'';
						v=Number(v).format(dem,false);
						p.showValue=v;
						break;
					case "c":
						var pt=mask.indexOf('.');
						var dem=pt!=-1 ? mask.substr(pt+1):'';
						v=Number(v).format(dem,false);
						p.showValue=Number(v).format("$"+dem);
						break;
					case "p":
						var pt=mask.indexOf('.');
						var dem=pt!=-1 ? mask.substr(pt+1):'';
						v=Number(v).format(dem,false);
						p.showValue=v+"%";
						break;
				}
				break;
			case "n":
				if ((/[^ \(\)\-,;0-9]/g).test(value)) {
					return doErrorStyle(p,"错误：包含非法字符");
				}
				var va=value.match(regExps.tele);
				if (!va)
					return doErrorStyle(p,"错误：未包含有效内容");
				var v=va.toString();
				if (v.length>Number(par)) {
					return doErrorStyle(p,"错误：超出长度（"+par+"）限制");
				}
				p.realValue=v;
				p.showValue=v;
				break;
			case "m":
				if ((/[^ ,;0-9]/g).test(value)) {
					return doErrorStyle(p,"错误：包含非法字符");
				}
				var va=value.match(regExps.mobile);
				if (!va)
					return doErrorStyle(p,"错误：未包含有效内容");
				var v=va.toString();
				if (v.length>Number(par)) {
					return doErrorStyle(p,"错误：超出长度（"+par+"）限制");
				}
				p.realValue=v;
				p.showValue=v;
				break;
			case "z":
				if (isNaN(value)) {
					return doErrorStyle(p,"错误：包含非法字符");
				}
				var v=Math.floor(value).toString();
				if (v.length>6) {
					return doErrorStyle(p,"错误：超出长度（6）限制");
				}
				var len=6-v.toString().length;
				while (len>0) {
					v+="0";
					len--;
				}
				p.realValue=v;
				p.showValue=v;
				break;
			case "a":
				if (isNaN(value) || value.indexOf(".")!=-1) {
					return doErrorStyle(p,"错误：包含非法字符");
				}
				if (value.length!=15 && value.length!=18) {
					return doErrorStyle(p,"错误：身份证填写不正确");
				}
				p.realValue=value;
				p.showValue=value;
				break;
			case "e":
				var arr=value.match(regExps.email);
				if (!arr) {
					return doErrorStyle(p,"错误：E-mail格式不正确");
				}
				var v=arr.toString();
				if(v.length>Number(par))
					return doErrorStyle(p,"错误：超出长度（"+par+"）限制");
				p.realValue=v;
				p.showValue=v;
				break;
			case "v":
				var i=par.indexOf(','),re;
				if (i!=-1)
					re=new RegExp(par.substr(i+1),"g"),par=par.substr(0,i);
				if (re && !re.test(value))
					return doErrorStyle(p,"错误：格式不正确");
				if (value.getLength()>Number(par)) {
					return doErrorStyle(p,"错误：超出长度（"+par+"）限制\n说明：一个汉字将占3个长度");
				}
				p.realValue=value;
				p.showValue=value;
				break;
			case "d":
				var fixedDate=refixDate(value,p.toMax=="true");
				if (fixedDate.match(/[^ 0-9\/\:]/g))
					return doErrorStyle(p,"错误：日期格式不正确");
				var d=new Date(fixedDate);
				if (isNaN(d))
					return doErrorStyle(p,"错误：日期格式不正确");
				var arr=par.split(","),mask=arr[0],arr1=arr[1],arr2=arr[2];
				if (arr1 && arr1!="null") {
					var min=arr1.indexOf("F(")!=-1 ? calc(arr1,p.document):new Date(refixDate(arr1));
					if (d<min) {
						return doErrorStyle(p,"错误：超出日期边界（最小值："+min.doMask(mask)+"）");
					}
				}
				if (arr2 && arr2!="null") {
					var max=arr2.indexOf("F(")!=-1 ? calc(arr2,p.document):new Date(refixDate(arr2));
					if (d>max) {
						return doErrorStyle(p,"错误：超出日期边界（最大值："+max.doMask(mask)+"）");
					}
				}
				if ((/D+/g).test(mask)) {
					var tmp=d.getFullYear();
					tmp+="-";
					var M=d.getMonth()+1;
					tmp+=M<10 ? ("0"+M):M;
					tmp+="-";
					var D=d.getDate();
					tmp+=D<10 ? ("0"+D):D;
					tmp+=" ";
					var h=d.getHours();
					tmp+=h<10 ? ("0"+h):h;
					tmp+=":";
					var m=d.getMinutes();
					tmp+=m<10 ? ("0"+m):m;
					tmp+=":";
					var s=d.getSeconds();
					tmp+=s<10 ? ("0"+s):s;
					var v=tmp;
				} else {
					var tmp=d.getFullYear();
					tmp+="-";
					var M=d.getMonth()+1;
					tmp+=M<10 ? ("0"+M):M;
					var v=tmp;
				}
				p.showValue=d.doMask(mask);
				break;
			case "t":
				if ((/[^ 时分\.\-0-9:]/g).test(value))
					return doErrorStyle(p,"错误：包含非法字符");
				var arr=value.replace(/[ 时分\.\-]/g,":").split(":");
				var h=arr[0] ? Number(arr[0]):0;
				if (h<0 || h>24)
					return doErrorStyle(p,"错误：小时数超出边界（0 ~ 24）");
				var v=(h<10 ? "0"+h:h)+":";
				var m=arr[1]? Number(arr[1]):0;
				if (m<0 || m>59)
					return doErrorStyle(p,"错误：分钟数超出边界（0 ~ 59）");
				v+=(m<10 ? "0"+m:m)+":";
				var s=arr[2] ? Number(arr[2]):0;
				if (s<0 || s>59)
					return doErrorStyle(p,"错误：秒数超出边界（0 ~ 59）");
				v+=s<10 ? "0"+s:s;
				var arr=par.split(","),mask=arr[0],arr1=arr[1],arr2=arr[2];
				var d=new Date("2000/1/1 "+v);
				if (arr1 && arr1!="null") {
					var min=arr1.indexOf("F(")!=-1 ? calc(arr1,p.document):new Date("2000/1/1 "+arr1);
					if (d<min) {
						return doErrorStyle(p,"错误：超出时间边界（最小值："+min.doMask(mask)+"）");
					}
				}
				if (arr2 && arr2!="null") {
					var max=arr2.indexOf("F(")!=-1 ? calc(arr2,p.document):new Date("2000/1/1 "+arr2);
					if (d>max) {
						return doErrorStyle(p,"错误：超出时间边界（最大值："+max.doMask(mask)+"）");
					}
				}
				p.showValue=d.doMask(mask);
				break;
		}
	}
	p.realValue=v || value;
	if (p.title)
		doNormalStyle(p);
}
function doErrorStyle(p,q) {
	p.style.backgroundColor="#FF0000";
	p.style.color="#FFFFFF";
	p.title=q;
}
function doNormalStyle(p) {
	if (p.readOnly) {
		p.style.backgroundColor="#EEEEEE";
		p.style.color="#666666";
		cursor="default";
	} else {
		p.style.backgroundColor="transparent";
		p.style.color="#000000";
		cursor="text";
	}
	p.title="";
}
function calc(p,doc) {
	var reg=/F\([\w\.]+\)/g;
	var flds=p.match(reg),j,fld,type;
	for (var i=0;i<flds.length;i++) {
		j=flds[i];
		fld=doc.getElementById(j.substring(2,j.length-1));
		type=fld.dtype.substr(0,1);
		switch (type) {
			case "d":
				p=p.replace(j,fld.title ? "NaN":new Date(refixDate(fld.realValue)));
				break;
			case "t":
				p=p.replace(j,fld.title ? "NaN":new Date("2000/1/1 "+fld.realValue));
				break;
			default:
				p=p.replace(j,fld.title ? "NaN":fld.realValue);
		}
		return eval(p);
	}
}
function refixDate(p,toMax){
	var r=p.trim().replace(/[年月\-\.]/g,"/").replace(/[时分]/g,":").replace(/[日秒]/g," ");
	var i=r.indexOf(" ");
	if (i==-1) {
		var arr=r.split("/");
		var time="00:00:00";
	}else{
		var arr=r.substr(0,i).split("/");
		var time=r.substr(i+1);
	}
	var today=new Date;
	var yt=arr[0] || today.getFullYear();
	if (yt.length>4)
		return 'NaN';
	else if (yt.length<4)
		var y=today.getFullYear().toString().substr(0,4-yt.length)+yt;
	else
		var y=yt;
	var m=arr[1] || (today.getMonth()+1);
	if (m<1 || m>12)
		return 'NaN';
	if (toMax)
	{
		var d=getMonthLen(y)[m-1];
	}
	else
	{
		var d=arr[2] || today.getDate();
		if (d<1 || d>getMonthLen(y)[m-1])
			return 'NaN';
	}
	return y+"/"+m+"/"+d+" "+time;
}
function checkLeapYear(p) {
	return ((p%4==0 && p%100 != 0) || p%400==0) ? 29:28;
}
function getMonthLen(p) {
	return [31,checkLeapYear(p),31,30,31,30,31,31,30,31,30,31];
}

var myImagesArr=[];
function preloadImages() {
	for (var i=0;i<arguments.length;i++) {
		myImagesArr[i]=new Image;
		myImagesArr[i].src=arguments[i];
	}
}
preloadImages(
"img/button_bg.gif",
"img/date_icon.gif",
"img/dialog_icon.gif",
"img/gen_bg.gif",
"img/outline_left.gif",
"img/outline_right.gif",
"img/t_blank.gif",
"img/t_check0.gif",
"img/t_check1.gif",
"img/t_check2.gif",
"img/t_folder.gif",
"img/t_openfolder.gif",
"img/t_minus.gif",
"img/t_plus.gif",
"img/title_bg.gif"
);
function domino(p) {
	var v=p.value;
	var listener=p.document.getElementById(p.listener);
	listener.length=0;
	if (v) {
		listener.style.display="";
		listener.options[0]=new Option("-请选择-",v+"00");
		var data=unitedInfo[listener.data];
		var n=1;
		for (var i in data) {
			if (i.indexOf("s"+v)==0) {
				listener.options[n++]=new Option(data[i],i.substr(1));
			}
		}
		if (n==1) {
			listener.style.display="none";
		}
	} else {
		listener.style.display="none";
	}
	if (listener.onchange)
		listener.onchange();
}
