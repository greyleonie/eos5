<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*,java.util.*,java.text.DecimalFormat" %>
<%
String begin,end,formto = "";
int score,courseid,itemId,cid,iid,flag = 0;
int hindex=1;
int findex=1;
int add=0;
int amountNum=0;
int allAdd=0;
String percent="0";
String apercent="0";
String bpercent="0";
String zpercent="0";
String xpercent="0";
String showWeek=base.util.TalentContext.getValue(pageContext,null,"week/showWeek");

if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {

	if(showWeek == null){
	   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
	   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
	   formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
	}else if(showWeek.equals("一")) {
      	String btmp = base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime");
      	begin = btmp.substring(0,4) + "-" + btmp.substring(4,6) + "-" + btmp.substring(6,8);
	   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
	   formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
		
	}else if(showWeek.equals(base.util.TalentContext.getValue(pageContext,null,"week/endWeekLength"))) {
	   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
	   end = base.util.TalentContext.getValue(pageContext,null,"Class/EndTime").replace('.','-');
	   formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
	
	}else if(!showWeek.equals("一") && !showWeek.equals(base.util.TalentContext.getValue(pageContext,null,"week/endWeekLength"))){
	   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
      	//String etmp = base.util.TalentContext.getValue(pageContext,null,"Class/EndTime");
      	//end = etmp.substring(0,4) + "-" + etmp.substring(4,6) + "-" + etmp.substring(6,8);
	   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
	   formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
	}/**/
} else {
   if (base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime") != null) {
      String btmp = base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime");
      begin = btmp.substring(0,4) + "-" + btmp.substring(4,6) + "-" + btmp.substring(6,8);
      String etmp = base.util.TalentContext.getValue(pageContext,null,"Class/EndTime");
      end = etmp.substring(0,4) + "-" + etmp.substring(4,6) + "-" + etmp.substring(6,8);
      formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
   }
}
DecimalFormat df=new   DecimalFormat("#0.0"); 
//统计专题课题数
int fdksAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"fdksAdd"));
//统计互动式教学课题数
int hdksAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"hdksAdd"));
//统计专业知识教学课题数
int specialityAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"specialityAdd"));
//统计项目教学课题数
int projectAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"projectAdd"));
add=fdksAdd+hdksAdd+projectAdd+specialityAdd;
//学员人数
int amount=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"Survey/amount"));
//专题课题数+互动式教学课题数，发放评估表份数
amountNum=amount*add;
//专题课题数，发放评估表份数
int fdksNum=amount*fdksAdd;
//互动式教学课题数，发放评估表份数
int hdksNum=amount*hdksAdd;
//专业教学课题数，发放评估表份数
int specialityNum=amount*specialityAdd;
//项目教学课题数，发放评估表份数
int projectNum=amount*projectAdd;

//专题课题数,统计回收份数
int ztadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"add"));
if(ztadd!=0){
float a=(float)ztadd/(float)fdksNum;
apercent=df.format((a*10000)/100)+"%";
}
//互动式教学课题数,统计回收份数
int hdadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"totalAdd"));
if(hdadd!=0){
float b=(float)hdadd/(float)hdksNum;
bpercent=df.format((b*10000)/100)+"%";
}

//专业教学课题数,统计回收份数
int zyadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"specialityAdd"));
if(zyadd!=0){
float b=(float)zyadd/(float)specialityNum;
zpercent=df.format((b*10000)/100)+"%";
}
//项目教学课题数,统计回收份数
int xmadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"projectAdd"));
if(xmadd!=0){
float b=(float)xmadd/(float)projectNum;
xpercent=df.format((b*10000)/100)+"%";
}

//专题课题数+互动式教学课题数,统计回收份数
allAdd=ztadd+hdadd+zyadd+xmadd;
if(allAdd!=0){
float c = (float)allAdd/(float)amountNum;  
percent=df.format((c*10000)/100)+"%";
}
%>

<style type="text/css">
<!--
.style2 {font-family: "宋体"}

.textc {
    font-size: 14px;
	color: #000000;
	font-weight: bold;
    font-family: "楷体";
}
-->
</style>
<script type="text/javascript">

function weekSubmit() {
var obj = document.getElementById("planweeks");

document.forms[0].target = "_self";
document.forms[0].action="teachWorkManage.prTeachEvaluate.prWeekReport.do";
document.getElementById("week/showWeek").value=obj.options[obj.selectedIndex].text;
if (obj.options[obj.selectedIndex].value.indexOf("-")>=0) {
var str = obj.options[obj.selectedIndex].value.split("-");
var begin = str[0].trim();
var end = str[1].trim();

document.getElementById("week/begin").value = begin;
document.getElementById("week/end").value = end;

document.forms[0].submit();
} else {
document.getElementById("week/begin").value = 0;
document.forms[0].submit();
}

}

function classSubmit() {
var obj = document.getElementById("planweeks");

obj.options[0].selected = true;
document.getElementById("week/begin").value = 0;
document.forms[0].target = "_self";
document.forms[0].action="teachWorkManage.prTeachEvaluate.prWeekReport.do";
document.forms[0].submit();

}

function exportToWord() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prWeekRankExport.do";
document.forms[0].target = "_blank";
document.forms[0].submit();
}
function exportToAll() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prWeekAllExport.do";
document.forms[0].target = "_blank";
document.forms[0].submit();
}
	function formatLevText(objname,levname) {
	   var tmpText = "";
	   for (var i=0;i<levname.length;i++) {
         tmpText += levname.substr(i, 1) + "<br>";
       }
       document.getElementById(objname).innerHTML = tmpText;
	}
	
	function formatItemText(objname,itemName) {
	   var name_tmp = "";
	   if (itemName.length <= 6) {
          for (var i=0;i < itemName.length;i++) {
             name_tmp = name_tmp + itemName.substr(i,1) + " ";
          }
          document.getElementById(objname).innerHTML = name_tmp + "<br>";
          return;
       }
       if (itemName.length >= 8) {
          document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
          return;
       }
       document.getElementById(objname).innerHTML = itemName + "<br>";
	}
	
	function getLength(){
		var selectLength = document.getElementById("planweeks");
		alert(selectLength.lastChild.innerText);
	}
</script>

<body>
<form>
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="week/begin" />
<html:hidden property="week/end" />
<html:hidden property="Class/ClassID" />
<html:hidden property="week/showWeek" />
<html:hidden property="week/endWeekLength" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;主体班每周汇总</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <SELECT name="AssignMark/ClassID" id="AssignMark/ClassID" onchange="classSubmit();">
          <option value="-1">--请选择班级--</option>
          <logic:iterate id="class" property="list[@type='studentclass']">
          <%
            String classno = base.util.TalentContext.getValue(pageContext,null,"Class/ClassID");
            String classid = base.util.TalentContext.getValue(pageContext,"class","Class/ClassID");
          if (classid.equals(classno)) {
          %>
          <option value="<bean:write id="class" property="Class/ClassID"/>" selected><bean:write id="class" property="Class/ClassName"/></option>
          <% } else { %>
          <option value="<bean:write id="class" property="Class/ClassID"/>"><bean:write id="class" property="Class/ClassName"/></option>
          <% } %>
          </logic:iterate>
          </SELECT>
          <b>
            <%int j=1; %>
          <SELECT name="planweeks" id="planweeks" onchange="weekSubmit();">
          <option value="0">全部</option>
          <logic:iterate id="week" property="list[@type='planweek']">
          <%
            String planweek = request.getParameter("planweeks");
            String fromto = base.util.TalentContext.getValue(pageContext,"week","planweek/fromto");
            if (fromto.equals(planweek)) {
          %>
          <option value="<bean:write id="week" property="planweek/fromto"/>" selected><%=TalentFunctions.getNumForCn(j)%></option>
          <% } else { %>
          <option value="<bean:write id="week" property="planweek/fromto"/>"><%=TalentFunctions.getNumForCn(j)%></option>
          <% }
          j++;%>
          </logic:iterate>
          </SELECT></b>
          <b>
            <input name="B1" type="button" class="button_02" onclick="weekSubmit();" value="汇 总">
            <input name="B3" type="button" class="button_02" value="导出" onClick="exportToWord()">
            <!-- 
            <input name="B3" type="button" class="button_02" value="导出所有" onClick="exportToAll()"> 
            -->
            <input name="B4" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="viewaction">
            </b> </td>
        </tr>
      </table>      
        <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="4">
          <tr>
            <td align="center" class="text_title"><b>
            <span id="printTable">
            
            <%if(showWeek==null||showWeek.equals("")||(showWeek.equals("请选择周"))){%>
             <bean:write property="Class/ClassName"/>学员教学质量评估汇总表
            <% }else{%>
             <bean:write property="Class/ClassName"/>学员第<%=showWeek%>周教学质量评估表
             <%} %>
             </span><br>
            <p class="text_red">（<%=formto%>）</p></b></td>
          </tr>
          <tr>
            <td height="30" align="left" class="textc">&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="MsoNormalIndent">
            <!--<bean:write property="Class/ClassName"/>-->本班共
            <bean:write property="Survey/amount"/>人，<%if(showWeek==null||showWeek.equals("")||showWeek.equals("请选择周")){%>评估课题数：<%=add %>
            <%}else{%>评估课题数：<%=add %><%}%>个
                       发放课题评估表<%=amountNum %>份，回收
            <%=allAdd %>份，回收率
            <%=percent%>，意见栏填写
            <bean:write property="Survey/suggest"/>份。</span></td>
          </tr>
        </table>        
      </td>
    </tr>
    <tr><td class="text">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
    <tr><td class="textc" width="90%">&nbsp;一、专题课教学（课题数:<%=fdksAdd%>，发放课题表：<%=fdksNum%>，回收:<%=ztadd%>,回收率:<%=apercent %>）<br></td></tr>
    <tr>
      <td class="text" width="90%">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="center" class="td_title">
          <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="11%">日期</td>
          <td width="9%">回交（份）</td>
          <td width="9%">回收率</td>
          <td width="9%">总得分</td>
          <td width="13%">平均分</td>
          <td width="9%">排名</td>
        </tr>
        <% int fdkLen=1;
          float norm=1;
          int place=1;
           Float temp = null;
           List normList = new ArrayList();
        %>
        <logic:iterate id="fdk" property="list[@type='fdks']">
        <%
          norm = Float.parseFloat(base.util.TalentContext.getValue(pageContext,"fdk","fdks/norm"));
          temp = new Float(base.util.TalentContext.getValue(pageContext,"fdk","fdks/norm"));
          normList.add(temp);
        %>
        <tr <% if (fdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center"><bean:write id="fdk" property="fdks/TeacherName"/></td>
          <td width="30%"><bean:write id="fdk" property="fdks/CourseTitle"/></td>
          <td width="11%" align="center"><bean:write id="fdk" property="fdks/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td> 
          <td width="9%" align="center"><bean:write id="fdk" property="fdks/ballot"/></td>     
          <td width="9%" align="center"><bean:write id="fdk" property="fdks/diviResult" />%</td>
          <td width="9%" align="center"><bean:write id="fdk" property="fdks/total"/></td>
          <td width="13%" align="center"><bean:write id="fdk" property="fdks/norm"/></td>
          <%
          if (fdkLen-1>0) { 
            float count = ((Float)normList.get(fdkLen-2)).floatValue();
            if (norm != count) place++;
           }
          %>
          <td width="9%" align="center"><%=place%></td>
        </tr>
        <% fdkLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
    <tr><td heigth="30"></td></tr>
    <tr><td class="textc" width="90%"><br>&nbsp;二、互动式教学（课题数:<%=hdksAdd%>，发放课题表：<%=hdksNum%>，回收:<%=hdadd%>,回收率:<%=bpercent %>）<br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="center" class="td_title">
           <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="11%">日期</td>
          <td width="9%">回交（份）</td>
          <td width="9%">回收率</td>
          <td width="9%">总得分</td>
          <td width="13%">平均分</td>
          <td width="9%">排名</td>
       
          </tr>
        <% int hdkLen=1;
           norm=1;
           place=1;
           normList.clear();
        %>
        <logic:iterate id="hdk" property="list[@type='hdks']">
        <%
          norm = Float.parseFloat(base.util.TalentContext.getValue(pageContext,"hdk","hdks/norm"));
          temp = new Float(base.util.TalentContext.getValue(pageContext,"hdk","hdks/norm"));
          normList.add(temp);
        %>
        <tr <% if (hdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center"><bean:write id="hdk" property="hdks/TeacherName"/></td>
          <td width="30%"><bean:write id="hdk" property="hdks/CourseTitle"/></td>
           <td width="11%" align="center"><bean:write id="hdk" property="hdks/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td> 
          <td width="9%" align="center"><bean:write id="hdk" property="hdks/ballot"/></td>
          <td width="9%" align="center"><bean:write id="hdk" property="hdks/hdksDiviResult"/>%</td>
          <td width="9%" align="center"><bean:write id="hdk" property="hdks/total"/></td>
          <td width="13%" align="center"><bean:write id="hdk" property="hdks/norm"/></td>
          <%
          if (hdkLen-1>0) { 
            float count = ((Float)normList.get(hdkLen-2)).floatValue();
            if (norm != count) place++;
           }
          %>
          <td width="9%" align="center"><%=place%></td>
        </tr>
        <% hdkLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
     <tr><td heigth="30"></td></tr>
    <tr><td class="textc" width="90%"><br>&nbsp;三、项目教学（课题数:<%=projectAdd%>，发放课题表：<%=projectNum%>，回收:<%=xmadd%>,回收率:<%=xpercent %>）<br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="center" class="td_title">
           <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="11%">日期</td>
          <td width="9%">回交（份）</td>
          <td width="9%">回收率</td>
          <td width="9%">总得分</td>
          <td width="13%">平均分</td>
          <td width="9%">排名</td>
       
          </tr>
        <% int projectLen=1;
           norm=1;
           place=1;
           normList.clear();
        %>
        <logic:iterate id="project" property="list[@type='project']">
        <%
          norm = Float.parseFloat(base.util.TalentContext.getValue(pageContext,"project","project/norm"));
          temp = new Float(base.util.TalentContext.getValue(pageContext,"project","project/norm"));
          normList.add(temp);
        %>
        <tr <% if (projectLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center"><bean:write id="project" property="project/TeacherName"/></td>
          <td width="30%"><bean:write id="project" property="project/CourseTitle"/></td>
           <td width="11%" align="center"><bean:write id="project" property="project/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td> 
          <td width="9%" align="center"><bean:write id="project" property="project/ballot"/></td>
          <td width="9%" align="center"><bean:write id="project" property="project/projectDiviResult"/>%</td>
          <td width="9%" align="center"><bean:write id="project" property="project/total"/></td>
          <td width="13%" align="center"><bean:write id="project" property="project/norm"/></td>
          <%
          if (projectLen-1>0) { 
            float count = ((Float)normList.get(projectLen-2)).floatValue();
            if (norm != count) place++;
           }
          %>
          <td width="9%" align="center"><%=place%></td>
        </tr>
        <% projectLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
     <tr><td heigth="30"></td></tr>
    <tr><td class="textc" width="90%"><br>&nbsp;四、专业知识教学（课题数:<%=specialityAdd%>，发放课题表：<%=specialityNum%>，回收:<%=zyadd%>,回收率:<%=zpercent %>）<br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr align="center" class="td_title">
           <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="11%">日期</td>
          <td width="9%">回交（份）</td>
          <td width="9%">回收率</td>
          <td width="9%">总得分</td>
          <td width="13%">平均分</td>
          <td width="9%">排名</td>
       
          </tr>
        <% int specialityLen=1;
           norm=1;
           place=1;
           normList.clear();
        %>
        <logic:iterate id="speciality" property="list[@type='speciality']">
        <%
          norm = Float.parseFloat(base.util.TalentContext.getValue(pageContext,"speciality","speciality/norm"));
          temp = new Float(base.util.TalentContext.getValue(pageContext,"speciality","speciality/norm"));
          normList.add(temp);
        %>
        <tr <% if (specialityLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center"><bean:write id="speciality" property="speciality/TeacherName"/></td>
          <td width="30%"><bean:write id="speciality" property="speciality/CourseTitle"/></td>
           <td width="11%" align="center"><bean:write id="speciality" property="speciality/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td> 
          <td width="9%" align="center"><bean:write id="speciality" property="speciality/ballot"/></td>
          <td width="9%" align="center"><bean:write id="speciality" property="speciality/specialityDiviResult"/>%</td>
          <td width="9%" align="center"><bean:write id="speciality" property="speciality/total"/></td>
          <td width="13%" align="center"><bean:write id="speciality" property="speciality/norm"/></td>
          <%
          if (specialityLen-1>0) { 
            float count = ((Float)normList.get(specialityLen-2)).floatValue();
            if (norm != count) place++;
           }
          %>
          <td width="9%" align="center"><%=place%></td>
        </tr>
        <% specialityLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
    <tr><td class="textc" width="90%"><br>&nbsp;三、意见和建议<br></td></tr>
    <tr><td class="text" width="90%">
    <%String tmp = "";
     int listlen = 1;
     int advicelen = 1;
    %>
    <logic:iterate id="advice" property="list[@type='advices']">
    <%
      String title = base.util.TalentContext.getValue(pageContext,"advice","advices/CourseTitle");
      String suggest = base.util.TalentContext.getValue(pageContext,"advice","advices/Advice");
     //if (suggest.length()>40) suggest = suggest.substring(0,34) + "......";
     if (!tmp.equals(title)) {
         tmp = title;
        if (listlen != 1) out.print("<br>");
         out.println("&nbsp;&nbsp;对“" + title + "”的评价和建议：<br>");
         out.println("&nbsp;&nbsp;学员1：" + TalentFunctions.transformHtmlTags(suggest) + "<br>");
         advicelen = 2;
      } else {
         out.println("&nbsp;&nbsp;学员"+advicelen+"：" + TalentFunctions.transformHtmlTags(suggest) + "<br>");
         advicelen++;
      }
      listlen++;
    %>
    </logic:iterate>
    </td></tr>
    </table>
    </td></tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
		var selectLength = document.getElementById("planweeks");
		document.getElementByName("week/endWeekLength")[0].value = selectLength.lastChild.innerText;
</script>