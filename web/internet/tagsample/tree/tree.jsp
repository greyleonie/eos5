<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,
                 com.primeton.tp.web.driver.webdriver.WebDriver,
                 com.primeton.tp.common.xml.XmlUtil"%>
<%
    /*
        ������ʱ����Ĭ�ϵľ���·��
        ��ʽӦ�õ�ʱ��Ҫͨ��
        getapp.gatPath()����ȡ����·����            
     */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/tree/tree.xml";
    RequestContext dom = new RequestContext(fileName);
    //out.println("XmlUtil.doc2String(request.getDocument())===\n"+ XmlUtil.doc2String(dom.getDocument()));
    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/pagefortreetwo.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/treetwo.js"></SCRIPT>
<eos:tree property="menu/mainMenu" multiSelected="true"/>
<SCRIPT LANGUAGE="JavaScript">init();</SCRIPT>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<p><a href="./treesource.htm" >�鿴Դ����</a></p>