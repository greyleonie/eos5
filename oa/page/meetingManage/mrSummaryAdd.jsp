<%@include file="/internet/common.jsp"%>

<form method="post"  action="oa.prMeetingManage.mrSummaryAddDO.do" enctype="multipart/form-data" >
  <html:hidden property="queryaction"/> 
  <html:hidden property="MR_SUMMARY/CONTENT"/>
  <html:hidden property="MR_NOTICE/NOTICEID" name="MR_SUMMARY/NOTICEID"/>
  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;�����Ҫ¼��</td>
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
            
            <tr> 
			   <td width="100%" height="30px" align="left" valign="middle" class="td1">
				  <INPUT type="hidden" id="FileType" name="FileType" value=".doc">
				  <INPUT type="hidden" id="UserName" name="UserName" value="<bean:write property='SessionEntity/userName'/>">
				  <html:select property="Template">
				  <html:option value="-1">--��ѡ������Ҫģ��--</html:option> 
                  <html:options property="list[@type='Template_Files']/Template_File/RecordID" labelProperty="list[@type='Template_Files']/Template_File/FileName"/> 
				  </html:select>&nbsp;
				  <INPUT type="button" class="button_02" value="�༭��Ҫ" onClick="editText();">&nbsp;
			   </td>
			</tr>
				<tr><td width="100%" height="600px" align="center" class="td2">
				<iframe src='/iWebOffice/MeetingSummary/DocumentEdit.jsp?Purview=edit&FileType=.doc&Template=' frameborder="0" width="100%" id="sendText" name="sendText" style=" height: 100%" scrolling="no"></iframe>
			</td></tr>

       
          
        
        
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="window.location.href='oa.prMeetingManage.mrSummaryList.do'">
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
  	
  	saveFile();
  	
  	setTimeout("document.forms[0].submit()",5000);
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  
  function editText() {
  var template = '';
  var from = document.forms[0];
  var title = '<bean:write property="MR_NOTICE/TOPIC"/>';
  var point = '<bean:write property="MR_NOTICE/MRNAME"/>';
  var starttime = '<bean:write property="MR_NOTICE/STARTDATE"/>';
  var endtime = '<bean:write property="MR_NOTICE/ENDDATE"/>';
  var topic = '<bean:write property="MR_NOTICE/CENTRALTOPIC"/>';
  var compere = '<bean:write property="MR_NOTICE/Moderator" formatType="operatorID"/>';
  var joinperson = '<bean:write property="MR_NOTICE/Participants"/>';
  var noticeperson = '<bean:write property="MR_NOTICE/NoticeScopeName"/>';
  var mark = '<bean:write property="MR_NOTICE/REMARK"/>';
  var templates = from.elements["Template"];
  var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");

  if (templates.options[templates.selectedIndex].value != '-1') {
     template=templates.options[templates.selectedIndex].value;
  } else {
     alert("��ѡ������Ҫģ��!");
     return false;
  }
  webOffice.Template = template;
  webOffice.WebSetMsgByName("OPTION","LOADTEMPLATE");
  if (webOffice.WebLoadTemplate()){                    //����OfficeServer��OPTION="LOADTEMPLATE"
       SetBookmarks("title",title);
       SetBookmarks("point",point);
       SetBookmarks("starttime",starttime);
       SetBookmarks("endtime",endtime);
       SetBookmarks("topic",topic);
       SetBookmarks("compere",compere);
       SetBookmarks("joinperson",joinperson);
       SetBookmarks("noticeperson",noticeperson);
       SetBookmarks("mark",mark);
   }else{
       alert(webOffice.Status);
   }
  
  }
  
  //���ã�������ǩֵ  vbmName:��ǩ���ƣ�vbmValue:��ǩֵ   ��ǩ����ע���Сд
  function SetBookmarks(vbmName,vbmValue){
  var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
  if (!webOffice.WebSetBookmarks(vbmName,vbmValue)){
     alert(webOffice.Status);
  } }
  
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
 