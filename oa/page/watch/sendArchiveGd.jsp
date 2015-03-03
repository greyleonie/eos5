<%@ include file="/internet/common.jsp" %>
<%@ page import="tools.util.*,java.util.*"%>
<%
String userId="";
String EmpowerIDs="";

try{
   userId=request.getParameter("userId");  
}catch(Exception e){
  System.out.println("==========errors:"+e);
}

Calendar c=new GregorianCalendar();
String year=String.valueOf(c.get(Calendar.YEAR));
String archiveId=request.getParameter("fid");
String RecordID=request.getParameter("RecordID");
CreatePdfFile.createDir(request,"gd");//创建归档大的目录
CreatePdfFile.createDir(request,"gd\\send");//创建发文的目录
CreatePdfFile.createFile(request,"gd\\send\\records.txt");//创建收文records.txt

HashMap hm=CreatePdfFile.createDirName(request,"gd\\send","h",year);//获取目录名和pdf文件名
String floderName=(String)hm.get("floderName");
String record=CreatePdfFile.querySendArchive(request,floderName,archiveId);//查询一条记录，组装数据
CreatePdfFile.apendRecord(request,"gd\\send\\records.txt",record);//在records.txt追加记录
ArrayList wfList=CreatePdfFile.getReceiveArchiveData(pageContext,"","list[@type='wfdata']");//取出流程的数据
CreatePdfFile.createPdfFile(request,"gd\\send\\"+floderName,(String)hm.get("fileName")+".pdf",wfList,"h");// 生成pdf文件


CreatePdfFile.handleMainContent(request,floderName,RecordID);//处理发文正文内容
//ArrayList list=null;
//list=CreatePdfFile.queryReceiveArchiveAttachment(archiveId);//查询发文的附件记录
//CreatePdfFile.copyFile(request,"gd\\send\\"+floderName,list);//把附件拷贝到备份目录
CreatePdfFile.shareFile(request,"gd\\send\\"+floderName,floderName,userId,EmpowerIDs,"发文呈批表");//把归档后产生的文档拷贝到共享文件夹
CreatePdfFile.updateRecord("SendArchive","sendID",archiveId);//更新为已经归档

%>
<form name="form1" method="post">
  
</form>
<script>
 alert("归档成功！");
 document.forms[0].action="oa.prWatch.sendArchiveList.do?menuID=DX_OASYS_WATCH_SENDARCHIVE";
 document.forms[0].submit();
</script>