<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.text.DateFormat,java.util.Date,DBstep.iDBManager2000.*" %>
<%!
DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();

//列出所有模版
public String GetTemplateList(String ObjType, String FileType)
  {
    String mTemplateList,mstr="";
    mTemplateList = "<select name=" + ObjType + " >";
    mTemplateList = mTemplateList +  "<option value=''>--------不用模版--------</option>";
    String Sql = "select RecordID,Descript from Template_File where FileType='" + FileType + "'"; //打开数据库
    try {
      if (DbaObj.OpenConnection()) {
        try {
          ResultSet result = DbaObj.ExecuteQuery(Sql);
          mstr="selected";
          while (result.next()) {
            mTemplateList = mTemplateList + "<option value='" + result.getString("RecordID") + "'"+mstr+">" + result.getString("Descript") + "</option>";
          }
          result.close();
        }
        catch (SQLException sqlex) {
          System.out.println(sqlex.toString());
        }
      }
      else {
        System.out.println("GetTemplateList: OpenDatabase Error");
      }
    }
    finally {
      DbaObj.CloseConnection();
    }
    mTemplateList = mTemplateList + "</select>";
    return (mTemplateList);
  }

  /**
   * 功能或作用：格式化日期时间
   * @param DateValue 输入日期或时间
   * @param DateType 格式化 EEEE是星期, yyyy是年, MM是月, dd是日, HH是小时, mm是分钟,  ss是秒
   * @return 输出字符串
   */
  public String FormatDate(String DateValue,String DateType)
  {
    String Result;
    SimpleDateFormat formatter = new SimpleDateFormat(DateType);
    try{
      Date mDateTime = formatter.parse(DateValue);
      Result = formatter.format(mDateTime);
    }catch(Exception ex){
      Result = ex.getMessage();
    }
    if (Result.equalsIgnoreCase("1900-01-01")){
      Result = "";
    }
    return Result;
  }
%>
<html>
<head>
<title>金格科技-iWebOffice2006全文批注实例</title>
<link rel='stylesheet' type='text/css' href='test.css'>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff">
<div align="center"><font size=4 color=ff0000>全文批注中间件应用示例[iWebOffice2006 OCX版]</font></div>
<hr size=1>
<div class=IptStyle>
  <p>注：演示版能打开和保存网络上的文件。正式版可实现更强大的功能，如要正式版，请与金格科技联系。<br>
  &nbsp;&nbsp;&nbsp;&nbsp;如要正确演示本示例，你必须:<br>
    1.安装Office2000系统和IE5.0以上版本，最好在Window 98以上的计算机上运行。<br>
  2.安装iWebOffice2006插件，请你在打开本页面的弹出窗口时，选择[是]按钮,才能正常运行。<br>
  3.如果不能正常自动安装iWebOffice2006插件，<a href="InstallClient.zip">请你在这里下载本地安装程序</a>。<br>
  </p>
</div>
<hr size=1>
<OBJECT id="WebOffice" width=100% height=24 classid="clsid:8B23EA28-723C-402F-92C4-59BE0E063499" codebase="iWebOffice2006.cab#version=7,5,0,0"></OBJECT>
<hr size=1>
<br>
<table border=0  cellspacing='0' cellpadding='0' width=100% align=center class=TBStyle>
<tr>
  <td colspan=6 class="TDTitleStyle">
     &nbsp;<input type=button name="BookMark" value="标签管理"  onclick="javascript:location.href='BookMark/BookMarkList.jsp'">
     &nbsp;<input type=button name="Template" value="模板管理"  onclick="javascript:location.href='Template/TemplateList.jsp'">
     &nbsp;<input type=button name="Template" value="签章管理"  onclick="javascript:location.href='Signature/SignatureList.jsp'">
  </td>
</tr>

<tr>
  <td colspan=4 class="TDTitleStyle" >
    请选择模版:<%=GetTemplateList("doc",".doc")%>
    <input type=button value="新建word文档  "  onclick="javascript:location.href='DocumentEdit.jsp?FileType=.doc&UserName='+username.value+'&Template='+doc.value;">
    <br>
    请选择模版:<%=GetTemplateList("xls",".xls")%>
    <input type=button value="新建excel文档 "  onclick="javascript:location.href='DocumentEdit.jsp?FileType=.xls&UserName='+username.value+'&Template='+xls.value;">
    <br>
    请选择模版:<%=GetTemplateList("wps",".wps")%>
    <input type=button value="新建wps文档   "  onclick="javascript:location.href='DocumentEdit.jsp?FileType=.wps&UserName='+username.value+'&Template='+wps.value;">
    <br>
    请选择模版:<%=GetTemplateList("et",".et")%>
    <input type=button value="新建金山表格  "  onclick="javascript:location.href='DocumentEdit.jsp?FileType=.et&UserName='+username.value+'&Template='+et.value;">
    <br>
    请选择模版:<%=GetTemplateList("ppt",".ppt")%>
    <input type=button value="新建ppt文档   "  onclick="javascript:location.href='DocumentEdit.jsp?FileType=.ppt&UserName='+username.value+'&Template='+ppt.value;">
    <br>
    请选择模版:<%=GetTemplateList("vsd",".vsd")%>
    <input type=button value="新建visio文档 "  onclick="javascript:location.href='DocumentEdit.jsp?FileType=.vsd&UserName='+username.value+'&Template='+vsd.value;">
  </td>
  <td colspan=2 class="TDTitleStyle">由于不同用户保留痕迹将使用不同的颜色，所以在修改文档时请更改身份<input type=text name=username size=8 value="演示人">
  </td>
</tr>

<tr>
  <td nowrap align=center class="TDTitleStyle" height="25">编号</td>
  <td nowrap align=center class="TDTitleStyle">主题</td>
  <td nowrap align=center class="TDTitleStyle">作者</td>
  <td nowrap align=center class="TDTitleStyle">类型</td>
  <td nowrap align=center class="TDTitleStyle">日期</td>
  <td nowrap align=center class="TDTitleStyle">操作</td>
</tr>
<%
    try {
      if (DbaObj.OpenConnection()) {
        try {
          ResultSet result = DbaObj.ExecuteQuery("select Status,RecordID,HtmlPath,DocumentID,Subject,Author,FileType,FileDate from Document order by DocumentID desc");
          while (result.next()) {
            String RecordID = result.getString("RecordID");
            String HTMLPath = result.getString("HtmlPath");
            if (HTMLPath == null)
               HTMLPath = "";
%>
<tr>
  <td class="TDStyle"><%=result.getString("DocumentID")%>&nbsp;</td>
  <td class="TDStyle"><%=result.getString("Subject")%>&nbsp;</td>
  <td class="TDStyle"><%=result.getString("Author")%>&nbsp;</td>
  <td class="TDStyle"><%=result.getString("FileType")%>&nbsp;</td>
  <td class="TDStyle"><%=FormatDate(result.getString("FileDate"),"yyyy-MM-dd")%>&nbsp;</td>
  <td class="TDStyle" nowrap>
    <input type=button onClick="javascript:location.href='DocumentEdit.jsp?RecordID=<%=RecordID%>&EditType=0,0&ShowType=1&UserName='+username.value;" value="阅读">
    <input type=button onClick="javascript:location.href='DocumentEdit.jsp?RecordID=<%=RecordID%>&EditType=1,1&ShowType=1&UserName='+username.value;" value="修改[无痕迹]">
    <input type=button onClick="javascript:location.href='DocumentEdit.jsp?RecordID=<%=RecordID%>&EditType=2,1&ShowType=1&UserName='+username.value;" value="修改[有痕迹]">
    <input type=button onClick="javascript:location.href='DocumentEdit.jsp?RecordID=<%=RecordID%>&EditType=3,1&ShowType=2&UserName='+username.value;" value="领导手写">
    <input type=button onClick="javascript:location.href='DocumentEdit.jsp?RecordID=<%=RecordID%>&EditType=3,0&ShowType=0&UserName='+username.value;" value="审核">
    <input type=button <% if (HTMLPath.equalsIgnoreCase("")) out.write("disabled"); %> onClick="javascript:window.open('<%=HTMLPath%>');" value="HTML">
  </td>
</tr>
<%
          }
          result.close();
        }
        catch (SQLException sqlex) {
          System.out.println(sqlex.toString());
        }
      }
      else {
        out.println("OpenDatabase Error");
      }
    }
    finally {
      DbaObj.CloseConnection();
    }
%>
</table>
</body>
</html>