<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<script language="javascript" type="text/javascript" src="/internet/My97DatePicker/WdatePicker.js"></script>


<script>
var i=1 
 function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='ɾ ��' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
	}
</script> 


<body>
<form method="post" name="myform" action="oa.prMeetingManage.mrApplyAddDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;�������&gt;�������롪&gt;������������</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="MR_APPLY/_order/col1/field"/>
		<html:hidden property="MR_APPLY/_order/col1/asc" />
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
		
		
		
	  </td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>

		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>
			<!------------------------------  ��ͷ  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">������ί��У��������</td>
				</tr>
			</table>
			<!------------------------------  �����  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">�����ˣ�</td>
				<td width="40%" nowrap class="td1"> <bean:write property="SessionEntity/userName" />			</td>
				<td width="10%" align="center" nowrap class="td1">����ʱ�䣺 </td>
				<td width="40%" nowrap class="td1"> <html:text name="MR_APPLY/APPLYDATE[@pattern='yyyy-MM-dd']"   attributesText='class="Wdate" readonly="true"' onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" property="currentDate" size="20" />				 			</td>
			  </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�������ƣ�</td>
				<td colspan="3" nowrap class="td1"><html:text property="MR_APPLY/MeetingName"   attributesText='class="inputOA"  ValidateType="notempty" Msg="�������Ʋ���Ϊ��"' size="80" maxlength="100"/></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�������⣺</td>
			    <td colspan="3" nowrap class="td1"><html:text property="MR_APPLY/TOPIC"   attributesText='class="inputOA"' size="80" maxlength="100"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">����������</td>
			    <td colspan="3" nowrap class="td1"><html:textarea property="MR_APPLY/CENTRALTOPIC"  styleClass="inputOA"  attributesText='cols="78" rows="4"'/>
			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��֯�ˣ�</td>
			    <td colspan="3" nowrap class="td1">
			    <html:text property="organizer"   attributesText='class="inputOA"' size="80" maxlength="100" readonly="true"/>
			    <input type="hidden" id="MR_APPLY/Organizer" name="MR_APPLY/Organizer"/>
			    <input name="Submit2232" type="button" class="button_02"  elname="MR_APPLY/Organizer,organizer" value="ѡ��" onClick="selectSysUser('no')">			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ˣ�</td>
			    <td colspan="3" nowrap class="td1"><html:text property="MR_APPLY/Moderator"   attributesText='class="inputOA"' size="80" maxlength="100" readonly="true"/>
			    &nbsp;<input name="Submit2232" type="button" class="button_02"  elname="MR_APPLY/Moderator,MR_APPLY/Moderator" value="ѡ��" onClick="selectSysUser('yes')">			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��ϯ��Ա��</td>
			    <td colspan="3" nowrap class="td1"><html:text property="MR_APPLY/MRParticipants"   attributesText='class="inputOA"' size="80" maxlength="100" readonly="true"/>
			    	<input type="hidden" id="MRParticipantIDs" name="MRParticipantIDs"/>
			        <input name="Submit2232" type="button" class="button_02"  elname="MRParticipantIDs,MR_APPLY/MRParticipants" value="ѡ��" onClick="selectSysUser('no')">	  </td>
			</tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��ʼʱ�䣺</td>
			    <td nowrap class="td1"><html:text property="MR_APPLY/STARTDATE[@pattern='yyyy-MM-dd HH:mm']"   attributesText='class="Wdate" readonly="true"' onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="20" /></td>
		        <td align="center" nowrap class="td1">����ʱ�䣺</td>
		        <td nowrap class="td1"><html:text property="MR_APPLY/ENDDATE[@pattern='yyyy-MM-dd HH:mm']"   attributesText='class="Wdate" readonly="true"' onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="20" /></td>
	          </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ң�</td>
			    <td colspan="3" nowrap class="td1">
			    <html:hidden property="MR_APPLY/MRCODE"/>
			    <html:text property="MR_APPLY/MRNAME"   attributesText='class="inputOA"  ValidateType="notempty" Msg="����ص㲻��Ϊ��"' size="80" maxlength="100" readonly="true"/>
			    <input name="Submit2232" elname="MR_APPLY/MRCODE,MR_APPLY/MRNAME" type="button" class="button_02" value="ѡ��" onClick="selectMeetingRoom()">			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�쵼���������</td>
			    <td colspan="3" nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�칫�Ұ��������</td>
			    <td colspan="3" nowrap class="td1">&nbsp;</td>
		      </tr>
			</table>
				  
		  
		 
		   
      
		
			
			<!------------------------------  ��ת  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����תѡ��</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<input name="Flow/nextNode" type="radio"  value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����Աѡ��</td>
          <td class="td1">
		  <html:text property="MR_APPLY/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="MR_APPLY/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','MR_APPLY/nextParticipantName','MR_APPLY/nextParticipantId')">
		<workflow:AppointActivity workItemID="@WFWorkItem/workItemID"  maxPartiNum="10"  buttonName="ѡ��..."  isSelOrg="false"  isSelRole="false" isSelPerson="true"  uselessDisplay="true"/>  
		  
		  </td>
        </tr>
        
      </table>
			
			<table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>

		</tr>
		</td>
	</table> 
	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsend" type="button" class="button_02" value="�� ��" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="�� ��" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
				</tr>
     </table>
</form>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>

<script>
function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}

function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["MR_APPLY/nextParticipantId"].value == ""){
					alert("��ѡ���»�����Ա");
					return;
				}
			}
			getWFData(frm);
			var ret=data();
			if(ret!=null&ret=="1"){
  	          alert("������Ŀγ�ʱ���г�ͻ.�뵽������ʹ������鿴");
  	          return;
          	}
			frm.submit();	
			//alert(document.getElementById('MRParticipantIDs').value);
		}
}

function  data(){
     var frm = document.forms[0];
     var startdate=frm.elements["MR_APPLY/STARTDATE[@pattern='yyyy-MM-dd HH:mm']"].value;
     var enddate=frm.elements["MR_APPLY/ENDDATE[@pattern='yyyy-MM-dd HH:mm']"].value;
      var mrcode=frm.elements["MR_APPLY/MRCODE"].value;
  	var sub1 = new HiddenSubmit("oa.bizMeetingManage.mrApplyData");
  	sub1.add("STARTDATE", startdate);
  	sub1.add("ENDDATE", enddate);
  	sub1.add("MRCODE", mrcode);
  	if (sub1.submit()) {
  	var ret1 = sub1.getValue("root/return/code");
  	 return ret1;
  	
  	}
}
</script>