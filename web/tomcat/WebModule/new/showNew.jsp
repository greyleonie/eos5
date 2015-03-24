<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<%@page import="com.talent.common.TalentFunction"%>
<%@page import="com.talent.common.Pagination"%>
<%@page import="org.apache.struts.util.RequestUtils"%>
<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>
<body>
<form action="/news.do?action=showNew" method="post">

<%String columns=request.getParameter("columns"); %>
  <logic:iterate id="news" name="newList">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte"><%=columns%></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
     
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1">
          <tr  onClick="changeTRBgColor(this)">
            <td width="100%" height="40px" align="center" valign="middle">
            <font size='5'><b><bean:write property="title" name="news"/></b></FONT>
            </td>
          </tr>
       
   
           <tr  onClick="changeTRBgColor(this)">
            <td width="100%" height="30px" align="center" valign="middle">
            <font size='3'><bean:write property="subhead" name="news"/></FONT>
            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="100%" height="5px" class="td1" align="center">
            <hr align="center" SIZE="1" width="100%">           
            <font size='2'><bean:write property="publishDate" name="news" format="yyyy-MM-dd"/></font>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="90%" height="30px" class="td1" align="center">
            <font size='2'><b><bean:write property="columns" name="news"/></b></font>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td id="planinfo" width="100%"  >
              <bean:write property="content" name="news" filter="false"/>
            </td>
            
          </tr>
         
          <tr  onClick="changeTRBgColor(this)">
            <td width="100%" class="td1" align="right" ><br>
            <font size='2'><bean:write property="department" name="news"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
            </td>
          </tr>
          
      </table>
     
      <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
            <td height="49" align="center">
                <input name="Submit2" type="button" class="button_02" value="·µ »Ø" onClick="javascript:history.go(-1);">
              </td>
            </tr>
      </table>
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
     
        </logic:iterate>
  </form>
 </body>
