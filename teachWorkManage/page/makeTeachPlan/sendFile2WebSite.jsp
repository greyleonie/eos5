<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="talent.core.*"%>
<% 
  String webSiteConfig=SendPage2NetWork.readWebSiteInfo();  //读取网站配置信息
  String source=(String)request.getParameter("fileSource");//生成页面的字符
   System.out.println("=============source:"+source);
  String fileName=(String)request.getParameter("title");  //教学计划
  boolean sendResult=SendPage2NetWork.uploadFile(fileName); //上传到网站服务器

%>