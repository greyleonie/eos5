<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ taglib uri="/WEB-INF/hci-display.tld" prefix="display" %>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%
//图片路径
String imgPath="/internet/images/";
String logoImg 			= imgPath + "Copyrigh.GIF";
String logOffImg 		= imgPath + "zhuxiao.gif";
String childImg 		= imgPath + "child.gif";
String parentCloseImg 	= imgPath + "parentClose.gif";
String parentOpenImg 	= imgPath + "parentOpen.gif";
String titleImg 		= imgPath + "kuai.gif";
String divideImg 		= imgPath + "left_line.gif";
String currImgSrc 		= imgPath + "current.gif";
//禁止 浏览器或代理服务器 cache 页面
//response.setHeader("Pragma", "no-cache");
//response.setHeader("Cache-Control", "no-cache");
//response.setDateHeader("Expires", 0);

%>
<script language="javaScript" src="/internet/scripts/autoInputCheck.js"></script>
<script language='javascript' src='/internet/scripts/progress.js' type='text/javascript'> </script>
<script language='javascript' src='/internet/scripts/sortTable.js' type='text/javascript'> </script>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<link rel="stylesheet" href="/internet/tagsample/css/HCIStyle.css" type="text/css">
<eos:css/>
