<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.talent.common.TalentFunction"%>
<%@page import="com.talent.common.Pagination"%>
<%@page import="org.apache.struts.util.RequestUtils"%>
<%@page import="com.talent.hibernate.News"%>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>
<body>
<form action="/news.do?action=showNew" method="post">

<style type="text/css">
<!--

a:link {
    TEXT-DECORATION:none
    COLOR: #000000
}
a:visited {
 TEXT-DECORATION:none
    COLOR: #880000 
}
a{TEXT-DECORATION:none}

.td_line {
	font-size: 12px;
	line-height: 20px;
	color: #000000;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #D0D0D0;
	border-right-color: #D0D0D0;
	border-bottom-color: #D0D0D0;
	border-left-color: #D0D0D0;
}


-->
</style>

<body>
<form>
<table width="700" align="center">
 <%ArrayList newsList=(ArrayList)request.getAttribute("newList");
                 int countNews=0;
                 if(newsList!=null){ countNews=newsList.size();}%>
    <tr>
      
    <td class="text" align="center" width="800"> 
      <table cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
  <tbody>
    <tr vAlign="top">
      <td width="750" height="158" align="center"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/image/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="90" bgcolor="#ebebeb">校园新闻&nbsp;</td>
                  
                    <td background="/image/left_bg1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/image/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="news.do?action=classNew&cote=1">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table cellspacing="0" cellpadding="0" width="130%" border="0">
                <tbody>
                
                <%int i=0; 
                SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd"); 
                %>
            
                 <%for(int k=0;k<countNews;k++){
                    News notice =(News)newsList.get(k); 
                   if(notice.getColumns().equals("校园新闻")){%>
                
                 <%i++;
                 if(i<7) {%>               
               
                  <tr>
                  
                  
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/image/img1.gif" width="11" height="11">
                      <a href="/news.do?action=showNew&newsId=<%=notice.getNewsId() %>">
                      <%String str2="";String str=notice.getTitle(); if(str.length()>20){ 
                       str2 =str.substring(0,20)+"...";
                       out.println(str2);}else{out.println(str);} 
                       %>
                     
                    &nbsp;(<%=s.format(notice.getPublishDate()) %>)</a>
                    </td>
                  </tr>
                  <%}}}%>

                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/image/img1.gif" width="11" height="11"></td>
                  </tr>
              
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
      <td width="7" height="158"></td>
      <td align="middle" width="750" height="158"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/image/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="108" bgcolor="#ebebeb">校院通知&nbsp;</td>
                    <td background="/image/left_bg1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/image/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="news.do?action=classNew&cote=2">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="99%" height="119" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                 <%int j=0; %>
                 
                 <%for(int k=0;k<countNews;k++){
                    News notice =(News)newsList.get(k); 
                   if(notice.getColumns().equals("校院通知")){%>
                
                 <%j++;
                 if(j<7) {%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/image/img1.gif" width="11" height="11">
                       <a href="/news.do?action=showNew&newsId=<%=notice.getNewsId() %>">
                      <%String str2="";String str=notice.getTitle(); if(str.length()>20){ 
                       str2 =str.substring(0,20)+"...";
                       out.println(str2);}else{out.println(str);} 
                       %>
                     
                    &nbsp;(<%=s.format(notice.getPublishDate()) %>)</a>
                    </td>
                  </tr>  
                  <%}}} %>   
              
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
	<tr vAlign="top">
      <td align="middle" width="750" height="158"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/image/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="108" bgcolor="#ebebeb" title='当前有条会议公告'>会议公告&nbsp;</td>
                    <td background="/image/left_bg1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/image/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="news.do?action=classNew&cote=3">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="99%" height="119" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <%int z=0; %>
                <%for(int k=0;k<countNews;k++){
                    News notice =(News)newsList.get(k); 
                   if(notice.getColumns().equals("会议公告")){%>
                 <%z++;
                 if(z<7) {%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/image/img1.gif" width="11" height="11">
                    <a href="/news.do?action=showNew&newsId=<%=notice.getNewsId() %>">
                     <%String str2="";String str=notice.getTitle(); if(str.length()>20){ 
                       str2 =str.substring(0,20)+"...";
                       out.println(str2);}else{out.println(str);} 
                       %>
                     
                    &nbsp;(<%=s.format(notice.getPublishDate()) %>)</a>
                    </td>
                  </tr>
                  <%}}} %>
            
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
      <td width="10" height="158"></td>
      <td align="middle" width="750" height="158"><table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/image/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="108" bgcolor="#ebebeb" title='当前有条部门公告'>部门公告&nbsp;</td>
                    <td background="/image/left_bg1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/image/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="news.do?action=classNew&cote=4">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="99%" height="119" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <%int g=0; %>
                <%for(int k=0;k<countNews;k++){
                    News notice =(News)newsList.get(k); 
                   if(notice.getColumns().equals("部门公告")){%>
                   <%g++;
                 if(g<7) {%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/image/img1.gif" width="11" height="11">
                     <a href="/news.do?action=showNew&newsId=<%=notice.getNewsId() %>">
                    <%String str2="";String str=notice.getTitle(); if(str.length()>20){ 
                       str2 =str.substring(0,20)+"...";
                       out.println(str2);}else{out.println(str);} 
                       %>
                     
                    &nbsp;(<%=s.format(notice.getPublishDate()) %>)</a>
                    </td>
                  </tr>
                  <%}}} %>
               
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
    
  </tbody>

</table>
</form>

</body>

