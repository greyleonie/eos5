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
String archiveId=request.getParameter("archiveId");
CreatePdfFile.createDir(request,"gd");//创建归档大的目录
CreatePdfFile.createDir(request,"gd\\receive");//创建收文的目录
CreatePdfFile.createFile(request,"gd\\receive\\records.txt");//创建收文records.txt

HashMap hm=CreatePdfFile.createDirName(request,"gd\\receive","S",year);//获取目录名和pdf文件名
String floderName=(String)hm.get("floderName");
String record=CreatePdfFile.queryReceiveArchive(request,floderName,archiveId);//查询一条记录，组装数据
CreatePdfFile.apendRecord(request,"gd\\receive\\records.txt",record);//在records.txt追加记录
ArrayList wfList=CreatePdfFile.getReceiveArchiveData(pageContext,"","list[@type='wfdata']");//取出流程的数据
CreatePdfFile.createPdfFile(request,"gd\\receive\\"+floderName,(String)hm.get("fileName")+".pdf",wfList,"s");// 生成pdf文件

ArrayList list=null;
list=CreatePdfFile.queryReceiveArchiveAttachment(archiveId);//查询收文的附件记录
CreatePdfFile.copyFile(request,"gd\\receive\\"+floderName,list);//把附件拷贝到备份目录
CreatePdfFile.shareFile(request,"gd\\receive\\"+floderName,floderName,userId,EmpowerIDs,"收文呈批表");//把归档后产生的文档拷贝到共享文件夹
CreatePdfFile.updateRecord("ReceiveArchive","receiveID",archiveId);//更新为已经归档

%>
<form name="form1" method="post">
  
</form>
<script>
 alert("归档成功！");
 document.forms[0].action="oa.prWatch.receiveArchiveList.do?menuID=DX_OASYS_WATCH_RECEARCHIVE";
 document.forms[0].submit();
</script>