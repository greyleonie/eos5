<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-pagecom.tld" prefix="pagecom" %>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="workflow" %>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<%@ taglib uri="/WEB-INF/hci-richclient.tld" prefix="richclient" %>
<%@ taglib uri="/WEB-INF/hci-datacell.tld" prefix="datacell" %>
<%@page import="talent.core.*,java.util.*,java.text.DecimalFormat" %>
<%
String begin,end,formto = "";
int score,courseid,itemId,cid,iid,flag = 0;
int hindex=1;
int findex=1;
int add=0;
int amountNum=0;
int allAdd=0;String showWeek="";String className="";
String apercent="0";
String bpercent="0";
String zpercent="0";
String xpercent="0";;
String percent="";
String week="";
className=base.util.TalentContext.getValue(pageContext,null,"Class/ClassName");
className= new   String(className.getBytes("GBK"),"iso8859-1");   
 showWeek=base.util.TalentContext.getValue(pageContext,null,"week/showWeek");
if(showWeek==null||showWeek.equals("")||showWeek.equals("请选择周")){
week="本期评估情况";
}else{
 week="第"+showWeek+"周评估情况";
}
 week= new   String(week.getBytes("GBK"),"iso8859-1");   
if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {
   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
   formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
} else {
   String btmp = base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime");
   begin = btmp.substring(0,4) + "-" + btmp.substring(4,6) + "-" + btmp.substring(6,8);
   String etmp = base.util.TalentContext.getValue(pageContext,null,"Class/EndTime");
   end = etmp.substring(0,4) + "-" + etmp.substring(4,6) + "-" + etmp.substring(6,8);
   formto = TalentFunctions.DateForCN(begin) + " 至 " + TalentFunctions.DateForCN(end);
}
response.setContentType("application/msword;charset=gb2312");

response.setHeader("Content-Disposition", "attachment;filename="+className+week+".doc");
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
</script>

<body>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="4">
          <tr>
            <td align="center" class="text_title"><b>
            <span id="printTable" class="MsoNormalIndent">
            <FONT size="4">
            <%if(showWeek==null||showWeek.equals("")||(showWeek.equals("请选择周"))){%>
             <bean:write property="Class/ClassName"/>学员教学质量评估汇总表
            <% }else{%>
             <bean:write property="Class/ClassName"/>学员第<%=showWeek%>周教学质量评估表
             <%} %></FONT>
            </span><br>
            <p class="text_red">（<%=formto%>）</p></b></td>
          </tr>
           <tr>
            <td height="30" align="left" class="textc">&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="MsoNormalIndent">
            <FONT size="3">
             <!--<bean:write property="Class/ClassName"/>-->本班共
            <bean:write property="Survey/amount"/>人，<%if(showWeek==null||showWeek.equals("")||showWeek.equals("请选择周")){%>评估课题数：<%=add %>
            <%}else{%>评估课题数：<%=add %><%}%>个
                       发放课题评估表<%=amountNum %>份，回收
            <%=allAdd %>份，回收率
            <%=percent%>，意见栏填写
            <bean:write property="Survey/suggest"/>份。</span></FONT></td>
          </tr>
        </table>        
      </td>
    </tr>
    <tr><td >
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr><td class="textc"><FONT size="3">
    &nbsp;一、专题课教学（课题数:<%=fdksAdd%>，发放课题表：<%=fdksNum%>，回收:<%=ztadd%>,回收率:<%=apercent %></FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
        <tr bgcolor="#FFFFFF" align="center" class="td_title">
          <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="10%">日期</td>
          <td width="10%">回交（份）</td>
          <td width="10%">回收率</td>
          <td width="10%">总得分</td>
          <td width="10%">平均分</td>
          <td width="10%">排名</td>
        </tr>
        <font size="2">
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
        <tr bgcolor="#FFFFFF" <% if (fdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center" class="textc"><bean:write id="fdk" property="fdks/TeacherName"/></td>
          <td width="30%"><bean:write id="fdk" property="fdks/CourseTitle"/></td>
          <td width="10%" align="center"><bean:write id="fdk" property="fdks/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
          <td width="10%" align="center"><bean:write id="fdk" property="fdks/ballot"/></td>
          <td width="10%" align="center"><bean:write id="fdk" property="fdks/diviResult" />%</td>
          <td width="10%" align="center"><bean:write id="fdk" property="fdks/total"/></td>
          <td width="10%" align="center"><bean:write id="fdk" property="fdks/norm"/></td>
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
        </font>
      </table>
      </td>
    </tr>
    <tr><td heigth="30"></td></tr>
    <tr><td class="textc"><br>
    <FONT size="3">
    &nbsp;二、互动式教学（课题数:<%=hdksAdd%>，发放课题表：<%=hdksNum%>，回收:<%=hdadd%>,回收率:<%=bpercent %>）
    </FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
        <tr bgcolor="#FFFFFF" align="center" class="td_title">
          <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="10%">日期</td>
          <td width="10%">回交（份）</td>
          <td width="10%">回收率</td>
          <td width="10%">总得分</td>
          <td width="10%">平均分</td>
          <td width="10%">排名</td>
          </tr>
        <% int hdkLen=1; %>
        <font size="2">
        <logic:iterate id="hdk" property="list[@type='hdks']">
        <tr bgcolor="#FFFFFF" <% if (hdkLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center" class="textc"><bean:write id="hdk" property="hdks/TeacherName"/></td>
          <td width="30%"><bean:write id="hdk" property="hdks/CourseTitle"/></td>
          <td width="10%" align="center"><bean:write id="hdk" property="hdks/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
          <td width="10%" align="center"><bean:write id="hdk" property="hdks/ballot"/></td>
          <td width="10%" align="center"><bean:write id="hdk" property="hdks/hdksDiviResult"/>%</td>
          <td width="10%" align="center"><bean:write id="hdk" property="hdks/total"/></td>
          <td width="10%" align="center"><bean:write id="hdk" property="hdks/norm"/></td>
          <td width="10%" align="center" class="textc"><%=hdkLen%></td>
        </tr>
        <% hdkLen++; %>
        </logic:iterate>
        </font>
      </table>
      </td>
    </tr>
      <tr><td heigth="30"></td></tr>
    <tr><td class="textc"><br>
    <FONT size="3">&nbsp;三、项目教学（课题数:<%=projectAdd%>，发放课题表：<%=projectNum%>，回收:<%=xmadd%>,回收率:<%=xpercent %>） </FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
        <tr align="center" class="td_title" bgcolor="#FFFFFF">
           <td width="10%">教员</td>
          <td width="30%">课题</td>
          <td width="11%">日期</td>
          <td width="9%">回交（份）</td>
          <td width="9%">回收率</td>
          <td width="9%">总得分</td>
          <td width="13%">平均分</td>
          <td width="9%">排名</td>
       
          </tr>
      <% int projectLen=1; %>
        <logic:iterate id="project" property="list[@type='project']">
         <font size="2">
        <tr bgcolor="#FFFFFF"  <% if (projectLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center" class="textc"><bean:write id="project" property="project/TeacherName"/></td>
          <td width="30%"><bean:write id="project" property="project/CourseTitle"/></td>
           <td width="11%" align="center"><bean:write id="project" property="project/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td> 
          <td width="9%" align="center"><bean:write id="project" property="project/ballot"/></td>
          <td width="9%" align="center"><bean:write id="project" property="project/projectDiviResult"/>%</td>
          <td width="9%" align="center"><bean:write id="project" property="project/total"/></td>
          <td width="13%" align="center"><bean:write id="project" property="project/norm"/></td>
        
          <td width="9%" align="center"><%=projectLen%></td>
          </font>
        </tr>
        <% projectLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
     <tr><td heigth="30"></td></tr>
    <tr><td class="textc"><br>
     <FONT size="3">&nbsp;四、专业知识教学（课题数:<%=specialityAdd%>，发放课题表：<%=specialityNum%>，回收:<%=zyadd%>,回收率:<%=zpercent %>）</FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
        <tr bgcolor="#FFFFFF" align="center" class="td_title">
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
          
        %>
        <logic:iterate id="speciality" property="list[@type='speciality']">
        <font size="2">
        <tr bgcolor="#FFFFFF" <% if (specialityLen%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="10%" align="center" class="textc"><bean:write id="speciality" property="speciality/TeacherName"/></td>
          <td width="30%"><bean:write id="speciality" property="speciality/CourseTitle"/></td>
           <td width="11%" align="center"><bean:write id="speciality" property="speciality/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td> 
          <td width="9%" align="center"><bean:write id="speciality" property="speciality/ballot"/></td>
          <td width="9%" align="center"><bean:write id="speciality" property="speciality/specialityDiviResult"/>%</td>
          <td width="9%" align="center"><bean:write id="speciality" property="speciality/total"/></td>
          <td width="13%" align="center"><bean:write id="speciality" property="speciality/norm"/></td>
        
          <td width="9%" align="center"><%=specialityLen%></td>
       
        </tr>
           </font>
        <% specialityLen++; %>
        </logic:iterate>
      </table>
      </td>
    </tr>
    <tr><td class="textc"><br>&nbsp;三、意见和建议<br></td></tr>
    <tr><td class="text">
    <%String tmp = "";
     int listlen = 1;
     int advicelen = 1;
    %>
    <logic:iterate id="advice" property="list[@type='advices']">
    <%
      String title = base.util.TalentContext.getValue(pageContext,"advice","advices/CourseTitle");
      String teacher = base.util.TalentContext.getValue(pageContext,"advice","advices/teachername");
      String suggest = base.util.TalentContext.getValue(pageContext,"advice","advices/Advice");
     if (!tmp.equals(title)) {
         tmp = title;
        if (listlen != 1) out.print("<br>");
         out.println("&nbsp;&nbsp;对" + teacher + "老师”" + title + "”课程的评价和建议：<br>");
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
</body>