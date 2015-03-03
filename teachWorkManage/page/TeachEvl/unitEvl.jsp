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
  int evlID=0,isadvice = 0;
  String title="",explain="",remarks="",deadline="",unitName="",unitdpmt="",unittime="";
  java.util.Date now = new java.util.Date();
  Calendar endDate = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
  
  String classID = request.getParameter("classID");
  String studentID = request.getParameter("studentID");
  String unitID = request.getParameter("unitID");
  String end = request.getParameter("end");
  endDate.setTime(sdf.parse(end));
  
  //�������ݿ�
  try{
    dbsession = HibernateSessionFactory.currentSession();
	}catch (Exception e) {
		e.printStackTrace();
	}
  Connection conn = dbsession.connection();
  Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

  //��ȡ��Ԫ��Ϣ
  String sql = "select a.*,IsNull(b.orgName,'') orgName from TeachingPlanUnit a left join EOSORG_T_Organization b on b.orgID=a.Department where a.UnitID=" + unitID;
  ResultSet units = stmt.executeQuery(sql);
  while (units!=null && units.next()) {
     unitName = units.getString("unitName") + " " + units.getString("unitTitle");
     unitdpmt = units.getString("orgName");
     unittime = sdf.format(units.getDate("BeginTime")) + " �� " + sdf.format(units.getDate("EndTime"));
  }
  
  //��ȡ��������Ϣ
  sql = "select top 1 * from Evaluation where ClassType='1' and Period='��Ԫ' order by version desc";
  ResultSet Evaluation = stmt.executeQuery(sql);
  while (Evaluation!=null && Evaluation.next()) {
     evlID = Evaluation.getInt("EvaluationID");
     isadvice = Evaluation.getInt("IsNeedAdvice");
     title = Evaluation.getString("title");
     explain = Evaluation.getString("explain");
     remarks = Evaluation.getString("remarks");
  }

  //��ȡȫģʽ������Ŀ
  sql = "select EvaluationID,ItemID,OrderNO,IsNull(CourseType,'') CourseType,"
      + "IsNull(CourseType,'ȫ��') as Course,Title,"
      + "(select count(1) from EvaluateItemScore b where b.ItemID=a.ItemID) as levlen "
      + "from EvaluateItems a where EvaluationID = " + evlID + " and CourseType IS Null";
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
<FORM id="addWeekEvlForm" method="post" action="unitEvl_do.jsp">
<input type="hidden" name="evaluationID" value="<%=evlID%>"/>
<input type="hidden" name="classID" value="<%=classID%>"/>
<input type="hidden" name="studentID" value="<%=studentID%>"/>
<input type="hidden" name="unitID" value="<%=unitID%>"/>
  <table width="100%"  border="0" align="center" cellpadding="4" cellspacing="4">
    <tr>
      <td height="20" align="center">
        <SPAN class="STYLE4" id="titleText"><%=title%></SPAN><BR><BR>
	    <div align="left" class="STYLE5"><b>��λѧԱ��</b><br>&nbsp;&nbsp;&nbsp;&nbsp;<%=remarks%></div>
      </td>
    </tr>
    <tr>
      <td height="20" align="left">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;��Ԫ���ƣ�<%=unitName%></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;�����ţ�<%=unitdpmt%></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;����Ԫ��ѧʱ�䣺<%=unittime%></p>
      </td>
    </tr>
    <tr>
      <td class="text" valign="top">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td><table id="allCourse" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="30%" bgcolor="#FFFFFF">&nbsp;&nbsp;���۵ȴ�("A"Ϊ�ã�"D"Ϊ��)<br/>��<br/>��<br/>��
                <%
                  for (int i=0;i<levels.size();i++) {
                     String levname = (String)levels.get(i);
                %>
              <td width="9%" align="center" bgcolor="#FFFFFF">
              <table width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                  <tr valign="middle">
                    <td align="center"><%=formatLevText(levname)%></td>
                  </tr>
              </table></td>
              <%}
                if (isadvice == 1) {%>
              <td width="30%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
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
              <td width="30%" height="45" align="center" bgcolor="#FFFFFF">
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
                     sql = "select * from AssignMark where ClassID=" + classID + " and CourseID=" + unitID + " and EvaluationID=" + evlID + " and ItemID=" + itemId + " and LevelID=" + levId + " and StudentID=" + studentID;
                     List mark = dbsession.createSQLQuery(sql).list();
              %>
              <td width="9%" align="center" bgcolor="#FFFFFF">
              <% if (mark != null && mark.size()>0) { %>
                 <input type="checkbox" name="i<%=i%>_l<%=j%>" id="i<%=i%>_l<%=j%>" checked value="iid=<%=itemId%>&lid=<%=levId%>" onclick="checkInput('i<%=i%>','<%=j%>','<%=levlen%>')"/>
              <% } else { %>
                 <input type="checkbox" name="i<%=i%>_l<%=j%>" id="i<%=i%>_l<%=j%>" value="iid=<%=itemId%>&lid=<%=levId%>" onclick="checkInput('i<%=i%>','<%=j%>','<%=levlen%>')"/>
              <% } %>
              </td>
              <%}
                if (isadvice == 1) {
                   String suggest = "";
                   sql = "select AdviceID,Advice from Advice where TargetType=2 and ClassID=" + classID + " and CourseID=" + unitID + " and itemID=" + itemId + " and StudentID=" + studentID;
                   List advices = dbsession.createSQLQuery(sql).list();
                   if (advices != null && advices.size() > 0) {
                      Object[] advice = (Object[])advices.get(0);
                      suggest = (String)advice[1];
                   }
              %>
              <td width="30%" align="center" bgcolor="#FFFFFF">
                <textarea name="item<%=itemId%>_suggest" cols="30" rows="5"><%=suggest%></textarea>
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
<% if (!now.after(endDate.getTime())) {%>
<input type="submit" id="save" value="����������">
<% } %>
<input type="button" id="back" value="����" onclick="window.location.href='zlpg.jsp'">
</div>
</form>
</body>
