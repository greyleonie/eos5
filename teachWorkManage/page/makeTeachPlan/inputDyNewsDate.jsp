<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>���ñ�������</title>
</head>
<body >
<form method="post" enctype="multipart/form-data" action="oa.prFolder.folderAddDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;��ѧ�ƻ����ơ�&gt;�趨����ʱ��</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28">
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="TeachingPlan/State" value="6"/>
      <html:hidden property="loc" value="6"/>
      <html:hidden property="fileName" />
       </td>
    </tr>
    <tr>
      <td class="text"><table width="86%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  >
            <td width="25%" height="30" align="right" class="td2">��ʼʱ�䣺</td>
            <td width="75%" class="td1">&nbsp;
                <html:text property="subjectNews/startTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
        <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["subjectNews/startTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
       <span class="text_red">*</span></td>
          </tr>
		  <tr >
            <td width="25%" height="90" align="right" class="td2">����ʱ�䣺</td>
            <td width="75%" class="td1">&nbsp;
           <html:text property="subjectNews/endTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
        <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["subjectNews/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
       <span class="text_red">*</span>
        </td>
         </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:window.close()">
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
  </body>
 </html>
  <script>

  function save() {
  	var frm = document.forms[0];
  	if(frm.elements["subjectNews/startTime[@pattern='yyyy-MM-dd']"].value==""||frm.elements["subjectNews/endTime[@pattern='yyyy-MM-dd']"].value==""){
  	  alert("��ʼ�ͽ���ʱ�䶼����Ϊ��!");
  	  return;
  	}else{
  	
  	frm.target="_blank";
    frm.action="teachWorkManage.prMakeTeachPlan.sendSubject2NetWork.do?isAdopted=1";
    window.self.close();
    frm.submit();
    
  	}
	
  }
  

  </script>
 