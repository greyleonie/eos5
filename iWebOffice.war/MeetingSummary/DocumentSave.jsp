<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.io.*,java.text.*,java.util.*,java.sql.*,DBstep.iDBManager2000.*" %>
<%
  String mRecordID=request.getParameter("RecordID");
  if (mRecordID==null) mRecordID="";
  String mTemplate=new String(request.getParameter("Template").getBytes("8859_1"));
  String mSubject=new String(request.getParameter("Subject").getBytes("8859_1"));
  String mAuthor=new String(request.getParameter("Author").getBytes("8859_1"));
  String mFileDate=new String(request.getParameter("FileDate").getBytes("8859_1"));
  String mFileType=new String(request.getParameter("FileType").getBytes("8859_1"));
  String mEditType=new String(request.getParameter("EditType").getBytes("8859_1"));
  String mShowType=new String(request.getParameter("ShowType").getBytes("8859_1"));
  String mHTMLPath=new String(request.getParameter("HTMLPath").getBytes("8859_1"));
  String mReadonly=new String(request.getParameter("Readonly").getBytes("8859_1"));
  String mStatus="READ";
  String mDeal="";
  String mStat="";
  String mDocumentID="";

DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
if (DbaObj.OpenConnection())
{
  String mysql="SELECT RecordID from  Document Where RecordID='" + mRecordID + "'";
  try
  {
    ResultSet result=DbaObj.ExecuteQuery(mysql) ;
    if (result.next())
    {
      mysql="update Document set RecordID=?,Template=?,Subject=?,Author=?,FileDate=?,FileType=?,HtmlPath=?,Status=? where RecordID='"+mRecordID+"'";
    }
    else
    {
      mysql="insert into Document (RecordID,Template,Subject,Author,FileDate,FileType,HtmlPath,Status) values (?,?,?,?,?,?,?,?)";
	  mDeal="INSERT";
    }
    result.close();
  }
  catch(Exception e)
  {
      System.out.println(e.toString());
  }
  java.sql.PreparedStatement prestmt=null;
  try
  {
      prestmt=DbaObj.Conn.prepareStatement(mysql);
      prestmt.setString(1,mRecordID);
      prestmt.setString(2,mTemplate);
      prestmt.setString(3,mSubject);
      prestmt.setString(4,mAuthor);
      prestmt.setString(5,mFileDate);
      prestmt.setString(6,mFileType);
      prestmt.setString(7,mHTMLPath);
      prestmt.setString(8,"READ");

      DbaObj.Conn.setAutoCommit(true) ;
      prestmt.executeUpdate();
      DbaObj.Conn.commit();
	  mStat="SAVEOK";
  }
  catch(Exception e)
  {
	  
      System.out.println(e.toString());
	  mStat="SAVEFAIL";
  }
  finally
  {
      prestmt.close();
  }
  DbaObj.CloseConnection() ;
}
else
{
  out.println("OpenDatabase Error") ;
}
%>
<%
if (!"true".equals(mReadonly))
response.sendRedirect("DocumentEdit.jsp?RecordID="+mRecordID+"&EditType="+mEditType+",1&ShowType="+mShowType+"&UserName="+mAuthor+"&STAT="+mStat);
else
response.sendRedirect("DocumentEdit.jsp?RecordID="+mRecordID+"&EditType=0,0&ShowType=0&UserName="+mAuthor+"&STAT="+mStat);
%>