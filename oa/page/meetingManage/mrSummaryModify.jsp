<%@include file="/internet/common.jsp"%>
<%
String url="";
String recordId = base.util.TalentContext.getValue(pageContext,null,"QueryMR_SUMMARY/CONTENT");
String username = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");
if (recordId != null && !"".equals(recordId)) 
    url = "/iWebOffice/MeetingSummary/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=2,0&ShowType=1&UserName="+username;
%>
<form method="post"  action="oa.prMeetingManage.mrSummaryModifyDO.do" enctype="multipart/form-data" >
  
  <html:hidden property="QueryMR_SUMMARY/SUMMARYID" name="MR_SUMMARY/SUMMARYID"/>
  <html:hidden property="QueryMR_SUMMARY/CONTENT" name="MR_SUMMARY/CONTENT"/>
  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;�����Ҫ�޸�</td>
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
                <input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="location.href='oa.prMeetingManage.mrSummaryList.do'">
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
  	
  	saveFile();
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  
  function saveFile() {
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
     alert(webOffice.Status);
     return false;
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   webform.submit();
  }
  </script>
 