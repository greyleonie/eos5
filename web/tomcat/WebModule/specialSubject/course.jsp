<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.talent.common.file.FileManage"%>
<%
 FileManage fm=new FileManage();
 boolean needWrite=true;
 //String fileName="ר���Լ����γ�.htm";
 String fileName=request.getParameter("fileName");
 if(fileName==null)fileName="";
 fm.handleHtmlFile(fileName,needWrite,request,response);
%>