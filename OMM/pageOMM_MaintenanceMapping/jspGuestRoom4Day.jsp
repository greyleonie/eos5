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
  				
				<td nowrap class="td2">所属建筑物：<select name="input/BuildingID" id="select1" bizAction="ICCard.bizField.selectBuilding2"
						paramXML="" listXpath="list[@type='Building']" entityName="Building" valueField="BuildingID"
						textField="BuildingName" childID="select2" nullLable="true"
						nullLableText="<bean:write property="input/BuildingName"/>"
						nullLableValue="<bean:write property="input/BuildingID"/>" onchange="refreshChild_DS(this),changeBuilding()"
						class="input">
					</select> 楼层： <select name="input/LayerNO" id="select2" bizAction="ICCard.bizField.selectLayer2" paramXML=""
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
							<td>空闲</td>
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_school"></td>
									</tr>
								</table>
							</td>
							<td>校内使用</td>
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_other"></td>
									</tr>
								</table>
							</td>
							<td>出租</td>
							<td>
								<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" class="state_book"></td>
									</tr>
								</table>
							</td>
							<td>预订</td>
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
		  		<tr class="td1"><td colspan="10" align="center"><b><bean:write property="LayerNO/LayerNO" id="layerset"/>层</b></td></tr>
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
                  <input type='hidden' value=' 楼层：<bean:write id="resultset" property="Room/LayerNO" /> <br/> 床位数：<bean:write id="resultset" property="Room/SeatNum"/> <br/> 电话：<bean:write id="resultset" property="Room/Tel"/> <br/> <bean:write id="resultset" property="Room/UsingLogs"/>' />
                  <input type='hidden' value='<bean:write id="resultset" property="Room/UsingLogs" />'/>
                  <input type='hidden' name="Room/RoomID" value='<bean:write id="resultset" property="Room/RoomID" />'/>
                  <input type='hidden' name="Room/RoomName" value='<bean:write id="resultset" property="Room/RoomName" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/HousingLogsID" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/State" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/SeatNum" />'/>
                  <bean:write id="resultset" property="Room/RoomName" />
                <% 
				count++;
				//输出行尾
				if(count%colPerRow==0){%>
					</tr>
				<%} %>
				</logic:equal>
				</logic:iterate>
					<%
	      //补齐行尾
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
      	<td class="td2" align="center"><font color="red">提示:点击房间号获取房间标识号</font></td>
      </tr>
		<tr>
			<td class="td2"  nowrap align="center"> 
			<!--<input name="B3" type="button" class="button_02" value="添加" onclick="Confirm()">  -->
			<input name="B6" type="button" class="button_02" value="关闭" onclick="cancel()"></td>
			<!--<TD width="8%" class="td2" nowrap align="right">&nbsp;</TD>
			<TD class="td1"><input name="B3" type="button" class="button_02" value="添加" onclick="Confirm()"> 
			<input name="B6" type="button" class="button_02" value="关闭" onclick="cancel()">
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
			alert("请在使用人列表中选择!");
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
			    alert("用户:"+mobileName+" 没有设置手机号码，添加失败！");
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
			
			   if (usingLog.indexOf("住宿人")>=0) {
			      if (usingLog.indexOf(";")>=0)
			         useCount = usingLog.split(";").length;
			      else
			         useCount = 1;
			   }
					if(freeroom.children[4].value==1 || freeroom.children[4].value=="" || useCount < seatNum){
						var url = "ICCard.prField.guestRoomBookAdd.do?input/RoomID="+freeroom.children[2].value+"&input/BuildingID="+BuildingID;
						createWindow(url,100,100,800,500);
					}else{
						alert("客房已被占用！");
					}					
			}else{
				alert("请选择需要入住的客房！");
			}			
		}//END 判断是否存在客房出租页面
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
						alert("客房已被预订！");
					}					
			}else{
				alert("请选择需要预订的客房！");
			}			
		}//END 判断是否存在客房出租页面
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
						alert("客房不是预订客房！");
					}					
			}else{
				alert("请选择需要预订确认的客房！");
			}			
		}//END 判断是否存在客房出租页面
	}
	
	function roomBookCancel(){
		if (typeof(window.parent["topFrame"])!="undefined"){
			var selectwin = window.parent["topFrame"];
			var selectpage = window.parent["topFrame"].document;															
			var freeroom = selectwin.preTD;	
			if(freeroom!=null&&typeof(freeroom)!="undefined"){					
					if(freeroom.children[4].value==4){
					    if(confirm("确实要取消预订房间吗？")){
						var url = "ICCard.prField.guestRoomBook2Cancel.do?input/RoomID="+freeroom.children[2].value;
						window.location.href = url;
						}
					}else{
						alert("客房不是预订客房！");
					}					
			}else{
				alert("请选择需要预订取消的客房！");
			}			
		}//END 判断是否存在客房出租页面
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
								alert("该房间在同一时间有两条或以上的出租记录，请与管理员联系！");
								return ;
							}
							*/
							var url = "ICCard.prField.guestRoomCheckOut.do?input/LogsID="+room.children[3].value;
							createWindow(url,100,100,800,500);
							
					}else{
						alert("所选客房不能作退房业务处理！");
					}					
			}else{
				alert("请选择需要退还的客房！");
			}			
		}//END 判断是否存在客房出租页面
	}
	function cancel(){
		this.parent.window.close();
	}
</script>