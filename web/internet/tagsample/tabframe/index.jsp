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
    String fileName = realpath+"/internet/tagsample/test.xml";
    RequestContext dom = new RequestContext(fileName);
    //out.println("XmlUtil.doc2String(request.getDocument())===\n"+ XmlUtil.doc2String(dom.getDocument()));
    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<html>
    <head><title>JSP Page</title>
    <link type="text/css" href="/internet/theme/style0/style.css" rel="stylesheet"/>
    <script language="javascript" src="/internet/scripts/tab.js" type="text/javascript"></script>
    </head>
    <body>


    
    <table width="100%" height="60%">
        <tr height="100%">
        <td width="50%">
    <eos:tabframe id="test"  width="100%" height="100%" frameborder="0" scrolling="auto">
        <eos:tabframetitle url="../testhtml/test1.htm" property="urls/url1"type="xpath" title="�ִ�����"/>
        <eos:tabframetitle url="../testhtml/test2.htm" selected="true" title="�ִ�����"/>
        <eos:tabframetitle url="../testhtml/test3.htm"   property="urls/url2"type="xpath" title="��λ�����豸"/>
    </eos:tabframe>
        </td>
      </tr>

    </table>
     
<p>&nbsp</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="tabframeresource.htm">�鿴Դ����</a></p>
<p>&nbsp</p>   
    </body>
</html>
