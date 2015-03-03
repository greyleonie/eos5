<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>设置报名日期</title>
</head>
<body >
<form method="post" enctype="multipart/form-data" action="oa.prFolder.folderAddDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教学计划编制—&gt;设定报名时间</td>
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
            <td width="25%" height="30" align="right" class="td2">开始时间：</td>
            <td width="75%" class="td1">&nbsp;
                <html:text property="subjectNews/startTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
        <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["subjectNews/startTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
       <span class="text_red">*</span></td>
          </tr>
		  <tr >
            <td width="25%" height="90" align="right" class="td2">结束时间：</td>
            <td width="75%" class="td1">&nbsp;
           <html:text property="subjectNews/endTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
        <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["subjectNews/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
       <span class="text_red">*</span>
        </td>
         </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="javascript:window.close()">
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
  	  alert("开始和结束时间都不能为空!");
  	  return;
  	}else{
  	
  	frm.target="_blank";
    frm.action="teachWorkManage.prMakeTeachPlan.sendSubject2NetWork.do?isAdopted=1";
    window.self.close();
    frm.submit();
    
  	}
	
  }
  

  </script>
 