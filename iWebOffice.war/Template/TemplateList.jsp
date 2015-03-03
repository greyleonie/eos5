<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.sql.*,DBstep.iDBManager2000.*" %>
<html>
<head>
<title>模板管理</title>
<link rel='stylesheet' type='text/css' href='../INDEX.css'>
<script language="javascript">
function ConfirmDel(FileUrl){
	if (confirm('是否确定删除该模板！')){
		location.href=FileUrl;
	}
}
</script>
</head>
<body bgcolor="#ffffff">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;公文管理—&gt;模板管理</td>
          </tr>
        </table></td>
    </tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
	  	<td class="text">
		  <input type=button name="AddDocTemplate" class="button_03" value="新建WORD模板"  onclick="javascript:location.href='TemplateEdit.jsp?FileType=.doc';">
		  <input type=button name="AddXslTemplate" class="button_03" value="新建EXCEL模板" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.xls';">
		  <!--<input type=button name="AddXslTemplate" value="新建wps模板" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.wps';">
		  <input type=button name="AddDocTemplate" value="新建金山表格模板"  onclick="javascript:location.href='TemplateEdit.jsp?FileType=.et';">-->
		  <input type=button name="AddXslTemplate" class="button_03" value="新建PPT模板" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.ppt';">
		  <!--<input type=button name="AddXslTemplate" value="新建visio模板" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.vsd';">-->
		  <!--<input type=button name="Return" class="button_02" value="返 回"  onclick="javascript:location.href='../DocumentList.jsp';">-->
		</td>
	  </tr>
	  <tr>
        <td height="8"> </td>
      </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
	<tr class="td_title">
		<td width="20%" nowrap align=center height="26">编号</td>
		<td width="20%" nowrap align=center>模板名称</td>
		<td width="20%" nowrap align=center>模板类型</td>
		<td width="20%" nowrap align=center>模板说明</td>
		<td width="20%" colspan="2" nowrap align=center>操作</td>
	</tr>
<%
  DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
  if (DbaObj.OpenConnection())
  {
    try
    {
	  int count=0;
	  String trClass = "result_content";
      ResultSet result=DbaObj.ExecuteQuery("Select RecordID,FileName,FileType,Descript From Template_File order by TemplateID desc") ;
      while ( result.next() )
      {
		if(count%2==0)
		  trClass = "td1";
		else
		  trClass = "td2";
		count++;
        String mRecordID=result.getString("RecordID");
        String mFileName=result.getString("FileName");
        String mFileType=result.getString("FileType");
        String mDescript=result.getString("Descript");
%>
	<tr class="<%=trClass%>">
		<td class="text"><%=mRecordID%>&nbsp;</td>
		<td class="text"><%=mFileName%>&nbsp;</td>
		<td class="text"><%=mFileType%>&nbsp;</td>
		<td class="text"><%=mDescript%>&nbsp;</td>
		<td class="text" align="center" width=50><a href="TemplateEdit.jsp?RecordID=<%=mRecordID%>&FileType=<%=mFileType%>">修改</a>
		</td>
		<td class="text" align="center" width=50><a href="javascript:ConfirmDel('TemplateDel.jsp?RecordID=<%=mRecordID%>');">删除</a></td>
	</tr>
<%
      }
      result.close() ;
    }
    catch(Exception e)
    {
      System.out.println(e.toString());
    }
    DbaObj.CloseConnection() ;
  }
  else
  {
    out.println("OpenDatabase Error") ;
  }
%>
</table>
</body>
</html>
