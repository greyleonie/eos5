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
if(showWeek==null||showWeek.equals("")||showWeek.equals("��ѡ����")){
week="�����������";
}else{
 week="��"+showWeek+"���������";
}
 week= new   String(week.getBytes("GBK"),"iso8859-1");   
if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {
   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
   formto = TalentFunctions.DateForCN(begin) + " �� " + TalentFunctions.DateForCN(end);
} else {
   String btmp = base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime");
   begin = btmp.substring(0,4) + "-" + btmp.substring(4,6) + "-" + btmp.substring(6,8);
   String etmp = base.util.TalentContext.getValue(pageContext,null,"Class/EndTime");
   end = etmp.substring(0,4) + "-" + etmp.substring(4,6) + "-" + etmp.substring(6,8);
   formto = TalentFunctions.DateForCN(begin) + " �� " + TalentFunctions.DateForCN(end);
}
response.setContentType("application/msword;charset=gb2312");

response.setHeader("Content-Disposition", "attachment;filename="+className+week+".doc");
DecimalFormat df=new   DecimalFormat("#0.0"); 
//ͳ��ר�������
int fdksAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"fdksAdd"));
//ͳ�ƻ���ʽ��ѧ������
int hdksAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"hdksAdd"));
//ͳ��רҵ֪ʶ��ѧ������
int specialityAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"specialityAdd"));
//ͳ����Ŀ��ѧ������
int projectAdd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"projectAdd"));
add=fdksAdd+hdksAdd+projectAdd+specialityAdd;
//ѧԱ����
int amount=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"Survey/amount"));
//ר�������+����ʽ��ѧ���������������������
amountNum=amount*add;
//ר����������������������
int fdksNum=amount*fdksAdd;
//����ʽ��ѧ���������������������
int hdksNum=amount*hdksAdd;
//רҵ��ѧ���������������������
int specialityNum=amount*specialityAdd;
//��Ŀ��ѧ���������������������
int projectNum=amount*projectAdd;

//ר�������,ͳ�ƻ��շ���
int ztadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"add"));
if(ztadd!=0){
float a=(float)ztadd/(float)fdksNum;
apercent=df.format((a*10000)/100)+"%";
}
//����ʽ��ѧ������,ͳ�ƻ��շ���
int hdadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"totalAdd"));
if(hdadd!=0){
float b=(float)hdadd/(float)hdksNum;
bpercent=df.format((b*10000)/100)+"%";
}

//רҵ��ѧ������,ͳ�ƻ��շ���
int zyadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"specialityAdd"));
if(zyadd!=0){
float b=(float)zyadd/(float)specialityNum;
zpercent=df.format((b*10000)/100)+"%";
}
//��Ŀ��ѧ������,ͳ�ƻ��շ���
int xmadd=Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"projectAdd"));
if(xmadd!=0){
float b=(float)xmadd/(float)projectNum;
xpercent=df.format((b*10000)/100)+"%";
}

//ר�������+����ʽ��ѧ������,ͳ�ƻ��շ���
allAdd=ztadd+hdadd+zyadd+xmadd;
if(allAdd!=0){
float c = (float)allAdd/(float)amountNum;  
percent=df.format((c*10000)/100)+"%";
}
%>
%>
<style type="text/css">
<!--
.style2 {font-family: "����"}

.textc {
    font-size: 14px;
	color: #000000;
	font-weight: bold;
    font-family: "����";
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
            <%if(showWeek==null||showWeek.equals("")||(showWeek.equals("��ѡ����"))){%>
             <bean:write property="Class/ClassName"/>ѧԱ��ѧ�����������ܱ�
            <% }else{%>
             <bean:write property="Class/ClassName"/>ѧԱ��<%=showWeek%>�ܽ�ѧ����������
             <%} %></FONT>
            </span><br>
            <p class="text_red">��<%=formto%>��</p></b></td>
          </tr>
           <tr>
            <td height="30" align="left" class="textc">&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="MsoNormalIndent">
            <FONT size="3">
             <!--<bean:write property="Class/ClassName"/>-->���๲
            <bean:write property="Survey/amount"/>�ˣ�<%if(showWeek==null||showWeek.equals("")||showWeek.equals("��ѡ����")){%>������������<%=add %>
            <%}else{%>������������<%=add %><%}%>��
                       ���ſ���������<%=amountNum %>�ݣ�����
            <%=allAdd %>�ݣ�������
            <%=percent%>���������д
            <bean:write property="Survey/suggest"/>�ݡ�</span></FONT></td>
          </tr>
        </table>        
      </td>
    </tr>
    <tr><td >
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr><td class="textc"><FONT size="3">
    &nbsp;һ��ר��ν�ѧ��������:<%=fdksAdd%>�����ſ����<%=fdksNum%>������:<%=ztadd%>,������:<%=apercent %></FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
        <tr bgcolor="#FFFFFF" align="center" class="td_title">
          <td width="10%">��Ա</td>
          <td width="30%">����</td>
          <td width="10%">����</td>
          <td width="10%">�ؽ����ݣ�</td>
          <td width="10%">������</td>
          <td width="10%">�ܵ÷�</td>
          <td width="10%">ƽ����</td>
          <td width="10%">����</td>
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
    &nbsp;��������ʽ��ѧ��������:<%=hdksAdd%>�����ſ����<%=hdksNum%>������:<%=hdadd%>,������:<%=bpercent %>��
    </FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
        <tr bgcolor="#FFFFFF" align="center" class="td_title">
          <td width="10%">��Ա</td>
          <td width="30%">����</td>
          <td width="10%">����</td>
          <td width="10%">�ؽ����ݣ�</td>
          <td width="10%">������</td>
          <td width="10%">�ܵ÷�</td>
          <td width="10%">ƽ����</td>
          <td width="10%">����</td>
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
    <FONT size="3">&nbsp;������Ŀ��ѧ��������:<%=projectAdd%>�����ſ����<%=projectNum%>������:<%=xmadd%>,������:<%=xpercent %>�� </FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
        <tr align="center" class="td_title" bgcolor="#FFFFFF">
           <td width="10%">��Ա</td>
          <td width="30%">����</td>
          <td width="11%">����</td>
          <td width="9%">�ؽ����ݣ�</td>
          <td width="9%">������</td>
          <td width="9%">�ܵ÷�</td>
          <td width="13%">ƽ����</td>
          <td width="9%">����</td>
       
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
     <FONT size="3">&nbsp;�ġ�רҵ֪ʶ��ѧ��������:<%=specialityAdd%>�����ſ����<%=specialityNum%>������:<%=zyadd%>,������:<%=zpercent %>��</FONT><br></td></tr>
    <tr>
      <td class="text">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
        <tr bgcolor="#FFFFFF" align="center" class="td_title">
           <td width="10%">��Ա</td>
          <td width="30%">����</td>
          <td width="11%">����</td>
          <td width="9%">�ؽ����ݣ�</td>
          <td width="9%">������</td>
          <td width="9%">�ܵ÷�</td>
          <td width="13%">ƽ����</td>
          <td width="9%">����</td>
       
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
    <tr><td class="textc"><br>&nbsp;��������ͽ���<br></td></tr>
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
         out.println("&nbsp;&nbsp;��" + teacher + "��ʦ��" + title + "���γ̵����ۺͽ��飺<br>");
         out.println("&nbsp;&nbsp;ѧԱ1��" + TalentFunctions.transformHtmlTags(suggest) + "<br>");
         advicelen = 2;
      } else {
         out.println("&nbsp;&nbsp;ѧԱ"+advicelen+"��" + TalentFunctions.transformHtmlTags(suggest) + "<br>");
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