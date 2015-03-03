<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prAlbum.albumFrame.do" target="mainFrame">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;相册管理<SPAN id="toptitle"></SPAN>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="ablumUploadAction" value="studentmanage.prAlbum.ablumUpload.do">
		<input type="hidden" name="queryaction" value="studentmanage.prAlbum.ablumList.do">
		<input type="hidden" name="ablumPrintAction" value="studentmanage.prAlbum.ablumPrint.do">
			 </td>
    </tr>
    <tr>
      <td class="text">&nbsp;班　级：
        <html:select property="QueryStudentSimple/ClassID/criteria/value"  attributesText='id="printTable"'>
            <html:option value="-1">--请选择班级--</html:option>
            <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/>
          </html:select>
        &nbsp;学员姓名：<html:text property="QueryStudentSimple/operatorname/criteria/value" attributesText='class="input"' size="10"/>
<INPUT value="like" type="hidden" name="QueryStudentSimple/operatorname/criteria/operator">
<INPUT value="center" type="hidden" name="QueryStudentSimple/operatorname/criteria/likeRule">
        <input name="query" type="button" class="button_02" value="查 询" onclick="toquery()">
		
		<qx:talentButton property="toList" type="button" styleClass="button_02" value="相册浏览" onclick="ablumList()" operation="DX_STUDENT_MANAGE_ALBUM.DX_STUDENT_MANAGE_ALBUM_VIEW" />
		<qx:talentButton property="toPrint" type="button" styleClass="button_02" value="贴框打印" onclick="ablumPrint()" operation="DX_STUDENT_MANAGE_ALBUM.DX_STUDENT_MANAGE_ALBUM_PRINT" />
		<qx:talentButton property="toUpload" type="button" styleClass="button_02" value="相片上传" onclick="ablumUpload()" operation="DX_STUDENT_MANAGE_ALBUM.DX_STUDENT_MANAGE_ALBUM_UPLAOD" />
		
		</td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>

  </table>


</form>

</body>
<script>
	function ablumUpload(){
		
		var frm = document.forms[0];
		if(checkForm(frm,"相片上传")){
			frm.action = frm.elements["ablumUploadAction"].value;
	   		frm.submit();
	   	}
   	}
   
   function ablumList(){
		
		var frm = document.forms[0];
		if(checkForm(frm,"相册浏览")){
			frm.action = frm.elements["queryaction"].value;
			frm.elements["QueryStudentSimple/operatorname/criteria/value"].value="";
	   		frm.submit();
	   	}
   	}
   	
   	function ablumPrint(){
		
		var frm = document.forms[0];
		if(checkForm(frm,"贴框打印")){
			frm.action = frm.elements["ablumPrintAction"].value;
	   		frm.target="_blank";
	   		frm.submit();
	   		frm.target="mainFrame";
	   	}
   	}
   	
   	function toquery(){
   		var frm = document.forms[0];
			toptitle.innerHTML="—&gt;查询";
			frm.action = frm.elements["queryaction"].value;
	   		frm.submit();
	   
   	}
   	function checkForm(frm,obj){
   		if(frm.elements["QueryStudentSimple/ClassID/criteria/value"].value == "-1") {
			alert("请选择班级");
			return false
		}
		toptitle.innerHTML="—&gt;"+obj;
   		return  true;
   		
   	}
   	
   	
</script>