<%@include file="./common.jsp"%>
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
    String fileName = realpath+"/internet/tagsample/demo/data.xml";
    RequestContext dom = new RequestContext(fileName);
    //out.println("XmlUtil.doc2String(request.getDocument())===\n"+ XmlUtil.doc2String(dom.getDocument()));
    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<link rel="stylesheet" href="/internet/tagsample/css/HCIStyle.css" type="text/css">