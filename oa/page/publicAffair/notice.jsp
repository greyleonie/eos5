<%@include file="/internet/common.jsp"%>
<html>
<head>
<style type="text/css">
<!--
.tds1 {
	background-color: #FFFFFF;
	font-size: 36px;
	font-weight: bold;
	line-height: 42px;
	color: #D24217;
}
.tds2 {
	background-color: #FFFFFF;
	font-size: 18px;
	line-height: 24px;
	color: #000000;
}
-->
</style>
<title>公文通知</title>
</head>
<%String flag = request.getParameter("flag"); %>
<body onUnload="reflashRead()">
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="86%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	     <tr>
		   <td height="500">
		     <table width="100%" height="506"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
			   <tr>
            <td width="85%" height="77" class="tds1" align="center">
              <bean:write property="Notice/Title"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="85%" height="369" class="tds2" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;
              <bean:write property="Notice/Content"/>           </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="85%" height="28" class="tds2" align="right">
              <bean:write property="Notice/PublisherIDName"/>&nbsp;&nbsp;&nbsp;&nbsp;          </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="85%" height="30" class="tds2" align="right">
             <bean:write property="Notice/CreateTime"/>&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
          </tr>
			 </table>
		   </td>
		 </tr>
          
      </table>
      <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
            <td height="49" align="center">
                <%if(flag!=null&&flag.equals("desk")){ %>
                <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()">
                <%}else{ %>
                <input name="Submit2" type="button" class="button_02" value="返　回" onClick="javascript:document.location.href='oa.prAffair.noticeRead.do'">
                <%} %>
                              </td>
            </tr>
      </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
</body>
</html>


 