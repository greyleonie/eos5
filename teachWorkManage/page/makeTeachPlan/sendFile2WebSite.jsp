<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="talent.core.*"%>
<% 
  String webSiteConfig=SendPage2NetWork.readWebSiteInfo();  //��ȡ��վ������Ϣ
  String source=(String)request.getParameter("fileSource");//����ҳ����ַ�
   System.out.println("=============source:"+source);
  String fileName=(String)request.getParameter("title");  //��ѧ�ƻ�
  boolean sendResult=SendPage2NetWork.uploadFile(fileName); //�ϴ�����վ������

%>