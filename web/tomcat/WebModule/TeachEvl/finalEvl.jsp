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
  String title="",explain="",remarks="",deadline="",className="",openState="";
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
  sql = "select * from Evaluation where evaluationid in (select top 1 evaluationid from AssignMark where classid="+classID+" and evaluationid in (select evaluationid from Evaluation where period='期末' and classtype='1'))";
  ResultSet Evaluation = stmt.executeQuery(sql);
  while (Evaluation != null && Evaluation.next()) {
         evlID = Evaluation.getInt("EvaluationID");
         isadvice = Evaluation.getInt("IsNeedAdvice");
         title = Evaluation.getString("title");
         explain = Evaluation.getString("explain");
         remarks = Evaluation.getString("remarks");
  }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='期末' and (Class like '%"+classID+"%' or Class like '%"+classID+",%' or Class like '%,"+classID+",%' or Class like '%,"+classID+"%')";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  } }
  if ("".equals(title)) {
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='期末' order by EvaluationID desc";
  Evaluation = stmt.executeQuery(sql);
  while (Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  } }

  //读取全模式评估项目
  sql = "select EvaluationID,ItemID,OrderNO,IsNull(CourseType,'') CourseType,"
      + "IsNull(CourseType,'全部') as Course,Title,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType IS Null order by OrderNO";
  List items = dbsession.createSQLQuery(sql).list();

  //读取全模式评估等级
  sql = "select LevelName from EvaluateItemScore where ItemID="
      + "(select top 1 ItemID from EvaluateItems where EvaluationID=" + evlID
      + " order by ItemID) order by LevelID,OrderNo";
  List levels = dbsession.createSQLQuery(sql).list();
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
<FORM id="addWeekEvlForm" method="post" action="finalEvl_do.jsp">
<input type="hidden" name="evaluationID" value="<%=evlID%>"/>
<input type="hidden" name="classID" value="<%=classID%>"/>
<input type="hidden" name="studentID" value="<%=studentID%>"/>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" align="center">
        <SPAN class="STYLE4" id="titleText"><%=title%></SPAN><BR><BR>
	    <div align="left" class="STYLE5">&nbsp;&nbsp;&nbsp;&nbsp;<%=remarks%></div>
      </td>
    </tr>
    <tr>
      <td class="text" valign="top">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td><table id="allCourse" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="18%" bgcolor="#FFFFFF">&nbsp;&nbsp;满意程度<br/>评<br/>价<br/>项
                <%
                  for (int i=0;i<levels.size();i++) {
                     String levname = (String)levels.get(i);
                %>
              <td width="10%" align="center" bgcolor="#FFFFFF">
              <table width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                  <tr valign="middle">
                    <td align="center"><%=formatLevText(levname)%></td>
                  </tr>
              </table></td>
              <%}
                if (isadvice == 1) {%>
              <td width="42%" align="center" bgcolor="#FFFFFF">意 见 与 建 议</td>
              <% } %>
            </tr>
            <%
              for (int i=0;i<items.size();i++) {
                      Object[] item = (Object[])items.get(i);
                      String name = (String)item[5];
                      int itemId = ((Integer)item[1]).intValue();
                      int levlen = ((Integer)item[6]).intValue();
            %>
            <tr>
              <td width="18%" height="45" align="center" bgcolor="#FFFFFF">
              <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="1">
                  <tr>
                    <td width="80%" align="center" valign="middle"><%=formatItemText(name)%>
                    </td>
                  </tr>
              </table></td>
              <%
                sql = "select LevelID from EvaluateItemScore where ItemID=" + itemId + " order by OrderNO";
                levels = dbsession.createSQLQuery(sql).list();
                for (int j=0;j<levels.size();j++) {
                     int levId = ((Integer)levels.get(j)).intValue();
                     sql = "select * from AssignMark where ClassID=" + classID + " and ItemID=" + itemId + " and LevelID=" + levId + " and StudentID=" + studentID;
                     List mark = dbsession.createSQLQuery(sql).list();
              %>
              <td width="10%" align="center" bgcolor="#FFFFFF">
              <% if (mark != null && mark.size()>0) { %>
                 <input type="checkbox" name="i<%=i%>_l<%=j%>" id="i<%=i%>_l<%=j%>" checked value="iid=<%=itemId%>&lid=<%=levId%>" onclick="checkInput('i<%=i%>','<%=j%>','<%=levlen%>')"/>
              <% } else { %>
                 <input type="checkbox" name="i<%=i%>_l<%=j%>" id="i<%=i%>_l<%=j%>" value="iid=<%=itemId%>&lid=<%=levId%>" onclick="checkInput('i<%=i%>','<%=j%>','<%=levlen%>')"/>
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
                <textarea name="item<%=itemId%>_suggest" cols="65" rows="5"><%=suggest%></textarea>
              </td>
              <% } %>
            </tr>
            <% } %>
          </table></td>
		</tr>
      </table></td>
    </tr>
  </table>
<div align="center">
<% if (!now.after(endDate.getTime()) || (now.after(closeTime) && now.before(endTime))) {%>
<input type="submit" id="save" value="提交评估表" style="color:#FF0000 ">
<% } %>
<input type="button" id="back" value="返回"  onclick="window.parent.location.href='zlpg.jsp?openState=<%=openState%>'"></div>
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