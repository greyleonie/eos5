<%@include file="/internet/common.jsp"%>


<title>教学计划编制-&gt;重发通知</title>
<body>
<form name="postForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制 -&gt; 重发通知
           </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td id="hiddens" height="8">
      <html:hidden property="CourseAdjust/AdjustID"/>
      <html:textarea property="CourseAdjust/AdjustContent" style="display:none"/> 
       </td>
    </tr>
    <tr>
      <td class="text"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       
          <tr  onClick="changeTRBgColor(this)">
            <td width="29%" align="right" class="td2">发布时间：</td>
            <td width="71%" class="td1">    
		<html:text property="LED/publishTime[@pattern='yyyy-MM-dd']"/>
        <img src="/internet/image/date.gif"  height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["LED/publishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             <span class="text_red">*(必选)</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">
            截止时间：
           </td>
            <td class="td1">
         	<html:text property="LED/endTime[@pattern='yyyy-MM-dd']"/>
        <img src="/internet/image/date.gif"  height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["LED/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <span class="text_red">*(必选)</span>
            </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="提 交" onclick="save()">&nbsp;   
                <input name="Submit2" type="button" class="button_02" value="取 消" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>

<script language="javascript">
var frm=document.postForm;

function save(){
//处理LED行信息
checkInput();

if(frm.elements["LED/publishTime[@pattern='yyyy-MM-dd']"].value==""||frm.elements["LED/endTime[@pattern='yyyy-MM-dd']"].value==""){
  alert("发布时间和截止时间都不能为空！");
  return;
}
 frm.action="teachWorkManage.prMakeTeachPlan.sendNoticeAgain.do";
 frm.submit();
}

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

//清除记录Led行
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
          
		  
          //判断日期时间
          if (isDate(tmpDate) && isTimeOnly(tmpTime)) {
             
             var appendDate = line.substr(0,line.length-1) + tmpDate;
		     //alert("appendDate : " + appendDate);
             var appendDateTime = line.substr(0,line.length-1) + content.substr(i,16);
		     //alert("appendDateTime : " + appendDateTime);
		     var appendDateLen = linelen + 4.5;
		     var appendDateTimeLen = linelen + 7.5;
		     //alert("appendDateLen : " + appendDateLen + "appendDateTimeLen : " + appendDateTimeLen);
		  
             //处理日期
             if (appendDateLen > 18) {
			    //alert("日期大于18：" + line.substring(0, line.length-4));
                lines.push(line.substring(0, line.length-1));
                line = content.substr(i,16);
				linelen = 8;
                i = i + 15;
                timeflag = 1;
				timestr = "";
             } else {
               //处理日期 + 时间
            
               if (appendDateTimeLen > 18) {
			      //alert("日期时间大于18：" + appendDate);
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
			      //alert("日期时间小于18：" + appendDateTime);
                  i = i + 15;
				  line = appendDateTime;
				  linelen = linelen + 7.5;
                  timeflag = 1;
				  timestr = "";
               }
               
             }
             
          }

    } else 
    if (!isNaN(timestr) && timestr.length == 1 && content.substr(i+4,1)=='年') {
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

//alert(final);
document.forms[0].elements["CourseAdjust/AdjustContent"].innerText = final;
}

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
</script>