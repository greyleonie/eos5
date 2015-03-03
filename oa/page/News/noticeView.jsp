<%@include file="/internet/common.jsp"%>

<%
String column = base.util.TalentContext.getValue(pageContext,null,"NewsOrg/Columns");
String name = column.substring(column.length()-2,column.length());
String pageID=null;
pageID=request.getParameter("pageID");
%>
 
<script language="JavaScript" for="window" event="onLoad">
    var content = document.forms[0].elements["NewsOrg/Content"].value;
  

    document.getElementById("planinfo").innerHTML = "<font size='3'>" + content + "</font>";
     document.forms[0].elements["NewsOrg/Content"].value= document.forms[0].elements["NewsOrg/Content"].value.replace("&amp;","");
    
</script>
<body >
<form method="post" enctype="multipart/form-data" action="oa.prNews.newsList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;校院信息—&gt;<%=column%>—&gt;<%=name%>查看</td>
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
      <table width="800px"  border="0" align="center" cellpadding="0" cellspacing="1" style="table-layout:fixed;">
          <tr  onClick="changeTRBgColor(this)">
            <td width="100%" height="80px" align="center" valign="middle">
            <font size='5'><b><bean:write property="NewsOrg/Title"/></b></FONT>
            </td>
          </tr>
       <logic:notEqual property="NewsOrg/Subhead" value="0">
   
           <tr  onClick="changeTRBgColor(this)">
            <td width="100%" height="30px" align="center" valign="middle">
            <font size='3'><bean:write property="NewsOrg/Subhead"/></FONT>
            </td>
          </tr>
            </logic:notEqual>
          <tr  onClick="changeTRBgColor(this)">
            <td width="100%" height="5px" class="td1" align="center">
            <hr align="center" SIZE="1" width="100%">           
            <font size='2'><bean:write property="NewsOrg/PublishDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy年MM月dd日"/></font>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="90%" height="30px" class="td1" align="center">
            <font size='2'><b><bean:write property="NewsOrg/Columns" /></b></font>
            </td>
          </tr>
		  <!--<tr  onClick="changeTRBgColor(this)">-->
		  <tr>
            <td id="planinfo" width="800px" style="word-wrap : break-word ;" align="left">
            </td>
            
          </tr>
         
          <tr  onClick="changeTRBgColor(this)">
            <td width="100%" class="td1" align="right" ><br>
            <font size='2'><bean:write property="NewsOrg/departmentName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
            </td>
          </tr>
          
      </table>
      <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
            <td height="49" align="center">
            <%if(pageID.equals("1")&&pageID!=null){ %>
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="window.location.href='oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=<%=column%>'">
                <%}else{ %>
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1);">
                <%} %>
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
        <html:hidden property="NewsOrg/Content"/>
		<html:hidden property="NewsOrg/_order/col1/field"/>
		<html:hidden property="NewsOrg/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
  </form>
 </body>

 