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
CreatePdfFile.createDir(request,"gd");//�����鵵���Ŀ¼
CreatePdfFile.createDir(request,"gd\\receive");//�������ĵ�Ŀ¼
CreatePdfFile.createFile(request,"gd\\receive\\records.txt");//��������records.txt

HashMap hm=CreatePdfFile.createDirName(request,"gd\\receive","S",year);//��ȡĿ¼����pdf�ļ���
String floderName=(String)hm.get("floderName");
String record=CreatePdfFile.queryReceiveArchive(request,floderName,archiveId);//��ѯһ����¼����װ����
CreatePdfFile.apendRecord(request,"gd\\receive\\records.txt",record);//��records.txt׷�Ӽ�¼
ArrayList wfList=CreatePdfFile.getReceiveArchiveData(pageContext,"","list[@type='wfdata']");//ȡ�����̵�����
CreatePdfFile.createPdfFile(request,"gd\\receive\\"+floderName,(String)hm.get("fileName")+".pdf",wfList,"s");// ����pdf�ļ�

ArrayList list=null;
list=CreatePdfFile.queryReceiveArchiveAttachment(archiveId);//��ѯ���ĵĸ�����¼
CreatePdfFile.copyFile(request,"gd\\receive\\"+floderName,list);//�Ѹ�������������Ŀ¼
CreatePdfFile.shareFile(request,"gd\\receive\\"+floderName,floderName,userId,EmpowerIDs,"���ĳ�����");//�ѹ鵵��������ĵ������������ļ���
CreatePdfFile.updateRecord("ReceiveArchive","receiveID",archiveId);//����Ϊ�Ѿ��鵵

%>
<form name="form1" method="post">
  
</form>
<script>
 alert("�鵵�ɹ���");
 document.forms[0].action="oa.prWatch.receiveArchiveList.do?menuID=DX_OASYS_WATCH_RECEARCHIVE";
 document.forms[0].submit();
</script>