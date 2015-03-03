<%@include file="/internet/common.jsp"%>
<body>
<form name="form2" method="post" action="studentmanage.prAlbum.ablumUploadOneExt.do" enctype="multipart/form-data">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;相册管理—&gt;学员相片上传/重传</td>
          </tr>
        </table> 
    </td>
    </tr>
    <tr height="10">
   <td></td>
   </tr>
   <tr>
   <td>
    <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
      
        <tr>
          <td  class="td1" height="40">&nbsp;
          <html:hidden property="QueryStudentSimple/StudentID"/>
            <input name="Photo" type="file" size="30">
                    <input name="upload12" type="button" class="button_02" value="上 传" onClick="upload2()"></td>
        </tr>
      </table>
   </td>
   </tr>
   </table>
   
   
     
    </form>

</body>
<script type="text/javascript">

 function upload2(){
 	var str=document.form2.Photo.value;
 	if(str==""){
 		alert("请选择上传文件");
 		return;
 	}
 	
 	
 	form2.submit();
 }
</script>