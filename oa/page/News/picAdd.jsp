<%@include file="/internet/common.jsp"%>
<html>
	<head>
		<title>新建文件</title>
	<style type="text/css">
    <!--
      .STYLE1 {font-size: 12px}
    -->
  </style>
	</head>
	<!--body onblur="this.focus();"-->
	<BODY  bgcolor="#F0F0F0">
		<FORM action="oa.prNews.picAddDo.do" method="post" encType="multipart/form-data"><INPUT value="ShareFolder"
				type="hidden" name="filepath"> <INPUT value="ShareFolder" type="hidden" name="FBFILE_T_FILE/GROUP_ID"> <INPUT
				value="F" type="hidden" name="FBFILE_T_FILE/FILE_SAVE">
			<TABLE width="110%" cellPadding="0" align="center" border="0" cellSpacing="0" >
				<TBODY>
					<TR onclick="changeTRBgColor(this)">
						<html:hidden name="ShareFolder/ParentFileID" property="fid" />
						<TD><span class="STYLE1">图&nbsp;&nbsp;&nbsp;&nbsp;片:</span><INPUT Msg="上传文档不能为空" ValidateType="notempty" type="file" class="input"size="18" name="file">
						 <INPUT value="保 存" type="button" onclick="save()" name="Button"></TD>
						
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
		<SCRIPT type="text/javascript">

			function save() {
				var frm = document.forms[0];
				var filenames = frm.file.value;
				var fname = filenames.split("\\");  
  	var filename = fname[fname.length-1];
				if (filename.indexOf(".")<0) {
					alert("该文件为不允许上传的文件！");
					return;
				}
				if (validater(frm)) 
					
				frm.submit();
			}
		</SCRIPT>
	</BODY>
</html>