<%@include file="/internet/common.jsp"%>
<%
		  	boolean display=true;
String url = "";
String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
String archiveTitle = base.util.TalentContext.getValue(pageContext,null,"ReceiveArchive/archiveTitle");
String recordId = base.util.TalentContext.getValue(pageContext,null,"ReceiveArchive/RecordID");
String username = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");
if (recordId != null && !"".equals(recordId)) { 
if ("DX2,DX4,DX6,DX7,DX8".indexOf(act)>=0)
    url = "/iWebOffice/ReceArchive/DocumentEdit.jsp?Purview=postil&RecordID="+recordId+"&EditType=3,1&ShowType=2&UserName="+username;
else if ("DX1".indexOf(act)>=0)
    url = "/iWebOffice/ReceArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=2,0&ShowType=1&UserName="+username;
else if ("DX3,DX5".indexOf(act)>=0)
    url = "/iWebOffice/ReceArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=0,0&ShowType=0&UserName="+username;
} else
    url = "";
%>

<script>
var inputobj;
var tabbox1 = new TabComponent("tab1c");
tabbox1.add("basedata","��������",0,"document.getElementById('tail').style.display = 'inline'");
tabbox1.add("attachment","�� ��",1,"document.getElementById('tail').style.display = 'none';exFullImgZoom();");
//tabbox1.add("participant","������ת",0,"document.getElementById('tail').style.display = 'inline'");
</script>

<script>
var i=1 
function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<img src='/internet/images/attachdelete.gif' alt='ɾ��' align='absmiddle' style='cursor:hand' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
}

function Twain_OnPostTransfer() {
    var frm = document.forms[0];
    var imgId = "scanImage";
    var scanType = frm.elements["scanType"];
    var imgNo = document.getElementById("scanImgCount").value;
    
    createFolder();
    if (scanType[0].checked) {
       if (imgNo == 0) imgNo = 1;
       document.getElementById("scanImgCount").value = imgNo;
       var imgName = "temp" + imgNo + ".jpg";
       var imgPath = "c:\\ScanImage\\" + imgName;
       
       frm.Twain.CloseSource();
	   frm.Twain.SaveAsJPEG(imgPath);
	   frm.fullImage.src = imgPath;
	   imgId += imgNo;
	   if (document.getElementById(imgId) == undefined)
          addImg(imgNo,imgPath);
    } else {
       imgNo++;
       document.getElementById("scanImgCount").value = imgNo;
       var imgName = "temp" + imgNo + ".jpg";
       var imgPath = "c:\\ScanImage\\" + imgName;
       
       frm.Twain.CloseSource();
	   frm.Twain.SaveAsJPEG(imgPath);
	   frm.fullImage.src = imgPath;
       addImg(imgNo,imgPath);
    }
    setTimeout("exFullImgZoom();",1000);
    setTimeout("exImgZoom();",1000);
}

function btnAcquire_onclick() {
    var frm = document.forms[0];
	frm.Twain.AcquireImage();
}

function addImg(imgNo,imgPath) {
   var imgId = "scanImage" + imgNo;
   var imgTb = document.getElementById("scanImgTb");
   var imgTr = imgTb.insertRow();
   var imgTd = imgTr.insertCell();
   var imgHtml = "<img id='"+imgId+"' src='"+imgPath+"' border='1' align='absmiddle' style='cursor:hand' onClick='showFullImg(this.id)'><br>";
   var delTag = "<img src='/internet/images/attachdelete.gif' alt='ɾ��' align='absmiddle' style='cursor:hand' onclick=delImg('"+imgNo+"')>";
   var name = "<input type=\"hidden\" name=\"list[@name='attachList']/attach[@hciTagIndex='"+imgNo+"']\" value=\"temp"+imgNo+".jpg\">";
   
   imgTd.className = "td1";
   imgTd.width = "100%";
   imgTd.height = "100%";
   imgTd.align = "center";
   imgTd.valign = "middle";
   imgTd.innerHTML = imgHtml+delTag+name;
}

function showFullImg(id) {
   var frm = document.forms[0];
   var imgNo = id.substr(id.length-1,1);
   var imgName = "temp" + imgNo + ".jpg";
   var imgPath = "c:\\ScanImage\\" + imgName;
   
   frm.fullImage.src = imgPath;
   setTimeout("exFullImgZoom();",2000);
}

function createFolder() {
   var fso; 
   fso = new ActiveXObject("Scripting.FileSystemObject");
   
   if (!fso.FolderExists("c:\\ScanImage"))
      fso.CreateFolder ("c:\\ScanImage");
}

function delImg(imgNo) {
   var fso;
   var frm = document.forms[0];
   var imgId = "scanImage" + imgNo;
   var imgName = "temp" + imgNo + ".jpg";
   var imgNo = document.getElementById("scanImgCount").value;
   
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FileExists("c:\\ScanImage\\"+imgName)) {
      document.getElementById("scanImgCount").value = imgNo - 1;
      fso.DeleteFile("c:\\ScanImage\\"+imgName);
      document.getElementById(imgId).parentNode.removeNode(true);
      frm.fullImage.src = "/internet/image/smy.gif";
   }
   else alert("�ĵ������ڣ�");
}
</script> 

<body>
<form method="post" name="myform" action="oa.prReceiveArchive.receiveProcessDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���Ĺ���&gt;��������</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="ReceiveArchive/_order/col1/field"/>
		<html:hidden property="ReceiveArchive/_order/col1/asc" />
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="WFWorkItem/submitType" />
		
		<html:hidden property="WFWorkItem/workItemID" />
		
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		
		
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		<html:hidden property="ReceiveArchive/receiveID" />
		<html:hidden property="ReceiveArchive/participant" />
		<html:hidden property="ReceiveArchive/passParticipant" />
		
		
		
	  </td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<!--<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>-->
			<!------------------------------  ��ͷ  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">�����е�У���ĳ�����</td></tr>
			</table>
			<!------------------------------  �����  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="9%" height="25" align="center" nowrap class="td1">���ĵ�λ��</td>
				<td colspan="2" nowrap class="td1"> 
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="ReceiveArchive/archiveUnit" styleClass="inputOA" maxlength="25" attributesText='style="width:96%;" ValidateType="notempty" Msg="���ĵ�λ����Ϊ��"' onmousedown="menuControl('archiveUnits',1)" onmouseout="menuControl('archiveUnits',0)"/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="ReceiveArchive/archiveUnit"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">������ </td>
				<td width="11%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX5">
				&nbsp;<html:text property="ReceiveArchive/archiveNum" styleClass="inputOA" attributesText='style="width:86%;" ValidateType="notempty,int" Msg="����Ϊ��;��������������"'/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
				&nbsp;<bean:write property="ReceiveArchive/archiveNum"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">�ܼ���</td>
				<td width="12%" nowrap class="td1"> 
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="ReceiveArchive/secretLevel"> 
				  <html:option value="0">����</html:option> <html:option value="1">����</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">����</html:option> 
				  </html:select> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="ReceiveArchive/secretLevel" disabled="true"> 
				  <html:option value="0">����</html:option> <html:option value="1">����</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">����</html:option> 
				  </html:select>
				</logic:notEqual>
				</td>
				<td width="9%" align="center" nowrap class="td1">�����̶ȣ�</td>
				<td width="13%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="ReceiveArchive/timeLevel"> 
				  <html:option value="0">����</html:option> <html:option value="1">�Լ�</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">�ؼ�</html:option> 
				</html:select> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="ReceiveArchive/timeLevel" disabled="true"> 
				  <html:option value="0">����</html:option> <html:option value="1">�Լ�</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">�ؼ�</html:option> 
				</html:select>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�ռ����ڣ�</td>
				<td width="25%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				<html:text property="ReceiveArchive/archiveDate[@pattern='yyyy-MM-dd']" styleClass="inputOA" attributesText='width:95%;" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')"/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="ReceiveArchive/archiveDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				</logic:notEqual>
				</td>
				<td width="9%" align="center" nowrap class="td1">���ı�ţ�</td>
				<td colspan="4" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="ReceiveArchive/archiveCode" styleClass="inputOA" maxlength="25" attributesText='width:96%;" ValidateType="notempty" Msg="���ı�Ų���Ϊ��"' onmousedown="menuControl('prefixs',1)" onmouseout="menuControl('prefixs',0)"/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="ReceiveArchive/archiveCode"/>
				</logic:notEqual>
				</td>
				<td align="center" nowrap class="td1">�� �� �ˣ�</td>
				<td nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="ReceiveArchive/chenPiMan" styleClass="inputOA" maxlength="25" attributesText='style="width:88%;" ValidateType="notempty" Msg="�����˲���Ϊ��"'/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="ReceiveArchive/chenPiMan"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�ļ����⣺</td>
				<td colspan="8" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="ReceiveArchive/archiveTitle" styleClass="inputOA" maxlength="200" attributesText='ValidateType="notempty" Msg="�ļ����ⲻ��Ϊ��"' />
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="ReceiveArchive/archiveTitle"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				      <tr height="10px" valign="top">
				        <td width="80%" align="left" valign="top" class="divwf1">���칫���쵼�����</td> 
				        <td width="20%" align="center" valign="top"><a href="javascript:gotoText();" class="divwf1"><u><font color="red">���������ġ�</font></u></a></td>
				      </tr>
				      <tr><td valign="top" class="divwf2">
						<fcc:wfdata name="niBanOption" wfnode="DX2,DX3" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="ReceiveArchive/activityDefID" cols="100%" rows="4" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
					    
				      </td></tr>
				    </table>			
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">��У�쵼��ʾ�����</div>
					<div class="divwf2">
					<fcc:wfdata name="chuanYue" wfnode="DX5" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="ReceiveArchive/activityDefID" cols="100%" rows="4" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
					</div>
				</td>
			 
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">�������Ա���������</div>
					<div class="divwf2">
					<fcc:wfdata name="qiTa" wfnode="DX8" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="ReceiveArchive/activityDefID" cols="100%" rows="4" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
					</div>
				</td>
			  </tr>
			  <!------------------------------  ������ת  ��ʼ ----------------------------->
			  <tr valign="top"> 
				<td colspan="9" nowrap>
		   
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" scrolling="auto" style=" height: 180"></iframe>	
		  </td>
          
        </tr>
        <!--<logic:equal property="WFWorkItem/activityDefID" value="DX5">
        <% int z=0; %>
        <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<tr> 
          <td width="19%" align="right" nowrap class="td2"><bean:write id="resultset" property="Activity/actDefName"/>��</td>
          <td width="81%" class="td1">
		  <INPUT type="text" id="pn<%=z %>" style="width:80%;border:1 #efefef soild;" readonly>
		  <input type="hidden" id="p<%=z %>"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipantById('<bean:write id="resultset" property="Activity/actDefID"/>','<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','pn<%=z %>','p<%=z %>')">
		  </td>
        </tr>
        <%z++; %>
		</logic:iterate>
        <input type="hidden" id="cnt" value="<%=z %>"/>
        <input type="hidden" id="ReceiveArchive/nextParticipantId" name="ReceiveArchive/nextParticipantId"/>
        <input name="Flow/nextNode" type="hidden"/>
        </logic:equal>
        <logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����תѡ��</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> onclick="returnNameNull('<%=i%>')"><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
        </logic:notEqual>
        <logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
        <logic:notEqual property="WFWorkItem/activityDefID" value="DX6">
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����Աѡ��</td>
          <td class="td1">
		  <html:text property="ReceiveArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="ReceiveArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','ReceiveArchive/nextParticipantName','ReceiveArchive/nextParticipantId')">
		  </td>
        </tr>
         </logic:notEqual>
         </logic:notEqual>-->
         
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����תѡ��</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<%
		  	 String actDefID=base.util.TalentContext.getValue(pageContext,"resultset","Activity/actDefID");
		  	 String passedNode=base.util.TalentContext.getValue(pageContext,null,"ExtendData/PassedNode/Node");
		  	 if(actDefID.equals(passedNode)){
		  	 	if(i==0){
		  	 		display=false;
		  	 	}
		  	 %>
		  	<input name="Flow/nextNode" onclick="selDisplay(this)" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> style="display: none;" >
		  	<%}else{ 
		  	%>
		  	<input name="Flow/nextNode" onclick="selDisplay(this)" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
		  	<%} %>
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
		<tr id="trDisplay"> 
          <td width="19%" align="right" nowrap class="td2">�»�����Աѡ��</td>
          <td width="81%" class="td1">
		  <!--<html:text property="ReceiveArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="ReceiveArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','ReceiveArchive/nextParticipantName','ReceiveArchive/nextParticipantId')">-->
		  
		  <%if(display){ %>
		  <html:text property="ReceiveArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="ReceiveArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','ReceiveArchive/nextParticipantName','ReceiveArchive/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="ReceiveArchive/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="ReceiveArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','ReceiveArchive/nextParticipantName','ReceiveArchive/nextParticipantId')">
		  <%} %>
		  </td>
        </tr>
      </table>
      
				</td>
			  </tr>
                       <!------------------------------  ������ת  ���� ----------------------------->
			  <tr valign="top"> 
				<td colspan="9" nowrap> 
	            <table id="tail" width="100%" height="40"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				<tr>
				  <td align="center">
				
				<input name="wfsend" type="button" class="button_02" value="�� ��" onClick="send()">
                <logic:equal property="WFWorkItem/activityDefID" value="DX6">
                	<script>
                		document.getElementById('wfsend').value='��������';
                	</script>
                </logic:equal>
				  <%
				  	act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
				  	if ("DX2,DX3".indexOf(act)>=0){
				  %>
				  <input name="wfreturn" type="button" class="button_02" value=" �� �� " onClick="returnNode()">
				  <%} %>		
				  <input name="wfsave" type="button" class="button_02" value="�� ��" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
				</tr>
                </table>
				</td>
			  </tr>
			</table>
				  
		  
		 
		   
      
			<!------------------------------  �༭����  ----------------------------->
			  
			  
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
			  <logic:equal property="WFWorkItem/activityDefID" value="DX1">
			    <tr> 
				  <td width="14%" height="30px" align="right" nowrap class="td2">
				  <img src='/internet/image/mail_atth.gif' height='16px' width='16px' align='absmiddle' style='cursor:hand' onclick="insertFile();">&nbsp;<a href="#" onClick="insertFile();">��Ӹ���</a>&nbsp;
				  <input type="hidden" name="filepath" value="archivereceive"/>
				  <input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="archive">
				  <input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
				  </td>
				  <td colspan="3" class="td1">
				  	<table width="100%" id="fjtable">
					</table>
				  </td>
				</tr>
				<tr> 
				  <td width="14%" align="right" nowrap class="td2"><img src='/internet/image/smy.gif' height='15px' width='20px' align='absmiddle'>&nbsp;ɨ������&nbsp;</td>
				  <td colspan="3" width="100%" height="30px" align="left" valign="middle" class="td1">&nbsp;
				  <INPUT type="radio" name="scanType" value="0" checked="checked">��ҳ�ĵ�&nbsp;
				  <INPUT type="radio" name="scanType" value="1">��ҳ�ĵ�&nbsp;
				  <INPUT type="button" class="button_02" value="��ʼɨ��" onClick="return btnAcquire_onclick();">&nbsp;
				  <A href="/internet/download/WebTWAIN3.0.3 setup.exe">�����ؿؼ���װ��</A>
				  </td>
				</tr>
				</logic:equal>
				<tr><td colspan="4">
				<table width="100%" height="600px" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" border="0">
				<tr><td width="90%" height="100%" align="center" valign="top" class="td1" >
				<div style="height:600px;overflow:auto"><img id="fullImage" src="/internet/image/smy.gif" style="cursor:hand;" title="�����ɷŴ�" onclick="viewAllImg(this)" ></div>
				</td>
				<td align="left" valign="top" width="10%" height="100%" class="td1">
				<table width="100%" id="scanImgTb" align="center" cellpadding="2" cellspacing="14" bgcolor="#FFFFFF" border="0">
				<%
									 int count=0;
									 String trClass = "result_content"; 
						  
								%>
							<logic:iterate id="resultset" property="list[@type='wfattachment']"> 
								<%
								  String filepath = "/internet/";
								  String className = "";
						          filepath += base.util.TalentContext.getValue(pageContext,"resultset","FlowAttachment/filePath");
						          
									if (count == 0) className = "red"; else className = "#CCCCCC";
									count++;
								%>
							<tr class="<%=trClass%>">
							  <td id="scanTd<%=count%>" bgcolor="<%=className%>" style="font-size:12px;" align="center" valign="top" width="100%" nowrap>
							  <img id="scanImage<%=count%>" width="70px" height="90px" src="<%=filepath%>" style="cursor:hand" onclick="showFullImg(<%=count%>,'<%=filepath%>')"><br><b><bean:write id="resultset" property="FlowAttachment/fileName"/></b>
							  </td>
							</tr>
							</logic:iterate> 
				</table>
				</td>
				</tr>
				</table>
				</td></tr>
				<tr valign="top"> 
				<td width="100%" colspan="4" height="30" align="center" valign="middle" class="td1">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="document.getElementById('tab1c_tabcon1').click()">
				</td>
			    </tr>
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
     
     <object classid="clsid:D043D337-61FF-4BC4-807B-B3551BDD788B" id="Twain" width="0" height="0" codebase="">
      <param name="_cx" value="32">
      <param name="_cy" value="32">
      <param name="JpgQuality" value="80">
      <param name="Manufacturer" value="DynamSoft Corporation">
      <param name="ProductFamily" value="Dynamic Web TWAIN">
      <param name="ProductName" value="Dynamic Web TWAIN">
      <param name="VersionInfo" value="Dynamic Web TWAIN 2.0">
      <param name="TransferMode" value="0">
      <param name="BorderStyle" value="0">
      <param name="FTPUserName" value>
      <param name="FTPPassword" value>
      <param name="FTPPort" value="21">
      <param name="HTTPUserName" value>
      <param name="HTTPPassword" value>
      <param name="HTTPPort" value="80">
      <param name="ProxyServer" value>
    </object>
</form>
<div id="archiveUnits" style="position:absolute; top:301px; width:375px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="archiveUnits" property="list[@type='archiveUnits']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='archiveUnits' property='archiveUnits/archiveUnit'/>');"><bean:write id='archiveUnits' property='archiveUnits/archiveUnit'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="pubLemma" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');"><bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="prefixs" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="prefixs" property="list[@type='prefixs']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='prefixs' property='prefixs/DESCRIPTION'/>');"><bean:write id='prefixs' property='prefixs/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<form id="rollback" method="post" action="oa.prReceiveArchive.receiveRollback.do">
<html:hidden property="WFWorkItem/processInstID"/>
<INPUT type="hidden" id="title" name="title" value="<bean:write property='ReceiveArchive/archiveTitle'/>">
<html:hidden property="tableName" value="ReceiveArchive"/>
<html:hidden property="type" value="inprocess"/>
</form>
</body>
<script>
    var oldImgCount=1;
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
	if (document.getElementById("scanImage1") != undefined) {
	   document.getElementById("fullImage").src = document.getElementById("scanImage1").src;
       setTimeout("exFullImgZoom();",1000);
	}
</script>

<script>
function rollback() {
	var frm = document.forms["rollback"];
	frm.submit();
}

function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			//if(getRadioValue("Flow/nextNode")!="EndActivity"){
				//if(frm.elements["ReceiveArchive/nextParticipantId"].value == ""){
					//alert("��ѡ���»�����Ա");
					//return;
				//}
			//}
			getWFData(frm);
			frm.submit();	
		}

}
<% if ("DX2,DX3".indexOf(act)>=0){ %>
function returnNode(){
	var isSure = confirm('�Ƿ񲵻�����?');
	if(isSure==true){
		var newValue='<bean:write property="ExtendData/PassedNode/Node"/>';
		selRadioByValue("Flow/nextNode",newValue);
		document.getElementById('ReceiveArchive/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('ReceiveArchive/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>

function selDisplay(obj){
	var v=obj.value;
	if(v=='EndActivity'){
		document.getElementById('trDisplay').style.display='none';
	}else{
		document.getElementById('trDisplay').style.display='block';
	}
}

function send() {
	<logic:equal property="WFWorkItem/activityDefID" value="DX5">
	/**var cnt=document.getElementById('cnt').value;
	var pid='';
	for(var i=0;i<cnt;i++){
		var tmp='p'+i
		if(document.getElementById(tmp)!=undefined){
			if(i==0){
				pid=pid+document.getElementById(tmp).value;
			}else{
				pid=pid+','+document.getElementById(tmp).value;
			}
		}
	}
	document.getElementById('ReceiveArchive/nextParticipantId').value=pid;**/
	</logic:equal>
	var frm = document.forms[0];
	var attachs = document.getElementsByName("file");
	
	if (frm.elements["WFWorkItem/activityDefID"].value == 'DX1' && document.getElementById("image1")==undefined) {
	var tableContent=document.getElementById('scanImgTb').innerHTML;
	if(tableContent==""){
	if (frm.elements["list[@name='attachList']/attach[@hciTagIndex='1']"] == undefined && frm.elements["file"] == undefined) {
	   alert("��ɨ�����Ļ��븽�����ͣ�");
	   return false;
	}	
	}
	
	if (frm.elements["file"] != undefined) {
	
	
	if (frm.elements["file"].value == '') {
	   alert("��������Ϊ�գ��뵼�븽�����ͣ�");
	   return false;
	} 
	for (var i=0;i<attachs.length;i++) {
	    var filepath = attachs[i].value
	    var ext = filepath.substring(filepath.indexOf(".")+1,filepath.length);
	    //alert(ext);
	    if ("JPG,BMP,GIF,PNG,TIF,jpg,bmp,gif,png,tif".indexOf(ext)<0) {
	       alert("���ϴ���ʽΪJPG��BMP��GIF��PNG��TIF��ͼƬ������");
	       return false;
	    }
	}
	
	}
	}
	
	
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if("<%=act %>"!="DX5"){
			    if(getRadioValue("Flow/nextNode")!="EndActivity"){
					if(frm.elements["ReceiveArchive/nextParticipantId"].value == ""){
						alert("��ѡ���»�����Ա");
						return false;
					}
				}
			}
			getWFData(frm);
			frm.submit();	
		}

}

function showFullImg(count,imgPath) {
   var frm = document.forms[0];
   var oldTd = "scanTd"+oldImgCount;
   var oldImg = "scanImage"+oldImgCount;
   var newTd = "scanTd"+count;
   var newImg = "scanImage"+count;
   
   oldImgCount = count;
   frm.fullImage.src = imgPath;
   document.getElementById(oldTd).style.backgroundColor  = "#CCCCCC";
   document.getElementById(newTd).style.backgroundColor  = "red";
}

function viewAllImg(img) {
   var windowObj = window.open("","viewImg","fullscreen=1,resizable=1,scrollbars=1,titlebar=1");
   var html = "<body><img id='fullImage' title='�����رմ��ڣ�' src='/internet/image/smy.gif' border='0' onClick='window.close();'></body>";
   
   windowObj.document.writeln(html);
   var imgObj = windowObj.document.getElementById("fullImage");
   imgObj.src = img.src;
   var oWidth = img.width;
   var oHeight = img.height;
   
   if (oWidth<=500 && oHeight<=500) imgObj.style.zoom="100%";
   else if ((oWidth>500 && oWidth<=1000) || (oHeight>500 && oHeight<=1000)) imgObj.style.zoom="100%";
   else if ((oWidth>1000 && oWidth<=1500) || (oHeight>1000 && oHeight<=1500)) imgObj.style.zoom="70%";
   else if ((oWidth>1500 && oWidth<=2000) || (oHeight>1500 && oHeight<=2000)) imgObj.style.zoom="50%";
   else if ((oWidth>2000 && oWidth<=2500) || (oHeight>2000 && oHeight<=2500)) imgObj.style.zoom="40%";
}

//��Сԭͼ
function exFullImgZoom() {
var fullimg = document.getElementById("fullImage");
var oWidth = fullimg.width;
var oHeight = fullimg.height;
   
if (oWidth<=500 && oHeight<=500) fullimg.style.zoom="100%";
else if ((oWidth>500 && oWidth<=1000) || (oHeight>500 && oHeight<=1000)) fullimg.style.zoom="70%";
else if ((oWidth>1000 && oWidth<=1500) || (oHeight>1000 && oHeight<=1500)) fullimg.style.zoom="50%";
else if ((oWidth>1500 && oWidth<=2000) || (oHeight>1500 && oHeight<=2000)) fullimg.style.zoom="35%";
else if ((oWidth>2000 && oWidth<=2500) || (oHeight>2000 && oHeight<=2500)) fullimg.style.zoom="26%";
}

//��СԤ��ͼ
function exImgZoom() {
var images = document.getElementsByTagName("img");

   for (var i=0;i<images.length;i++) {
      var image = images[i];

      if (image.id.indexOf("scanImage")>=0) {
         var oWidth = image.width;
         var oHeight = image.height;

         if (oWidth<=200 && oHeight<=200) image.style.zoom="10%";
         else if ((oWidth>200 && oWidth<=400) || (oHeight>200 && oHeight<=400)) image.style.zoom="8%";
         else if ((oWidth>400 && oWidth<=600) || (oHeight>400 && oHeight<=600)) image.style.zoom="8%";
         else if ((oWidth>600 && oWidth<=800) || (oHeight>600 && oHeight<=800)) image.style.zoom="6%";
         else if ((oWidth>800 && oWidth<=1000) || (oHeight>800 && oHeight<=1000)) image.style.zoom="5%";
         else if ((oWidth>1000 && oWidth<=2000) || (oHeight>1000 && oHeight<=2000)) image.style.zoom="3%";
         else if ((oWidth>2000 && oWidth<=4000) || (oHeight>2000 && oHeight<=4000)) image.style.zoom="2%";
         
         image.style.border = "2";
         image.style.borderColor = "red";

      } 
   }
}

function gotoText() {
   document.getElementById('tab1c_tabcon2').click();
   document.getElementById('tab1c_tabbar1').className = 'tbottom4';
}
</script>
<script language="javascript">
function menuControl(obj,show)
{
window.event.cancelBubble=true;
inputobj = event.srcElement;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+obj+")");
}
else
{
eval("hideMenu("+obj+")");
}


}

var nbottom=0,speed=11;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{var parent = event.srcElement;
obj.style.display="block";
//obj.style.clip="rect(0 0 0 0)";
obj.style.top = ylib_getPageY(parent)+18;
obj.style.left = ylib_getPageX(parent);
//nbottom=5;
//displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}

function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
 
function setValue(value) {
inputobj.value = inputobj.value + value;
}
//ѡ���»�����תѡ�񣬲�ͬʱ����»�����Աѡ������
function returnNameNull(i){
 var frm = document.forms[0];
 var v_radios = frm.elements["ReceiveArchive/nextParticipantName"];
 
 v_radios.value="";
}
</script>