<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="com.talent.common.TalentFunction"%>
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
  int evlID=0,isadvice = 0;
  String title="",explain="",remarks="",className="",deadline="",openState="";
  java.util.Date now = new java.util.Date(),endTime = null,closeTime = null;
  Calendar endDate = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    
  openState = request.getParameter("openState");
  String classID = request.getParameter("classID");
  String studentID = request.getParameter("studentID");
  String end = request.getParameter("end");
  endDate.setTime(sdf.parse(end));
  endDate.add(Calendar.DAY_OF_MONTH,5);
  deadline = sdf.format(endDate.getTime());
  
  //连接数据库
  try{
    dbsession = HibernateSessionFactory.currentSession();
	}catch (Exception e) {
		e.printStackTrace();
	}
  Connection conn = dbsession.connection();
  Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  
  //读取班级信息
  String sql = "select ClassName,EndTime from Class where ClassID=" + classID;
  ResultSet Class = stmt.executeQuery(sql);
  while (Class.next()) {
     className = Class.getString("ClassName");
     endTime = Class.getDate("EndTime");//毕业时间
  }
  //计算补救开始时间
  closeTime = TalentFunction.getBeginOfWeek(endTime);
  Calendar endCld = Calendar.getInstance();
  endCld.setTime(closeTime);
  endCld.add(Calendar.DAY_OF_MONTH,-7);
  closeTime = endCld.getTime();
  
  //读取评估表信息
  sql = "select * from Evaluation where evaluationid in (select top 1 evaluationid from AssignMark where classid="+classID+" and evaluationid in (select evaluationid from Evaluation where period='外请课' and classtype='1'))";
  ResultSet Evaluation = stmt.executeQuery(sql);
  while (Evaluation != null && Evaluation.next()) {
         evlID = Evaluation.getInt("EvaluationID");
         isadvice = Evaluation.getInt("IsNeedAdvice");
         title = Evaluation.getString("title");
         explain = Evaluation.getString("explain");
         remarks = Evaluation.getString("remarks");
  }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='外请课' and (Class like '%"+classID+"%' or Class like '%"+classID+",%' or Class like '%,"+classID+",%' or Class like '%,"+classID+"%')";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  } }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='外请课' order by EvaluationID desc";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  } }
  
  //读取该班级外请课
  sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,b.ItemID,"
      + "(select count(1) from EvaluateItemScore where ItemID=b.ItemID) levlen,"
      + "(select EducatingMode from EducatingMode where EducatingModeID=a.TeahchingModelID) Course,"
      + "IsNull(Teachers,'') TeacherID,"
      + "case when a.Teachers is null then a.Outsider else "
      + "(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) end as Teacher "
      + "from Course a inner join (select ItemID,convert(int,CourseType) coursetype from EvaluateItems where EvaluationID=" + evlID
      + " and CourseType IS NOT NULL) b on a.TeahchingModelID=b.coursetype where a.IsAdopted=1 and a.ClassID=" + classID
      + "  and (a.Outsider IS NOT NULL and a.Outsider <> '') order by ClassDate";
  List courses = dbsession.createSQLQuery(sql).list();
%>
<style type="text/css">
  <!--
    .STYLE1 {
    font-family: "华文新魏";
    font-size: 16px;
    }
    .style2 {font-family: "宋体"}
    .STYLE3 {
    font-family: "新宋体";
    font-size: 18px;
    font-weight: bold;
    }
    .STYLE4 {
    font-family: "新宋体";
    font-size: x-large;
    font-weight: bold;
    }
    .STYLE5 {
    font-family: "新宋体";
    font-size: 16px;
    }
    .STYLE6 {
    font-family: "新宋体";
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
<FORM id="addWeekEvlForm" method="post" action="extraEvl_do.jsp">
<input type="hidden" name="evaluationID" value="<%=evlID%>"/>
<input type="hidden" name="classID" value="<%=classID%>"/>
<input type="hidden" name="studentID" value="<%=studentID%>"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td height="20" align="center">
      <span class="STYLE3">广州市委党校&nbsp;&nbsp;广州行政学院</span><br>
      <SPAN class="STYLE4" id="titleText"><%=title%></SPAN>
      <BR><span class="STYLE5">（<%=className%>）</span><BR>
      <div align="left" class="STYLE5">&nbsp;&nbsp;&nbsp;&nbsp;<%=remarks%> <font color="#ff0000">(注：灰色方格不可“√”，未到评估时间)</font></div>
     
    </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
        <tr>
          <td width="30%" align="center" bgcolor="#FFFFFF">专题（主讲人）</td>
          <td width="20%" align="center" bgcolor="#FFFFFF">评教类别</td>
        <%if (isadvice == 1) {        %>
          <td width="50%" align="center" bgcolor="#FFFFFF">意 见 和 建 议</td>
        <%}        %>
        </tr>
      <%
        for (int k=0;k<courses.size();k++) {
                 Object[] course = (Object[]) courses.get(k);
                 String cid = "";
                 String ctitle = "";
                 String itemId = "";
                 String levlen = "";
                 String coursetype = "";
                 String tid = "";
                 String tname = "";
                 String cdate = "";
                 java.util.Date ctime = new java.util.Date();
                 
                 if (course[0] != null) cid = ((Integer)course[0]).toString();
                 if (course[2] != null) ctitle = ((String)course[2]).trim();
                 if (course[3] != null) { cdate = sdf.format(course[3]); ctime = sdf.parse(cdate); }
                 if (course[5] != null) itemId = ((Integer)course[5]).toString();
                 if (course[6] != null) levlen = ((Integer)course[6]).toString();
                 if (course[7] != null) coursetype = (String)course[7];
                 if (course[8] != null) tid = (String)course[8];
                 if (course[9] != null) tname = (String)course[9];
      %>
        <tr>
          <td width="30%" bgcolor="#FFFFFF"><%=coursetype%>：<br/><%=sdf.format(course[3])%><BR><%=ctitle%><br/>
          <%if (tname != null) { %>
          <div align="right">（<%=tname%>）</div>
          <%} %>
          </td>
          <td width="20%" align="center" bgcolor="#FFFFFF">
            <table width="90%" border="0" cellspacing="3" cellpadding="0">
            <%
              sql = "select LevelID,LevelName from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
              List levels = dbsession.createSQLQuery(sql).list();
              for (int i=0;i<levels.size();i++) {
                 Object[] level = (Object[]) levels.get(i);
                 String levId = ((Integer)level[0]).toString();
                 String levname = (String)level[1];
                 sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and LevelID=" + levId + " and StudentID=" + studentID;
                 List mark = dbsession.createSQLQuery(sql).list();
            %>
              <tr>
                <td width="30%" align="center">
                <%
                  if ((ctime.before(now) && !cdate.equals(sdf.format(now))) || (now.after(closeTime) && now.before(endTime))) {
                  if (mark != null && mark.size()>0) { 
                %>
                  <input type="checkbox" name="c<%=k%>_l<%=i%>" id="i<%=k%>_l<%=i%>" checked value="cid=<%=cid%>&iid=<%=itemId%>&lid=<%=levId%>&tid=<%=tid%>" onclick="checkInput('c<%=k%>','<%=i%>','<%=levlen%>')"/>
                <% } else {%>
                  <input type="checkbox" name="c<%=k%>_l<%=i%>" id="i<%=k%>_l<%=i%>" value="cid=<%=cid%>&iid=<%=itemId%>&lid=<%=levId%>&tid=<%=tid%>" onclick="checkInput('c<%=k%>','<%=i%>','<%=levlen%>')"/>
                <% }  } else { %>
                 <input type="checkbox" name="c<%=k%>_l<%=i%>" id="i<%=k%>_l<%=i%>" value="cid=<%=cid%>&iid=<%=itemId%>&lid=<%=levId%>&tid=<%=tid%>" onclick="checkInput('c<%=k%>','<%=i%>','<%=levlen%>')"  disabled="true"/>
                 <% } %>
                </td>
                <td width="70%" align="left"><%=levname%></td>
              </tr>
            <%
              }
            %>
            </table>
          </td>
        <%if (isadvice == 1) {
             String suggest = "";
             sql = "select AdviceID,Advice from Advice where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and StudentID=" + studentID;
             List advices = dbsession.createSQLQuery(sql).list();
             if (advices != null && advices.size() > 0) {
                Object[] advice = (Object[])advices.get(0);
                suggest = (String)advice[1];
             }
        %>
          <td width="50%" bgcolor="#FFFFFF">
             <textarea name="c<%=cid%>_suggest" cols="54" rows="5"><%=suggest%></textarea>
          </td>
        <%}%>
        </tr>
      <%
        }
      %>
      </table>
    </td>
  </tr>
</table>
</td></tr></table>
<P class="STYLE6" align="right">教 务 处</P>
<div align="center">
<% if (!now.after(endDate.getTime()) || (now.after(closeTime) && now.before(endTime))) {%>
<input type="submit" id="save" value="提交评估表" style="color:#FF0000 ">
<% } %>
<input type="button" id="back" value="返回" onclick="window.parent.location.href='zlpg.jsp?openState=<%=openState%>'"></div>
</form>
</body>
<script language="javascript">
<% if (now.after(endDate.getTime()) && now.before(closeTime)) {%>
var checkboxes = document.getElementsByTagName("INPUT");

for (var i=0;i<checkboxes.length;i++) {
    var obj = checkboxes[i];
    
    if (obj.type == "checkbox") obj.disabled=true;
}
<% } %>
</script>
