<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="org.hibernate.*,com.talent.common.HibernateSessionFactory"%>

<%!
public String formatLevText(String levname) {
	   String tmpText = "";
	   for (int i=0;i<levname.length();i++) {
         tmpText += levname.substring(i, i+1) + "<br>";
     }
     
     return tmpText;
}

public String formatItemText(String itemName) {
String name_tmp = "";
	   if (itemName.length() <= 6) {
          for (int i=0;i < itemName.length();i++) {
             name_tmp = name_tmp + itemName.substring(i,i+1) + " ";
          }
          
          return name_tmp + "<br>";
       }
       if (itemName.length() > 8) {
          name_tmp = itemName.substring(0,itemName.length()/2) + "<br>" + itemName.substring(itemName.length()/2,itemName.length()) + "<br>";
          return name_tmp;
       }
       name_tmp = itemName + "<br>";
return name_tmp;
}
%>

<%
  Session dbsession = null;
  int evlID=0,isadvice = 0,age=0;
  String title="",explain="",remarks="",sex="",degree="",deadline="",openState="";
  java.util.Date now = new java.util.Date();
  Calendar endDate = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    
  openState = request.getParameter("openState");
 	String classID = request.getParameter("classID");
  String studentID = request.getParameter("studentID");
  String week = request.getParameter("week");
  String begin = request.getParameter("begin");
  String end = request.getParameter("end");
  endDate.setTime(sdf.parse(end));
  endDate.add(Calendar.DAY_OF_MONTH,5);
  deadline = sdf.format(endDate.getTime());
  
  //�������ݿ�
  try{
    dbsession = HibernateSessionFactory.currentSession();
	}catch (Exception e) {
		e.printStackTrace();
	}
  Connection conn = dbsession.connection();
  Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

  //��ȡѧԱ��Ϣ
  String sql = "select a.sex,(year(getdate())-year(a.Birthdate)) age,b.degree "
             + "from student a left join degree b on b.degreeId=a.degreeId where studentid=" + studentID;
  ResultSet student = stmt.executeQuery(sql);
  while (student.next()) {
     sex = student.getString("sex").trim();
     age = student.getInt("age");
     degree = student.getString("degree");
  }
  
  //��ȡ��������Ϣ
  sql = "select * from Evaluation where evaluationid in (select top 1 evaluationid from AssignMark where classid="+classID+" and evaluationid in (select evaluationid from Evaluation where period='ÿ��' and classtype='2'))";
  ResultSet Evaluation = stmt.executeQuery(sql);
  while (Evaluation != null && Evaluation.next()) {
         evlID = Evaluation.getInt("EvaluationID");
         isadvice = Evaluation.getInt("IsNeedAdvice");
         title = Evaluation.getString("title");
         explain = Evaluation.getString("explain");
         remarks = Evaluation.getString("remarks");
  }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='2' and Period='ÿ��' and (Class like '%"+classID+"%' or Class like '%"+classID+",%' or Class like '%,"+classID+",%' or Class like '%,"+classID+"%')";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  } }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='2' and Period='ÿ��' order by EvaluationID desc";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  } }
  
  //��ȡȫģʽ������Ŀ
  sql = "select EvaluationID,ItemID,OrderNO,IsNull(CourseType,'') CourseType,"
      + "IsNull(CourseType,'ȫ��') as Course,Title,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType IS Null order by OrderNO";
  List items = dbsession.createSQLQuery(sql).list();

  //��ȡȫģʽ�����ȼ�
  sql = "select LevelName from EvaluateItemScore where ItemID="
      + "(select top 1 ItemID from EvaluateItems where EvaluationID=" + evlID
      + " order by ItemID) order by LevelID,OrderNo";
  List levels = dbsession.createSQLQuery(sql).list();
%>
<style type="text/css">
  <!--
    .STYLE1 {
    font-family: "������κ";
    font-size: 16px;
    }
    .style2 {font-family: "����"}
    .STYLE3 {
    font-family: "������";
    font-size: 18px;
    font-weight: bold;
    }
    .STYLE4 {
    font-family: "������";
    font-size: x-large;
    font-weight: bold;
    }
    .STYLE5 {
    font-family: "������";
    font-size: 16px;
    }
    .STYLE6 {
    font-family: "������";
    font-size: 16px;
    font-weight: bold;
    }
    .STYLE11 {font-size: 12px}
    .noinput {
    BORDER-RIGHT: #a3a3a3 1px solid;
    BORDER-TOP: #636562 1px solid;
    DISPLAY: none;
    FONT-SIZE: 12px;
    BORDER-LEFT: #636562 1px solid;
    WIDTH: 600px;
    COLOR: #000000;
    BORDER-BOTTOM: #a3a3a3 1px solid;
    HEIGHT: 25px
    }
    .showinput {
    BORDER-RIGHT: #a3a3a3 1px solid;
    BORDER-TOP: #636562 1px solid;
    DISPLAY: block;
    FONT-SIZE: 12px;
    BORDER-LEFT: #636562 1px solid;
    WIDTH: 600px;
    COLOR: #000000;
    BORDER-BOTTOM: #a3a3a3 1px solid;
    HEIGHT: 25px
    }
    .showversion {
    FONT-SIZE: 12px;
    WIDTH: 50px;
    COLOR: #000000;
    }
    .noversion {
    DISPLAY: none;
    FONT-SIZE: 12px;
    WIDTH: 50px;
    COLOR: #000000;
    }
  -->
</style>
<script type="text/javascript">
function checkInput(iid,lid,levlen) {
for (var i=0;i<levlen;i++) {
   if (i != lid) {
      var obj = document.getElementById(iid+"_l"+i);
      if (obj.checked) {
         obj.checked = false;
      }
   }
}
}
</script>
<body>
<FORM id="addWeekEvlForm" method="post" action="shortEvl_do.jsp">
<input type="hidden" name="evaluationID" value="<%=evlID%>"/>
<input type="hidden" name="classID" value="<%=classID%>"/>
<input type="hidden" name="studentID" value="<%=studentID%>"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" align="center">
      <span class="STYLE3">������ί��У&nbsp;&nbsp;��������ѧԺ</span><br>
      <SPAN class="STYLE4" id="titleText"><%=title%></SPAN><BR>
      <div align="left" class="STYLE5">
        <strong>��λѧԱ��</strong><br/>&nbsp;&nbsp;&nbsp;&nbsp;
        <SPAN id="remarksText"><%=remarks%></SPAN>
      </div>
    </td>
  </tr>
  <tr>
    <td class="text" valign="top">
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td>
            <span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;һ�����Ļ�����Ϣ</span>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
              <tr>
                <td width="10%" bgcolor="#FFFFFF" align="center" valign="middle"><br/>ѧ��</td>
                <td width="40%" bgcolor="#FFFFFF" align="center" valign="middle">
                  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="40%" align="center">��ʿ�о���</td>
                      <td width="10%" align="center">
                        <input type="checkbox" name="checkbox" value="checkbox" <%if ("��ʿ�о���".equals(degree)) { out.print("checked");}%>/>
                      </td>
                      <td width="40%" align="center">��ѧ����</td>
                      <td width="10%" align="center">
                        <input type="checkbox" name="checkbox4" value="checkbox" <%if ("��ѧ����".equals(degree)) { out.print("checked");}%>/>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">˶ʿ�о���</td>
                      <td align="center">
                        <input type="checkbox" name="checkbox2" value="checkbox" <%if ("˶ʿ�о���".equals(degree)) { out.print("checked");}%>/>
                      </td>
                      <td align="center">��ѧר��</td>
                      <td align="center">
                        <input type="checkbox" name="checkbox5" value="checkbox" <%if ("��ѧר��".equals(degree)) { out.print("checked");}%>/>
                      </td>
                    </tr>
                    <tr>
                      <td align="center">��У�о���</td>
                      <td align="center">
                        <input type="checkbox" name="checkbox3" value="checkbox" <%if ("��У�о���".equals(degree)) { out.print("checked");}%>/>
                      </td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                  </table>
                </td>
                <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">��<br/>��</td>
                <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle">��
                  <input type="checkbox" name="checkbox6" value="checkbox" <%if ("1".equals(sex)) { out.print("checked");}%>/>
                  &nbsp;&nbsp;&nbsp;&nbsp;Ů
                  <input type="checkbox" name="checkbox7" value="checkbox" <%if ("0".equals(sex)) { out.print("checked");}%>/>
                </td>
                <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">��<br/>��</td>
                <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle">
                  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="60%" align="left">40������</td>
                      <td width="40%" align="center">
                        <input type="checkbox" name="checkbox8" value="checkbox" <%if (age<40) { out.print("checked");}%>/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left">40�ꡫ50��</td>
                      <td align="center">
                        <input type="checkbox" name="checkbox9" value="checkbox" <%if (age>=40 && age<50) { out.print("checked");}%>/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left">50������</td>
                      <td align="center">
                        <input type="checkbox" name="checkbox10" value="checkbox" <%if (age>=50) { out.print("checked");}%>/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
              <tr id="allCourse_item0_tr">
                <td width="18%" bgcolor="#FFFFFF">&nbsp;&nbsp;����̶�<br/>��<br/>��<br/>��
                <%
                  for (int i=0;i<levels.size();i++) {
                     String levname = (String)levels.get(i);
                %>
                <td width="10%" align="center" bgcolor="#FFFFFF">
                  <table width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr valign="middle">
                      <td align="center"><%=formatLevText(levname)%></td>
                    </tr>
                  </table>
                </td>
              <%}
                if (isadvice == 1) {%>
                <td width="42%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
              <% } %>
              </tr>
            <%
              for (int i=0;i<items.size();i++) {
                      Object[] item = (Object[])items.get(i);
                      String name = (String)item[5];
                      int itemId = ((Integer)item[1]).intValue();
            %>
              <tr>
                <td width="18%" height="45" align="center" bgcolor="#FFFFFF">
                  <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                      <td width="80%" align="center" valign="middle"><%=formatItemText(name)%></td>
                    </tr>
                  </table>
                </td>
              <%
                sql = "select LevelID from EvaluateItemScore where ItemID=" + itemId + "order by OrderNO";
                levels = dbsession.createSQLQuery(sql).list();
                for (int j=0;j<levels.size();j++) {
                     int levId = ((Integer)levels.get(j)).intValue();
                     sql = "select * from AssignMark where ClassID=" + classID + " and ItemID=" + itemId + " and LevelID=" + levId + " and StudentID=" + studentID;
                     List mark = dbsession.createSQLQuery(sql).list();
              %>
                <td width="10%" align="center" bgcolor="#FFFFFF">
                <% if (mark != null && mark.size()>0) { %>
                  <input type="checkbox" name="i<%=i%>_l<%=j%>" id="i<%=i%>_l<%=j%>" checked value="iid=<%=itemId%>&lid=<%=levId%>" onclick="checkInput('i<%=i%>','<%=j%>','<%=levels.size()%>')"/>
                <% } else { %>
                  <input type="checkbox" name="i<%=i%>_l<%=j%>" id="i<%=i%>_l<%=j%>" value="iid=<%=itemId%>&lid=<%=levId%>" onclick="checkInput('i<%=i%>','<%=j%>','<%=levels.size()%>')"/>
                <% } %>
                </td>
              <%}
                if (isadvice == 1) {
                   String suggest = "";
                   sql = "select AdviceID,Advice from Advice where ClassID=" + classID + " and itemID=" + itemId + " and StudentID=" + studentID;
                   List advices = dbsession.createSQLQuery(sql).list();
                   if (advices != null && advices.size() > 0) {
                      Object[] advice = (Object[])advices.get(0);
                      suggest = (String)advice[1];
                   }
              %>
                <td width="42%" align="center" bgcolor="#FFFFFF">
                <textarea name="item<%=itemId%>_suggest" cols="" rows=""><%=suggest%></textarea>
                </td>
              <% } %>
              </tr>
            <% } %>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;��������ר��ε�����</span>
            <span class="STYLE5">��������ѡ��Ŀ�ġ������ڴ򡰡̡�����Ըÿ��ⲻ���⣬���á������հ׼��ɣ�</span>
          </td>
        </tr>
<%
  //��ȡ�ð༶ר���
  sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,b.ItemID,"
      + "(select count(1) from EvaluateItemScore where ItemID=b.ItemID) levlen,"
      + "(select EducatingMode from EducatingMode where EducatingModeID=a.TeahchingModelID) Course,"
      + "Teachers,(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) Teacher "
      + "from Course a inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlID
      + " and CourseType IS NOT NULL) b on a.TeahchingModelID=b.coursetype "
      + "where a.IsAdopted=1 and (a.IsOutClass=0 or a.IsOutClass Is Null) and a.ClassID=" + classID;
  List courses = dbsession.createSQLQuery(sql).list();
%>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
              <tr>
                <td width="30%" align="center" bgcolor="#FFFFFF">ר�⣨�����ˣ�</td>
                <td width="20%" align="center" bgcolor="#FFFFFF">�������</td>
                <% if (isadvice == 1) { %>
                <td width="50%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
                <% } %>
              </tr>
            <%for (int k=0;k<courses.size();k++) {
                 Object[] course = (Object[]) courses.get(k);
                 String cid = ((Integer)course[0]).toString();
                 String ctitle = (String)course[2];
                 String itemId = ((Integer)course[5]).toString();
                 String levlen = ((Integer)course[6]).toString();
                 String coursetype = (String)course[7];
                 String tid = (String)course[8];
                 String tname = (String)course[9];
              %>
                <tr>
                  <td width="30%" bgcolor="#FFFFFF">
                    <%=coursetype%>��<br/><%=sdf.format(course[3])%><BR><%=ctitle%><br/>
                    <div align="right">��<%=tname%>��</div>
                  </td>
                  <td width="20%" align="center" bgcolor="#FFFFFF">
                    <table width="90%" border="0" cellspacing="3" cellpadding="0">
                    <%sql = "select LevelID,LevelName from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
                      levels = dbsession.createSQLQuery(sql).list();
                      for (int i=0;i<levels.size();i++) {
                         Object[] level = (Object[]) levels.get(i);
                         String levId = ((Integer)level[0]).toString();
                         String levname = (String)level[1];
                         sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and LevelID=" + levId + " and StudentID=" + studentID;
                         List mark = dbsession.createSQLQuery(sql).list();
                      %>
                        <tr>
                          <td width="30%" align="center">
                          <% if (mark != null && mark.size()>0) { %>
                            <input type="checkbox" name="c<%=k%>_l<%=i%>" id="c<%=k%>_l<%=i%>" checked value="" onclick="checkInput('c<%=k%>','<%=i%>','<%=levlen%>')"/>
                          <% } else {%>
                            <input type="checkbox" name="c<%=k%>_l<%=i%>" id="c<%=k%>_l<%=i%>" value="" onclick="checkInput('c<%=k%>','<%=i%>','<%=levlen%>')"/>
                          <% } %>
                          </td>
                          <td width="70%" align="left"><%=levname%></td>
                        </tr>
                      <% } %>
                    </table>
                  </td>
                  <% if (isadvice == 1) { 
                        String suggest = "";
                        sql = "select AdviceID,Advice from Advice where ClassID=" + classID + " and CourseID=" + cid + " and StudentID=" + studentID;
                        List advices = dbsession.createSQLQuery(sql).list();
                        if (advices != null && advices.size() > 0) {
                           Object[] advice = (Object[])advices.get(0);
                           suggest = (String)advice[1];
                        }%>
                  <td width="50%" bgcolor="#FFFFFF">
                  <textarea name="c<%=cid%>_suggest" cols="54" rows="5"><%=suggest%></textarea>
                  </td>
                  <% } %>
                </tr>
              <% } %>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;�ġ�������ε�����</span>
            <span class="STYLE5">�������Դ˿β����⣬�ɲ��򡰡̡���</span>
          </td>
        </tr>
<%
  //��ȡ�ð༶�����
  sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,b.ItemID,"
      + "(select count(1) from EvaluateItemScore where ItemID=b.ItemID) levlen,"
      + "(select EducatingMode from EducatingMode where EducatingModeID=a.TeahchingModelID) Course,"
      + "Teachers,(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) Teacher "
      + "from Course a inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlID
      + " and CourseType IS NOT NULL) b on a.TeahchingModelID=b.coursetype where a.IsAdopted=1 and a.ClassID=" + classID
      + " and a.IsOutClass=1";
  courses = dbsession.createSQLQuery(sql).list();
%>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
              <tr>
                <td width="30%" align="center" bgcolor="#FFFFFF">ר�⣨�����ˣ�</td>
                <td width="20%" align="center" bgcolor="#FFFFFF">�������</td>
                <% if (isadvice == 1) { %>
                <td width="50%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
                <% } %>
              </tr>
            <%for (int k=0;k<courses.size();k++) {
                 Object[] course = (Object[]) courses.get(k);
                 String cid = ((Integer)course[0]).toString();
                 String ctitle = (String)course[2];
                 String itemId = ((Integer)course[5]).toString();
                 String levlen = ((Integer)course[6]).toString();
                 String coursetype = (String)course[7];
                 String tid = (String)course[8];
                 String tname = (String)course[9];
              %>
                <tr>
                  <td width="30%" bgcolor="#FFFFFF">
                    <%=coursetype%>��<br/><%=ctitle%><br/>
                    <div align="right">��<%=tname%>��</div>
                  </td>
                  <td width="20%" align="center" bgcolor="#FFFFFF">
                    <table width="90%" border="0" cellspacing="3" cellpadding="0">
                    <%sql = "select LevelID,LevelName from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
                      levels = dbsession.createSQLQuery(sql).list();
                      for (int i=0;i<levels.size();i++) {
                         Object[] level = (Object[]) levels.get(i);
                         String levId = ((Integer)level[0]).toString();
                         String levname = (String)level[1];
                         sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and LevelID=" + levId + " and StudentID=" + studentID;
                         List mark = dbsession.createSQLQuery(sql).list();
                    %>
                        <tr>
                          <td width="30%" align="center">
                          <% if (mark != null && mark.size()>0) { %>
                            <input type="checkbox" name="e<%=k%>_l<%=i%>" id="e<%=k%>_l<%=i%>" checked value="cid=<%=cid%>&iid=<%=itemId%>&lid=<%=levId%>&tid=<%=tid%>" onclick="checkInput('e<%=k%>','<%=i%>','<%=levlen%>')"/>
                          <% } else {%>
                            <input type="checkbox" name="e<%=k%>_l<%=i%>" id="e<%=k%>_l<%=i%>" value="cid=<%=cid%>&iid=<%=itemId%>&lid=<%=levId%>&tid=<%=tid%>" onclick="checkInput('e<%=k%>','<%=i%>','<%=levlen%>')"/>
                          <% } %>
                          </td>
                          <td width="70%" align="left"><%=levname%></td>
                        </tr>
                      <% } %>
                    </table>
                  </td>
                  <% if (isadvice == 1) { 
                        String suggest = "";
                        sql = "select AdviceID,Advice from Advice where ClassID=" + classID + " and CourseID=" + cid + " and StudentID=" + studentID;
                        List advices = dbsession.createSQLQuery(sql).list();
                        if (advices != null && advices.size() > 0) {
                           Object[] advice = (Object[])advices.get(0);
                           suggest = (String)advice[1];
                        } %>
                  <td width="50%" bgcolor="#FFFFFF">
                  <textarea name="c<%=cid%>_suggest" cols="" rows=""><%=suggest%></textarea>
                  </td>
                 <% } %>
                </tr>
              <% } %>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p align="right" class="STYLE1">��ϸ�л���Ĳ�����֧�֣�</p>
<div align="center">
<% if (!now.after(endDate.getTime())) {%>
<input type="submit" id="save" value="�ύ������" style="color:#FF0000 ">
<% } %>
<input type="button" id="back" value="����" onclick="window.parent.location.href='zlpg.jsp?openState=<%=openState%>'"></div>
</form>
</body>
<script language="javascript">
<% if (now.after(endDate.getTime())) {%>
var checkboxes = document.getElementsByTagName("INPUT");

for (var i=0;i<checkboxes.length;i++) {
    var obj = checkboxes[i];
    
    if (obj.type == "checkbox") obj.disabled=true;
}
<% } %>
</script>