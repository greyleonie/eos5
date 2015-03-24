<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>
<%@page import="com.talent.common.TalentFunction"%>
<%@page import="org.hibernate.*,com.talent.common.HibernateSessionFactory"%>

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
             name_tmp = name_tmp + itemName.substring(i,i+1) + "";
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
  int evlID=0,isadvice=0,fs=0,fis=0,hs=0,his=0;
  String title="",explain="",remarks="",className="",deadline="",openState="";
  Session dbsession = null;
  java.util.Date now = new java.util.Date(),endTime = null,closeTime = null;
  Calendar endDate = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  
  openState = request.getParameter("openState");
  String classID = request.getParameter("classID");
  String studentID = request.getParameter("studentID");
  String week = TalentFunction.getNumForCn(new Integer(request.getParameter("week")).intValue());
  String begin = request.getParameter("begin").replace('.','-');
  String end = request.getParameter("end").replace('.','-');
  String formto = TalentFunction.DateForCN(begin)+ "至" + TalentFunction.DateForCN(end);
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

  //读取辅导课信息
  sql = "select a.CourseID,a.ClassID,a.CourseTitle,a.ClassDate,a.ClassTime,ISNULL(a.Teachers,'') TeacherId,"
      + "case when a.Teachers is null then a.Outsider else "
      + "(select ISNULL(operatorName,'') from EOSOperator where operatorID=convert(decimal(9),a.Teachers)) end as TeacherName,"
      + "case when datepart(hh,a.ClassTime)<10 then "
      + "(select count(1) from StudentlaterLogs b where b.studentid="+studentID+" and datediff(dd,b.checkTime,a.ClassDate)=0 and (b.state=0 or b.state=1) and b.wubie=0) "
      + "when datepart(hh,a.ClassTime)>10 and datepart(hh,a.ClassTime)<16 then "
      + "(select count(1) from StudentlaterLogs b where studentid="+studentID+" and datediff(dd,b.checkTime,a.ClassDate)=0 and (b.state=0 or b.state=1) and b.wubie=1) "
      + "when datepart(hh,a.ClassTime)>=18 and datepart(hh,a.ClassTime)<=20 then "
      + "(select count(1) from StudentlaterLogs b where studentid="+studentID+" and datediff(dd,b.checkTime,a.ClassDate)=0 and (b.state=0 or b.state=1) and b.wubie=2) "
      + "end kaoqin "
      + "from Course a where a.IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.ClassID=" + classID + " and a.TeahchingModelID in "
      + "(select EducatingModeID from EducatingMode where modeType='辅导') "
      + "and (a.ClassDate between '"+ begin +"' and '" + end + "') order by ClassDate";
  List courses = dbsession.createSQLQuery(sql).list();
  fs = courses.size();
  System.out.println("================courses' size :" + courses.size()+ "====================");
  
  sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType='辅导' order by OrderNO";
  List items = dbsession.createSQLQuery(sql).list();
  fis = items.size();
  System.out.println("================items' size :" + items.size()+ "====================");
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
  FONT-SIZE: large;
  FONT-FAMILY: "新宋体"
  }

  .STYLE5 {
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
  .style10 {

	font-weight: bold;
}
</STYLE>
<script type="text/javascript">
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
</script>

<Body>
<FORM id="addWeekEvlForm" method="post" action="weekEvl_do.jsp">
<input type="hidden" name="evaluationID" value="<%=evlID%>"/>
<input type="hidden" name="classID" value="<%=classID%>"/>
<input type="hidden" name="studentID" value="<%=studentID%>"/>
<input type="hidden" name="begin" value="<%=begin%>"/>
<input type="hidden" name="end" value="<%=end%>"/>
<table width="830" cellPadding="0" align="center" border="0" cellSpacing="0">
  <TBODY>
    <tr>
      <td height="20" align="center">
        <SPAN class="STYLE3">中共广州市委党校&nbsp;&nbsp;广州行政学院</SPAN><BR>
        <SPAN class="STYLE4" id="titleText"><%=title%></SPAN><br>
        <span class="STYLE5"><b><%=className%></b><font color="red">（第<%=week%>周：<%=formto%>）</font></span><br>
        <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;<font size='2' family='宋体'> <%
        if (explain!=null && !"".equals(explain)) {
           out.print(explain + "<BR>" + remarks);
        } else {
           out.print(remarks);
        }
        %><font color="#ff0000"><br>(注：评价等次“A”为好，“C”为差)(灰色方格不可“√”，未到评估时间)</font>
							</font>
						</div>
      </td>
    </tr>
    <tr>
      <td valign="top" class="text">
        <table width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
          <TBODY>
            <tr>
              <td align="center" width="130" valign="middle" bgColor="#ffffff" class="STYLE6">教师及课题<br>(辅导课)<BR></td>
              <td width="700" valign="middle" align="center" bgColor="#ffffff">
                <table width="700" cellPadding="0" height="100%" border="0" cellSpacing="0" id="tutorship" bgColor="#000000">
                  <TBODY>
                    <tr class="STYLE6">
                      <%
                      int width = 580 / items.size();
                      for (int i=0;i<items.size();i++) {
                      Object[] item = (Object[])items.get(i);
                      String name = (String)item[5];
                      explain = (String)item[6];
                      int itemscore = ((Integer)item[3]).intValue();
                      %>
                        <td width="<%=width %>" align="center" valign="middle" bgColor="#ffffff">
						<table align="center" cellPadding="0" width="100%" height="100%" border="0" cellSpacing="1" bgColor="#000000">
						<tr bgColor="#ffffff"><td width="100%" height="15%" align="center" valign="middle">
						<span  class="style10"><%=formatItemText(name)%></span >
						</td></tr>
            <tr bgColor="#ffffff"><td width="100%" height="85%" align="left" valign="top" class="style2">
						<%
              if (explain.indexOf("；")>0) {
                 String[] explains = explain.split("；");
						     for (int t=0;t<explains.length;t++) {
						          out.println(explains[t] + ";<br>");
						     }
						  }
						  if (explain.indexOf(";")>0) {
                 String[] explains = explain.split(";");
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
                      <td width="120" rowspan="2" align="center" bgColor="#ffffff">具体意见<br><br>和建议</td>
                      <% } %>
                    </tr>
                    <tr>
                      <%
                        for (int j=0;j<items.size();j++) {
                           Object[] item = (Object[])items.get(j);
                           int itemId = ((Integer)item[1]).intValue();
                      %>
                        <td width="<%=width %>" valign="top" align="center" bgColor="#ffffff">
                          <table width="<%=width %>" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
                            <TBODY>
                              <tr class="STYLE9" height="100%">
                              <%
                                sql = "select LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                List levels = dbsession.createSQLQuery(sql).list();
                                  for (int i=0;i<levels.size();i++) {
                                     Object[] level = (Object[]) levels.get(i);
                                     String levname = (String)level[0];
                                     Integer levscore = ((Integer)level[1]);
                                     out.println("<td bgcolor='#ffffff' valign='middle' align='center'>" + formatLevText(levname) + "</td>");
                                   } %>
                              </tr>
                            </TBODY>
                          </table>
                        </td>
                      <% } %>
                    </tr>
                  </TBODY>
                </table>
              </td>
            </tr>
            <%
              for (int k=0;k<courses.size();k++) {
                 Object[] course = (Object[]) courses.get(k);
                 int kaoqin = 0;
                 String cid = "";
                 String tname = "";
                 String ctitle = "";
                 String tid = "";
                 String cdate = "";
                 java.util.Date ctime = new java.util.Date();
                 if (course[6] != null) tname =((String)course[6]).trim();
                 if (course[2] != null) ctitle = ((String)course[2]).trim();
                 if (course[0] != null) cid = ((Integer)course[0]).toString();
                 if (course[5] != null) tid = ((String)course[5]).trim();
                 if (course[3] != null) { cdate = sdf.format(course[3]); ctime = sdf.parse(cdate); }
                 if (course[7] != null) kaoqin = ((Integer)course[7]).intValue();
            %>
            <tr class="STYLE9">
              <td width="130" height="10" bgColor="#ffffff">
              <table cellPadding="0" cellSpacing="0" width="100%" height="100%" border="0">
              <tr><td height="20%" align="center"><font size="3px" color="blue"><b><%=tname%></b></font></td></tr>
              <tr><td height="20%" align="left"><font size="3px" color="red"><%=ctitle%></font></td></tr>
              <tr><td height="20%" align="center"><font size="2px"><%=cdate%></font></td></tr>
              </table>
              </td>
              <td width="700" valign="middle" align="center" bgColor="#ffffff">
                <table cellPadding="0" cellSpacing="1" width="700" height="100%" border="0" bgColor="#000000">
                  <TBODY>
                    <tr class="STYLE9">
                    <%
                      for (int j=0;j<items.size();j++) {
                           Object[] item = (Object[])items.get(j);
                           int itemId = ((Integer)item[1]).intValue();
                           int levLen = ((Integer)item[7]).intValue();
                    %>
                        <td width="<%=width %>px" bgColor="#ffffff">
                          <table width="100%" border="0" cellPadding="0" cellSpacing="0" align="center">
                              <tr class="STYLE9">
                              <%
                                sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                List levels = dbsession.createSQLQuery(sql).list();
                                sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and ItemID=" + itemId + " and StudentID=" + studentID;
                                List itemMark = dbsession.createSQLQuery(sql).list();
                                for (int i=0;i<levels.size();i++) {
                                     Object[] level = (Object[]) levels.get(i);
                                     int levId = ((Integer)level[0]).intValue();
                                     sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and LevelID=" + levId + " and StudentID=" + studentID;
                                     List mark = dbsession.createSQLQuery(sql).list();
                                     if ((kaoqin>0)) {
                                        if (itemMark != null && itemMark.size()>0) {
                                           if (mark != null && mark.size()>0) {
                                              out.println("<td align='center' width='5px'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"') disabled='true' checked></td>");
                                           } else {
                                              out.println("<td align='center' width='5px'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"') disabled='true' sytle='backgroundColor:red'></td>");
                                           } 
                                        } else {
                                           out.println("<td align='center' width='5px'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"') sytle='backgroundColor:red'></td>");
                                        }
                                     } else {
                                        out.println("<td align='center' width='5px'><INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='f"+k+"_i"+j+"_l"+i+"' id='f"+k+"_i"+j+"_l"+i+"' onclick=checkInput('f"+k+"','i"+j+"','"+i+"','"+levLen+"') disabled='true'></td>");
                                     }
                                } %>
                              </tr>
                          </table>
                        </td>
                      <% } 
                         if (isadvice == 1) {
                            String suggest = "";
                            sql = "select * from Advice where TargetType=1 and ClassID=" + classID + " and CourseID=" + cid + " and StudentID=" + studentID;
                            List advices = dbsession.createSQLQuery(sql).list();
                            if (advices != null && advices.size() > 0) {
                               Object[] advice = (Object[])advices.get(0);
                               suggest = (String)advice[7];
                            }
                      %>
                      <td width="120" align="center" bgColor="#ffffff">
                      <textarea name="c<%=cid%>_suggest" cols="13" rows="8"><%=suggest%></textarea>
                      </td>
                     <% } %>
                    </tr>
                  </TBODY>
                </table>
              </td>
            </tr>
           <% }

  //读取互动课信息
  sql = "select CourseID,ClassID,CourseTitle,ClassDate,ClassTime,Compere,"
      + "(select operatorName from EOSOperator where operatorID=convert(decimal(9),a.Compere)) Teacher,"
      + "case when datepart(hh,a.ClassTime)<10 then "
      + "(select count(1) from StudentlaterLogs b where b.studentid="+studentID+" and datediff(dd,b.checkTime,a.ClassDate)=0 and (b.state=0 or b.state=1) and b.wubie=0) "
      + "when datepart(hh,a.ClassTime)>10 and datepart(hh,a.ClassTime)<16 then "
      + "(select count(1) from StudentlaterLogs b where studentid="+studentID+" and datediff(dd,b.checkTime,a.ClassDate)=0 and (b.state=0 or b.state=1) and b.wubie=1) "
      + "when datepart(hh,a.ClassTime)>=18 and datepart(hh,a.ClassTime)<=20 then "
      + "(select count(1) from StudentlaterLogs b where studentid="+studentID+" and datediff(dd,b.checkTime,a.ClassDate)=0 and (b.state=0 or b.state=1) and b.wubie=2) "
      + "end kaoqin "
      + "from Course a where IsAdopted=1 and (a.IsOutClass is null or a.IsOutClass != 1) and a.ClassID=" + classID + " and TeahchingModelID in "
      + "(select EducatingModeID from EducatingMode where modeType='互动') "
      + "and (ClassDate between '"+ begin +"' and '" + end + "') order by ClassDate";
  System.out.println("==================hdsql:" + sql + "================");
  courses = dbsession.createSQLQuery(sql).list();
  hs = courses.size();
  sql = "select EvaluationID,ItemID,OrderNO,Score,CourseType,substring(Title,0,charindex(':',Title,0)) Name,"
      + "substring(Title,charindex(':',Title,0)+1,len(Title)-charindex(':',Title,0)) Explain,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType='互动' order by OrderNO";
  items = dbsession.createSQLQuery(sql).list();
  his = items.size();
           %>
            <tr>
              <td align="center" width="130" valign="middle" class="STYLE6" bgColor="#ffffff">教师及课题<BR>（互动式教学）</td>
              <td width="700" valign="middle" align="center" bgColor="#ffffff">
                <table width="100%" height="100%" border="0" cellPadding="0" cellSpacing="1" bgColor="#000000">
                    <tr class="STYLE6">
                    <%
                      int hwidth = 580 / items.size();
                      for (int i=0;i<items.size();i++) {
                      Object[] item = (Object[])items.get(i);
                      String name = (String)item[5];
                      explain = (String)item[6];
                      int itemscore = ((Integer)item[3]).intValue();
                      %>
                        <td width="<%=hwidth %>" align="center" valign="middle" bgColor="#ffffff">
						<table align="center" cellPadding="0" width="100%" height="100%" border="0" cellSpacing="1" bgColor="#000000">
						<tr bgColor="#ffffff"><td width="100%" height="15%" align="center" valign="middle">
						<span  class="style10"><%=formatItemText(name)%></span>
						</td></tr>
            <tr bgColor="#ffffff"><td width="100%" height="85%" align="left" valign="top" class="style2">
						<%
              if (explain.indexOf("；")>0) {
                 String[] explains = explain.split("；");
						     for (int t=0;t<explains.length;t++) {
						          out.println(explains[t] + ";<br>");
						     }
						  }
						  if (explain.indexOf(";")>0) {
                 String[] explains = explain.split(";");
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
                      <td width="120" rowspan="2" align="center" bgColor="#ffffff">具体意见<br><br>和建议</td>
                     <% } %>
                    </tr>
                    <tr class="STYLE9">
                    <%
                      for (int j=0;j<items.size();j++) {
                           Object[] item = (Object[])items.get(j);
                           String itemId = ((Integer)item[1]).toString();
                           out.println("<td width='"+ hwidth + "' valign='top' align='center' bgcolor='#ffffff'>");
                           out.println("<table width='"+ hwidth + "' height='100%' border='0' cellPadding='0' cellSpacing='1' bgcolor='#000000'>");
                           out.println("<tr height='100%' class='STYLE9'>");
                                sql = "select LevelName,convert(varchar(10),Score) levscore from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                List levels = dbsession.createSQLQuery(sql).list();
                                for (int i=0;i<levels.size();i++) {
                                     Object[] level = (Object[]) levels.get(i);
                                     String levname = (String)level[0];
                                     String levscore = (String)level[1];
                                     System.out.println("<td align='center' bgcolor='#ffffff' valign='middle'>" + formatLevText(levname) + "(" + levscore + ")</td>");
                                     out.println("<td align='center' bgcolor='#ffffff' valign='middle'>" + formatLevText(levname) + "</td>");
                                }
                           out.println("</tr></table></td>"); } %>
                    </tr>
                </table>
              </td>
            </tr>
            <%
              for (int k=0;k<courses.size();k++) {
                 Object[] course = (Object[]) courses.get(k);
                 int kaoqin = 0;
                 String cid = "";
                 String tname = "";
                 String ctitle = "";
                 String tid = "";
                 String cdate = "";
                 java.util.Date ctime = new java.util.Date();
                 if (course[6] != null) tname =((String)course[6]).trim();
                 if (course[2] != null) ctitle = ((String)course[2]).trim();
                 if (course[0] != null) cid = ((Integer)course[0]).toString();
                 if (course[5] != null) tid = ((String)course[5]).trim();
                 if (course[3] != null) { cdate = sdf.format(course[3]); ctime = sdf.parse(cdate); }
                 if (course[7] != null) kaoqin = ((Integer)course[7]).intValue();
            %>
            <tr class="STYLE9">
              <td width="130" bgColor="#ffffff">
              <table cellPadding="0" cellSpacing="0" width="100%" height="100%" border="0">
              <tr><td height="20%" align="center"><font size="3px" color="blue"><b><%=tname%></b></font></td></tr>
              <tr><td height="20%" align="left"><font size="3px" color="red"><%=ctitle%></font></td></tr>
              <tr><td height="20%" align="center"><font size="2px"><%=sdf.format(course[3])%></font></td></tr>
              </table>
              </td>
              <td width="700" valign="middle" align="center" bgColor="#ffffff">
                <table cellPadding="0" cellSpacing="1" width="100%" height="100%" border="0" bgColor="#000000">
                  <TBODY>
                    <tr class="STYLE9">
                    <%
                      for (int j=0;j<items.size();j++) {
                           Object[] item = (Object[])items.get(j);
                           int itemId = ((Integer)item[1]).intValue();
                           int levLen = ((Integer)item[7]).intValue();
                    %>
                        <td align="center" width="<%=hwidth %>" bgColor="#ffffff">
                          <table width="<%=hwidth %>" border="0" cellPadding="0" cellSpacing="1">
                            <TBODY>
                              <tr class="STYLE9">
                              <%
                                sql = "select LevelID,LevelName,Score from EvaluateItemScore where itemID=" + itemId + " order by LevelID,OrderNo";
                                List levels = dbsession.createSQLQuery(sql).list();
                                sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and ItemID=" + itemId + " and StudentID=" + studentID;
                                List itemMark = dbsession.createSQLQuery(sql).list();
                                for (int i=0;i<levels.size();i++) {
                                     Object[] level = (Object[]) levels.get(i);
                                     int levId = ((Integer)level[0]).intValue();
                                     sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + cid + " and EvaluationID=" + evlID + " and LevelID=" + levId + " and StudentID=" + studentID;
                                     List mark = dbsession.createSQLQuery(sql).list();
                                     if ((kaoqin>0)) {
                                        if (itemMark != null && itemMark.size()>0) {
                                           if (mark != null && mark.size()>0) {
                                              out.println("<td width='24%' align='center'>");
                                              out.println("<INPUT type='checkbox' checked value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"') disabled='true'>");
                                              out.println("</td>");
                                           } else {
                                              out.println("<td width='24%' align='center'>");
                                              out.println("<INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"') disabled='true'>");
                                              out.println("</td>");
                                           }
                                        } else {
                                              out.println("<td width='24%' align='center'>");
                                              out.println("<INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"') sytle='backgroundColor:red'>");
                                              out.println("</td>");
                                        } 
                                     } else {
                                        out.println("<td width='24%' align='center'>");
                                        out.println("<INPUT type='checkbox' value='iid="+itemId+"&levid="+levId+"&tid="+tid+"' name='h"+k+"_i"+j+"_l"+i+"' id='h"+k+"_i"+j+"_l"+i+"' onclick=checkInput('h"+k+"','i"+j+"','"+i+"','"+levLen+"') disabled='true'>");
                                        out.println("</td>");
                                     }
                                }%>
                              </tr>
                            </TBODY>
                          </table>
                        </td>
                      <%}
                        if (isadvice == 1) {
                           String suggest = "";
                           sql = "select * from Advice where TargetType=1 and ClassID=" + classID + " and CourseID=" + cid  + " and StudentID=" + studentID;
                           List advices = dbsession.createSQLQuery(sql).list();
                           if (advices != null && advices.size() > 0) {
                              Object[] advice = (Object[])advices.get(0);
                              suggest = (String)advice[7];
                           }
                      %>
                        <td align="center" width="120" bgColor="#ffffff">
                        <textarea name="c<%=cid%>_suggest" cols="13" rows="8"><%=suggest%></textarea>
                        </td>
                       <% } %>
                    </tr>
                  </TBODY>
                </table>
              </td>
            </tr>
          <% } %>
          </TBODY>
        </table>
      </td>
    </tr>
  </TBODY>
</table>
<table width="830"><tr><td align="right" height="30" class="STYLE6">教 务 处</td></tr></table>
<div align="center">

<input type="button" id="save" value="提交评估表" style="color:#FF0000 " onclick="submitForm(<%=fs%>,<%=fis%>,<%=hs%>,<%=his%>);">

<input type="button" id="back" value="返回" onclick="window.parent.location.href='zlpg.jsp?openState=<%=openState%>'"></div>
</FORM>
</Body>
<script language="javascript">

var checkboxes = document.getElementsByTagName("INPUT");

for (var i=0;i<checkboxes.length;i++) {
    var obj = checkboxes[i];
    
    if (obj.type == "checkbox") obj.disabled=false;
}


function submitForm(fs,fis,hs,his) {
   //初始化变量
   var tab=1;
   var frm = document.forms[0];
   
   //检查辅导课
   for (var i=0;i<fs;i++) {
      var sign=1;
      for (var j=0;j<fis;j++) {
         var flag=0;
         var k=0;
         var boxid="f"+i+"_i"+j+"_l"+k;
         while (document.getElementById(boxid)!=undefined) {
            if (document.getElementById(boxid).checked || document.getElementById(boxid).disabled) {
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
         break;
      }
   }
   
   //检查互动课
   for (var i=0;i<hs;i++) {
      var sign=1;
      for (var j=0;j<his;j++) {
         var flag=0;
         var k=0;
         var boxid="h"+i+"_i"+j+"_l"+k;
         while (document.getElementById(boxid)!=undefined) {
            if (document.getElementById(boxid).checked || document.getElementById(boxid).disabled) {
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
         break;
      }
   }
   
   if (tab==1) {
      if (confirm("是否确定保存当前评估表？")==false){
			   return false;
      } else {
         frm.submit();
      }
   } else {
      alert("请对每个老师课程的每一项评估填满，谢谢！");
      return false;
   }
}
</script>