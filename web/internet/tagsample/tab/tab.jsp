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
            <eos:titleitem  >仓储物流</eos:titleitem>
            <eos:titleitem  selected="true">工位器具设备</eos:titleitem>
        </eos:tabtitle>
        <eos:tabcontent>
            <eos:contentitem>仓储物流内容</eos:contentitem>
            <eos:contentitem>工位器具设备内容</eos:contentitem>
        </eos:tabcontent>
    </eos:tab>
        </td>
     <td>
    <eos:tab id="test2"  width="100%" height="80%">
        <eos:tabtitle>
            <eos:titleitem  >仓储物流</eos:titleitem>
            <eos:titleitem selected="true">工位器具设备</eos:titleitem>
        </eos:tabtitle>
        <eos:tabcontent>
            <eos:contentitem>仓储物流内容</eos:contentitem>
            <eos:contentitem>工位器具设备内容</eos:contentitem>
        </eos:tabcontent>
    </eos:tab>
        </td>
      </tr>

    </table>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<p><a href="./tabsource.htm">查看源代码</a></p>    
    </body>
</html>
