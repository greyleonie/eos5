<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/wftag.tld" prefix="wf" %>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="workflow" %>
<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<%
//图片路径
String imgPath="/internet/WFCOMMON/images/";
String logoImg 			= imgPath + "Copyrigh.GIF";
String logOffImg 		= imgPath + "zhuxiao.gif";
String childImg 		= imgPath + "child.gif";
String parentCloseImg 	= imgPath + "parentClose.gif";
String parentOpenImg 	= imgPath + "parentOpen.gif";
String titleImg 		= imgPath + "kuai.gif";
String divideImg 		= imgPath + "left_line.gif";
String currImgSrc 		= imgPath + "current.gif";
//禁止 浏览器或代理服务器 cache 页面
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>

<link rel="stylesheet" href="/internet/WFCOMMON/css/wfdisplay.css" type="text/css">
<script language="javascript" src="/internet/scripts/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/internet/WFCOMMON/scripts/pagination.js"></script>
<script language='javascript' src='/internet/WFCOMMON/scripts/Graphic.js' type='text/javascript'></script>
<script language='javascript' src='/internet/WFCOMMON/scripts/common.js' type='text/javascript'></script>
<script language='javascript' src='/internet/WFCOMMON/js/page.js' type='text/javascript'></script>
<script language='javascript' src='/internet/WFCOMMON/js/list.js' type='text/javascript'></script>
<script language='javascript' src='/internet/WFCOMMON/js/grid.js' type='text/javascript'></script>
