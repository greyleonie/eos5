<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.sql.*,DBstep.iDBManager2000.*" %>
<html>
<head>
<title>ģ�����</title>
<link rel='stylesheet' type='text/css' href='../INDEX.css'>
<script language="javascript">
function ConfirmDel(FileUrl){
	if (confirm('�Ƿ�ȷ��ɾ����ģ�壡')){
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
            <td class="text_wirte">�칫ϵͳ��&gt;���Ĺ���&gt;ģ�����</td>
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
		  <input type=button name="AddDocTemplate" class="button_03" value="�½�WORDģ��"  onclick="javascript:location.href='TemplateEdit.jsp?FileType=.doc';">
		  <input type=button name="AddXslTemplate" class="button_03" value="�½�EXCELģ��" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.xls';">
		  <!--<input type=button name="AddXslTemplate" value="�½�wpsģ��" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.wps';">
		  <input type=button name="AddDocTemplate" value="�½���ɽ���ģ��"  onclick="javascript:location.href='TemplateEdit.jsp?FileType=.et';">-->
		  <input type=button name="AddXslTemplate" class="button_03" value="�½�PPTģ��" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.ppt';">
		  <!--<input type=button name="AddXslTemplate" value="�½�visioģ��" onclick="javascript:location.href='TemplateEdit.jsp?FileType=.vsd';">-->
		  <!--<input type=button name="Return" class="button_02" value="�� ��"  onclick="javascript:location.href='../DocumentList.jsp';">-->
		</td>
	  </tr>
	  <tr>
        <td height="8"> </td>
      </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
	<tr class="td_title">
		<td width="20%" nowrap align=center height="26">���</td>
		<td width="20%" nowrap align=center>ģ������</td>
		<td width="20%" nowrap align=center>ģ������</td>
		<td width="20%" nowrap align=center>ģ��˵��</td>
		<td width="20%" colspan="2" nowrap align=center>����</td>
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
		<td class="text" align="center" width=50><a href="TemplateEdit.jsp?RecordID=<%=mRecordID%>&FileType=<%=mFileType%>">�޸�</a>
		</td>
		<td class="text" align="center" width=50><a href="javascript:ConfirmDel('TemplateDel.jsp?RecordID=<%=mRecordID%>');">ɾ��</a></td>
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
