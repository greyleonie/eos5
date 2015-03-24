<%@include file="/internet/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������ί��У��Ϣһ�廯ƽ̨</title>


<script language="javascript">

function test(t) {
    for (var i=0; i<t.rows.length; i++)
    for (var j=0; j<t.rows[i].cells.length; j++)
    t.rows[i].cells[j].className= t.rows[i].cells[j] == event.srcElement ? 'button_under' : 'button';
}
</script>

<!--  �й�ũ����ʼ  -->
<SCRIPT language=JavaScript><!--

var lunarInfo=new Array(
0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0);
var Animals=new Array("��","ţ","��","��","��","��","��","��","��","��","��","��");
var Gan=new Array("��","��","��","��","��","��","��","��","��","��");
var Zhi=new Array("��","��","��","î","��","��","��","δ","��","��","��","��");
var now = new Date();
var SY = now.getYear(); 
var SM = now.getMonth();
var SD = now.getDate();

//==== ���� offset ���ظ�֧, 0=����
function cyclical(num) { return(Gan[num%10]+Zhi[num%12])}


//==== ����ũ�� y���������
function lYearDays(y) {
   var i, sum = 348
   for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0
   return(sum+leapDays(y))
}

//==== ����ũ�� y�����µ�����
function leapDays(y) {
   if(leapMonth(y))  return((lunarInfo[y-1900] & 0x10000)? 30: 29)
   else return(0)
}



//==== ����ũ�� y�����ĸ��� 1-12 , û�򴫻� 0
function leapMonth(y) { return(lunarInfo[y-1900] & 0xf)}



//====================================== ����ũ�� y��m�µ�������
function monthDays(y,m) { return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 )}

//==== ���ũ��, �����������, ����ũ���������
//     ����������� .year .month .day .isLeap .yearCyl .dayCyl .monCyl
function Lunar(objDate) {
   var i, leap=0, temp=0
   var baseDate = new Date(1900,0,31)
   var offset   = (objDate - baseDate)/86400000

   this.dayCyl = offset + 40
   this.monCyl = 14

   for(i=1900; i<2050 && offset>0; i++) {
      temp = lYearDays(i)
      offset -= temp
      this.monCyl += 12
   }
   if(offset<0) {
      offset += temp;
      i--;
      this.monCyl -= 12
   }

   this.year = i
   this.yearCyl = i-1864

   leap = leapMonth(i) //���ĸ���
   this.isLeap = false

   for(i=1; i<13 && offset>0; i++) {
      //����
      if(leap>0 && i==(leap+1) && this.isLeap==false)
         { --i; this.isLeap = true; temp = leapDays(this.year); }
      else
         { temp = monthDays(this.year, i); }

      //�������
      if(this.isLeap==true && i==(leap+1)) this.isLeap = false

      offset -= temp
      if(this.isLeap == false) this.monCyl ++
   }

   if(offset==0 && leap>0 && i==leap+1)
      if(this.isLeap)
         { this.isLeap = false; }
      else
         { this.isLeap = true; --i; --this.monCyl;}

   if(offset<0){ offset += temp; --i; --this.monCyl; }

   this.month = i
   this.day = offset + 1
}



 function YYMMDD(){ 
    var cl = '<font color="#0000df" STYLE="font-size:9pt;">'; 
    if (now.getDay() == 0) cl = '<font color="#c00000" STYLE="font-size:9pt;">'; 
   if (now.getDay() == 6) cl = '<font color="#00c000" STYLE="font-size:9pt;">';
   return(cl+SY+'��'+(SM+1)+'��'+SD+'��</font>'); 
 }

 function weekday(){ 
    var day = new Array("������","����һ","���ڶ�","������","������","������","������");
    var cl = '<font color="#ff0000" STYLE="font-size:9pt;">'; 
    if (now.getDay() == 0) cl = '<font color="#c00000" STYLE="font-size:9pt;">';
    if (now.getDay() == 6) cl = '<font color="#00c000" STYLE="font-size:9pt;">'; 
    return(cl+ day[now.getDay()]+ '</font>'); 
 }


//==== ��������
function cDay(m,d){
 var nStr1 = new Array('��','һ','��','��','��','��','��','��','��','��','ʮ');
 var nStr2 = new Array('��','ʮ','إ','ئ','��');
 var s;
 if (m>10){s = 'ʮ'+nStr1[m-10]} else {s = nStr1[m]} s += '��'
 switch (d) {
  case 10:s += '��ʮ'; break;
  case 20:s += '��ʮ'; break;
  case 30:s += '��ʮ'; break;
  default:s += nStr2[Math.floor(d/10)]; s += nStr1[d%10];
 }
 return(s);
}
 function solarDay1(){
    var sDObj = new Date(SY,SM,SD);
    var lDObj = new Lunar(sDObj);
    var cl = '<font color="#000066" STYLE="font-size:9pt;">'; 
   // var tt = '��'+Animals[(SY-4)%12]+'��'+cyclical(lDObj.monCyl)+'�� '+cyclical(lDObj.dayCyl++)+'��' ;
    var tt = '��'+Animals[(SY-4)%12]+'��' ;
    return(cl+tt+'</font>');
 }
 function solarDay2(){
    var sDObj = new Date(SY,SM,SD);
    var lDObj = new Lunar(sDObj);
    var cl = '<font color="#000066" STYLE="font-size:9pt;">'; 
    //ũ��BB'+(cld[d].isLeap?'�� ':' ')+cld[d].lMonth+' �� '+cld[d].lDay+' ��
    var tt = cyclical(SY-1900+36)+'�� '+cDay(lDObj.month,lDObj.day);
    return(cl+tt+'</font>');
 }
 function solarDay3(){
var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758)
var solarTerm = new Array("С��","��","����","��ˮ","����","����","����","����","����","С��","â��","����","С��","����","����","����","��¶","���","��¶","˪��","����","Сѩ","��ѩ","����")
var lFtv = new Array("0101*����","0115 Ԫ����","0505 �����","0707 ��Ϧ���˽�","0715 ��Ԫ��","0815 �����","0909 ������","1208 ���˽�","1224 С��","0100*��Ϧ")
var sFtv = new Array("0101*Ԫ��","0214 ���˽�","0308 ��Ů��","0312 ֲ����","0315 ������Ȩ����","0401 ���˽�","0501 �Ͷ���","0504 �����","0512 ��ʿ��","0601 ��ͯ��","0701 ������ ��ۻع����",
"0801 ������","0808 ���׽�","0909 ë����������","0910 ��ʦ��","0928 ���ӵ���","1001*�����",
"1006 ���˽�","1024 ���Ϲ���","1112 ����ɽ����","1220 ���Żع����","1225 ʥ����","1226 ë�󶫵���")

  var sDObj = new Date(SY,SM,SD);
  var lDObj = new Lunar(sDObj);
  var lDPOS = new Array(3)
  var festival='',solarTerms='',solarFestival='',lunarFestival='',tmp1,tmp2;
  //ũ������ 
  for(i in lFtv)
  if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
   tmp1=Number(RegExp.$1)-lDObj.month
   tmp2=Number(RegExp.$2)-lDObj.day
   if(tmp1==0 && tmp2==0) lunarFestival=RegExp.$4 
  }
  //��������
  for(i in sFtv)
  if(sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/)){
   tmp1=Number(RegExp.$1)-(SM+1)
   tmp2=Number(RegExp.$2)-SD
   if(tmp1==0 && tmp2==0) solarFestival = RegExp.$4 
  }
  //����
  tmp1 = new Date((31556925974.7*(SY-1900)+sTermInfo[SM*2+1]*60000)+Date.UTC(1900,0,6,2,5))
  tmp2 = tmp1.getUTCDate()
  if (tmp2==SD) solarTerms = solarTerm[SM*2+1]  
  tmp1 = new Date((31556925974.7*(SY-1900)+sTermInfo[SM*2]*60000)+Date.UTC(1900,0,6,2,5))
  tmp2= tmp1.getUTCDate()
  if (tmp2==SD) solarTerms = solarTerm[SM*2] 

  if(solarTerms == '' && solarFestival == '' && lunarFestival == '')
    festival = '';
  else
    festival =  solarTerms + ' ' + solarFestival + ' ' + lunarFestival;

    /*
        festival = '<TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR="#CCFFCC"><TR><TD>'+
    '<FONT COLOR="#000000" STYLE="font-size:9pt;">'+solarTerms + ' ' + solarFestival + ' ' + lunarFestival+'</FONT></TD>'+
    '</TR></TABLE>';
    */
              
  var cl = '<font color="#000066" STYLE="font-size:9pt;">';
  return(cl+festival+'</font>');
 }

 function setCalendar(){
    //document.write('<table align=center CELLPADDING=2 CELLSPACING=0 border=1><tr><td bgcolor=#FEFEEF><table border=0 CELLPADDING=0 CELLSPACING=0><tr><td align=center>');
      document.write(YYMMDD()+weekday()+'&nbsp;&nbsp;');
   // document.write('</td></tr>');
   // document.write('<tr><td align=center>'); 
   
      document.write(solarDay1());
   // document.write('</td></tr><tr><td align=center>'); 
      document.write(solarDay2());
    //document.write('</td></tr><tr><td>');
     document.write(solarDay3());
   // document.write('</td></tr></table></td></tr></table>');
 }

//--></SCRIPT>
<!--  �й�ũ������  -->
</head>

<body>
<table width="100%" height="29"  border="0" cellpadding="0" cellspacing="0" background="/internet/image/menu_bg.gif">
 <form name="form1" method="post" action="">
  <tr>
    <td  nowrap="nowrap"  width="500" align="center">
	<table  border="0" align="left" cellpadding="0" cellspacing="0" onClick="test(this)" id="eosmenutable">
      <tr align="center"> 
      	<qx:talentModule moduleID="DX_OASYS">
		    <a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_OASYS" target="bodyframe">
	        <td  nowrap="nowrap" width="75" class="button" id="DX_OASYS">�칫ϵͳ</td>
	        </a>
        </qx:talentModule>
        
        <qx:talentModule moduleID="DX_TEACH_MANAGE">
	        <a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_TEACH_MANAGE" target="bodyframe">
	        <td nowrap="nowrap" width="75" class="button" id="DX_TEACH_MANAGE">�������</td>
	        </a>
        </qx:talentModule>
        
        <qx:talentModule moduleID="DX_STUENT_MANAGE">
	        <a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_STUENT_MANAGE" target="bodyframe">
	        <td nowrap="nowrap" width="75" class="button" id="DX_STUENT_MANAGE">ѧԱ����</td>
	        </a> 
        </qx:talentModule>
        
      	<qx:talentModule moduleID="DX_OASYS_RESEARCHMANAGE">
		    <a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_OASYS_RESEARCHMANAGE" target="bodyframe">
	        <td  nowrap="nowrap" width="75" class="button" id="DX_OASYS_RESEARCHMANAGE">���й���</td>
	        </a>
        </qx:talentModule>
        
        <qx:talentModule moduleID="DX_CARD_MANAGE">
	        <a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_CARD_MANAGE" target="bodyframe">
	        <td nowrap="nowrap" width="75" class="button" id="DX_CARD_MANAGE">һ �� ͨ</td>
			</a>
		</qx:talentModule>
		
		 <qx:talentModule moduleID="DX_NETCENTER_MANAGE">
	        <a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_NETCENTER_MANAGE" target="bodyframe">
	        <td nowrap="nowrap" width="75" class="button" id="DX_NETCENTER_MANAGE">��������</td>
			</a>
		</qx:talentModule>
		
		
		<qx:talentModule moduleID="DX_OMMSYS">
			<a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_OMMSYS" target="bodyframe">
	        <td nowrap="nowrap" width="75" class="button" id="DX_OMMSYS">��ά����</td>
	        </a>
        </qx:talentModule>
		
		
		<qx:talentModule moduleID="DX_SYSTEM_MANAGE">
			<a href="common.pr.menutext.do?TEOSMENU/parentsid=DX_SYSTEM_MANAGE" target="bodyframe">
	        <td nowrap="nowrap" width="75" class="button" id="DX_SYSTEM_MANAGE">ϵͳ����</td>
	        </a>
        </qx:talentModule>
        </tr>
    </table>
	
    <td align="right">      <table  border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="100%" align="right" nowrap="nowrap"><!--<IMG src="/internet/ShareImage/37665164-small.gif" height="25px"/><a href="oa.prNews.noticeView.do?pageID=2&fid=1030" alt="�Զ����������걨ϵͳ" target="main"   >�Զ����������걨ϵͳ.Tel:37665164</a>-->&nbsp;&nbsp;<span class="text_red">��ǰ�û���<bean:write property="SessionEntity/userName" formatClass="username" formatType="userid"/></span>&nbsp;<span class="text" id="currentTime"><script>setCalendar()</script> </span></td>
        </tr>
      </table></td>
     
  </tr>
  </form>
</table>
<IFRAME src="oa.prPersonOffice.popUpMessage.do?InnerNote=&type=rece" style="display: none"></IFRAME>
</body>
</html>