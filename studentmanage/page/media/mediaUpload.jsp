<%@ page language="java" import="java.util.*,java.io.File" pageEncoding="GBK"%>
<%@include file="/internet/common.jsp"%>
<%
		String classID = base.util.TalentContext.getValue(pageContext, null,"classID");
		String cid = base.util.TalentContext.getValue(pageContext, null,"cid");
		String fname = base.util.TalentContext.getValue(pageContext, null,"fname");
		if(cid!=null&&fname!=null){
			File f = new File("D:\\primeton\\jboss-3.2.5\\server\\default\\deploy\\eos4jboss\\default.war\\internet\\upload\\media\\" + cid+"\\"+fname);
			f.delete();
		}
		//out.print(classID);
%>
<body>
	<form method="post" action="studentmanage.prMedia.prMediaUploadDo.do" enctype="multipart/form-data">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">ϵͳ����&gt;ý�����&gt;�༶ý��</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5">&nbsp;</td>
			</tr>
		</table>
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr>
				<td>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td class="text">�� ����
								<html:select property="classID">
									<html:option value="public">--��ѡ��༶--</html:option>
									<html:options property="list/entity/classID" labelProperty="list/entity/className" />
								</html:select>
								&nbsp; <SELECT id="type">
									<OPTION value="0">��ǰ��</OPTION>
									<OPTION value="1">��ʷ��</OPTION>
									<OPTION value="2">�ƻ���</OPTION>
								</SELECT> &nbsp; <input type="submit" value="��ѯ" />
								<SCRIPT>

									var tmp='<bean:write property="type"/>';
									var obj=document.getElementById('type');
									if (tmp=='0') {
										obj.options[0].selected=true;
									}
									if (tmp=='1') {
										obj.options[1].selected=true;
									}
									if (tmp=='2') {
										obj.options[2].selected=true;
									}
								</SCRIPT>
							</td>
						</tr>
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
									<tr>
										<td width="14%" height="30px" align="right" nowrap class="td2"><img src='/internet/image/mail_atth.gif'
												height='16px' width='16px' align='absmiddle' style='cursor:hand' onclick="insertFile();">&nbsp;<a href="#"
												onClick="insertFile();">��Ӹ���</a>&nbsp; <input type="hidden" name="filepath" value="archivereceive" /> <input
												type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="archive"> <input type="hidden"
												name="FBFILE_T_FILE/FILE_SAVE" value="F"></td>
										<td colspan="3" class="td1">
											<table width="100%" id="fjtable">
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="text">&nbsp;</td>
						</tr>
						<tr>
							<td class="text">
								<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
								<tr class="td">
						            <td width="80%" align="center" class="td2">ý����Դ</td> 
						            <td width="20%" align="center" class="td2">����</td>        
						        </tr>
						        <%
									File filePath = new File("D:\\primeton\\jboss-3.2.5\\server\\default\\deploy\\eos4jboss\\default.war\\internet\\upload\\media\\" + classID);
									if (filePath.isDirectory()) {
										String[] fileList = filePath.list();
										for (int i=0;i<fileList.length;i++) {
											out.print("<tr class=\"td1\"><td class='td1' align=\"center\"><a href=\"/oa/page/shareFolder/downloadFile.jsp?filePath=/primeton/jboss-3.2.5/server/default/deploy/eos4jboss/default.war/internet/upload/media/"+classID+"&fileName="+fileList[i]+"\" >" + fileList[i] + "</a></td><td class='td1' align=\"center\"><a href=\"/oa/page/shareFolder/downloadFile.jsp?filePath=/primeton/jboss-3.2.5/server/default/deploy/eos4jboss/default.war/internet/upload/media/"+classID+"&fileName="+fileList[i]+"\" >����</a>&nbsp;<a href='studentmanage.prMedia.prMediaUpload.do?cid="+classID+"&fname="+fileList[i]+"&classID="+classID+"'>ɾ��</a></td></tr>");
										}
									}
								%>
							</table>
						</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
	</form>
</body>
<script>

	var i=0

	function insertFile() {
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
		C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<img src='/internet/images/attachdelete.gif' alt='ɾ��' align='absmiddle' style='cursor:hand' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
	}
</script>