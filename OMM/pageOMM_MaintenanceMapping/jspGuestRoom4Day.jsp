<%@include file="/internet/common.jsp"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<%
String op = (String)request.getParameter("op");
 %>
	<form>
	<input  type="hidden" name="CurrDate" value="<bean:write property="input/CurrDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>" />
		<table align="center">
			<tr>
                  <input type='hidden' name="BuildingName" value='<bean:write property="input/BuildingName"/>'/>
  				
				<td nowrap class="td2">���������<select name="input/BuildingID" id="select1" bizAction="ICCard.bizField.selectBuilding2"
						paramXML="" listXpath="list[@type='Building']" entityName="Building" valueField="BuildingID"
						textField="BuildingName" childID="select2" nullLable="true"
						nullLableText="<bean:write property="input/BuildingName"/>"
						nullLableValue="<bean:write property="input/BuildingID"/>" onchange="refreshChild_DS(this),changeBuilding()"
						class="input">
					</select> ¥�㣺 <select name="input/LayerNO" id="select2" bizAction="ICCard.bizField.selectLayer2" paramXML=""
						listXpath="list[@type='LayerNO']" entityName="LayerNO" valueField="LayerNO" textField="LayerNO" childID=""
						mainSelectID="select1" nullLable="true" nullLableText="<bean:write property="input/LayerNO"/>"
						nullLableValue="<bean:write property="input/LayerNO"/>" onchange="doChange()" class="input">
					</select>
					<script language="JavaScript" type="text/JavaScript">

						initSel_DS(document.getElementById("select1"));
					</script>
				</td>
			</tr>
			<tr>
				<td class="td1">
					<table width="300">
						<tr class="td3">
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_empty"></td>
									</tr>
								</table>
							</td>
							<td>����</td>
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_school"></td>
									</tr>
								</table>
							</td>
							<td>У��ʹ��</td>
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_other"></td>
									</tr>
								</table>
							</td>
							<td>����</td>
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_book"></td>
									</tr>
								</table>
							</td>
							<td>Ԥ��</td>
						</tr>
					</table>
				</td>
			</tr>
		<tr>
        <td valign="top" class="text">
       <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail" style="cursor:hand">

				<%
		             int count=0;
		             int colPerRow =10;
			           String trClass = "td1"; 
		  
		  		%>
		  		<logic:iterate id="layerset" property="list[@type='LayerNO']">
		  		<%
		             count=0;
		  		%>
		  		<tr class="td1"><td colspan="10" align="center"><b><bean:write property="LayerNO/LayerNO" id="layerset"/>��</b></td></tr>
				<logic:iterate id="resultset" property="list[@type='Room']">
				<logic:equal id="resultset" property="Room/LayerNO" valueType="variable" valueId="layerset" value="LayerNO/LayerNO">
					<%
					if(count%colPerRow==0){	
			       %>
			       <tr> 
			    <%}%>
                  <td  height="25" align="center" width="10%"  onmouseover='doMsg(this)' onmouseout='doHidePane()' onclick='doClick(this)'   
                  class="
                  <logic:equal id="resultset" property="Room/State" value="4">state_book</logic:equal>
                  <logic:notEqual id="resultset" property="Room/State" value="4">
                  	<logic:equal id="resultset" property="Room/UsingType" value="1">state_empty</logic:equal>
                  	<logic:equal id="resultset" property="Room/UsingType" value="2">state_school</logic:equal>
                  	<logic:equal id="resultset" property="Room/UsingType" value="3">state_other</logic:equal>
                  </logic:notEqual>">
                  <input type='hidden' value=' ¥�㣺<bean:write id="resultset" property="Room/LayerNO" /> <br/> ��λ����<bean:write id="resultset" property="Room/SeatNum"/> <br/> �绰��<bean:write id="resultset" property="Room/Tel"/> <br/> <bean:write id="resultset" property="Room/UsingLogs"/>' />
                  <input type='hidden' value='<bean:write id="resultset" property="Room/UsingLogs" />'/>
                  <input type='hidden' name="Room/RoomID" value='<bean:write id="resultset" property="Room/RoomID" />'/>
                  <input type='hidden' name="Room/RoomName" value='<bean:write id="resultset" property="Room/RoomName" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/HousingLogsID" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/State" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/SeatNum" />'/>
                  <bean:write id="resultset" property="Room/RoomName" />
                <% 
				count++;
				//�����β
				if(count%colPerRow==0){%>
					</tr>
				<%} %>
				</logic:equal>
				</logic:iterate>
					<%
	      //������β
			count = count%colPerRow;
			if(count<colPerRow&&count!=0){
				for(int x=count; x<colPerRow; x++){%>
					<td class="td1">&nbsp;</td>
				<%}%>
				</tr>
				<%}%>
				</logic:iterate>
              </table>
		
		  </td>
      </tr>
      <tr>
      	<td class="td2" align="center"><font color="red">��ʾ:�������Ż�ȡ�����ʶ��</font></td>
      </tr>
		<tr>
			<td class="td2"  nowrap align="center"> 
			<!--<input name="B3" type="button" class="button_02" value="���" onclick="Confirm()">  -->
			<input name="B6" type="button" class="button_02" value="�ر�" onclick="cancel()"></td>
			<!--<TD width="8%" class="td2" nowrap align="right">&nbsp;</TD>
			<TD class="td1"><input name="B3" type="button" class="button_02" value="���" onclick="Confirm()"> 
			<input name="B6" type="button" class="button_02" value="�ر�" onclick="cancel()">
			</TD>-->
		</tr>
		</table>
	</form>
	
<form name="frm2" method="post" >
<html:hidden property="input/degree"/>
<html:hidden property="input/BeginDate"/>
<html:hidden property="input/EndDate"/>
</form>
  
  
  
  <div id="msgpane" style="display:none;position:absolute;z-index:100;font-size:9pt;border:1px inset #000000;background-color:#FAFAD2">
</div>
<script>
	var frm=document.forms[0];
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
	var preTD = null;
	function doClick(obj){
		//alert("RoomID "+obj.all["Room/RoomID"].value);
		//var buildingName = frm[""].value;
		//var roomName = frm[""].value;
		var select1 = document.getElementById("select1");
		AddRoomID(obj.all["Room/RoomID"].value,obj.all["Room/RoomName"].value,select1.value,select1.options[select1.selectedIndex].innerText);
		//AddRoomID(obj.all["Room/RoomID"].value,obj.all["Room/RoomName"].value,select1.options[select1.selectedIndex].innerText,document.all["BuildingName"].value);
		
		
		//////////////////////////////////////////////////////////
		if (gSelectedTD!=null){
			gSelectedTD.background = "";
		}else{
			if(typeof(document.all.initTD)!="undefined"){
				document.all.initTD.background = "image/state_selected.gif";
			}
		}
		gSelectedTD = obj;
		preTD = obj;
		obj.background = "image/state_selected.gif";
		var roomid = obj.children[2].value;
		var frame = window.parent["bottomFrame"];
		var id = obj.children[1].value;
		var op = "<bean:write property="op"/>";
		//frame.location.href = "ICCard.prField.guestRoom4Month.do?input/RoomID="+roomid+"&op="+op;
	}
	function AddRoomID(roomID,RoomName,BuildingID,BuildingName){
        this.parent.window.opener.addOptionBtn4(trim(roomID),RoomName,BuildingID,BuildingName);
    }
	function doChange(){
        var frm = document.forms[0];
		var BuildingID = frm["input/BuildingID"].value;
		var LayerNO = frm["input/LayerNO"].value;
		var CurrDate = frm.CurrDate.value;
		var op = "<bean:write property="op"/>";
		frm.action="OMM.prDevUsingLogs.printoSelectGuestRootTop.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&op="+op;
		frm.submit();
		//document.location.href="ICCard.prField.guestRoom4Day.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&op="+op;
	}
	/*function doChange(){
        var frame = window.parent["topFrame"];
        var frm = document.forms[0];
		var BuildingID = frm["input/BuildingID"].value;
		var LayerNO = frm["input/LayerNO"].value;
		var CurrDate = frm.CurrDate.value;
		var op = "<bean:write property="op"/>";
		frame.location.href = "ICCard.prField.guestRoom4Day.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&op="+op;
	}*/
//------------------------------------------------------------------------------
	function Confirm(){
		/*userList=frm.userid;
		var mobileName="";		
		if(userList.selectedIndex == -1) {
			alert("����ʹ�����б���ѡ��!");
			userList.focus();
			return ;
		}	
		
		if(userList.options.length>0){			
			for(var i = 0; i < userList.options.length; i++){
				if(userList.options[i] != null && userList.options[i].selected == true){
				 if(userList.options[i].value.length==0){
				     mobileName=mobileName+userList.options[i].innerText;
			       
		         }else{
					AddMobile(userList.options[i]);
					}
				}
			}
			if(mobileName!="")
			{
			    alert("�û�:"+mobileName+" û�������ֻ����룬���ʧ�ܣ�");
			}
		}*/
 	}
 	
 	function AddMobile(mobile){
        this.parent.window.opener.addOptionBtn4(mobile.innerText,mobile.value);
		
 	}
//------------------------------------------------------------------------------
	function changeBuilding(){
        var frame = window.parent["topFrame"];
        var frm = document.forms[0];
		var BuildingID = frm["input/BuildingID"].value;
		frm["input/LayerNO"].value = "";
		var LayerNO = frm["input/LayerNO"].value;
		var CurrDate = frm.CurrDate.value;
		var op = "<bean:write property="op"/>";
		frame.location.href = "ICCard.prField.guestRoom4Day.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&op="+op;
	}
	
	function roomCheckIn(){
		if (typeof(window.parent["topFrame"])!="undefined"){
			var selectwin = window.parent["topFrame"];
			var selectpage = window.parent["topFrame"].document;															
			var freeroom = selectwin.preTD;
            var frm = document.forms[0];
		    var BuildingID = frm["input/BuildingID"].value;
			
			if (freeroom!=null&&typeof(freeroom)!="undefined"){
			   var seatNum = freeroom.children[5].value;
			   var useCount = 0;
			   var usingLog = freeroom.children[1].value
			   //alert(usingLog + "," + seatNum);
			
			   if (usingLog.indexOf("ס����")>=0) {
			      if (usingLog.indexOf(";")>=0)
			         useCount = usingLog.split(";").length;
			      else
			         useCount = 1;
			   }
					if(freeroom.children[4].value==1 || freeroom.children[4].value=="" || useCount < seatNum){
						var url = "ICCard.prField.guestRoomBookAdd.do?input/RoomID="+freeroom.children[2].value+"&input/BuildingID="+BuildingID;
						createWindow(url,100,100,800,500);
					}else{
						alert("�ͷ��ѱ�ռ�ã�");
					}					
			}else{
				alert("��ѡ����Ҫ��ס�Ŀͷ���");
			}			
		}//END �ж��Ƿ���ڿͷ�����ҳ��
	}
	
	function roomBook(){
		if (typeof(window.parent["topFrame"])!="undefined"){
			var selectwin = window.parent["topFrame"];
			var selectpage = window.parent["topFrame"].document;															
			var freeroom = selectwin.preTD;
			if(freeroom!=null&&typeof(freeroom)!="undefined"){					
					if(freeroom.children[3].value==1 || freeroom.children[3].value=="" ){
						var url = "ICCard.prField.guestRoomBook2Add.do?input/RoomID="+freeroom.children[2].value;
						createWindow(url,100,100,800,500);
					}else{
						alert("�ͷ��ѱ�Ԥ����");
					}					
			}else{
				alert("��ѡ����ҪԤ���Ŀͷ���");
			}			
		}//END �ж��Ƿ���ڿͷ�����ҳ��
	}
	
	function roomBookOK(){
		if (typeof(window.parent["topFrame"])!="undefined"){
			var selectwin = window.parent["topFrame"];
			var selectpage = window.parent["topFrame"].document;															
			var freeroom = selectwin.preTD;	
			if(freeroom!=null&&typeof(freeroom)!="undefined"){					
					if(freeroom.children[4].value==4){
						var url = "ICCard.prField.guestRoomBook2Update.do?input/RoomID="+freeroom.children[2].value;
						createWindow(url,100,100,800,500);
					}else{
						alert("�ͷ�����Ԥ���ͷ���");
					}					
			}else{
				alert("��ѡ����ҪԤ��ȷ�ϵĿͷ���");
			}			
		}//END �ж��Ƿ���ڿͷ�����ҳ��
	}
	
	function roomBookCancel(){
		if (typeof(window.parent["topFrame"])!="undefined"){
			var selectwin = window.parent["topFrame"];
			var selectpage = window.parent["topFrame"].document;															
			var freeroom = selectwin.preTD;	
			if(freeroom!=null&&typeof(freeroom)!="undefined"){					
					if(freeroom.children[4].value==4){
					    if(confirm("ȷʵҪȡ��Ԥ��������")){
						var url = "ICCard.prField.guestRoomBook2Cancel.do?input/RoomID="+freeroom.children[2].value;
						window.location.href = url;
						}
					}else{
						alert("�ͷ�����Ԥ���ͷ���");
					}					
			}else{
				alert("��ѡ����ҪԤ��ȡ���Ŀͷ���");
			}			
		}//END �ж��Ƿ���ڿͷ�����ҳ��
	}
	
	function roomCheckOut(){
		if (typeof(window.parent["topFrame"])!="undefined"){
			var selectwin = window.parent["topFrame"];
			var selectpage = window.parent["topFrame"].document;													
			var freeroom = selectpage.preTD;			
			var room = selectwin.preTD;			
			if(room!=null&&typeof(room)!="undefined"){					
					if(typeof(room.children[3])!="undefined"&&room.children[3].value!=""){
							var logids = room.children[3].value;
							/*
							var logidArray = logids.split("|");	
							if(logidArray[1]!=""){
								alert("�÷�����ͬһʱ�������������ϵĳ����¼���������Ա��ϵ��");
								return ;
							}
							*/
							var url = "ICCard.prField.guestRoomCheckOut.do?input/LogsID="+room.children[3].value;
							createWindow(url,100,100,800,500);
							
					}else{
						alert("��ѡ�ͷ��������˷�ҵ����");
					}					
			}else{
				alert("��ѡ����Ҫ�˻��Ŀͷ���");
			}			
		}//END �ж��Ƿ���ڿͷ�����ҳ��
	}
	function cancel(){
		this.parent.window.close();
	}
</script>