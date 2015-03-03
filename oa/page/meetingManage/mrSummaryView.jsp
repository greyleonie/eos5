<%@include file="/internet/common.jsp"%>
<%
String url="";
String recordId = base.util.TalentContext.getValue(pageContext,null,"QueryMR_SUMMARY/CONTENT");
String username = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");
if (recordId != null && !"".equals(recordId)) 
    url = "/iWebOffice/MeetingSummary/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=0,0&ShowType=1&UserName="+username;
%>

<form method="post"  action="" enctype="multipart/form-data" >
  <html:hidden property="queryaction"/> 
  <html:hidden property="QueryMR_SUMMARY/NOTICEID" name="MR_SUMMARY/NOTICEID"/>
  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议管理—&gt;会议纪要查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
			
			
			<tr><td width="100%" height="800px" align="center" class="td2">
				<iframe src='<%=url%>' frameborder="0" width="100%" id="sendText" name="sendText" style=" height: 100%" scrolling="no"></iframe>
			</td></tr>
        
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  </script>
 