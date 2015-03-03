<%@include file="/internet/common.jsp"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="base.util.DBconnection"%>
<%@page import="talent.core.TalentFunctions"%>

<%!
private String formatLevText(String levname) {
	   String tmpText = "";
	   for (int i=0;i<levname.length();i++) {
         tmpText += levname.substring(i, i+1) + "<BR>";
     }
     
     return tmpText;
}

private String formatItemText(String itemName) {
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
try {
  int evlID=0,isadvice=0,itemslen=0,fs=0,fis=0,hs=0,his=0;
  String title="",explain="",remarks="",className="",deadline="",studentID="0";
  java.util.Date now = new java.util.Date();
  Calendar endDate = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String classID = request.getParameter("classID");
  String week = TalentFunctions.getNumForCn(new Integer(request.getParameter("week")).intValue());
  String begin = request.getParameter("begin").replace('.','-');
  String end = request.getParameter("end").replace('.','-');
  String formto = TalentFunctions.DateForCN(begin).substring(5) + " 至 " + TalentFunctions.DateForCN(end).substring(5);
  endDate.setTime(sdf.parse(end));
  endDate.add(Calendar.DAY_OF_MONTH,5);
  deadline = sdf.format(endDate.getTime());

  //连接数据库
  DBconnection testdb = new DBconnection();
  Connection conn = testdb.getConnection();
  java.sql.Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  
  //读取班级信息
  String sql = "select ClassName from Class where ClassID=" + classID;
  ResultSet Class = stmt.executeQuery(sql);
  while (Class.next()) {
     className = Class.getString("ClassName");
  }

  //读取评估表信息
  sql = "select * from Evaluation where evaluationid in (select top 1 evaluationid from AssignMark where classid="+classID+" and evaluationid in (select evaluationid from Evaluation where period='每周' and classtype=1))";
  ResultSet Evaluation = stmt.executeQuery(sql);
  while (Evaluation != null && Evaluation.next()) {
         evlID = Evaluation.getInt("EvaluationID");
         isadvice = Evaluation.getInt("IsNeedAdvice");
         title = Evaluation.getString("title");
         explain = Evaluation.getString("explain");
         remarks = Evaluation.getString("remarks");
  }
  if ("".equals(title)) {
     sql = "select top 1 * from Evaluation where ClassType='1' and Period='每周' and (Class like '%"+classID+"%' or Class like '%"+classID+",%' or Class like '%,"+classID+",%' or Class like '%,"+classID+"%')";
     Evaluation = stmt.executeQuery(sql);
     while (Evaluation.next()) {
        evlID = Evaluation.getInt("EvaluationID");
        isadvice = Evaluation.getInt("IsNeedAdvice");
        title = Evaluation.getString("title");
        explain = Evaluation.getString("explain");
        remarks = Evaluation.getString("remarks");
     } 
  }
  if ("".equals(title)) {
     sql = "select top 1 * from Evaluation where ClassType='1' and Period='每周' order by EvaluationID desc";
     Evaluation = stmt.executeQuery(sql);
     while (Evaluation.next()) {
        evlID = Evaluation.getInt("EvaluationID");
        isadvice = Evaluation.getInt("IsNeedAdvice");
        title = Evaluation.getString("title");
        explain = Evaluation.getString("explain");
        remarks = Evaluation.getString("remarks");
     } 
  }
  
  //读取学员ID
  if (request.getParameter("studentID") != null) studentID = request.getParameter("studentID");
  
  sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType='辅导' Order By OrderNO";
  ResultSet items = stmt.executeQuery(sql);
%>
<STYLE type="text/css">
  .style2 {
  FONT-FAMILY: "新宋体";
  FONT-SIZE: 13px;
  }

  .STYLE3 {
  FONT-WEIGHT: bold;
  FONT-SIZE: 18px;
  FONT-FAMILY: "新宋体"
  }

  .STYLE4 {
  FONT-WEIGHT: bold;
  FONT-SIZE: x-large;
  FONT-FAMILY: "新宋体"
  }

  .STYLE5 {
  FONT-WEIGHT: bold;
  FONT-SIZE: 16px;
  FONT-FAMILY: "新宋体"
  }

  .STYLE6 {
  FONT-WEIGHT: bold;
  FONT-SIZE: 14px;
  FONT-FAMILY: "新宋体"
  }

  .STYLE9 {
  FONT-SIZE: 14px
  }

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
</STYLE>
<script type="text/javascript">
var studentIds = '<%=request.getParameter("studentIds")%>';
var message = "以下学员编号 ："+studentIds+"的评估表录入成功！";

if (studentIds!='') {
   message = "以下学员编号 ："+studentIds+"的评估表录入成功！";
} else {
   message = "该班级学员已完全录满，不能再录！";
}

function checkInput(cid,iid,lid,levlen) {
for (var i=0;i<levlen;i++) {
   if (i != lid) {
      var obj = document.getElementById(cid+"_"+iid+"_l"+i);
      if (obj.checked) {
         obj.checked = false;
      }
   }
}
}

<%if ("success".equals(request.getParameter("flag"))) {%>
alert(message);
<%}%>
<%if ("fail".equals(request.getParameter("flag"))) {%>
alert("评估表录入失败，请重新录入！");
<%}%>
</script>

<Body>
<FORM id="addWeekEvlForm" method="post" action="teachWorkManage.prTeachEvaluate.prWeekEvlIssueDo.do">
<input type="hidden" name="evaluationID" value="<%=evlID%>"/>
<input type="hidden" name="classID" value="<%=classID%>"/>
<input type="hidden" name="studentID" value="<%=studentID%>"/>
<input type="hidden" name="begin" value="<%=begin%>"/>
<input type="hidden" name="end" value="<%=end%>"/>
<input type="hidden" name="week" value="<%=request.getParameter("week")%>"/>
<table width="1000" cellPadding="0" align="center" border="0" cellSpacing="0">
  <TBODY>
    <tr>
      <td height="20" align="center">
        <SPAN class="STYLE3">中共广州市委党校&nbsp;&nbsp;广州行政学院</SPAN><BR>
        <SPAN class="STYLE4" id="titleText"><%=title%></SPAN><br>
        <span class="STYLE5"><%=className%>（第<%=week%>周：<%=formto%>）</span><br>
        <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
        <%
        if (explain!=null && !"".equals(explain)) {
           out.print(explain + "<BR>" + remarks);
        } else {
           out.print(remarks);
        }
        %></div>
      </td>
    </tr>
    <tr>
      <td valign="top" class="text">
        <table width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
          <TBODY>
            <tr>
              <td align="center" width="120" valign="middle" bgColor="#ffffff" class="STYLE6">教师及课题<BR>（辅导课）</td>
              <td width="880" valign="middle" align="center" bgColor="#ffffff">
                <table width="880" cellPadding="0" height="100%" border="0" cellSpacing="0" id="tutorship" bgColor="#000000">
                  <TBODY>
                    <tr class="STYLE6">
                      <%
                      if (items != null) {
                            items.last();
                            itemslen = items.getRow();
                            items.beforeFirst();
                         }
                      int width = 680 / itemslen;
                      while (items != null && items.next()) {
                         String name = items.getString("Name");
                         explain = items.getString("Explain");
                      int itemscore = items.getInt("Score");
                      %>
                        <td width="<%=width %>" align="center" valign="middle" bgColor="#ffffff">
						<table align="center" cellPadding="0" width="100%" height="100%" border="0" cellSpacing="1" bgColor="#000000">
						<tr bgColor="#ffffff"><td width="100%" height="15%" align="center" valign="middle">
						<%=formatItemText(name)%>
						</td></tr>
            <tr bgColor="#ffffff"><td width="100%" height="85%" align="left" valign="top" class="style2">
						<%
              if (explain.indexOf("；")>0) {
                   String[] explains = explain.split("；");
						     for (int t=0;t<explains.length;t++) {
						          out.println(explains[t] + ";<br>");
						     }
						  }
						%>
						</td></tr>
						</table>
                        </td>
                      <% }
                         if (isadvice == 1) {
                      %>
                      <td width="200" rowspan="2" align="center" bgColor="#ffffff">具体意见和建议</td>
                      <% } %>
                    </tr>
                    <tr>
                      <%
                        ResultSet items1 = stmt.executeQuery(sql);
                     if (items1 != null) {
                            items1.last();
                            itemslen = items1.getRow();
                            items1.beforeFirst();
                     while (items1.next()) {
                        int itemId = items1.getInt("ItemID");
                      %>
                        <td width="<%=width %>" valign="top" align="center" bgColor="#ffffff">
                          <table width="<%=width %>" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
                            <TBODY>
                              <tr class="STYLE9" height="100%">
                              <%
                                java.sql.Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                sql = "select LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                ResultSet levels = stmt1.executeQuery(sql);
                            while (levels != null & levels.next()) {
                                     String levname = levels.getString("LevelName");
                                     out.println("<td bgcolor='#ffffff' valign='middle' align='center'>" + formatLevText(levname) + "</td>");
                                } %>
                              </tr>
                            </TBODY>
                          </table>
                        </td>
                      <% } }%>
                    </tr>
                  </TBODY>
                </table>
              </td>
            </tr>
            <%  int k=0,j=0,i=0;
            //读取辅导课信息
            sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,ISNULL(a.Teachers,'') TeacherID,"
                + "(select ISNULL(operatorName,'') from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) as TeacherName "
                + "from Course a where a.IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.ClassID=" + classID + " and a.TeahchingModelID in "
                + "(select EducatingModeID from EducatingMode where modeType='辅导') "
                + "and (a.ClassDate between '"+ begin +"' and '" + end + "')";
                java.sql.Statement stmt8 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet courses = stmt8.executeQuery(sql);
              while (courses != null && courses.next()) {
                 String tname = "";
                 String ctitle = "";
               int tid = -2;
               int cid = courses.getInt("CourseID");
               if (courses.getString("CourseTitle") != null) ctitle = courses.getString("CourseTitle").trim();
               if (courses.getString("TeacherName") != null) tname = courses.getString("TeacherName").trim();
               if (courses.getString("TeacherID") != null && !"".equals(courses.getString("TeacherID"))) tid = new Integer(courses.getString("TeacherID")).intValue();
            %>
            <tr class="STYLE9">
              <td width="120" bgColor="#ffffff"><%=sdf.format(courses.getDate("ClassDate"))%><BR><%=tname%> ：<BR><%=ctitle%></td>
              <td width="880" valign="middle" align="center" bgColor="#ffffff">
                <table cellPadding="0" cellSpacing="1" width="880" height="100%" border="0" bgColor="#000000">
                  <TBODY>
                    <tr class="STYLE9">
                    <%
      sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType='辅导'";
                        java.sql.Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet items2 = stmt2.executeQuery(sql);
                     if (items2 != null) {
                            items2.last();
                            itemslen = items2.getRow();
                            items2.beforeFirst();
                        }
                        j=0;
                     while (items2 != null && items2.next()) {
                        int itemId = items2.getInt("ItemID");
                        int levLen = items2.getInt("levlen");
                    %>
                        <td width="<%=width %>" bgColor="#ffffff">
                          <table width="<%=width%>" border="0" cellPadding="0" cellSpacing="1" align="center">
                            <TBODY>
                              <tr class="STYLE9">
                              <%
                                i=0;
                                sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                java.sql.Statement stmt3 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet levels1 = stmt3.executeQuery(sql);
                            while (levels1 != null && levels1.next()) {
                                int levId = levels1.getInt("LevelID");
                                     String levname = levels1.getString("LevelName");
                                     
                                     java.sql.Statement stmt0 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                     sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and LevelID=" + levId + " and StudentID=" + studentID;
                                     ResultSet mark = stmt0.executeQuery(sql);
                                if (mark != null) {
                                        mark.last();
                                   int marksize = mark.getRow();
                                        mark.beforeFirst();
                                   if (marksize > 0) {
                                        out.println("<td align='center'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"') checked></td>");
                                        } else {
                                     if (i == 0 && "0".equals(studentID))
                                              out.println("<td align='center'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"') checked></td>");
                                     else
                                              out.println("<td align='center'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"')></td>");
                                        }
                                     }
                                    mark.close();
                                i++;} %>
                              </tr>
                            </TBODY>
                          </table>
                        </td>
                      <% j++;} 
                         if (isadvice == 1) {
                                String suggest = "";
                                java.sql.Statement fastmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                sql = "select * from Advice where TargetType=1 and ClassID=" + classID + " and CourseID=" + cid + " and StudentID=" + studentID;
                                ResultSet advices = fastmt.executeQuery(sql);
                            while (advices != null && advices.next()) {
                                   suggest = advices.getString("Advice");
                                }
                      %>
                      <td width="200" align="center" bgColor="#ffffff">
                      <textarea name="c<%=cid%>_suggest" cols="23" rows="8"><%=suggest%></textarea>
                      </td>
                     <% } %>
                    </tr>
                  </TBODY>
                </table>
              </td>
            </tr>
           <% k++;}
  fs=k;fis=j;
  sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType='互动' Order By OrderNO";
  ResultSet items3 = stmt.executeQuery(sql);
           %>
            <tr>
              <td align="center" width="120" valign="middle" class="STYLE6" bgColor="#ffffff">教师及课题<BR>（互动式教学）</td>
              <td width="880" valign="middle" align="center" bgColor="#ffffff">
                <table width="100%" height="100%" border="0" cellPadding="0" cellSpacing="1" bgColor="#000000">
                    <tr class="STYLE6">
                    <%
                   if (items3 != null) {
                            items3.last();
                            itemslen = items3.getRow();
                            items3.beforeFirst();
                      }
                   int hwidth = 680 / itemslen;
                      i=0;
                   while (items3 != null && items3.next()) {
                         String name = items3.getString("Name");
                         explain = items3.getString("Explain");
                      int itemscore = items3.getInt("Score");
                      %>
                        <td width="<%=hwidth %>" align="center" valign="middle" bgColor="#ffffff">
						<table align="center" cellPadding="0" width="100%" height="100%" border="0" cellSpacing="1" bgColor="#000000">
						<tr bgColor="#ffffff"><td width="100%" height="15%" align="center" valign="middle">
						<%=formatItemText(name)%>
						</td></tr>
                        <tr bgColor="#ffffff"><td width="100%" height="85%" align="left" valign="top" class="style2">
						<%
                      if (explain.indexOf("；")>0) {
                              String[] explains = explain.split("；");
						     for (int t=0;t<explains.length;t++) {
						          out.println(explains[t] + ";<br>");
						     }
						  }
						%>
						</td></tr>
						<!--<tr><td>
						<%=itemscore%>
						</td></tr>-->
						</table>
                        </td>
                      <% } if (isadvice == 1) { %>
                      <td width="200" rowspan="2" align="center" bgColor="#ffffff">具体意见和建议</td>
                     <% } %>
                    </tr>
                    <tr class="STYLE9">
                    <%
                      ResultSet items4 = stmt.executeQuery(sql);
                     if (items4 != null) {
                            items4.last();
                            itemslen = items4.getRow();
                            items4.beforeFirst();
                        }
                     while (items4 != null && items4.next()) {
                        int itemId = items4.getInt("ItemID");
                           out.println("<td width='"+ hwidth + "' valign='top' align='center' bgcolor='#ffffff'>");
                           out.println("<table width='"+ hwidth + "' height='100%' border='0' cellPadding='0' cellSpacing='1' bgcolor='#000000'>");
                           out.println("<tr height='100%' class='STYLE9'>");
                           
                           java.sql.Statement stmt4 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                           sql = "select LevelName,convert(varchar(10),Score) levscore from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                           ResultSet levels2 = stmt4.executeQuery(sql);
                        while (levels2 != null && levels2.next()) {
                               String levname = levels2.getString("LevelName");
                               out.println("<td align='center' bgcolor='#ffffff' valign='middle'>" + formatLevText(levname) + "</td>");
                           }
                           out.println("</tr></table></td>"); } %>
                    </tr>
                </table>
              </td>
            </tr>
            <%
                k=0;
                //读取互动课信息
                sql = "select CourseID,ClassID,CourseTitle,ClassDate,ClassTime,Compere,"
                + "(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Compere)) TeacherName "
                + "from Course a where IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.ClassID=" + classID + " and TeahchingModelID in "
                + "(select EducatingModeID from EducatingMode where modeType='互动') "
                + "and (ClassDate between '"+ begin +"' and '" + end + "')";
                System.out.println("==================hdsql:" + sql + "================");
                ResultSet courses1 = stmt.executeQuery(sql);
              while (courses1 != null && courses1.next()) {
                   String tname = "";
                   String ctitle = "";
                   String comperes = "";
                 int tid = -2;
                 int cid = courses1.getInt("CourseID");
                 if (courses1.getString("CourseTitle") != null) ctitle = courses1.getString("CourseTitle").trim();
                 if (courses1.getString("Compere") != null) comperes = courses1.getString("Compere").trim();
                 if (courses1.getString("TeacherName") != null) tname = courses1.getString("TeacherName").trim();
                 if (courses1.getString("Compere") != null && !"".equals(courses1.getString("Compere"))) tid = new Integer(courses1.getString("Compere")).intValue();
            %>
            <tr class="STYLE9">
              <td width="120" bgColor="#ffffff"><%=sdf.format(courses1.getDate("ClassDate"))%><BR><%=tname%> ：<BR><%=ctitle%></td>
              <td width="880" valign="middle" align="center" bgColor="#ffffff">
                <table cellPadding="0" cellSpacing="1" width="100%" height="100%" border="0" bgColor="#000000">
                  <TBODY>
                    <tr class="STYLE9">
                    <%
      sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType='互动' Order By OrderNO";
                      java.sql.Statement stmt5 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                      ResultSet items5 = stmt5.executeQuery(sql);
                     if (items5 != null) {
                            items5.last();
                            itemslen = items5.getRow();
                            items5.beforeFirst();
                        }
                        j=0;
                     while (items5 != null && items5.next()) {
                        int itemId = items5.getInt("ItemID");
                        int levLen = items5.getInt("levlen");
                    %>
                        <td align="center" width="<%=hwidth %>" bgColor="#ffffff">
                          <table width="<%=hwidth %>" border="0" cellPadding="0" cellSpacing="1">
                            <TBODY>
                              <tr class="STYLE9">
                              <%
                                i=0;
                                java.sql.Statement stmt6 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                ResultSet levels3 = stmt6.executeQuery(sql);
                            while (levels3 != null && levels3.next()) {
                                int levId = levels3.getInt("LevelID");
                                     String levname = levels3.getString("LevelName");
                                     
                                     java.sql.Statement stmt7 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                     sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and LevelID=" + levId + " and StudentID=" + studentID;
                                     ResultSet mark = stmt7.executeQuery(sql);
                                if (mark != null) {
                                        mark.last();
                                   int marksize = mark.getRow();
                                        mark.beforeFirst();
                                   if (marksize>0) {
                                            out.println("<td width='24%' align='center'>");
                                            out.println("<INPUT type='checkbox' checked value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"')>");
                                            out.println("</td>");
                                        } else {
                                       if (i == 0 && "0".equals(studentID)) {                                    
                                                out.println("<td width='24%' align='center'>");
                                                out.println("<INPUT type='checkbox' checked value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"')>");
                                                out.println("</td>");
                                             } else {
                                                out.println("<td width='24%' align='center'>");
                                                out.println("<INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"')>");
                                                out.println("</td>");
                                             }
                                        }
                                    }
                                i++;}%>
                              </tr>
                            </TBODY>
                          </table>
                        </td>
                      <%j++;}
                        if (isadvice == 1) {
                               String suggest = "";
                               java.sql.Statement hastmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                               sql = "select * from Advice where TargetType=1 and ClassID=" + classID + " and CourseID=" + cid  + " and StudentID=" + studentID;
                               ResultSet advices = hastmt.executeQuery(sql);
                           while (advices != null && advices.next()) {
                                   suggest = advices.getString("Advice");
                               }
                      %>
                        <td align="center" width="200" bgColor="#ffffff">
                        <textarea name="c<%=cid%>_suggest" cols="23" rows="8"><%=suggest%></textarea>
                        </td>
                       <% } %>
                    </tr>
                  </TBODY>
                </table>
              </td>
            </tr>
          <% k++;} 
          hs=k;
          his=j;
          %>
          </TBODY>
        </table>
      </td>
    </tr>
  </TBODY>
</table>
<table width="1000"><tr><td align="right" height="30" class="STYLE6">教 务 处</td></tr></table>
<div align="center">
<%
if (request.getParameter("studentID") == null) {
%>
<font size="2">请输入提交份数：<input type="text" name="times" value="1" size="3">，默认为1份。</font><br>
<%
}
%>
<input type="button" id="save" value="保存评估表" onClick="submitForm(<%=fs%>,<%=fis%>,<%=hs%>,<%=his%>);">
<input type="button" id="back" value="返回" onclick="window.location.href='teachWorkManage.prTeachEvaluate.prTeachEvlIssue.do?ClassID=<%=classID%>&queryaction='"></div>
</FORM>
<script language="javascript">
function submitForm(fs,fis,hs,his) {
   //初始化变量
   var tab=1;
   var frm = document.forms[0];
   var fstring = "";
   var hstring = "";
   
   //检查辅导课
   for (var i=0;i<fs;i++) {
      var sign=1;
      for (var j=0;j<fis;j++) {
         var flag=0;
         var k=0;
         var boxid="f"+i+"_i"+j+"_l"+k;
         while (document.getElementById(boxid)!=undefined) {
            if (document.getElementById(boxid).checked) {
               flag=1;
            }
            k++;
            boxid="f"+i+"_i"+j+"_l"+k;
         }
         if (flag==0) {
            sign=0;
            break;
         }
      }
      if (sign==0) {
         tab=0;
         fstring += i + ",";
         continue;
      }
   }
   fstring = fstring.substring(0,fstring.length-1);
   //alert(fstring);
   
   //检查互动课
   for (var i=0;i<hs;i++) {
      var sign=1;
      for (var j=0;j<his;j++) {
         var flag=0;
         var k=0;
         var boxid="h"+i+"_i"+j+"_l"+k;
         while (document.getElementById(boxid)!=undefined) {
            if (document.getElementById(boxid).checked) {
               flag=1;
            }
            k++;
            boxid="h"+i+"_i"+j+"_l"+k;
         }
         if (flag==0) {
            sign=0;
            break;
         }
      }
      if (sign==0) {
         tab=0;
         hstring += i + ",";
         break;
      }
   }
   hstring = hstring.substring(0,hstring.length-1);
   //alert(hstring);
   
   if (tab==1) {
      if (confirm("是否确定保存当前评估表？")==false){
			   return false;
      } else {
         frm.submit();
      }
   } else {
      if (confirm("评估表中有些课程的评估项还没填满，是否仍然保存当前评估表？")==false){
			   return false;
      } else {
         fs_array = fstring.split(",");
         hs_array = hstring.split(",");
         
         //去掉辅导课已选项目
         for (var i=0;i<fs_array.length;i++) {
            for (var j=0;j<fis;j++) {
               var k=0;
               var boxid="f"+fs_array[i]+"_i"+j+"_l"+k;
               while (document.getElementById(boxid)!=undefined) {
                  if (document.getElementById(boxid).checked) {
                     document.getElementById(boxid).checked=false;
                  }
                  k++;
                  boxid="f"+i+"_i"+j+"_l"+k;
               }
            }
         }
         //去掉互动课已选项目
         for (var i=0;i<hs_array.length;i++) {
            for (var j=0;j<his;j++) {
               var k=0;
               var boxid="h"+hs_array[i]+"_i"+j+"_l"+k;
               while (document.getElementById(boxid)!=undefined) {
                  if (document.getElementById(boxid).checked) {
                     document.getElementById(boxid).checked=false;
                  }
                  k++;
                  boxid="h"+i+"_i"+j+"_l"+k;
               }
            }
         }
         //alert("Submit Form!");
         if (confirm("确定提交此评估表吗？")==true){
            frm.submit();
         }
      }
   }
}
</script>
<% } 
   catch (Exception e) {
       e.printStackTrace();
   }
%>
</Body>