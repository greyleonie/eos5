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
CreatePdfFile.createDir(request,"gd");//�����鵵���Ŀ¼
CreatePdfFile.createDir(request,"gd\\send");//�������ĵ�Ŀ¼
CreatePdfFile.createFile(request,"gd\\send\\records.txt");//��������records.txt

HashMap hm=CreatePdfFile.createDirName(request,"gd\\send","h",year);//��ȡĿ¼����pdf�ļ���
String floderName=(String)hm.get("floderName");
String record=CreatePdfFile.querySendArchive(request,floderName,archiveId);//��ѯһ����¼����װ����
CreatePdfFile.apendRecord(request,"gd\\send\\records.txt",record);//��records.txt׷�Ӽ�¼
ArrayList wfList=CreatePdfFile.getReceiveArchiveData(pageContext,"","list[@type='wfdata']");//ȡ�����̵�����
CreatePdfFile.createPdfFile(request,"gd\\send\\"+floderName,(String)hm.get("fileName")+".pdf",wfList,"h");// ����pdf�ļ�


CreatePdfFile.handleMainContent(request,floderName,RecordID);//��������������
//ArrayList list=null;
//list=CreatePdfFile.queryReceiveArchiveAttachment(archiveId);//��ѯ���ĵĸ�����¼
//CreatePdfFile.copyFile(request,"gd\\send\\"+floderName,list);//�Ѹ�������������Ŀ¼
CreatePdfFile.shareFile(request,"gd\\send\\"+floderName,floderName,userId,EmpowerIDs,"���ĳ�����");//�ѹ鵵��������ĵ������������ļ���
CreatePdfFile.updateRecord("SendArchive","sendID",archiveId);//����Ϊ�Ѿ��鵵

%>
<form name="form1" method="post">
  
</form>
<script>
 alert("�鵵�ɹ���");
 document.forms[0].action="oa.prWatch.sendArchiveList.do?menuID=DX_OASYS_WATCH_SENDARCHIVE";
 document.forms[0].submit();
</script>