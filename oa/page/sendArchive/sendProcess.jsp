<%@taglib uri="/WEB-INF/workflow.tld" prefix="workflow" %>
<%@include file="/internet/common.jsp"%>
<%
boolean writable = true;
String url="",url1="";
String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
String archiveTitle = base.util.TalentContext.getValue(pageContext,null,"SendArchive/archiveTitle");
String recordId = base.util.TalentContext.getValue(pageContext,null,"SendArchive/RecordID");
String username = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");

if (recordId != null && !"".equals(recordId)) { 
if ("DX3,DX5,DX61".indexOf(act)>=0)
    url = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=postil&RecordID="+recordId+"&EditType=3,1&ShowType=2&UserName="+username;
else if ("DX1,DX2,DX41,DX42".indexOf(act)>=0)
    url = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=2,0&ShowType=1&UserName="+username;
else if ("DX62".equals(act))
    url = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=0,0&ShowType=0&UserName="+username;
    url1 = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=1,0&ShowType=1&UserName="+username;
} else 
    url = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&SendArchive/archiveTitle=" + archiveTitle;

//�жϵ�ǰ�����Ƿ��ѱ���
//if (application.getAttribute("sendArchive"+recordId) != null && "open".equals((String)application.getAttribute("sendArchive"+recordId))) {
//    url = "/iWebOffice/SendArchive/DocumentEdit.jsp?Purview=edit&RecordID="+recordId+"&EditType=0,0&ShowType=0&UserName="+username;
//    writable = false;
//} else {
//    application.setAttribute("sendArchive"+recordId,"open");
//}
%>
<script>
var inputobj;
var canwrite = <%=writable%>;
var tabbox1 = new TabComponent("tab1c")
tabbox1.add("basedata","��������",1,"document.getElementById('tail').style.display = 'inline'")
tabbox1.add("attachment","�� ��",0,"document.getElementById('tail').style.display = 'none';promptTextStatus();")
//tabbox1.add("participant","������ת",0,"document.getElementById('tail').style.display = 'inline'")
</script>

<script>
var i=1 
function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='ɾ ��' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
}

function promptTextStatus() {
   if (!canwrite) alert("����������һ���˱༭���У���ֻ����ֻ����ʽ������");
}
</script> 


<body>
<form method="post" name="myform" action="oa.prSendArchive.sendProcessDo.do" enctype="multipart/form-data">
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
		
		<html:hidden property="SendArchive/sendID" />
		<html:hidden property="SendArchive/RecordID"/>
		<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
		<html:hidden property="SendArchive/archiveTitle"/>
		</logic:notEqual>
		<html:hidden property="SendArchive/participant" />
		<html:hidden property="SendArchive/passParticipant" />
		<html:hidden property="SendArchive/_order/col1/asc" />
		<html:hidden property="SendArchive/_order/col1/field"/>
		
			<html:hidden property="type"/>
		
	  </td>
    </tr>
  </table>
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
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">�����е�У���ĳ�����</td></tr>
			</table>
			<!------------------------------  �����  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td height="25" align="center" nowrap class="td1">���ı��⣺</td>
				<td colspan="8" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="SendArchive/archiveTitle" styleClass="inputOA" maxlength="200" attributesText='style="width:98%;" ValidateType="notempty" Msg="�ļ����ⲻ��Ϊ��"' /></td>
			    </logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="SendArchive/archiveTitle"/>
				</logic:notEqual>
			  </tr>
			  <tr>
				<td width="6%" align="center" nowrap class="td1">�ܼ���</td>
				<td width="12%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="SendArchive/secretLevel"> 
				  <html:option value="0">����</html:option> <html:option value="1">����</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">����</html:option> 
				  </html:select> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="SendArchive/secretLevel" disabled="true"> 
				  <html:option value="0">����</html:option> <html:option value="1">����</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">����</html:option> 
				  </html:select> 
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">�����̶ȣ�</td>
				<td width="13%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="SendArchive/timeLevel"> 
				  <html:option value="0">����</html:option> <html:option value="1">�Լ�</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">�ؼ�</html:option> 
				  </html:select>
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:select property="SendArchive/timeLevel" disabled="true"> 
				  <html:option value="0">����</html:option> <html:option value="1">�Լ�</html:option> 
				  <html:option value="2">����</html:option> <html:option value="3">�ؼ�</html:option> 
				  </html:select>
				</logic:notEqual>
				</td>
				<td width="6%" height="25" align="center" nowrap class="td1">���Ļ��أ�</td>
				<td nowrap width="15%" class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="SendArchive/sendOrgan" styleClass="inputOA" maxlength="25" attributesText='style="width:95%;" ValidateType="notempty" Msg="���Ļ��ز���Ϊ��"' onmousedown="menuControl('sendOrgan',1)" onmouseout="menuControl('sendOrgan',0)"/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="SendArchive/sendOrgan"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr>
				<td width="6%" align="center" nowrap class="td1">��岿�ţ�</td>
				<td colspan="3" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="SendArchive/draftDept" styleClass="inputOA" maxlength="25" attributesText='style="width:97%;" ValidateType="notempty" Msg="��嵥λ����Ϊ��"' onmousedown="menuControl('draftDept',1)" onmouseout="menuControl('draftDept',0)"/>
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="SendArchive/draftDept"/>
				</logic:notEqual>
				<td width="6%" height="25" align="center" nowrap class="td1">�� �� �ˣ�</td>
				<td nowrap width="15%" class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="SendArchive/drafter" styleClass="inputOA" maxlength="25" attributesText='style="width:65%;" ValidateType="notempty" Msg="����˲���Ϊ��"'/>
				<input name="receiver" type="button" class="button_02" value="ѡ��" elname="SendArchive/drafter,SendArchive/drafter" onClick="selectSysUser();">
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="SendArchive/drafter"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�ĺţ�</td>
				<td colspan="3" width="25%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<html:text property="SendArchive/archiveCode" styleClass="inputOA" maxlength="25" attributesText='style="width:96%;" ValidateType="notempty" Msg="�ĺŲ���Ϊ��"' onmousedown="menuControl('prefixs',1)" onmouseout="menuControl('prefixs',0)"/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<bean:write property="SendArchive/archiveCode"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">�������ڣ�</td>
				<td nowrap width="15%" class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<html:text property="SendArchive/sendDate[@pattern='yyyy-MM-dd']" styleClass="inputOA" attributesText='style="width:95%;" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')"/>
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
				&nbsp;<bean:write property="SendArchive/sendDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr>
			    <td width="6%" align="center" nowrap class="td1">���֣� </td>
				<td width="13%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<html:text property="SendArchive/printer" value="<%=username%>" styleClass="inputOA" attributesText='style="width:60%;" ValidateType="notempty" Msg="����Ϊ��"'/>
				<input name="receiver" type="button" class="button_02" value="ѡ��" elname="SendArchive/printer,SendArchive/printer" onClick="selectSysUser();">
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<bean:write property="SendArchive/printer"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">У�ԣ� </td>
				<td width="13%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<html:text property="SendArchive/corrector" value="<%=username%>" styleClass="inputOA" attributesText='style="width:60%;" ValidateType="notempty" Msg="У��Ϊ��"'/>
				<input name="receiver" type="button" class="button_02" value="ѡ��" elname="SendArchive/corrector,SendArchive/corrector" onClick="selectSysUser();"> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<bean:write property="SendArchive/corrector"/>
				</logic:notEqual>
				</td>
				<td width="6%" align="center" nowrap class="td1">��ӡ������ </td>
				<td width="15%" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<html:text property="SendArchive/sendNum" styleClass="inputOA" attributesText='style="width:96%;" ValidateType="notempty,int" Msg="����Ϊ��;��������������"'/> 
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<bean:write property="SendArchive/sendNum"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr>
				<td width="6%" align="center" nowrap class="td1">���͵�λ��</td>
				<td colspan="3" nowrap class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<html:text property="SendArchive/mainUnit" styleClass="inputOA" size="20" maxlength="50" attributesText='style="width:97%;" ValidateType="notempty" Msg="���͵�λ����Ϊ��"' />
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<bean:write property="SendArchive/mainUnit"/>
				</logic:notEqual>
				<td width="6%" height="25" align="center" nowrap class="td1">���͵�λ��</td>
				<td nowrap width="15%" class="td1">
				<logic:equal property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<html:text property="SendArchive/copyUnit" styleClass="inputOA" size="20" maxlength="50" attributesText='style="width:94%;" ValidateType="notempty" Msg="���͵�λ����Ϊ��"' />
				</logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				&nbsp;<bean:write property="SendArchive/copyUnit"/>
				</logic:notEqual>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				      <tr>
				        <td width="80%" align="left" valign="top" class="divwf1">�������쵼ǩ����</td> 
				        <td width="20%" align="center" valign="top"><a href="javascript:gotoText();" class="divwf1">���������ġ�</a></td>
				      </tr>
				      <tr><td>
					    <div class="divwf2">
						   <fcc:wfdata name="bumen" wfnode="DX3" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="SendArchive/activityDefID" cols="100%" rows="4" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
					    </div>
				      </td></tr>
				    </table>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">���ֹ��쵼ǩ����</div>
					<div class="divwf2">
					<fcc:wfdata name="zhuban" wfnode="DX5" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="SendArchive/activityDefID" cols="100%" rows="4" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
					</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">��У��Ҫ�쵼ǩ����</div>
					<div class="divwf2">
					<fcc:wfdata name="zhuguan" wfnode="DX61" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="SendArchive/activityDefID" cols="100%" rows="4" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
					</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">�������������</div>
					<div class="divwf2">
                    <fcc:wfdata name="others" wfnode="DX2,DX41,DX42,DX62" type="textarea" classname="inputOA" list="list[@type='wfdata']" domwfnode="SendArchive/activityDefID" cols="100%" rows="5" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/>
                    </div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap>
					<!------------------------------  ������ת  ��ʼ ----------------------------->
		   
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" style=" height: 200" scrolling="auto"></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����תѡ��</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  	boolean display=true;
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
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> style="display: none;" >
		  	<%}else{ 
		  	%>
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
		  	<%} %>
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
        <logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����Աѡ��</td>
          <td class="td1">
		  <!--<html:text property="SendArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="SendArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','SendArchive/nextParticipantName','SendArchive/nextParticipantId')">-->
		  <%if(display){ %>
		  <html:text property="SendArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="SendArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','SendArchive/nextParticipantName','SendArchive/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="SendArchive/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="SendArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','SendArchive/nextParticipantName','SendArchive/nextParticipantId')">
		  <%} %>
		  </td>
        </tr>
        </logic:notEqual>
      </table>
                     <!------------------------------  ������ת  ���� ----------------------------->
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap> 
	            <table id="tail" width="100%" height="40"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				<tr>
				  <td align="center" valign="middle">
				     <logic:notEqual property="WFWorkItem/activityDefID" value="DX62">
				     <input name="wfsend" type="button" class="button_02" value="�� ��" onClick="send()">
				     </logic:notEqual>
				  <%
				  	act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
				  	if ("DX3,DX5,DX61".indexOf(act)>=0){
				  %>
				  <input name="wfreturn" type="button" class="button_02" value=" �� �� " onClick="returnNode()">
				  <%} %>				  
                     <logic:equal property="WFWorkItem/activityDefID" value="DX62">
                     <input name="wfsend" type="button" class="button_02" value="��������" onClick="send()">
                     </logic:equal>
                     <!--<workflow:RollBack activityInstID="@WFWorkItem/activityInstID" buttonName="�� ��" buttonClass="button_02"></workflow:RollBack>-->
				     <input name="wfsave" type="button" class="button_02" value="�� ��" onClick="save()">
				     <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="history.back()">
				  </td>
				</tr>
                </table>
				</td>
			  </tr>
			</table>
				  
		  
		 
		   
      
			<!------------------------------  �༭����  ----------------------------->
			  
			  
			  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" id="attachment">
			    <logic:equal property="WFWorkItem/activityDefID" value="DX62">
			    <tr><td width="100%" height="35px" align="left" class="td2">&nbsp;
			    <html:select property="Template">
				  <html:option value="-1">--��ѡ���׺�ģ��--</html:option> 
                  <html:options property="list[@type='Template_Files']/Template_File/RecordID" labelProperty="list[@type='Template_Files']/Template_File/FileName"/> 
				  </html:select>&nbsp;
				  <INPUT type="button" class="button_02" value="�����׺�" onClick="lanternRed();">
			      <!--<INPUT type="button" class="button_02" value="��������" onClick="saveFile();">-->
			    </td></tr>
				</logic:equal>
				<tr><td width="100%" height="600px" align="center" class="td1">
				<iframe src='<%=url%>' frameborder="0" width="100%" id="sendText" name="sendText" style=" height: 100%" scrolling="no" disabled="true"></iframe>
				</td></tr>
				<tr valign="top"> 
				<td width="100%" height="40" align="center" valign="middle">
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
</form>
<div id="draftDept" style="position:absolute; top:301px; width:375px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="draftDepts" property="list[@type='draftDepts']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='draftDepts' property='draftDepts/draftDept'/>');"><bean:write id='draftDepts' property='draftDepts/draftDept'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="sendOrgan" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="sendOrgans" property="list[@type='sendOrgans']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='sendOrgans' property='sendOrgans/sendOrgan'/>');"><bean:write id='sendOrgans' property='sendOrgans/sendOrgan'/></a></td>
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
<form id="rollback" method="post" action="oa.prSendArchive.sendRollback.do">
<html:hidden property="WFWorkItem/processInstID"/>
<html:hidden property="title"/>
<html:hidden property="tableName" value="SendArchive"/>
<html:hidden property="type" value="inprocess"/>
</form>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>

<script>
var template = "";
var code = "";
function rollback() {
	var frm = document.forms["rollback"];
	frm.elements["title"].value = document.forms[0].elements["SendArchive/archiveTitle"].value;
	frm.submit();
}

function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			saveFile(false);
			setTimeout("document.forms[0].submit()",5000);
		}

}
<% if ("DX3,DX5,DX61".indexOf(act)>=0){ %>
function returnNode(){
	var isSure = confirm('�Ƿ񲵻�����?');
	if(isSure==true){
		var newValue='<bean:write property="ExtendData/PassedNode/Node"/>';
		selRadioByValue("Flow/nextNode",newValue);
		document.getElementById('SendArchive/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('SendArchive/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
	
	//if (frm.elements["SendArchive/RecordID"].value == '') alert("��������Ϊ�գ���༭������ͣ�");
	
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["SendArchive/nextParticipantId"].value == ""){
					alert("��ѡ���»�����Ա");
					return;
				}
			}
			//alert('aaa');
			getWFData(frm);
			saveFile(false);
			setTimeout("document.forms[0].submit()",5000);
		}

}

function lanternRed() {
var from = document.forms[0];
var templates = from.elements["Template"];

if (templates.options[templates.selectedIndex].value != '-1')
   template=templates.options[templates.selectedIndex].value;
else {
   alert("��ѡ���׺�ģ��!");
   return false;
}
if (from.elements["SendArchive/archiveCode"].value == '') { alert("�ĺŲ���Ϊ�գ������룡"); return false; }
if (from.elements["SendArchive/mainUnit"].value == '') { alert("���͵�λ����Ϊ�գ������룡"); return false; }
if (from.elements["SendArchive/copyUnit"].value == '') { alert("���͵�λ����Ϊ�գ������룡"); return false; }

setFileReadable(true);
setTimeout("editFile();",5000);
setTimeout("saveFile(true);",5000);
}

//���ã�������ǩֵ  vbmName:��ǩ���ƣ�vbmValue:��ǩֵ   ��ǩ����ע���Сд
function SetBookmarks(vbmName,vbmValue){
  var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
  if (!webOffice.WebSetBookmarks(vbmName,vbmValue)){
     alert(webOffice.Status);
  }
}

function saveFile(readonly) {
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
     alert(webOffice.Status);
     return false;
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   if (readonly) webform.elements["Readonly"].value="true";
   webform.submit();
}

function editFile() {
   var from = document.forms[0];
   var code = from.elements["SendArchive/archiveCode"].value;
   var mainUnit = from.elements["SendArchive/mainUnit"].value;
   var copyUnit = from.elements["SendArchive/copyUnit"].value;
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   
   webOffice.Template = template;
   webOffice.WebSetMsgByName("OPTION","LOADTEMPLATE");
   //alert(templates.options[templates.selectedIndex].value);
   if (webOffice.WebLoadTemplate()){                    //����OfficeServer��OPTION="LOADTEMPLATE"
       SetBookmarks("archiveCode",code);     //���ģ���ĺ�
       SetBookmarks("mainUnit",mainUnit);     //������͵�λ
       SetBookmarks("copyUnit",copyUnit);     //��䳭�͵�λ
       webOffice.WebSetMsgByName("COMMAND","INSERTFILE");
       if (!webOffice.WebInsertFile()){                   //��乫������   ����OfficeServer��OPTION="INSERTFILE"
         alert(webOffice.Status);
       }
   }else{
       alert(webOffice.Status);
   }
}

function setFileReadable(flag) {
   if (flag) {
      document.getElementById("sendText").src = "<%=url1%>";
   } else {
      document.getElementById("sendText").src = "<%=url%>";
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
 var v_radios = frm.elements["SendArchive/nextParticipantName"];
 
 v_radios.value="";
}

</script>