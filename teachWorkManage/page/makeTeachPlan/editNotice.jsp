<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<script>
 var msg='<bean:write property="msg"/>';
 if(msg!=""){
   alert(msg);
 }
</script>
<title>����֪ͨ</title>
<%
  java.text.SimpleDateFormat fir=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
  java.text.SimpleDateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd");
  Date date=new Date();
  String today=sdf.format(date);  
  String currentDate=df.format(date);
  String d=fir.format(date);
 %>
<body>
<form name="form1" method="post">
<input type="hidden" name="PageCond/begin">
<input type="hidden" name="PageCond/count">
<input type="hidden" name="PageCond/length">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;����֪ͨ</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8" id="hiddens">
      <INPUT type="hidden" name="Course/ClassID" value="<bean:write property='SessionEntity/Course/ClassID'/>">
      <INPUT type="hidden" name="Course/CourseID" value="<bean:write property='SessionEntity/Course/CourseID'/>">
      <INPUT type="hidden" name="Course/ClassName" value="<bean:write property='SessionEntity/Course/ClassName'/>">
      <INPUT type="hidden" name="Course/CourseTitle" value="<bean:write property='SessionEntity/Course/CourseTitle'/>">
      <INPUT type="hidden" name="Course/DateTime" value="<bean:write property='SessionEntity/Course/DateTime'/>">
      <INPUT type="hidden" name="Course/ClassRoomID" value="<bean:write property='SessionEntity/Course/ClassRoomID'/>">
      <INPUT type="hidden" name="Course/RoomName" value="<bean:write property='SessionEntity/Course/RoomName'/>">
      <INPUT type="hidden" name="oldCourse/CourseTitle" value="<bean:write property='SessionEntity/oldCourse/CourseTitle'/>">
      <INPUT type="hidden" name="oldCourse/DateTime" value="<bean:write property='SessionEntity/oldCourse/DateTime'/>">
      <INPUT type="hidden" name="oldCourse/ClassRoomID" value="<bean:write property='SessionEntity/oldCourse/ClassRoomID'/>">
      <INPUT type="hidden" name="oldCourse/RoomName" value="<bean:write property='SessionEntity/oldCourse/RoomName'/>">
      <html:hidden property="CourseAdjust/AdjustID"/>
      <html:hidden property="CourseAdjust/ClassID"/>
      <html:hidden property="CourseAdjust/PlanID"/>
      <html:hidden property="CourseAdjust/CourseID"/> 
      <html:hidden property="CourseAdjust/Adjuster"/>     
      <html:hidden property="CourseAdjust/NoticeMethod"/>
      <input type="hidden" name="CourseAdjust/AdjustTime[@pattern='yyyy-MM-dd HH:mm']" value="<%=today %>">
      <html:hidden property="CourseAdjust/"/>
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="isAdd"/>
      <html:hidden property="nextOne"/>
      <html:hidden property="loc"/>
      <html:hidden property="saveLED"/>
      <html:hidden property="mobile"/>
      <html:hidden property="SendMsg/MsgFormat"/>
      <html:hidden property="SendMsg/DoneTime" value="<%=d %>"/>
      <input type="hidden" name="splitContent" value="">
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">֪ͨ���ݣ�</td>
            <td width="88%" class="td1">
            <html:textarea rows="8" cols="37" property="CourseAdjust/AdjustContent"/>
            <input name="preview" type="button" class="button_eight" value="Ԥ������Ч��" onclick="checkInput()">
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">֪ͨʱ�䣺</td>
            <td class="td1">
               <html:text property="CourseAdjust/NoticeTime[@pattern='yyyy-MM-dd']" value="<%=currentDate%>" attributesText='class="input" size="30"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CourseAdjust/NoticeTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <span class="text_red">*</span>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ֹʱ�䣺</td>
            <td class="td1">
                  <html:text property="LED/endTime[@pattern='yyyy-MM-dd']"  attributesText='class="input" size="30"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["LED/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <span class="text_red">*</span></td>          
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">֪ͨ��ʽ��</td>
            <td class="td1">
            <input type="checkbox" checked="checked" name="C1" value="0">
              ����
            <input type="checkbox" name="C1" value="1">
                ����
            <input type="checkbox" name="C1" value="2" onclick="setBtnStatus()">
            �ֻ�����</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���Ͷ���</td>
            <td class="td1">         
             <font color="#B51018">��ʾ:˫�������б��е�ѡ�����ɾ���ú���</font><br>
             <select size="10" style="width:150" name="mobilenums" ondblclick="deleteOption(this)"></select>
            <br>         
            <input id="btnSelect" type="button" class="button_eight" value="ѡ���ֻ�����" elname="accept,mobilenums" disabled="disabled" onclick="selectMobile('')">
            <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="clearObject()">
            �������˵ĺ���Ϊ�ղ��ܽ��յ�����Ϣ��<br>
             <html:hidden property="accept"/>
            �ֹ��������(����֮����/�ָ�)��<br>
             <html:text property="typeNo" attributesText='class="input" size="45"' disabled="true"/><br>
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">
                <input id="btnNext" type="button" class="button_eight" value="������һ��" onclick="continueAdd()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="history.go(-3)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script>
if(document.form1.elements["loc"].value=="6"){
    document.form1.btnNext.style.display="none";
}
var mobile='<bean:write property="Teacher/MobileTel"/>';
var teacherName='<bean:write property="EOSOperator/operatorName"/>';
if(teacherName!="")teacherName= teacherName+"["+mobile+"]";
document.form1.elements["accept"].value=mobile;

if(teacherName!=""){
 document.form1.elements["mobilenums"].value=teacherName;
}else{
  document.form1.elements["mobilenums"].value=mobile;
}
 //document.form1.elements["C1"][2].checked=true;
 
 if(document.form1.elements["C1"][2].checked){//���ѡ���˷��͵��ֻ���ѡ�����ť�ſ���
    document.form1.btnSelect.disabled=false;
 }
 else{
   document.form1.btnSelect.style.disabled=true;
 }
</script>
<script language="javascript">
var frm=document.form1;

function setBtnStatus(){

  if(document.form1.elements["C1"][2].checked){//���ѡ���˷��͵��ֻ���ѡ�����ť�ſ���
    document.form1.btnSelect.disabled=false;
    document.form1.typeNo.disabled=false;
 }
 else{
   document.form1.btnSelect.disabled=true;
   document.form1.typeNo.disabled=true;
 }
}



function is_chinese(elem){
	var pattern=/[^\x00-\xff]/g;
	if(pattern.test(elem)){
	  //��������
		return 1;
	}else{
	  //����������
	  return 0;
	}
}

function getTypedMobileNo(){
   var typedNo=frm.elements["typeNo"].value;
   var array=new Array();
   var mobile="";
   
   if(typedNo!=""){
     array=typedNo.split("/");
   }
   
 for(var i=0;i<array.length;i++){
     var no=array[i];
      if(no!=""){
        if(mobile==""){
           mobile=no;
        }else{
           mobile+="|"+no;
        }//end if
      }//end if
   }//end for
   
   return mobile;
}
//--------------------------------------------------------------------------

function save(){
var start=frm.elements["CourseAdjust/NoticeTime[@pattern='yyyy-MM-dd']"].value;

//����LED����Ϣ
checkInput();

if(frm.elements["CourseAdjust/NoticeTime[@pattern='yyyy-MM-dd']"].value==""){
  alert("֪ͨʱ�䲻��Ϊ�գ�");
  return;
}

 if(start!=""&&start<date2str(new Date()).split("")[0]){
    alert("֪ͨʱ�䲻��С�ڵ��죡");
    return;
}

if(frm.elements["LED/endTime[@pattern='yyyy-MM-dd']"].value==""){
  alert("����ʱ�䲻��Ϊ�գ�");
  return;
}
 
  var msgFormat="";
  var getvalue="";
  getvalue=joinMobile();
  if(document.form1.elements["C1"][2].checked&&getvalue==""&&document.form1.elements["typeNo"].value==""){
      alert("û�н��ն�����߽��ն���ĺ���Ϊ�գ�");
      return;
   }else{
  
   var tempMobile=getTypedMobileNo();
  
   autoMobile();
   //alert("tempMobile:"+tempMobile+"  mobile:"+frm.elements["mobile"].value);
   if(tempMobile!=""){
      if(getvalue!=""){
         getvalue+="|"+tempMobile;
      }else{
         getvalue=tempMobile;
      }
   }
    frm.elements["mobile"].value=getvalue;
  }

if(document.form1.elements["C1"][2].checked){
  frm.elements["accept"].value="1";
}

   
   //alert(frm.elements["mobile"].value);
   frm.elements["SendMsg/MsgFormat"].value=is_chinese(document.forms[0].elements["CourseAdjust/AdjustContent"].value);
   frm.elements["CourseAdjust/PlanID"].value=frm.elements["TeachingPlan/PlanID"].value;
   sendType();
   splitContent();
   frm.action="teachWorkManage.prMakeTeachPlan.saveNotice.do";
  
 frm.submit();
}

//--------------------------------------------------------------------------------
function goback(){
  var loc=frm.elements["loc"].value;
  if(loc=="6"){
    window.close();
  }else{
  history.go(-1);
  }
}
	
function sendType(){
 var sendType="";
 var array=frm.elements["C1"];
 
 for(var i=0;i<3;i++){
    var obj=array[i];   
    if(obj.checked){
    
      if(i==0){
         frm.elements["saveLED"].value=1;
      }
      if(sendType==""){
         sendType=obj.value;
      }else{
         sendType+=","+obj.value;
      }//end else
    }//end if
 }//end for
 
 frm.elements["CourseAdjust/NoticeMethod"].value=sendType; 
}

function   date2str(d){   
  var   ret=d.getFullYear()+"-"   
  ret+=("00"+(d.getMonth()+1)).slice(-2)+"-"   
  ret+=("00"+d.getDate()).slice(-2)+"   "   
  ret+=("00"+d.getHours()).slice(-2)+":"   
  ret+=("00"+d.getMinutes()).slice(-2)+":"   
  ret+=("00"+d.getSeconds()).slice(-2)+"."   
  return   ret+d.getMilliseconds()   
  }
  
  function continueAdd(){
   frm.elements["nextOne"].value="1";
    save();
   
  }
  
  function clearObject(){
     document.form1.elements["accept"].value="";
     document.form1.elements["mobilenums"].innerHTML="";
  }
  
 //��Աѡ�񣬸��ݲ���single='yes'Ϊ������ѡ�񣬷���Ϊ�����ѡ��


function autoMobile(){
  var mobile=document.forms[0].elements["mobilenums"].value; 
  var mobiles="";
  var array=new Array();
   if(mobile!=""){
    array=mobile.split("[");
    }
  var len=array.length;
  for(var i=0;i<len;i++){
    var content=array[i];
    var no=content.substring(0,11);
   
    if(no!=""&&no.indexOf("1")>-1){
     if(mobiles==""){
        mobiles=no;
     }else{
      mobiles+="|"+no;
     }
    }//end if
  }//end for
  frm.elements["mobile"].value=mobiles;
}

function splitContent(){//�������
      var content=document.forms[0].elements["CourseAdjust/AdjustContent"].value;
	  var len=content.length;
	  var canD0=true;
      var count=0;
	  var from="[��ί��У��������]";//10
	  var theEnd="(����)";
	  var append="(����)";
      var array=new Array();
      var splitContent="";
      
	  while(canD0){
	      if(count==0){
		  
		     if(len>61){
			    array[array.length]=from+content.substring(0,50)+theEnd;
                 content=content.substring(50,content.length);
				 len=content.length;
				 count++;
			 }else{
				 array[array.length]=from+content;
				 canD0=false;
				 }//end  if(len>61){
		  }else{
		     if(len>66){
			      array[array.length]=append+content.substring(0,66);
				//alert(count+"===="+content)
				  content=content.substring(66,content.length);
                  len=content.length;
			 }else{
			   array[array.length]=append+content;
			    canD0=false;
			 }
		  }//end if(count==0)
	  }//end while

	  for(var i=0;i<array.length;i++){
	 //   alert(i+"::"+array[i]);
	    if(splitContent==""){
	       splitContent=array[i];
	    }else{
	       splitContent+="@@@"+array[i];
	    }
	  }
	  document.forms[0].elements["splitContent"].value=splitContent;
	//alert(splitContent);
}

function init(){
  frm.elements["LED/endTime[@pattern='yyyy-MM-dd']"].value=frm.elements["Course/DateTime"].value.substring(0,10);
}

init();

function checkInput() {
var charString = ",.?;:'\"\\!@#$%^&*(){}[]|<>/~#%-_  ";
var timestr = "";
var lines = new Array();
var content = document.forms[0].elements["CourseAdjust/AdjustContent"].value.replace(/\r\n/g,' ');
var leave = "";
var chr = "";
var line = "";
var index = 0;
var linelen = 0;
var timelen = 0;
var timeflag = 0;

//�����¼Led��
delLines();

if (content.length > 18) {
for (var i=0;i<content.length;i++) {
    chr = content.substr(i,1);
    
	if (!isNaN(chr) && chr != ' ') {
       linelen = linelen + 0.5;
       line = line + chr;
       if (timestr == '' || (timestr != '' && index == (i-1))) {
          timestr = timestr + chr;
          index = i;
       } else {
          timestr = chr;
          index = i;
       }
	} else {
    
	  if (isAlpha(chr)) {
            linelen = linelen + 0.5;
            line = line + chr;
      } else if (charString.indexOf(chr)>=0) {
	    if (linelen!=0 && (linelen+0.5) != 18) {
	        linelen = linelen + 0.5;
            line = line + chr;
	    }
	  } else {
         linelen = linelen + 1;
         line = line + chr;
      }
	  
    }
    
	
    if (!isNaN(timestr) && timestr.length == 1 && content.substr(i+4,1)=='-') {
          var tmpDate = content.substr(i,10);
		  var tmpTime = content.substr(i+11,5);
          
		  
          //�ж�����ʱ��
          if (isDate(tmpDate) && isTimeOnly(tmpTime)) {
             
             var appendDate = line.substr(0,line.length-1) + tmpDate;
		     //alert("appendDate : " + appendDate);
             var appendDateTime = line.substr(0,line.length-1) + content.substr(i,16);
		     //alert("appendDateTime : " + appendDateTime);
		     var appendDateLen = linelen + 4.5;
		     var appendDateTimeLen = linelen + 7.5;
		     //alert("appendDateLen : " + appendDateLen + "appendDateTimeLen : " + appendDateTimeLen);
		  
             //��������
             if (appendDateLen > 18) {
			    //alert("���ڴ���18��" + line.substring(0, line.length-4));
                lines.push(line.substring(0, line.length-1));
                line = content.substr(i,16);
				linelen = 8;
                i = i + 15;
                timeflag = 1;
				timestr = "";
             } else {
               //�������� + ʱ��
            
               if (appendDateTimeLen > 18) {
			      //alert("����ʱ�����18��" + appendDate);
                  lines.push(appendDate);
                  line = tmpTime;
				  linelen = 3;
                  i = i + 15;
                  timeflag = 1;
				  timestr = "";
               } else if (appendDateTimeLen == 18) { 
			      i = i + 15;
				  //alert(appendDateTime);
				  lines.push(appendDateTime);
				  line = "";
				  timestr = "";
				  linelen = 0;
                  timeflag = 1;
			   }
			   else {
			      //alert("����ʱ��С��18��" + appendDateTime);
                  i = i + 15;
				  line = appendDateTime;
				  linelen = linelen + 7.5;
                  timeflag = 1;
				  timestr = "";
               }
               
             }
             
          }

    } else 
    if (!isNaN(timestr) && timestr.length == 1 && content.substr(i+4,1)=='��') {
       timestr = '';
    }

	if (!isNaN(timestr) && timestr.length == 1 && content.substr(i+4,1)!='-') {
       timestr = '';
	}
    
    if (timeflag != 1) {
       
       var nextcharlen = 0;
       var nextchar = content.substr(i+1,1)
       if (isAlphaNumeric(nextchar) || charString.indexOf(nextchar)>=0) {
          nextcharlen = linelen + 0.5;
	   } else {
          nextcharlen = linelen + 1;
	   }
       if (nextcharlen > 18) {
             lines.push(line);
             line = "";
			 linelen = 0;
       }
       
    } else {
       timeflag = 0;
       continue;
    }
}
} else {
   line = content;
}

if (line != "") lines.push(line);

var final = "";
var totalLen = 0;


if (lines.length >= 7) {
   if ((lines.length % 7) != 0)
      totalLen = 7 * (Math.floor(lines.length/7)+1);
   else
      totalLen = lines.length;
} else {
   totalLen = 7;
}

for (var j=0;j<lines.length;j++) {
   if (lines[j]!=undefined) {
	  final = final + lines[j] + "\r\n";
	  //alert(lines[j]);
	  var input = "<input type='hidden' name=lines/line[@hciTagIndex='"+j+"'] value='" + lines[j] + "'>";
	  document.getElementById("hiddens").insertAdjacentHTML("beforeEnd",input);
   }
   else break;
}

for (var k=lines.length;k<totalLen;k++) {
   final = final + "\r\n";
   var input = "<input type='hidden' name=lines/line[@hciTagIndex='"+k+"'] value=' '>";
   document.getElementById("hiddens").insertAdjacentHTML("beforeEnd",input);
}

document.forms[0].elements["CourseAdjust/AdjustContent"].innerText = final;
}

checkInput();

function delLines() {
var i=0;
var objname = "lines/line[@hciTagIndex='0']";

while (document.getElementById(objname) != undefined) {
//alert(document.getElementById(objname).value);
   document.getElementById(objname).removeNode();
   i++;
   objname = "lines/line[@hciTagIndex='" + i + "']";
}
}
  function selectMobile(){
	  var remark=new Date().getTime();
		var loc="ICCard.prMsg.selectMobile.do?remark="+remark;
		var obj=frm.elements["mobilenums"];
		
	    frm.elements["btnSelect"].style.disabled="none";
	    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=180,scroll=yes");
}

	function addOption(textval,val){
			var oOption = document.createElement("OPTION");
			oOption.text=textval;
			oOption.value=val;
			form1.mobilenums.add(oOption);
		
		}
function joinMobile(){
  var obj=frm.elements["mobilenums"];
  var mobiles="";
  var len=obj.options.length;
  if(len>0){
     for(var i=0;i<len;i++){
         var theValue=obj.options[i].value;
         if(mobiles==""){
           mobiles=theValue;
         }else{
           mobiles+="|"+theValue;
         }
     }//for
  }//e
   return mobiles;
   }
   function deleteOption(ctrlobj){
			if(ctrlobj.value=="" && ctrlobj.innerText=="")
				return;
			if(window.confirm("ȷ��ɾ���ú�����")){							
				form1.mobilenums.remove(ctrlobj.selectedIndex);
			}
		}
</script>