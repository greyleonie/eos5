<%@include file="/internet/common.jsp"%>

<%
String url = "";
String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
String recordId = base.util.TalentContext.getValue(pageContext,null,"ReceiveArchive/RecordID");
String title = base.util.TalentContext.getValue(pageContext, null, "ReceiveArchive/archiveTitle");
String username = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");

url = "/iWebOffice/ReceArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=0,0&ShowType=1&UserName="+username+"&SendArchive/archiveTitle="+title;
%>

<script>
var inputobj;
var tabbox1 = new TabComponent("tab1c")
tabbox1.add("listdetail","��������",1)
tabbox1.add("attachment","�� ��",0,"exFullImgZoom();exImgZoom();")

function showFullImg(imgPath) {
   var frm = document.forms[0];
   
   frm.fullImage.src = imgPath;
}
</script>

<body>
<form method="post" name="myform">
<table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>
			<!------------------------------  ��ͷ  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="printTable">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">�����е�У���ĳ�����</td></tr>
			</table>
			<!------------------------------  �����  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
<tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					
				</td>
			  </tr>
			  <tr> 
				<td width="9%" height="25" align="center" nowrap class="td1">���ĵ�λ��</td>
				<td colspan="2" nowrap class="td1">&nbsp; <bean:write property="ReceiveArchive/archiveUnit" /> 
				</td>
				<td width="6%" align="center" nowrap class="td1">������ </td>
				<td width="11%" align="center" nowrap class="td1"> <bean:write property="ReceiveArchive/archiveNum" /> 
				</td>
				<td width="6%" align="center" nowrap class="td1">�ܼ���</td>
				<td width="12%" align="center" nowrap class="td1">
				  <logic:equal property="ReceiveArchive/secretLevel" value="0">����</logic:equal>
				  <logic:equal property="ReceiveArchive/secretLevel" value="1">����</logic:equal> 
				  <logic:equal property="ReceiveArchive/secretLevel" value="2">����</logic:equal>
				  <logic:equal property="ReceiveArchive/secretLevel" value="3">����</logic:equal> 
				   </td>
				<td width="9%" align="center" nowrap class="td1">�����̶ȣ�</td>
				<td width="13%" align="center" nowrap class="td1">
				  <logic:equal property="ReceiveArchive/timeLevel" value="0">����</logic:equal> 
				  <logic:equal property="ReceiveArchive/timeLevel" value="1">�Լ�</logic:equal> 
				  <logic:equal property="ReceiveArchive/timeLevel" value="2">����</logic:equal>
				  <logic:equal property="ReceiveArchive/timeLevel" value="3">�ؼ�</logic:equal> 
				 </td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�ռ����ڣ�</td>
				<td width="25%" nowrap class="td1"> &nbsp;<bean:write property="ReceiveArchive/archiveDate[@pattern='yyyy-MM-dd']"/> 
				</td>
				<td width="9%" align="center" nowrap class="td1">���ı�ţ�</td>
				<td colspan="4" nowrap class="td1">&nbsp; <bean:write property="ReceiveArchive/archiveCode" /> 
				</td>
				<td align="center" nowrap class="td1">�� �� �ˣ�</td>
				<td nowrap class="td1">&nbsp;<bean:write property="ReceiveArchive/chenPiMan"/> 
				</td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�ļ����⣺</td>
				<td colspan="8" nowrap class="td1">&nbsp;<bean:write property="ReceiveArchive/archiveTitle" /></td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div style='font-size:14px;font-weight:bold'>[�칫���쵼������]</div>
					<div >
						<fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" />
						
					<br>
					</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div style='font-size:14px;font-weight:bold'>[У�쵼�������]</div>
					<div >
					<fcc:wfdataview name="chuanYue" wfnode="DX4" list="list[@type='wfdata']" />
						
					<br>
					</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div style='font-size:14px;font-weight:bold'>[�ֹ��쵼��ʾ���]</div>
					<div class="divwf2">
					<fcc:wfdataview name="yueShi" wfnode="DX6" list="list[@type='wfdata']" />	
                
					<br>
					</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div style='font-size:14px;font-weight:bold'>[�칫���쵼�������]</div>
					<div>
					<fcc:wfdataview name="jiaoBan" wfnode="DX7" list="list[@type='wfdata']" />
						
					<br>
					</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div style='font-size:14px;font-weight:bold'>[�����Ա�������]</div>
					<div >
					<fcc:wfdataview name="qiTa" wfnode="DX8" list="list[@type='wfdata']"/>
						
					<br>
					</div>
				</td>
			  </tr>
			</table>
		   
      
			<!------------------------------  �༭����  ----------------------------->
			  
			  
			  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
				<tr><td colspan="4">
				<table width="100%" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" border="0">
				<tr><td width="60%" height="100%" align="center" valign="middle" class="td1">
				<img id="fullImage" src="/internet/image/smy.gif" border="0" style="cursor:hand" onclick="viewAllImg(this)">
				</td>
				<td align="center" width="40%" height="100%" class="td1">
				<table width="100%" height="100%" id="scanImgTb" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" border="0">
				<%
									 int count=0;
									 String trClass = "result_content"; 
						  
								%>
							<logic:iterate id="resultset" property="list[@type='wfattachment']"> 
								<%
						          String filepath = base.util.TalentContext.getValue(pageContext,"resultset","FlowAttachment/filePath");
						          //filepath = filepath.replaceAll("\","/");
						          filepath = "/internet/" + filepath;
									if(count%2==0)
										trClass = "td1";
									else
										trClass = "td2";
									count++;
								%>
							<tr class="<%=trClass%>">
							  <td align="center" valign="middle" nowrap><img id="image<%=count%>" src="<%=filepath%>" border="1" style="cursor:hand" onclick="showFullImg('<%=filepath%>')"><br><bean:write id="resultset" property="FlowAttachment/fileName"/></td>
							</tr>
							</logic:iterate> 
				</table>
				</td>
				</tr>
				</table>
				</td></tr>
        	  </table>
			
			<table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<script>
			tabbox1.inithidetab();
			</script>
		</td>
		</tr>
	</table> 
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>
</form>
</body>
<script>
	if (document.getElementById("image1") != undefined)
	   document.getElementById("fullImage").src = document.getElementById("image1").src;


function viewAllImg(img) {
   var windowObj = window.open("","viewImg","resizable=1,scrollbars=1,titlebar=1");
   var html = "<body><img id='fullImage' src='/internet/image/smy.gif' border='0'></body>";
   
   windowObj.document.writeln(html);
   windowObj.document.getElementById("fullImage").src = img.src;
}

//��Сԭͼ
function exFullImgZoom() {
var fullimg = document.getElementById("fullImage");
var oWidth = fullimg.width;
var oHeight = fullimg.height;
   
if (oWidth<=500 && oHeight<=500) fullimg.style.zoom="100%";
else if ((oWidth>500 && oWidth<=1000) || (oHeight>500 && oHeight<=1000)) fullimg.style.zoom="50%";
else if ((oWidth>1000 && oWidth<=1500) || (oHeight>1000 && oHeight<=1500)) fullimg.style.zoom="30%";
else if ((oWidth>1500 && oWidth<=2000) || (oHeight>1500 && oHeight<=2000)) fullimg.style.zoom="25%";
else if ((oWidth>2000 && oWidth<=2500) || (oHeight>2000 && oHeight<=2500)) fullimg.style.zoom="20%";
}

//��СԤ��ͼ
function exImgZoom() {
var images = document.getElementsByTagName("img");

   for (var i=0;i<images.length;i++) {
      var image = images[i];

      if (image.id.indexOf("image")>=0) {
         var oWidth = image.width;
         var oHeight = image.height;

         if (oWidth<=200 && oHeight<=200) image.style.zoom="100%";
         else if ((oWidth>200 && oWidth<=400) || (oHeight>200 && oHeight<=400)) image.style.zoom="50%";
         else if ((oWidth>400 && oWidth<=600) || (oHeight>400 && oHeight<=600)) image.style.zoom="30%";
         else if ((oWidth>600 && oWidth<=800) || (oHeight>600 && oHeight<=800)) image.style.zoom="25%";
         else if ((oWidth>800 && oWidth<=1000) || (oHeight>800 && oHeight<=1000)) image.style.zoom="20%";
         else if ((oWidth>1000 && oWidth<=2000) || (oHeight>1000 && oHeight<=2000)) image.style.zoom="10%";
         else if ((oWidth>2000 && oWidth<=4000) || (oHeight>2000 && oHeight<=4000)) image.style.zoom="5%";

      } 
   }
}
</script>