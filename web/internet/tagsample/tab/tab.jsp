<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>

<html>
    <head><title>JSP Page</title>
    <link type="text/css" href="/internet/theme/style0/style.css" rel="stylesheet"/>
    <script language="javascript" src="/internet/scripts/tab.js" type="text/javascript"></script>
    </head>
    <body>
    
    <table width="100%" height="60%">
        <tr height="50%">
        <td>
    <eos:tab id="test"  width="100%" height="80%">
        <eos:tabtitle>
            <eos:titleitem  >�ִ�����</eos:titleitem>
            <eos:titleitem  selected="true">��λ�����豸</eos:titleitem>
        </eos:tabtitle>
        <eos:tabcontent>
            <eos:contentitem>�ִ���������</eos:contentitem>
            <eos:contentitem>��λ�����豸����</eos:contentitem>
        </eos:tabcontent>
    </eos:tab>
        </td>
     <td>
    <eos:tab id="test2"  width="100%" height="80%">
        <eos:tabtitle>
            <eos:titleitem  >�ִ�����</eos:titleitem>
            <eos:titleitem selected="true">��λ�����豸</eos:titleitem>
        </eos:tabtitle>
        <eos:tabcontent>
            <eos:contentitem>�ִ���������</eos:contentitem>
            <eos:contentitem>��λ�����豸����</eos:contentitem>
        </eos:tabcontent>
    </eos:tab>
        </td>
      </tr>

    </table>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<p><a href="./tabsource.htm">�鿴Դ����</a></p>    
    </body>
</html>
