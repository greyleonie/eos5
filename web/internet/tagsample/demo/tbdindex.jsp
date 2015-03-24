<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>


    <eos:webframe type="top_bottom" template="template_top_bottom.jsp">
        <eos:webframeitem location="top" width="100%" height="80%" frameBorder="0" scrolling="auto" url="./menu/index.jsp"   />
		<eos:webframeitem location="bottom" width="900" height="400" frameBorder="0" scrolling="no" url="./bottom/index.htm"   />
    </eos:webframe>
<br>
<hr size=1>
<table width="38%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="48%"><a href="Data.xml">对应的数据模型</a></td>
    <td width="52%">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%"><a href="lrwebframe.txt">左右框架代码</a></td>
    <td width="52%"><a href="tbwebframe.txt">上下框架代码</a></td>
  </tr>
  <tr>
    <td width="48%"><a href="add.htm">增加页面代码</a></td>
    <td width="52%"><a href="select.txt">查询功能代码</a></td>
  </tr>
  <tr>
    <td width="48%"><a href="modify.htm">修改功能代码</a></td>
    <td width="52%"><a href="delete.htm">删除功能代码</a></td>
  </tr>
  <tr>
    <td width="48%">&nbsp;</td>
    <td width="52%">&nbsp;</td>
  </tr>
</table>