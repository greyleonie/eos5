<%@include file="/internet/common.jsp"%>
<form method="post"  >
<div style="display:none" id="usingClassLogsPane"></div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���ع���&gt;
            <logic:notEqual  property="op" value="view" >���ҳ���</logic:notEqual>
            <logic:equal  property="op" value="view" >������Ϣ��ѯ</logic:equal>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>

<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>   
          <td height="15" class="text"   >
			 <table><tr> <td class="td1"> 
	        	 <logic:notEqual  property="op" value="view" >
					<qx:talentButton property="book" type="button" styleClass="button_02" value="����Ԥ��" onclick="showBookPane()" operation="DX_CARD_MANAGE_FIELD_CLASSROOM.DX_CARD_MANAGE_FIELD_CLASSROOM_BOOK"/>	
					<qx:talentButton property="cancel" type="button" styleClass="button_02" value="ȡ��Ԥ��" onclick="showCancelPane()" operation="DX_CARD_MANAGE_FIELD_CLASSROOM.DX_CARD_MANAGE_FIELD_CLASSROOM_CANCEL"/>
					<qx:talentButton property="checkout" type="button" styleClass="button_02" value="Ԥ������" onclick="showCheckOut()" operation="DX_CARD_MANAGE_FIELD_CLASSROOM.DX_CARD_MANAGE_FIELD_CLASSROOM_CHECKOUT"/>
					<qx:talentButton property="query" type="button" styleClass="button_eight" value="Ԥ����Ϣ��ѯ" onclick="showQueryPane()" operation="DX_CARD_MANAGE_FIELD_CLASSROOM.DX_CARD_MANAGE_FIELD_CLASSROOM_QUERY"/>
				
				</logic:notEqual> 
					 
				
	          
	          </td>
	          <td width="200" class="td1">��ǰ���ڣ�<font color="red"><bean:write property="input/CurrDate"/></font></td>
	          <td align="right">
	          <table width="200">
				<tr class="td3" ><td><table border="1" width="15" height="15"  bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_empty"  >��</td></tr> </table></td><td>����</td>
					<td><table border="1" width="15" height="15" bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_school">��</td></tr> </table></td><td>У��ʹ��</td>
					<td><table border="1" width="15" height="15" bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_other" >��</td></tr> </table></td><td>����</td>
				</tr>
			</table>
	          </td></tr> </table>
		
		
		

			</td>
      </tr>
      <tr>
        <td valign="top" class="text">
        <% 
		int colPerRow = 7; //ÿ����ʾ������
		int j = 0; // ����ÿ����ʾ
	    %>
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" style="cursor:hand">	
	<logic:iterate iterateId="roomset" property="list[@type='Room']">
	<logic:notEqual id="roomset" property="Room/RoomName" value="">
		     <%if(j%colPerRow==0){%>
		     	<tr>
		     <%}%>
				<!--���ÿ�����ҵ�һ��-->
	 			<TD class="td3">
				<TABLE BORDER=0 align=right width='100%'  cellpadding="0" cellspacing="0">
					<TR  class="td3">	 
				
				<!--���ҵ�Ԫ-->
		
				<TD  onmouseover='doMsg(this)' onmouseout='doHidePane()' onclick='doClick(this)' align="center" nowrap="nowrap"  style="font-weight:500">
				<input type='hidden' value='¥��:<bean:write id="roomset" property="Room/BuildingName"/><BR>¥��:<bean:write id="roomset" property="Room/LayerNO"/><BR>��λ��:<bean:write id="roomset" property="Room/SeatNum"/><BR>'/>
				<input type='hidden' value='<bean:write id="roomset" property="Room/RoomID"/>'/>
				<font  style="color: #114489;font-weight: bold;"><bean:write id="roomset" property="Room/RoomName"/></font>
				</TD>
				</TR>
				<TR>
				<TD>
				  <TABLE BORDER=0 align=center cellpadding="1" cellspacing="2" width="100%">
				  <!--�����ʹ�����-->
				<TR  class="td3"    align="center"><TD  width="34%"  title='<bean:write id="roomset" property="Room/Morning"/>' class='<logic:equal id="roomset" property="Room/MorningType" value="1">state_empty</logic:equal>
                  <logic:equal id="roomset" property="Room/MorningType" value="2">state_school</logic:equal>
                  <logic:equal id="roomset" property="Room/MorningType" value="3">state_other</logic:equal>'  >��</TD>	
				<!--�����ʹ�����-->
				<TD width="33%" title='<bean:write id="roomset" property="Room/Afternoon"/>' class='<logic:equal id="roomset" property="Room/AfternoonType" value="1">state_empty</logic:equal>
                  <logic:equal id="roomset" property="Room/AfternoonType" value="2">state_school</logic:equal>
                  <logic:equal id="roomset" property="Room/AfternoonType" value="3">state_other</logic:equal>'>��</TD>	
				<!--���ϵ�ʹ�����-->
				<TD width="33%" title='<bean:write id="roomset" property="Room/Night"/>' class='<logic:equal id="roomset" property="Room/NightType" value="1">state_empty</logic:equal>
                  <logic:equal id="roomset" property="Room/NightType" value="2">state_school</logic:equal>
                  <logic:equal id="roomset" property="Room/NightType" value="3">state_other</logic:equal>'>��</TD></TR>	
          </TABLE> 
       </TD>

					</TR>
				</TABLE>
			</TD>
	
				<% 
				j++;
				//�����β
				if(j%colPerRow==0){%>
					</TR>
				<%} %>

	</logic:notEqual>
	</logic:iterate>
	
	     <%
	     
	      //������β
			j = j%colPerRow;
			if(j<colPerRow&&j!=0){
				for(int x=j; x<colPerRow; x++){%>
					<TD class="td1">&nbsp;</TD>
				<%}%>
				</tr>
			<%}%>
			</table>
		
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>  
  </form>
<form name="frm2" method="post" >
</form>
  
  
  
  <div id="msgpane" style="display:none;position:absolute;z-index:100;font-size:9pt;border:1px inset #000000;background-color:#FAFAD2">
</div>
  <script>
	function doMsg(obj){
		var msgpane = document.all.msgpane;
		var msg = obj.children[0].value;
		msgpane.innerHTML = msg;
		msgpane.style.display = "";
		msgpane.style.top = event.y+document.body.scrollTop ;
		msgpane.style.left = event.x+document.body.scrollLeft;
	}

	function doHidePane(){
		var msgpane = document.all.msgpane;
		msgpane.style.display = "none";
	}

	var gSelectedTD = null;
	function doClick(obj){
		var parent = obj.parentElement.parentElement.parentElement.parentElement;
		parent.bgcolor = "#FF0000";
		if (gSelectedTD!=null){
			gSelectedTD.bgColor = "";
		}
		gSelectedTD = obj;
		obj.bgColor = "#FF0000";
		var roomid = obj.children[1].value;

		var frame = window.parent["bottomFrame"];
		var id = obj.children[1].value;
		var op = "<bean:write property="op"/>";
		var currDate = "<bean:write property="input/CurrDate"/>";
		frame.location.href = "ICCard.prField.classRoom4Month.do?input/RoomID="+id+"&op="+op+"&input/CurrDate="+currDate;
	}
	


	function showBookPane(){
		if (typeof(window.parent["bottomFrame"])!="undefined"){
			var selectpage = window.parent["bottomFrame"].document;
			var freeclassroom = selectpage.all.freeclassroom;
			var array = new Array();
			if(typeof(freeclassroom)!=undefined){
				for(i=0;i<freeclassroom.length;i++){
					if(freeclassroom[i].checked){
						array[array.length] = freeclassroom[i].value;
					}
				}
			}

			if(array.length>0){				
			
				var firstNoon = array[0];
				
				var roomParam = firstNoon.split("|");
				var roomObjID = roomParam[2];
				
		/*
				if(roomObjID==164&&curUserDepID!=8&&curUserDepID!=14){
					//���������Ļ���񴦰��ű���������ʾ���ܰ��ţ�					
					var msg = "�������������ĵ���Ա��\n���ܰ��ű������ĳ���ҵ��";					
					alert(msg);
					
					return;
				}
				*/
				
				var firstDate = firstNoon.substring(0,firstNoon.indexOf("|"));
				var curDateStr = getCurrentDate();
				if(firstDate>=curDateStr){				
					
					var selectDate = Date.parse();
								
					var url = "ICCard.prField.classRoomBookAdd.do";
					var orderform = createWindow(url,100,100,800,500);
				}else{
					alert("��ѡ���ڲ��������Ұ��Ų�������ȷ�ϡ�");
				}
			}else{
				alert("��ѡ����Ҫ������ʱ�Σ�");
			}
		}
		
	}
	function showCancelPane(){
		if (typeof(window.parent["bottomFrame"])!="undefined"){
			var selectpage = window.parent["bottomFrame"].document;
			var checkclassroom = selectpage.all.checkclassroom;
			var array = new Array();
			if(typeof(checkclassroom)!="undefined"){
				if(checkclassroom.length !=undefined){
				for(i=0;i<checkclassroom.length;i++){
					if(checkclassroom[i].checked){
						array[array.length] = checkclassroom[i].value;
					}
				}
			}else{
					if(checkclassroom.checked){
						array[0] = checkclassroom.value;
					}
				
				}
			

			if(array.length>0){				
				var pane = document.all.usingClassLogsPane;
				var frm = document.forms[0];
					for(i=0;i<array.length;i++){	
						innerHTML = "<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/UsingClassroomLogsID\" value=\""+array[i]+ "\"/>";		
						pane.innerHTML += innerHTML;
					}
					
			
				if(confirm("�Ƿ�ȷ��ȡ��ָ��Ԥ����¼��")==false){
						return ;
					}    	 
					frm.action = "ICCard.prField.classRoomBookCancelDo.do";
					frm.target = "_parent";
					frm .submit();
				
			}else{
				alert("��ѡ����ʵ�ʱ�Σ�");
			}
			
			}else{
				alert("��ѡ����ʵ�ʱ�Σ�");
			}
		}

	}
	function showCheckOut(){
	if (typeof(window.parent["bottomFrame"])!="undefined"){
			var selectpage = window.parent["bottomFrame"].document;
			var checkclassroom = selectpage.all.checkclassroom;
			var array = new Array();
			if(typeof(checkclassroom)!="undefined"){
				if(checkclassroom.length !=undefined){
				for(i=0;i<checkclassroom.length;i++){
					if(checkclassroom[i].checked){
						array[array.length] = checkclassroom[i].value;
					}
				}
			}else{
					if(checkclassroom.checked){
						array[0] = checkclassroom.value;
					}
				
				}
			

			if(array.length==1){	
			/*			
				var pane = document.all.usingClassLogsPane;
				var frm = document.forms[0];
					for(i=0;i<array.length;i++){	
						innerHTML = "<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/UsingClassroomLogsID\" value=\""+array[i]+ "\"/>";		
						pane.innerHTML += innerHTML;
					}
					
			*/
				var url = "ICCard.prField.classRoomCheckOut.do?input/LogsID="+array[0];
				var checkOuntForm = createWindow(url,100,100,800,500);
				
			}else{
				alert("ֻ��ѡ��һ��ʱ�Σ�");
				return;
			}
			
			}else{
				alert("��ѡ����ʵ�ʱ�Σ�");
			}
		}
	
	

	}
	function showQueryPane(){
		var url = "ICCard.prField.classRoomBookQuery.do";
		var checkOuntForm = createWindow(url,100,100,800,500);
	}	
	
	function  getCurrentDate(){
		var curTime = new Date();
		var curDateStr = "";
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
		return curDateStr;
			
		}
		
	
	
  </script>
  