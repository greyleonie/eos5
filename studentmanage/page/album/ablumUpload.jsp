<%@include file="/internet/common.jsp"%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="50%"><form name="form1" method="post" action="studentmanage.prAlbum.ablumBatchUpload.do" enctype="multipart/form-data">
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
        <tr>
          <td class="td_title" align="center" >全部相片上传
          <html:hidden property="QueryStudentSimple/ClassID/criteria/value"/>
          </td>
        </tr>
        <tr>
          <td  class="td1" height="30">&nbsp;
          相片命名：
          <html:radio name="QueryStudentSimple/NameType" value="operatorname" checked="true"/>按姓名  
          <html:radio name="QueryStudentSimple/NameType" value="StudentNO"/>按学号
		  <html:radio name="QueryStudentSimple/NameType" value="PhotoID"/>按相片号
          </td>
        </tr>
        <tr>
          <td  class="td1" height="30">&nbsp;<input name="Photo" type="file" size="30">
		  <input name="toupload1" type="button" class="button_02" value="上 传" onClick="upload1()"><br><font color="red">(必须是ZIP压缩文件)</font></td>
        </tr>
      </table>
        </form>    </td>
    <td width="50%">
    <form name="form2" method="post" action="studentmanage.prAlbum.ablumUploadOne.do" enctype="multipart/form-data">
     <html:hidden property="QueryStudentSimple/ClassID/criteria/value"/>
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
        <tr>
          <td class="td_title" align="center" >单张相片上传</td>
        </tr>
        <tr>
          <td  class="td1" height="30">&nbsp;请选择学员：
            <html:select property="QueryStudentSimple/StudentID"  attributesText='id="printTable"'>
                      <html:option value="-1">请选择</html:option>
                      <html:options property="list[@type='QueryStudentSimple']/QueryStudentSimple/StudentID" labelProperty="list[@type='QueryStudentSimple']/QueryStudentSimple/operatorname"/>
                    </html:select>
                    </td>
        </tr>
        <tr>
          <td  class="td1" height="30">&nbsp;
            <input name="Photo" type="file" size="30">
                    <input name="upload12" type="button" class="button_02" value="上 传" onClick="upload2()"></td>
        </tr>
      </table>
    </form></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>


</body>
<script type="text/javascript">
 function upload1(){
 	var str=document.form1.Photo.value;
 	if(str==""){
 		alert("请选择上传文件");
 		return;
 	}
 	if(str.substring(str.lastIndexOf(".")+1,str.length).toLowerCase()!="zip"){
 		alert("请导入zip格式文件");
 		return;
 	}
 	form1.submit();
 }
 function upload2(){
 	var str=document.form2.Photo.value;
 	if(str==""){
 		alert("请选择上传文件");
 		return;
 	}
 	
 	if(document.form2.elements["QueryStudentSimple/StudentID"].value=="-1"){
 		alert("请选择学员.");
 		return;
 	}
 	form2.submit();
 }
</script>