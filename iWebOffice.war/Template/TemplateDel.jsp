<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.sql.*,DBstep.iDBManager2000.*" %>
<%
String mRecordID=request.getParameter("RecordID");

DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
if (DbaObj.OpenConnection())
{
  java.sql.PreparedStatement prestmt=null;
  String mSql="Delete from Template_File where RecordID = '"+ mRecordID + "'";
  prestmt =DbaObj.Conn.prepareStatement(mSql);
  DbaObj.Conn.setAutoCommit(true) ;
  prestmt.execute();
  DbaObj.Conn.commit();
  prestmt.close();
}
DbaObj.CloseConnection();

response.sendRedirect("TemplateList.jsp");
%>

