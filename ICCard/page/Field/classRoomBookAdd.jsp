<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
  var pageSelectedClassroom = new Array();
  //����|���|����ID|��������
  function showSelectClassroom(){  
	var tblSelectClassroomPane = document.all.selectClassroomPane;
	if (pageSelectedClassroom.length>0){
		//��������б�
		var rows = tblSelectClassroomPane.rows.length;
		for(j=rows-1;j>0;j--){
			tblSelectClassroomPane.deleteRow(j);
		}
	}
	for(i=0;i<pageSelectedClassroom.length;i++){
		var row = tblSelectClassroomPane.insertRow();
		row.className = "td1";
		var rowData = pageSelectedClassroom[i].split("|");
		var cell = row.insertCell();
		cell.insertAdjacentText("AfterBegin",rowData[0]);

		cell = row.insertCell();
		noon = "";
		if (rowData[1]==0){
			noon = "����";
		}
		if(rowData[1]==1){
			noon = "����";
		}
		if(rowData[1]==2){
			noon = "����";
		}
		cell.insertAdjacentText("AfterBegin",noon);

		cell = row.insertCell();
		cell.insertAdjacentText("AfterBegin",rowData[3]);
		
	}
  }
  
  
  function autoReadBookInfo(){
		try{
			var opener = window.opener;
			var selectpage = opener.parent["bottomFrame"].document;
			var freeclassroom = selectpage.all.freeclassroom;
			var array = new Array();
			if(typeof(freeclassroom)!="undefined"){
				for(i=0;i<freeclassroom.length;i++){
					if(freeclassroom[i].checked){
						array[array.length] = freeclassroom[i].value;
						
					}
				}
			}

			if(array.length>0){
				var firstNoon = array[0];
				var firstDate = firstNoon.substring(0,firstNoon.indexOf("|"));
				document.all["ClassroomBusinessRec/UsingDate"].value = firstDate;
				for(i=0;i<array.length;i++){
					pageSelectedClassroom[pageSelectedClassroom.length] = array[i];
				}
				showSelectClassroom();
			}
		}catch(exception){}
	}


</script>



<form method="post"  action="ICCard.prField.classRoomBookAddDo.do">
<div style="display:none" id="usingClassLogsPane"></div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ���ع��� -&gt; �ͻ����� -&gt; �ͻ����� -&gt; ����Ԥ��</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="10%" align="center" bgcolor="#4A82D1" class="textb_wirte">����Ԥ��</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="80%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<html:hidden property="ClassroomBusinessRec/Status" value="3"/>
        <tr> 
          <td align="right" class="td2">ʹ�õ�λ�� </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/UsingOrgan"   maxlength="100" attributesText='class="input" size="50"'/> </td> 
           </tr>
        <tr> 
          <td align="right" class="td2">ʹ�����ڣ� </td> 
          <td class="td1" ><html:text property="ClassroomBusinessRec/UsingDate" attributesText='class="input" size="12"  ValidateType="notempty" Msg="ʹ�����ڲ���Ϊ��"' readonly="true"/> <span class="text_red">*</span>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassroomBusinessRec/UsingDate"],"yyyy-MM-dd")></td>
        </tr>
        <tr> 
          <td align="right" class="td2">�� ϵ �ˣ� </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/LinkMan"  maxlength="100" attributesText='class="input" size="25"  ValidateType="notempty" Msg="��ϵ�˲���Ϊ��"'/><span class="text_red">*</span></td>
        </tr>
          <tr> 
          <td align="right" class="td2">��ϵ�绰�� </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/LinkTel"  maxlength="50" attributesText='class="input" size="25" '/></td>
        </tr>
          <tr> 
          <td align="right" class="td2">��Ч֤�����ƣ� </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/PassPortName"  maxlength="50" attributesText='class="input" size="25" '/></td>
        </tr>
        <tr> 
          <td align="right" class="td2">֤�����룺 </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/PassPortNumber"  maxlength="50" attributesText='class="input" size="25" '/></td>
        </tr>
          <tr> 
          <td align="right" class="td2">Ԥ��� </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/PreWorth"   attributesText='class="input" size="10" ValidateType="money" Msg="Ԥ�������Ϊ����"'/></td>
        </tr>
          <tr> 
          <td align="right" class="td2">�Ƿ�ʹ�ÿյ���</td>
          <td class="td1" ><html:radio property="ClassroomBusinessRec/IsUseAirConditioning" value="1" />��
							<html:radio property="ClassroomBusinessRec/IsUseAirConditioning" value="0"  />��</td>
        </tr>
          <tr> 
          <td align="right" class="td2">��&nbsp;&nbsp;&nbsp; ;�� </td>
          <td class="td1" ><html:textarea property="ClassroomBusinessRec/Purpose" rows="5" cols="40"  /></td>
        </tr>
          <tr> 
          <td align="right" class="td2">�� �� �ˣ� </td>
          <td class="td1" ><input type="text"  name="ClassroomBusinessRec/BookActionMan" value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>' maxlength="50"   class="input" size="10"  ValidateType="notempty" Msg="�����˲���Ϊ��"/> <span class="text_red">*</span></td>
        </tr>
                  <tr> 
          <td align="right" class="td2">����ʱ�䣺 </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/SysBookTime"   attributesText='class="input" size="25" ValidateType="notempty" Msg="����ʱ�䲻��Ϊ��"'/> <span class="text_red">*</span></td>
        </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="window.close()"></td>
            </tr>
          </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="selectClassroomPane">
                <tr class="td_title"> 
                  <td width="20%" align="center" nowrap id="ClassroomBusinessRec.ClassroomBusinessRecName" onClick="talentsort()">ʱ��</td>
                  <td width="20%" align="center" nowrap id="ClassroomBusinessRec.LayerNum" onClick="talentsort()">����ʱ��</td>
                  <td width="60%" align="center" nowrap id="ClassroomBusinessRec.RoomNum" onClick="talentsort()">��������</td>
                
                </tr>

				
              </table>  
          
          
          
          </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
 function save(){
	var pane = document.all.usingClassLogsPane;
	var frm = document.forms[0];
	if (validater(frm)){
		if (pageSelectedClassroom.length>0){
			for(i=0;i<pageSelectedClassroom.length;i++){
				var temparray = pageSelectedClassroom[i].split("|");
				innerHTML = "<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/UsingDate[@pattern='yyyy-MM-dd']\" value=\""+temparray[0]+ "\"/>";
				innerHTML +="<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/UsingNoon\" value=\""+temparray[1]+ "\"/>";
				innerHTML +="<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/RoomID\" value=\""+temparray[2]+ "\"/>";
				pane.innerHTML += innerHTML;
			}
			frm .submit();
		}else{
			alert("��ѡ�������ң�");
		}
	}
 }
  
  
	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "ICCard.prField.buildingList.do";
	}
	
	
	function  fillCurrentTime(){
		var curTime = new Date();
		var curDateStr = "";
		var curTimeStr = "";
		var form = document.forms[0];
		var datetime = form["ClassroomBusinessRec/SysBookTime"].value;
		if(datetime==""){
			//����Ϊ��ǰʱ��
             var month = curTime.getMonth()+1;
			if (month<10){
					month = "0"+month;
			}
			var curDateOfMonth = curTime.getDate();
			if (curDateOfMonth<10){
				curDateOfMonth = "0"+curDateOfMonth;
			}
			curDateStr = curTime.getFullYear()+"-"+month+"-"+curDateOfMonth;

			var hours = curTime.getHours();
            if (hours<10){
				hours = "0"+hours;
			}
			var minutes = curTime.getMinutes();
			if(minutes<10){
				minutes = "0"+minutes;
			}
			var second = curTime.getSeconds();
			if(second<10){
				second ="0"+second;
			}
			curTimeStr =curDateStr+" "+ hours+":"+minutes+":"+second;
			form["ClassroomBusinessRec/SysBookTime"].value = curTimeStr;
			}
		}
	autoReadBookInfo();
	fillCurrentTime();
  </script>
  