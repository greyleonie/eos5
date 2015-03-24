<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,
                 com.primeton.tp.web.driver.webdriver.WebDriver,
                 com.primeton.tp.common.xml.XmlUtil"%>
<%
    /*
        现在暂时是用默认的绝对路径
        正式应用的时候要通过
        getapp.gatPath()来获取绝对路径。            
     */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/list.xml";
    RequestContext dom = new RequestContext(fileName);
    //out.println("XmlUtil.doc2String(request.getDocument())===\n"+ XmlUtil.doc2String(dom.getDocument()));
    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/pagefortreetwo.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/treetwo.js"></SCRIPT>
<eos:tree property="menu/mainMenu" expandDepth="1"/>