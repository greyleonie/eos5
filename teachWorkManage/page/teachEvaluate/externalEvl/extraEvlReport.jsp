<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*,java.util.*" %>
<%
String begin,end,formto = "";
if (base.util.TalentContext.getValue(pageContext,null,"week/begin") != null && !"0".equals(base.util.TalentContext.getValue(pageContext,null,"week/begin"))) {
   begin = base.util.TalentContext.getValue(pageContext,null,"week/begin").replace('.','-');
   end = base.util.TalentContext.getValue(pageContext,null,"week/end").replace('.','-');
   formto = TalentFunctions.DateForCN(begin) + " �� " + TalentFunctions.DateForCN(end);
} else {
   if (base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime") != null) {
      String btmp = base.util.TalentContext.getValue(pageContext,null,"Class/BeginTime");
      begin = btmp.substring(0,4) + "-" + btmp.substring(4,6) + "-" + btmp.substring(6,8);
      String etmp = base.util.TalentContext.getValue(pageContext,null,"Class/EndTime");
      end = etmp.substring(0,4) + "-" + etmp.substring(4,6) + "-" + etmp.substring(6,8);
      formto = TalentFunctions.DateForCN(begin) + " �� " + TalentFunctions.DateForCN(end);
   }
}

%>
<style type="text/css">
<!--
.style2 {font-family: "����"}
-->
</style>
<script type="text/javascript">
function submitForm() {

document.forms[0].submit();

}
</script>

<body>
<form>
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="Class/ClassID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ����������&gt;�������������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <SELECT name="AssignMark/ClassID" id="AssignMark/ClassID" onchange="submitForm();">
          <option value="-1">--��ѡ��༶--</option>
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
          </SELECT><b>
            <input name="B32" type="button" class="button_02" value="�� ��">
            <input name="B3" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
            <input name="B3" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
            <input type="hidden" name="queryaction">
            <input type="hidden" name="viewaction">
            </b> </td>
        </tr>
      </table>      
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" class="text_title"><b>
            <span id="printTable" class="MsoNormalIndent"><bean:write property="Class/ClassName"/>����ν�ѧ������Ϣ<br></span>
            <span class="text_red">��<%=formto%>��</span></b></td>
          </tr>
          <tr>
            <td height="30" align="left" class="text">
            <span class="MsoNormalIndent">
            <!--<bean:write property="Class/ClassName"/>-->���๲
            <bean:write property="Survey/amount"/>�ˣ�����ѧԱ���������
            <bean:write property="Survey/amount"/>�ݣ�����
            <bean:write property="Survey/ballot"/>�ݣ�������
            <bean:write property="Survey/precent"/>%���������д
            <bean:write property="Survey/suggest"/>�ݡ�</span>
            </td>
          </tr>
        </table>        
        </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
        <tr align="center" class="td_title">
          <td rowspan="2">������</td>
          <td rowspan="2">����</td>
          <td rowspan="2">����</td>
          <td rowspan="2">���գ��ݣ�</td>
          <logic:iterate id="level" property="list[@type='extraLevs']">
          <td width="10%" colspan="2"><bean:write id="level" property="extraLevs/LevelName"/></td>
          </logic:iterate>
          <td>����</td>
        </tr>
        <tr class="td2">
        <%int levlen = 0; %>
        <logic:iterate id="level" property="list[@type='extraLevs']">
          <td width="5%" align="center">Ʊ��</td>
          <td width="5%" align="center">%</td>
        <%levlen++; %>
        </logic:iterate>
          <td width="5%" align="center">&nbsp;</td>
          </tr>
        <%
        int ballot=1,i=1,place=1;
         Integer tmp = null;
         List ballotList = new ArrayList();
        %>
        <logic:iterate id="report" property="list[@type='extraReports']">
        <%
          ballot = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","extraReports/ballot"));
          tmp = new Integer(base.util.TalentContext.getValue(pageContext,"report","extraReports/ballot"));
          ballotList.add(tmp);
        %>
        <tr <% if (i%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
          <td width="12%"><bean:write id="report" property="extraReports/TeacherName"/></td>
          <td width="32%"><bean:write id="report" property="extraReports/CourseTitle"/></td>
           <td width="10%"align="center"><bean:write id="report" property="extraReports/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
          <td width="10%" align="center"><bean:write id="report" property="extraReports/ballot"/></td>
          <logic:iterate id="level" property="list[@type='extraLevs']">
          <%int flag = 0; %>
          <logic:iterate id="detail" property="list[@type='extraDetail']">
          <%
          int courseId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"report","extraReports/CourseID"));
           String levname = base.util.TalentContext.getValue(pageContext,"level","extraLevs/LevelName").trim();
          int cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"detail","extraDetail/CourseID"));
           String lname = base.util.TalentContext.getValue(pageContext,"detail","extraDetail/LevelName").trim();
          if (cid==courseId && lname.equals(levname)) {
          %>
          <td width="5%" align="center"><bean:write id="detail" property="extraDetail/ballot"/></td>
          <td width="5%" align="center"><bean:write id="detail" property="extraDetail/precent"/></td>
          <%
           flag = 1;}
          %>
          </logic:iterate>
          <%if (flag==0) { %>
          <td width="5%" align="center">0</td>
          <td width="5%" align="center">0</td>
          <% } %>
          </logic:iterate>
          <%
          if (i-1>0) { 
            //int count = ((Integer)ballotList.get(i-2)).intValue();
           // if (ballot != count) place++;
           place++;
           }
          %>
          <td width="8%" align="center"><%=place%></td>
          </tr>
        <% i++; %>
        </logic:iterate>
        <tr onclick="changeTRBgColor(this)">
           <td class='td2'>����ͽ���</td>
           <td colspan="<%=levlen*2+3%>" class='td1'>
           <logic:iterate id="course" property="list[@type='extraReports']">
           <logic:greaterThan id="course" property="extraReports/advicelen" value="0">
           ��<bean:write id="course" property="extraReports/TeacherName"/>��<bean:write id="course" property="extraReports/CourseTitle"/>��<br>
           <%int k=1; %>
           <logic:iterate id="advice" property="list[@type='extraAdvices']">
           <%
           int courseID = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"course","extraReports/CourseID"));
           int courseNO = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"advice","extraAdvices/CourseID"));
           if (courseNO == courseID) {
                String advice = base.util.TalentContext.getValue(pageContext,"advice","extraAdvices/Advice");
                out.println("ѧԱ" + k + "��" + TalentFunctions.transformHtmlTags(advice)+"<br>");
                k++; 
             }
           %>
           </logic:iterate>
           </logic:greaterThan>
           </logic:iterate>
           </td>
        </tr>
      </table>
      </td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>