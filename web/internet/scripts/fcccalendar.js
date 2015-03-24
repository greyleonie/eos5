/**
* calendar.js author:Chen Chun
*
* ��������:�������ؼ�(���¼�ƿؼ�)�������ز��ʵ�ַ�ʽ�������˵�������ʽ���ܱ���������ص��鷳��
* �ؼ��ĵ�����������������ָ��λ�ûᵯ���ؼ���塣���ı�����������ʱ����Ҫѡ�����ڣ�Ȼ�������
* ��������ĳһ��ĵ�Ԫ����ʱ�������ؼ������ѡ���ʱ���Զ���ı�����ؼ������������ʾ����
* ����¡����԰�ס�����ϵġ�,��,��,�����ֱ��������£�Ҳ���Ե�����������һ����"Today"��ť����
* ��<<,<,>,>>����������¡�������"Today"��ť�����ѵ�ǰʱ�䴫���ı��򡣴������µڶ�����"�գ�
* һ�����������ģ��壬��"��ʾ�������ڣ������������룬ֻ������ʾʱ�䣻�������갴ס������������ק
* �ؼ���ҳ������λ�á������������ǿؼ������������������ĳһ�죬���ɰ�ѡ�е�ʱ�䴫��ָ���ı���
* ��������������ʾ����ʱ���룬�������ʱ������������һ�����־�����ʾ��Ӧ��΢����ť���Ա����ʱ�䡣
* ������ı�������ڣ�Ŀǰ֧�����¼��֣�yyyyMMddHHmmss,yyyyMMdd,yyyy-MM-dd HH:mm:ss,yyyy-MM-dd,
* yyyy/MM/dd HH:mm:ss,yyyy/MM/dd,yyyy��MM��dd��HHʱmm��ss��,yyyy��MM��dd��
*
* ���÷���: 
* ����һ:calendar()���ú����ʺ�ֱ�����ı�����á�
* ������:calendar(obj,format)���ú����ʺ�������ָ����ҳ��Ԫ�ص��á����в���objΪ�����Ŀ�꣬format
* Ϊ��������ڸ�ʽ��
* 
* ��Ϊ�������ؼ���ͼƬʹ�õ������·����������ҳ�������ļ��еĲ�ͬ�п���ͼƬ��ʾ��������
* ��ʱ���޸�ͼƬ���·��: this.imageRelativePath = "/pageComponent/resources/images/calendar";
*
*/

<!--
document.write("<div id=eosCalendarLayer style='position: absolute; z-index: 9999; width: 185; height: 233; display: none'>");
document.write("<iframe src='/pageComponent/resources/scripts/blank.htm' name=eosCalendarIframe scrolling=no frameborder=0 width=100% height=100%></iframe></div>");

//���ڿؼ��߶� 19+20+120+19+20
function writeIframe(parent)	//��iframe���г�ʼ��
{
	var strIframe = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><style>"+
    "*{font-size: 12px; font-family: ����}"+
	".operate { cursor: hand; }"+
	".textarea{	FONT-FAMILY: Tahoma;font-size:8pt;height: 17px;padding-right:2px;text-align:right;}"+
    ".bg{ color: "+ parent.lightColor +"; cursor: default; background-color: "+ parent.darkColor +";}"+
	"table#tableHead td{ font-size:14px; font-family:����; font-weight:bold; color:#FFFFFF; }"+
    "table#tableMain{ width:180; height:198;}"+
    "table#tableWeek td{ font-size:12px; font-family:����; font-weight:bold; color:#00008B; "+
						"background-color:"+ parent.darkColor +"; border:0px; }"+
    "table#tableDay td{ font-size: 12px; font-family:����; font-color: #000000;border: 0px solid;}"+
	"table#tableTime td{ cursor: hand; font-size: 12px; font-family:����; font-color: #000000;border: 0px solid;}"+
    "td#meizzYearHead, td#meizzYearMonth{color: "+ parent.wordColor +"}"+
    ".out { text-align: center; border-top: 1px solid "+ parent.DarkBorder +"; border-left: 1px solid "+ 
			parent.DarkBorder +"; border-right: 1px solid "+ parent.lightColor +"; border-bottom: 1px solid "+ parent.lightColor +"; }"+
    ".over{ text-align: center; border-top: 1px solid #FFFFFF; border-left: 1px solid #FFFFFF;"+
    "border-bottom: 1px solid "+ parent.DarkBorder +"; border-right: 1px solid "+ parent.DarkBorder +"}"+
    "</style></head><body onselectstart='return false' style='margin: 0px' oncontextmenu='return false'><form name=meizz>";

    if (parent.drag)
	{ 
		strIframe += "<script language=javascript>"+
			"var drag=false, cx=0, cy=0, o = parent.WebCalendar.calendar; function document.onmousemove(){"+
			"if(parent.WebCalendar.drag && drag){if(o.style.left=='')o.style.left=0; if(o.style.top=='')o.style.top=0;"+
			"o.style.left = parseInt(o.style.left) + window.event.clientX-cx;"+
			"o.style.top  = parseInt(o.style.top)  + window.event.clientY-cy;}}"+
			"function document.onkeydown(){ switch(window.event.keyCode){  case 88 : parent.hiddenCalendar(); break;"+
			"case 37 : parent.prevM(); break; case 38 : parent.prevY(); break; case 39 : parent.nextM(); break; case 40 : parent.nextY(); break;"+
			"case 84 : document.all['today'].click(); break;} window.event.keyCode = 0; window.event.returnValue= false;}"+
			"function dragStart(){cx=window.event.clientX; cy=window.event.clientY; drag=true;}"+
			"function scrolltextarea(obj,min,max){ var textareaMin = min; var textareaMax = max; if (obj.scrollTop==0)"+
			"{ obj.value = (parseInt(obj.value) > textareaMax-1)?textareaMin:(parseInt(obj.value)+1); }	else if (obj.scrollTop==2)"+
			"{ obj.value = (parseInt(obj.value) < textareaMin+1)?textareaMax:(parseInt(obj.value)-1);} obj.scrollTop = 1; }</scr"+"ipt>"
	}

	/**
	* ��ݡ��·ݡ�ʱ���֡����ѡ��ؼ�,
	* �Լ������ڿؼ��ϵ�λ�á�
	*/
    strIframe += "<select name=tmpYearSelect  onblur='parent.hiddenSelect(this)' style='z-index:1;position:absolute;top:5;left:33;display:none'"+
    " onchange='parent.WebCalendar.thisYear =this.value; parent.hiddenSelect(this); parent.writeCalendar();'></select>"+
    "<select name=tmpMonthSelect onblur='parent.hiddenSelect(this)' style='z-index:1; position:absolute;top:5;left:95;display:none'"+
    " onchange='parent.WebCalendar.thisMonth=this.value; parent.hiddenSelect(this); parent.writeCalendar();'></select>";

	if(parent.timeShow == true)
		strIframe += "<textarea onscroll=\"scrolltextarea(this,0,23)\"  class=\"textarea\" rows=\"1\" name=\"tmpHourSelect\" cols=\"3\""+ 
			"onblur='parent.WebCalendar.thisHour=this.value; parent.hiddenTextarea(this); parent.writeCalendar();' style='z-index:1; position:absolute;top:176;left:7;display:none'"+
			" onchange='parent.hiddenTextarea(this); parent.writeCalendar();'></textarea>"+
			"<textarea onscroll='scrolltextarea(this,0,59)'  class='textarea' rows='1' name='tmpMinuteSelect' cols='3'"+ "onblur='parent.WebCalendar.thisMinute=this.value; parent.hiddenTextarea(this); parent.writeCalendar();' style='z-index:1; position:absolute;top:176;left:66;display:none'"+
			" onchange='parent.hiddenTextarea(this); parent.writeCalendar();'></textarea>"+
			"<textarea onscroll='scrolltextarea(this,0,59)'  class='textarea' rows='1' name='tmpSecondSelect' cols='3'"+ "onblur='parent.WebCalendar.thisSecond=this.value; parent.hiddenTextarea(this); parent.writeCalendar();' style='z-index:1; position:absolute;top:176;left:127;display:none'"+
			" onchange='parent.hiddenTextarea(this); parent.writeCalendar();'></textarea>";

	strIframe += 
    "<div><table id=tableMain cellspacing=0 cellpadding=0 style='background-color:#F6F6F6;border:1px solid #0054E3;'>"+
    "<tr><td>"+
    "<table width=180 height=30 id=tableHead border=0 cellspacing=0 cellpadding=0 background='"+ parent.imageRelativePath +"/TaskBarBG.gif' bgcolor='#255FDC'><tr align=center>"+
	"<td><image class='operate' src='"+ parent.imageRelativePath +"/_calprevyr.gif' title='��ǰ�� 1 ��&#13;��ݼ�����' onclick='parent.prevY()' onfocus='this.blur()' style='meizz:expression(this.disabled=parent.WebCalendar.thisYear==1000)'></td>" + 
	"<td><image class='operate' src='"+ parent.imageRelativePath +"/_calprevmm.gif' onfocus='this.blur()' title='��ǰ�� 1 ��&#13;��ݼ�����' onclick='parent.prevM()'>"+
    "</td>"+
    "<td width=60 class='operate' id=meizzYearHead  title='����˴�ѡ�����' onclick='parent.funYearSelect(parseInt(this.innerText, 10))'"+
	"</td><td width=15>��</td>"+
    "<td width=60 class='operate' id=meizzYearMonth title='����˴�ѡ���·�' onclick='parent.funMonthSelect(parseInt(this.innerText, 10))'"+
	"</td><td width=15>��</td>"+
	"<td align=right><image class='operate' src='"+ parent.imageRelativePath +"/_calnextmm.gif' title='��� 1 ��&#13;��ݼ�����' onclick='parent.nextM()' onfocus='this.blur()'></td>"+
	"<td><image class='operate' src='"+ parent.imageRelativePath +"/_calnextyr.gif' title='��� 1 ��&#13;��ݼ�����' onclick='parent.nextY()' onfocus='this.blur()' style='meizz:expression(this.disabled=parent.WebCalendar.thisYear==9999)'></td></tr>"+
	"<tr><td colspan=8 width=180 height=2 background='"+ parent.imageRelativePath +"/progressBar.gif'></td></tr>"+
	"</table></td></tr>"+
	"<tr><td height=20><table id=tableWeek width=180 cellspacing=1 cellpadding=0 background-color:#CCCCCC ";

    if(parent.drag)
		strIframe += "onmousedown='dragStart()' onmouseup='drag=false' onmouseout='drag=false'";

	strIframe += "><tr align=center><td height=20>��</td><td>һ</td><td>��</td><td>��</td><td>��</td><td>��</td><td>��</td></tr></table>"+
		"</td></tr><tr><td valign=top width=180 bgcolor='"+ parent.lightColor +"'>"+
	    "<table id=tableDay height=120 width=180 cellspacing=1 cellpadding=1 style='background-color:#CCCCCC;border:0px;'>";
         for(var x=0; x<5; x++){ strIframe += "<tr>";
         for(var y=0; y<7; y++)  strIframe += "<td class=out id='meizzDay"+ (x*7+y) +"'></td>"; strIframe += "</tr>";}
         strIframe += "<tr>";
         for(var x=35; x<42; x++) strIframe += "<td class=out id='meizzDay"+ x +"'></td>";
	
	strIframe += "</tr></table></td></tr>";
	
	/**
	* ʱ���֡���ѡ�������������������ʱ����Ӧ�����ɫ���������Լ���ʱ����ĵ��ڿ�
	*/
	if(parent.timeShow) 	
		strIframe += "<tr><td width=180 height=25>"+
			"<table width='100%' height='100%' id=tableTime border=0 cellspacing=0 cellpadding=0 bgcolor='"+ parent.lightColor +"'><tr align=center>"+
			"<td width=59 id=hourTD align='right'></td>"+
			"<td width=59 id=minuteTD align='right'></td>"+
			"<td width=59 id=secondTD align='right'></td></tr></table></td></tr>";
	
	strIframe +="<tr><td height=30 width=180>"+
		"<table width='100%' height='100%' border=0 cellpadding=0 cellspacing=0 bgcolor='"+ parent.darkColor + "'><tr><td align=center>"+
		"<a href='javascript:parent.returnCurDate();' id='today' onfocus='this.blur()' title='��ǰ����&#13;��ݼ���T'>"+
		"<font color='#444444' style='font-size:12px; font-weight:bold;'>����</font></a></td>"+
		"<td align=center><a href='javascript:parent.hiddenCalendar();' onfocus='this.blur()' title='�رտ�ݼ�:X'>"+
		"<font color='#444444' style='font-size:12px;'>ȡ��</font></a></td>"+ 
		"<td align=center><a href='javascript:parent.clear()'>"+
		"<font color='#444444' style='font-size:12px;'>���</font></a></td>"+ 
		"</tr></table></td></tr><table></div></form></body></html>"

    with(parent.iframe)
    {
        document.writeln(strIframe); document.close();
        for(var i=0; i<42; i++)
        {
            WebCalendar.dayObj[i] = eval("meizzDay"+ i);
            WebCalendar.dayObj[i].onmouseover = dayMouseOver;
            WebCalendar.dayObj[i].onmouseout  = dayMouseOut;
            WebCalendar.dayObj[i].onclick     = returnDate;
        }
    }
}

function WebCalendar() //��ʼ������������
{
    this.daysMonth  = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    this.day        = new Array(42);				//��������չʾ�õ�����
    this.dayObj     = new Array(42);				//��������չʾ�ؼ�����
    this.dateStyle  = null;							//�����ʽ������������
    this.iframe     = window.frames("eosCalendarIframe");						//������ iframe ����
    this.calendar   = getObjectById("eosCalendarLayer");						//�����Ĳ�

	this.objExport  = null;							//�����ش�����ʾ�ؼ�
    this.eventSrc   = null;							//������ʾ�Ĵ����ؼ�
    
	this.inputDate  = null;							//ת��������������(d/m/yyyy)
    this.thisYear   = new Date().getFullYear();		//������ı����ĳ�ʼֵ
    this.thisMonth  = new Date().getMonth()+ 1;		//�����µı����ĳ�ʼֵ
    this.thisDay    = new Date().getDate();			//�����յı����ĳ�ʼֵ
    this.thisHour   = new Date().getHours();		//����ʱ�ı����ĳ�ʼֵ
    this.thisMinute = new Date().getMinutes();      //����ֵı����ĳ�ʼֵ
    this.thisSecond = new Date().getSeconds();      //������ı����ĳ�ʼֵ
    this.today      = this.thisDay +"/"+ this.thisMonth +"/"+ this.thisYear;    //����(d/m/yyyy)
    
    this.dateReg    = "";           //������ʽ��֤������ʽ
	//���������û��ɶ���
    this.yearFall   = 100;           //����������������ֵ
    this.format     = "yyyy-MM-dd"; //*�ش����ڵĸ�ʽ(Ŀǰ֧��yyyy-MM-dd,yyyy/MM/dd)	
    this.timeShow   = true;         //*�Ƿ񷵻�ʱ��	
    this.drag       = true;         //�Ƿ������϶�
    this.darkColor  = "#B3D7FF";	//�ؼ��İ�ɫ
    this.lightColor = "#FFFFFF";    //�ؼ�����ɫ
    this.wordColor  = "#000000";    //�ؼ���������ɫ
    this.wordDark   = "#C0C0C0";    //�ؼ��İ�������ɫ(��ǰ��֮����������ֵ���ɫ)
    this.dayBgColor = "FFFFFF";		//�������ֱ���ɫ
    this.todayColor = "#FFFFCC";    //�����������ϵı�ʾ����ɫ
	this.inputColor = "#B0C4DE";	//ѡ�е������������ϵı�ʾ����
    this.DarkBorder = "#CCCCCC";	//������ʾ��������ɫ
	this.isOpen = false;			//�����Ƿ��Ѵ�
	this.imageRelativePath = "/internet/image";
} 

var WebCalendar = new WebCalendar();

//�û�����������
function calendar() 
{	
	if(WebCalendar.isOpen != true)
	{	
		if(arguments[1] == undefined || arguments[1] == "undefined")
			WebCalendar.format = "yyyy-MM-dd HH:mm:ss";
		else
			WebCalendar.format = arguments[1];

		if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
			WebCalendar.timeShow = false;
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})��(\d{1,2})��(\d{1,2})��$/;
			WebCalendar.timeShow = false;
		}
		else if(WebCalendar.format=="yyyyMMdd")
		{
			WebCalendar.dateReg = /^(\d{4})(\d{2})(\d{2})$/;
			WebCalendar.timeShow = false;
		}
		else if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2}) (HH:mm:ss)$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
			WebCalendar.timeShow = true;
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})��(\d{1,2})��(\d{1,2})��(\d{1,2})ʱ(\d{1,2})��(\d{1,2})��$/;
			WebCalendar.timeShow = true;
		}
		else if(WebCalendar.format=="yyyyMMddHHmmss")
		{	
			WebCalendar.dateReg = /^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/;
			WebCalendar.timeShow = true;
		}
		else
		{
			WebCalendar.format = "yyyy-MM-dd HH:mm:ss";
			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{2})\2(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;
			WebCalendar.timeShow = true;
		}

		var e = window.event.srcElement;
		writeIframe(WebCalendar);
		var o = WebCalendar.calendar.style;
		WebCalendar.eventSrc = e;
		if (arguments.length == 0) 
		  WebCalendar.objExport = e;
		else 
		  WebCalendar.objExport = eval(arguments[0]);
		WebCalendar.iframe.tableWeek.style.cursor = WebCalendar.drag ? "move" : "default";
		
		funBindTo(WebCalendar.objExport);	//��������ʾλ�ð���ĳһ�ؼ���

		o.display = ""; 	
		WebCalendar.iframe.document.body.focus();
		
		var cw = WebCalendar.calendar.clientWidth, ch = WebCalendar.calendar.clientHeight;
		var dw = document.body.clientWidth, dl = document.body.scrollLeft, dt = document.body.scrollTop;
	 
		try{
			if (WebCalendar.objExport.value.trim() != ""){
				WebCalendar.dateStyle = WebCalendar.objExport.value.trim().match(WebCalendar.dateReg);
				if (WebCalendar.dateStyle == null)
				{
					WebCalendar.thisYear   = new Date().getFullYear();
					WebCalendar.thisMonth  = new Date().getMonth()+ 1;
					WebCalendar.thisDay    = new Date().getDate(); 
					WebCalendar.thisHour   = new Date().getHours();	
					WebCalendar.thisMinute = new Date().getMinutes();
					WebCalendar.thisSecond = new Date().getSeconds(); 
					writeCalendar(); return false;
				}
				else
				{
					if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format) || 
						/^(y{4})(-|\/)(M{1,2})\2(d{1,2}) (HH:mm:ss)$/.test(WebCalendar.format))
					{
						WebCalendar.thisYear   = parseInt(WebCalendar.dateStyle[1], 10);
						WebCalendar.thisMonth  = parseInt(WebCalendar.dateStyle[3], 10);
						WebCalendar.thisDay    = parseInt(WebCalendar.dateStyle[4], 10);
						WebCalendar.thisHour   = parseInt(WebCalendar.dateStyle[5], 10);
						WebCalendar.thisMinute = parseInt(WebCalendar.dateStyle[6], 10);
						WebCalendar.thisSecond = parseInt(WebCalendar.dateStyle[7], 10);
					}
					else
					{
						WebCalendar.thisYear   = parseInt(WebCalendar.dateStyle[1], 10);
						WebCalendar.thisMonth  = parseInt(WebCalendar.dateStyle[2], 10);
						WebCalendar.thisDay    = parseInt(WebCalendar.dateStyle[3], 10);
						WebCalendar.thisHour   = parseInt(WebCalendar.dateStyle[4], 10);
						WebCalendar.thisMinute = parseInt(WebCalendar.dateStyle[5], 10);
						WebCalendar.thisSecond = parseInt(WebCalendar.dateStyle[6], 10);
					}
					WebCalendar.inputDate  = parseInt(WebCalendar.thisDay, 10) +"/"+ parseInt(WebCalendar.thisMonth, 10) +"/"+ 
											parseInt(WebCalendar.thisYear, 10); 
					writeCalendar(); 
					WebCalendar.isOpen = true;
				}
			}  else { 
				WebCalendar.thisYear   = new Date().getFullYear();		
				WebCalendar.thisMonth  = new Date().getMonth()+ 1;		
				WebCalendar.thisDay    = new Date().getDate();			
				WebCalendar.thisHour   = new Date().getHours();		
				WebCalendar.thisMinute = new Date().getMinutes();      
				WebCalendar.thisSecond = new Date().getSeconds();      
				writeCalendar(); WebCalendar.isOpen = true; }
		}  catch(e){ writeCalendar();WebCalendar.isOpen = true; }
	}
	else
	{
		hiddenCalendar(); 
	}
}

function funBindTo(target)	//����������ĳһ�ؼ���
{
	var t = target.offsetTop,  h = target.clientHeight, l = target.offsetLeft, p = target.type;
	var o = WebCalendar.calendar.style;

	while (target = target.offsetParent)
	  {t += target.offsetTop; l += target.offsetLeft;}

	var cw = parseInt(o.width), ch = parseInt(o.height);
    var dw = document.body.clientWidth, dl = document.body.scrollLeft, dt = document.body.scrollTop, dh = document.body.clientHeight;

	if (dh + dt - t - h >= ch) 
	  o.top = (p=="image")? t + h : t + h + 6;
    else 
	  o.top  = (t - dt < ch) ? ((p=="image")? t + h : t + h + 6) : (t - ch);
    if (dw + dl - l >= cw) 
	  o.left = l; 
	else 
	  o.left = (dw >= cw) ? dw - cw + dl : dl;
}

function funMonthSelect() //�·ݵ�������
{
    var m = isNaN(parseInt(WebCalendar.thisMonth, 10)) ? new Date().getMonth() + 1 : parseInt(WebCalendar.thisMonth);
    var e = WebCalendar.iframe.document.forms[0].tmpMonthSelect;
    for (var i=1; i<13; i++) e.options.add(new Option(i, i));// +"��"
    e.style.display = ""; e.value = m; e.focus(); window.status = e.style.top;//??
}

function funYearSelect() //��ݵ�������
{
    var n = WebCalendar.yearFall;
    var e = WebCalendar.iframe.document.forms[0].tmpYearSelect;
    var y = isNaN(parseInt(WebCalendar.thisYear, 10)) ? new Date().getFullYear() : parseInt(WebCalendar.thisYear);
        y = (y <= 1000)? 1000 : ((y >= 9999)? 9999 : y);
    var min = (y - n >= 1000) ? y - n : 1000;
    var max = (y + n <= 9999) ? y + n : 9999;
        min = (max == 9999) ? max-n*2 : min;
        max = (min == 1000) ? min+n*2 : max;
    for (var i=min; i<=max; i++) e.options.add(new Option(i, i));// +"��"
    e.style.display = ""; e.value = y; e.focus();
}

function funHourSelect() //Сʱ�Ĺ�����ť
{    
	if(WebCalendar.timeShow) 
	{ 
		var h = isNaN(parseInt(WebCalendar.thisHour, 10)) ? new Date().getHours() : parseInt(WebCalendar.thisHour);
		var e = WebCalendar.iframe.document.forms[0].tmpHourSelect;
		e.style.display = ""; e.value = h; e.focus(); 
	}
}

function funMinuteSelect() //���ӵĹ�����ť
{
	if(WebCalendar.timeShow) 
	{
		var mi = isNaN(parseInt(WebCalendar.thisMinute, 10)) ? new Date().getMinutes() : parseInt(WebCalendar.thisMinute);
		var e = WebCalendar.iframe.document.forms[0].tmpMinuteSelect;
		e.style.display = ""; e.value = mi; e.focus();
	}
}

function funSecondSelect() //��Ĺ�����ť
{
	if(WebCalendar.timeShow) 
	{
		var s = isNaN(parseInt(WebCalendar.thisSecond, 10)) ? new Date().getSeconds : parseInt(WebCalendar.thisSecond);
		var e = WebCalendar.iframe.document.forms[0].tmpSecondSelect;
		e.style.display = ""; e.value = s; e.focus();
	}
}

function prevM()  //��ǰ���·�
{
    WebCalendar.thisDay = 1;
    if (WebCalendar.thisMonth==1)
    {
        WebCalendar.thisYear--;
        WebCalendar.thisMonth=13;
    }
    WebCalendar.thisMonth--; 
	writeCalendar();
}

function nextM()  //�����·�
{
    WebCalendar.thisDay = 1;
    if (WebCalendar.thisMonth==12)
    {
        WebCalendar.thisYear++;
        WebCalendar.thisMonth=0;
    }
    WebCalendar.thisMonth++; 
	writeCalendar();
}

//��ǰ�� Year
function prevY()
{WebCalendar.thisDay = 1; WebCalendar.thisYear--; writeCalendar();}

//���� Year
function nextY()
{WebCalendar.thisDay = 1; WebCalendar.thisYear++; writeCalendar();}

//���������б�
function hiddenSelect(e)
{for(var i=e.options.length; i>-1; i--)e.options.remove(i); e.style.display="none";}

//����΢����ť
function hiddenTextarea(e)
{e.style.display="none";}

//��ȡ����
function getObjectById(id)
{ 
  if(document.all) 
    return(eval("document.all."+ id)); 
  return(eval(id));
}

//��������
function hiddenCalendar()
{
  getObjectById("eosCalendarLayer").style.display = "none";
  WebCalendar.isOpen = false;
}

//�����Զ��������
function appendZero(n)
{return(("00"+ n).substr(("00"+ n).length-2));}

//�����ַ�����ȥ�ո���
function String.prototype.trim()
{return this.replace(/(^\s*)|(\s*$)/g,"");}

//����Ƶ�ĳ��ʱ���¼�
function dayMouseOver()
{
    this.className = "over";
    this.style.backgroundColor = WebCalendar.darkColor;
    if(WebCalendar.day[this.id.substr(8)].split("/")[1] == WebCalendar.thisMonth)
    this.style.color = WebCalendar.lightColor;
	this.style.cursor = "hand";
}

//����Ƴ�ĳ��ʱ���¼�
function dayMouseOut()
{
    this.className = "out"; 
	var d = WebCalendar.day[this.id.substr(8)], a = d.split("/");
    this.style.removeAttribute('backgroundColor');
    if(a[1] == WebCalendar.thisMonth && d != WebCalendar.today)
    {
        if(WebCalendar.dateStyle && a[0] == parseInt(WebCalendar.dateStyle[4], 10))
        this.style.color = WebCalendar.lightColor;
        this.style.color = WebCalendar.wordColor;
    }
}

//��������ʾ�����ݵĴ������
function writeCalendar() 
{
    var y = WebCalendar.thisYear;
    var m = WebCalendar.thisMonth; 
    var d = WebCalendar.thisDay;
	var h = WebCalendar.thisHour;
	var mi = WebCalendar.thisMinute;
	var s = WebCalendar.thisSecond;
    WebCalendar.daysMonth[1] = (0==y%4 && (y%100!=0 || y%400==0)) ? 29 : 28;
    if (!(parseInt(y, 10)<=9999 && parseInt(y, 10) >= 1000 && parseInt(m, 10)>=0 && parseInt(m, 10)<=12 && parseInt(d, 10)>=0
		 && parseInt(h, 10)<=23 && parseInt(h, 10)>=0 && parseInt(mi, 10)<=59 && parseInt(mi, 10)>=0
		 && parseInt(s, 10)<=59 && parseInt(s, 10)>=0))
	{
		//alert("�Բ����������˴�������ڣ�");
        WebCalendar.thisYear     = new Date().getFullYear();
        WebCalendar.thisMonth    = new Date().getMonth()+ 1;
        WebCalendar.thisDay		 = new Date().getDate(); 
		WebCalendar.thisHour	 = new Date().getHours(); 
		WebCalendar.thisMinute   = new Date().getMinutes(); 
		WebCalendar.thisSecond   = new Date().getSeconds(); 
	}
    WebCalendar.iframe.meizzYearHead.innerText  = y;
    WebCalendar.iframe.meizzYearMonth.innerText = m;
	if(WebCalendar.timeShow)
	{
		WebCalendar.iframe.hourTD.innerText = h +" ʱ";
		WebCalendar.iframe.hourTD.title = '����˴�ѡ��ʱ';
		WebCalendar.iframe.hourTD.onclick = funHourSelect;
		WebCalendar.iframe.minuteTD.innerText = mi +" ��";
		WebCalendar.iframe.minuteTD.title='����˴�ѡ���';
		WebCalendar.iframe.minuteTD.onclick = funMinuteSelect;
		WebCalendar.iframe.secondTD.innerText = s +" ��";
		WebCalendar.iframe.secondTD.title='����˴�ѡ����';
		WebCalendar.iframe.secondTD.onclick = funSecondSelect;
	}
	WebCalendar.daysMonth[1] = (0==y%4 && (y%100!=0 || y%400==0)) ? 29 : 28; //�������Ϊ29��
    var w = new Date(y, m-1, 1).getDay();	//����ֵ0-6 -> ����-��һ
    var prevDays = m==1  ? WebCalendar.daysMonth[11] : WebCalendar.daysMonth[m-2];	//��ǰ����һ��������
	//������ for ѭ��Ϊ����������Դ������ WebCalendar.day����ʽ�� d/m/yyyy
	for(var i=(w-1); i>=0; i--)	//�����ϸ�������
    {
        WebCalendar.day[i] = prevDays +"/"+ (parseInt(m, 10)-1) +"/"+ y;
        if(m==1) WebCalendar.day[i] = prevDays +"/"+ 12 +"/"+ (parseInt(y, 10)-1);
        prevDays--;
    }
    for(var i=1; i<=WebCalendar.daysMonth[m-1]; i++) WebCalendar.day[i+w-1] = i +"/"+ m +"/"+ y;	//��������
    for(var i=1; i<42-w-WebCalendar.daysMonth[m-1]+1; i++)	//��������
    {
        WebCalendar.day[WebCalendar.daysMonth[m-1]+w-1+i] = i +"/"+ (parseInt(m, 10)+1) +"/"+ y;
        if(m==12) WebCalendar.day[WebCalendar.daysMonth[m-1]+w-1+i] = i +"/"+ 1 +"/"+ (parseInt(y, 10)+1);
    }
    for(var i=0; i<42; i++)    //���ѭ���Ǹ���Դ����д����������ʾ
    {
        var a = WebCalendar.day[i].split("/");
        WebCalendar.dayObj[i].innerText    = a[0];
        WebCalendar.dayObj[i].title        = a[2] +"-"+ appendZero(a[1]) +"-"+ appendZero(a[0]);
        WebCalendar.dayObj[i].bgColor      = WebCalendar.dayBgColor;
        WebCalendar.dayObj[i].style.color  = WebCalendar.wordColor;
        if ((i<10 && parseInt(WebCalendar.day[i], 10)>20) || (i>27 && parseInt(WebCalendar.day[i], 10)<12))
            WebCalendar.dayObj[i].style.color = WebCalendar.wordDark;
        if (WebCalendar.inputDate==WebCalendar.day[i])    //�����������������������ϵ���ɫ
        {
			WebCalendar.dayObj[i].bgColor = WebCalendar.inputColor; 
			WebCalendar.dayObj[i].style.color = WebCalendar.wordColor;
			WebCalendar.dayObj[i].style.fontWeight = "bold";
		}
        if (WebCalendar.day[i] == WebCalendar.today)      //���ý����������Ϸ�ӳ��������ɫ
        {
			WebCalendar.dayObj[i].bgColor = WebCalendar.todayColor; 
			WebCalendar.dayObj[i].style.color = WebCalendar.wordColor;
			WebCalendar.dayObj[i].style.fontWeight = "bold";
		}
    }
}

/*
* �������ڸ�ʽ�ȷ����û�ѡ��������
* Ŀǰ֧��:yyyyMMdd,yyyy/MM/dd,yyyy-MM-dd,yyyy��MM��dd��
* yyyyMMddHHmmss,yyyy/MM/dd HH:mm:ss,yyyy-MM-dd HH:mm:ss,yyyy��MM��dd��HHʱmm��ss��
*/
function returnDate() 
{
    if(WebCalendar.objExport)
    {
        var returnValue;
		var a = WebCalendar.day[this.id.substr(8)].split("/");
		
		if(WebCalendar.format == "yyyyMMdd" || WebCalendar.format == "yyyyMMddHHmmss")
		//eos��׼��ʽ
		{			
			returnValue = a[2] + appendZero(a[1]) + appendZero(a[0]);
			if(WebCalendar.timeShow == true)
			{
				var h = WebCalendar.thisHour, m = WebCalendar.thisMinute, s = WebCalendar.thisSecond;
				returnValue += appendZero(h) + appendZero(m) + appendZero(s);
			}
		}
		else if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format) || 
			/^(y{4})(-|\/)(M{1,2})(-|\/)(d{1,2}) HH:mm:ss$/.test(WebCalendar.format))
		//"-","/"�����ʽ
		{
			var d;
			if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format))
				d = WebCalendar.format.match(/^(\w{4})(-|\/)(\w{1,2})\2(\w{1,2})$/);
			else
				d = WebCalendar.format.match(/^(\w{4})(-|\/)(\w{1,2})\2(\w{1,2}) HH:mm:ss$/);
			if(d==null)
			{
			  alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
			  return false;
			}
			var flag = d[3].length==2 || d[4].length==2; //�жϷ��ص����ڸ�ʽ�Ƿ�Ҫ����
			returnValue = flag ? a[2] +d[2]+ appendZero(a[1]) +d[2]+ appendZero(a[0]) : a[2] +d[2]+ a[1] +d[2]+ a[0];			
			if(WebCalendar.timeShow == true)
			{
				var h = WebCalendar.thisHour, m = WebCalendar.thisMinute, s = WebCalendar.thisSecond;
				returnValue += flag ? " "+ appendZero(h) +":"+ appendZero(m) +":"+ appendZero(s) : " "+  h  +":"+ m +":"+ s;
			}			
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format) ||
			/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/.test(WebCalendar.format))
		//���ĸ�ʽ
		{
			var d;
			if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format))
				d = WebCalendar.format.match(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/);
			else
				d = WebCalendar.format.match(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/);
			if(d==null)
			{
			  alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
			  return false;
			}
			var flag = d[3].length==2 || d[5].length==2; //�жϷ��ص����ڸ�ʽ�Ƿ�Ҫ����
			returnValue = flag ? a[2] + "��" + appendZero(a[1]) + "��" + appendZero(a[0]) + "��" : a[2] + "��" + a[1] + "��" + a[0] + "��";
			if(WebCalendar.timeShow == true)
			{
				var h = WebCalendar.thisHour, m = WebCalendar.thisMinute, s = WebCalendar.thisSecond;
				returnValue += flag ? appendZero(h) +"ʱ"+ appendZero(m) + "��" + appendZero(s) + "��" : h +"ʱ"+ m + "��" + s + "��";
			}
		}
		else
		//Ĭ�ϵķ��ظ�ʽ
		{	
			if(/^(y{4})(-)(M{1,2})\2(d{1,2}) HH:mm:ss$/.test(WebCalendar.format))	
			{
				var h = WebCalendar.thisHour, m = WebCalendar.thisMinute, s = WebCalendar.thisSecond;
				returnValue = a[2] + "-" + appendZero(a[1]) + "-" + appendZero(a[0]);
				returnValue += " " + appendZero(h) +":"+ appendZero(m) + ":" + appendZero(s);
			}
			else
				alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
		}
        WebCalendar.objExport.value = returnValue;
        hiddenCalendar();
    }
	else
	{
		alert("���趨���������λ�ò��ԣ�\r\n\r\n�����¶��� WebCalendar.objExport ��");
	}
}

function returnCurDate() //�������ڸ�ʽ�ȷ��ص�ǰ����
{
	var yy = new Date().getFullYear(),mm = new Date().getMonth() +1,dd = new Date().getDate();
	var h = new Date().getHours(), m = new Date().getMinutes(), s = new Date().getSeconds();
    if(WebCalendar.objExport)
    {
        var returnValue;
		if(WebCalendar.format == "yyyyMMdd" || WebCalendar.format == "yyyyMMddHHmmss")
		//eos��׼��ʽ
		{
			returnValue = yy + appendZero(mm) + appendZero(dd);
			if(WebCalendar.timeShow == true)
			{
				returnValue += appendZero(h) + appendZero(m) + appendZero(s);
			}
		}
		else if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format) || 
			/^(y{4})(-|\/)(M{1,2})(-|\/)(d{1,2}) HH:mm:ss$/.test(WebCalendar.format))
		//"-","/"�����ʽ
		{
			var d;
			if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format))
				d = WebCalendar.format.match(/^(\w{4})(-|\/)(\w{1,2})\2(\w{1,2})$/);
			else
				d = WebCalendar.format.match(/^(\w{4})(-|\/)(\w{1,2})\2(\w{1,2}) HH:mm:ss$/);

			if(d==null)
			{
			  alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
			  return false;
			}
			var flag = d[3].length==2 || d[4].length==2; //�жϷ��ص����ڸ�ʽ�Ƿ�Ҫ����
			returnValue = flag ? yy +d[2]+ appendZero(mm) +d[2]+ appendZero(dd) : yy +d[2]+ mm +d[2]+ dd;
			if(WebCalendar.timeShow == true)
			{			
				returnValue += flag ? " "+ appendZero(h) +":"+ appendZero(m) +":"+ appendZero(s) : " "+  h  +":"+ m +":"+ s;
			}
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format) ||
			/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/.test(WebCalendar.format))
		//���ĸ�ʽ
		{
			var d;
			if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format))
				d = WebCalendar.format.match(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/);
			else
				d = WebCalendar.format.match(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/);
			if(d==null)
			{
			  alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
			  return false;
			}
			var flag = d[3].length==2 || d[5].length==2; //�жϷ��ص����ڸ�ʽ�Ƿ�Ҫ����
			returnValue = flag ? yy + "��" + appendZero(mm) + "��" + appendZero(dd) + "��" : yy + "��" + mm + "��" + dd + "��";
			if(WebCalendar.timeShow == true)
			{
				var h = WebCalendar.thisHour, m = WebCalendar.thisMinute, s = WebCalendar.thisSecond;
				returnValue += flag ? appendZero(h) +"ʱ"+ appendZero(m) + "��" + appendZero(s) + "��" : h +"ʱ"+ m + "��" + s + "��";
			}
		}
		else
		//Ĭ�ϵķ��ظ�ʽ
		{	
			if(/^(y{4})(-)(M{1,2})\2(d{1,2}) HH:mm:ss$/.test(WebCalendar.format))	
			{
				var h = WebCalendar.thisHour, m = WebCalendar.thisMinute, s = WebCalendar.thisSecond;
				returnValue = yy + "-" + mm + "-" + ss;
				returnValue += " " + appendZero(h) +":"+ appendZero(m) + ":" + appendZero(s);
			}
			else
				alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
		}
        WebCalendar.objExport.value = returnValue;
        hiddenCalendar();
    }
	else
	{
		alert("���趨���������λ�ò��ԣ�\r\n\r\n�����¶��� WebCalendar.objExport ��");
	}
}

function clear() {
	if(WebCalendar.objExport) {
		WebCalendar.objExport.value = "";
		hiddenCalendar();
	}
}

function document.onclick()
{
    if(WebCalendar.eventSrc != window.event.srcElement) 
		hiddenCalendar();
}

/**
��*�˺�����yyyMMdd��yyyyMMddHHmmssת�ɸ���֧�ֵĸ�ʽ
��*����˵����
��*��������data:��ת�������ڡ�
��*��������format:��Ҫת���ɵ����ڸ�ʽ��
��*
��*/
function formatSpecial(data,format)
{ 
	

	if(WebCalendar.isOpen != true)
	{	
		if(arguments[1] == undefined || arguments[1] == "undefined")
			WebCalendar.format = "yyyy-MM-dd HH:mm:ss";
		else
			WebCalendar.format = arguments[1];

		if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
			WebCalendar.timeShow = false;
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})��(\d{1,2})��(\d{1,2})��$/;
			WebCalendar.timeShow = false;
		}
		else if(WebCalendar.format=="yyyyMMdd")
		{
			WebCalendar.dateReg = /^(\d{4})(\d{2})(\d{2})$/;
			WebCalendar.timeShow = false;
		}
		else if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2}) (HH:mm:ss)$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
			WebCalendar.timeShow = true;
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/.test(WebCalendar.format))
		{
			WebCalendar.dateReg = /^(\d{4})��(\d{1,2})��(\d{1,2})��(\d{1,2})ʱ(\d{1,2})��(\d{1,2})��$/;
			WebCalendar.timeShow = true;
		}
		else if(WebCalendar.format=="yyyyMMddHHmmss")
		{	
			WebCalendar.dateReg = /^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/;
			WebCalendar.timeShow = true;
		}
		else
		{
			WebCalendar.format = "yyyy-MM-dd HH:mm:ss";
			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{2})\2(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;
			WebCalendar.timeShow = true;
		}
        var returnValue;
		//alert(this.id.substr(8));
		//alert(WebCalendar.day[this.id.substr(8)]);
		//var a = WebCalendar.day[this.id.substr(8)].split("/");
		var a=new Array();
		a[2]=data.substr(0,4);
		a[1]=data.substr(4,2);
		a[0]=data.substr(6,2);
        
		
		if(WebCalendar.format == "yyyyMMdd" || WebCalendar.format == "yyyyMMddHHmmss")
		//eos��׼��ʽ
		{		
			returnValue = a[2] + appendZero(a[1]) + appendZero(a[0]);
			if(WebCalendar.timeShow == true)
			{
				var h = data.substr(8,2);
				var  m = data.substr(10,2);
				var s = data.substr(12,2);
				returnValue += appendZero(h) + appendZero(m) + appendZero(s);
			}
		}
		else if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format) || 
			/^(y{4})(-|\/)(M{1,2})(-|\/)(d{1,2}) HH:mm:ss$/.test(WebCalendar.format))
		//"-","/"�����ʽ
		{
			var d;
			if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(WebCalendar.format))
				d = WebCalendar.format.match(/^(\w{4})(-|\/)(\w{1,2})\2(\w{1,2})$/);
			else
				d = WebCalendar.format.match(/^(\w{4})(-|\/)(\w{1,2})\2(\w{1,2}) HH:mm:ss$/);
			if(d==null)
			{
			 // alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
			  return data;
			}
			var flag = d[3].length==2 || d[4].length==2; //�жϷ��ص����ڸ�ʽ�Ƿ�Ҫ����
			returnValue = flag ? a[2] +d[2]+ appendZero(a[1]) +d[2]+ appendZero(a[0]) : a[2] +d[2]+ a[1] +d[2]+ a[0];			
			if(WebCalendar.timeShow == true)
			{
				var h = data.substr(8,2);
				var  m = data.substr(10,2);
				var s = data.substr(12,2);
				returnValue += flag ? " "+ appendZero(h) +":"+ appendZero(m) +":"+ appendZero(s) : " "+  h  +":"+ m +":"+ s;
			}
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format) ||
			/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/.test(WebCalendar.format))
		//���ĸ�ʽ
		{
			var d;
			if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(WebCalendar.format))
				d = WebCalendar.format.match(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/);
			else
				d = WebCalendar.format.match(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/);
			if(d==null)
			{
			  //alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
			  return data;
			}
			var flag = d[3].length==2 || d[5].length==2; //�жϷ��ص����ڸ�ʽ�Ƿ�Ҫ����
			returnValue = flag ? a[2] + "��" + appendZero(a[1]) + "��" + appendZero(a[0]) + "��" : a[2] + "��" + a[1] + "��" + a[0] + "��";
			//returnValue =  a[2] + "��" + a[1] + "��" + a[0] + "��";
			if(WebCalendar.timeShow == true)
			{
				var h = data.substr(8,2);
				var  m = data.substr(10,2);
				var s = data.substr(12,2);
				returnValue += flag ? appendZero(h) +"ʱ"+ appendZero(m) + "��" + appendZero(s) + "��" : h +"ʱ"+ m + "��" + s + "��";
			//returnValue +=  h +"ʱ"+ m + "��" + s + "��";
			
			
			}
		}
		else
		//Ĭ�ϵķ��ظ�ʽ
		{	
			if(/^(y{4})(-)(M{1,2})\2(d{1,2}) HH:mm:ss$/.test(WebCalendar.format))	
			{
				var h = data.substr(8,2);
				var  m = data.substr(10,2);
				var s = data.substr(12,2);
				returnValue = a[2] + "-" + appendZero(a[1]) + "-" + appendZero(a[0]);
				returnValue += " " + appendZero(h) +":"+ appendZero(m) + ":" + appendZero(s);
			}
			else
			 return data;	
			//alert("���趨�����������ʽ���ԣ�\r\n\r\n�����¶��� WebCalendar.format ��");
		}
		
       return returnValue;
      
    }


	}

/**
��*�˺����Ѹ���֧�ֵĸ�ʽת��yyyMMdd��yyyyMMddHHmmss
��*����˵����
��*��������data:��ת�������ڡ�
��*��������format:��ת�����ڵĸ�ʽ��
��*
��*/

	function formatDefault(data,format)
	{             
		


		if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(format))
		{
			return data.substr(0,4)+data.substr(5,2)+data.substr(8,2);

		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)$/.test(format))
		{
			return data.substr(0,4)+data.substr(5,2)+data.substr(8,2);
		}
		else if(WebCalendar.format=="yyyyMMdd")
		{
			return data;
			
		}
		else if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2}) (HH:mm:ss)$/.test(format))
		{return data.substr(0,4)+data.substr(5,2)+data.substr(8,2)+data.substr(11,2)+data.substr(14,2)+data.substr(17,2);

			WebCalendar.dateReg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
			WebCalendar.timeShow = true;
		}
		else if(/^(y{4})(��)(M{1,2})(��)(d{1,2})(��)(HHʱmm��ss��)$/.test(format))
		{
			return data.substr(0,4)+data.substr(5,2)+data.substr(8,2)+data.substr(11,2)+data.substr(14,2)+data.substr(17,2);

			
		}
		else if(format=="yyyyMMddHHmmss")
		{	return data
			
		}
		else
		{
			
            return data.substr(0,4)+data.substr(5,2)+data.substr(8,2)+data.substr(11,2)+data.substr(14,2)+data.substr(17,2);

			
		}

				}
//-->