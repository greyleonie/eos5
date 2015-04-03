<%@include file="/internet/common.jsp"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<form method="post">
<input  type="hidden" name="CurrDate" value="<bean:write property="input/CurrDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>" />
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;
            <logic:notEqual  property="op" value="view" >客房出租</logic:notEqual>
            <logic:equal  property="op" value="view" >客房信息查询</logic:equal>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
  
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>   
          <td  valign="top" class="text">
	          <table width="98%"><tr> <td class="td1" nowrap="nowrap" > 
	          <logic:notEqual  property="op" value="view" >
	          			
	          		<qx:talentButton property="book" type="button" styleClass="button_02" value="入住登记" onclick="roomCheckIn()" operation="DX_CARD_MANAGE_FIELD_GUESTROOM.DX_CARD_MANAGE_FIELD_GUESTROOM_BOOK"/>	
					<qx:talentButton property="checkout" type="button" styleClass="button_02" value="退 房" onclick="roomCheckOut()" operation="DX_CARD_MANAGE_FIELD_GUESTROOM.DX_CARD_MANAGE_FIELD_GUESTROOM_CHECKOUT"/>
					<qx:talentButton property="book" type="button" styleClass="button_02" value="客房预订" onclick="roomBook()" operation="DX_CARD_MANAGE_FIELD_GUESTROOM.DX_CARD_MANAGE_FIELD_GUESTROOM_ROOMBOOK"/>
					<qx:talentButton property="book" type="button" styleClass="button_02" value="预订确认" onclick="roomBookOK()" operation="DX_CARD_MANAGE_FIELD_GUESTROOM.DX_CARD_MANAGE_FIELD_GUESTROOM_ROOMBOOKOK"/>	
	          		<qx:talentButton property="book" type="button" styleClass="button_02" value="预订取消" onclick="roomBookCancel()" operation="DX_CARD_MANAGE_FIELD_GUESTROOM.DX_CARD_MANAGE_FIELD_GUESTROOM_ROOMBOOKCANCEL"/>	
	          		
				</logic:notEqual>	 
					 
					 所属建筑物：
	         <select  name="input/BuildingID"  id="select1" bizAction="ICCard.bizField.selectBuilding2"   paramXML="" listXpath="list[@type='Building']" entityName="Building" valueField="BuildingID"    textField="BuildingName"        childID="select2"  nullLable="true" nullLableText="<bean:write property="input/BuildingName"/>" nullLableValue="<bean:write property="input/BuildingID"/>" onchange="refreshChild_DS(this),changeBuilding()" class="input"></select> 
	           
	           楼层：
	         <select name="input/LayerNO"        id="select2" bizAction="ICCard.bizField.selectLayer2"    paramXML="" listXpath="list[@type='LayerNO']"     entityName="LayerNO"    valueField="LayerNO" textField="LayerNO"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="<bean:write property="input/LayerNO"/>" nullLableValue="<bean:write property="input/LayerNO"/>" onchange="doChange()" class="input"></select>
			 <script language="JavaScript" type="text/JavaScript">	 	
				initSel_DS(document.getElementById("select1"));
			</script>
	           当前日期：<font color="red"><bean:write property="input/CurrDate"/> </font>
	          </td>
	   </tr>
	   <tr> 
	           <td class="td1" >
	        <table width="300">
				<tr class="td3" ><td><table border="1" width="25" height="15"  bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_empty" >　</td></tr> </table></td><td>空闲</td>
					<td><table border="1" width="25" height="15" bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_school">　</td></tr> </table></td><td>校内使用</td>
					<td><table border="1" width="25" height="15" bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_other" >　</td></tr> </table></td><td>出租</td>
               <td><table border="1" width="25" height="15" bordercolordark="#FFFFFF"  cellspacing="0" cellpadding="0" >
               <tr><td width="100%" class="state_book" >　</td></tr> </table></td><td>预订</td>
				</tr>
			</table>
	          </td>
	        </tr> </table>
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
                  <logic:equal id="resultset" property="Room/UsingType" value="1">state_empty</logic:equal><logic:equal id="resultset" property="Room/UsingType" value="2">state_school</logic:equal><logic:equal id="resultset" property="Room/UsingType" value="3">state_other</logic:equal>
                  </logic:notEqual>">
                  <input type='hidden' value=' 楼层：<bean:write id="resultset" property="Room/LayerNO" /> <br/> 床位数：<bean:write id="resultset" property="Room/SeatNum"/> <br/> 电话：<bean:write id="resultset" property="Room/Tel"/> <br/> <bean:write id="resultset" property="Room/UsingLogs"/>' />
                  <input type='hidden' value='<bean:write id="resultset" property="Room/UsingLogs" />'/>
                  <input type='hidden' value='<bean:write id="resultset" property="Room/RoomID" />'/>
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
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
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
		frame.location.href = "ICCard.prField.guestRoom4Month.do?input/RoomID="+roomid+"&op="+op;
	}
	function doChange(){
        var frame = window.parent["topFrame"];
       	if(frame='undefined'){
       		frame = window.parent["ifAddList"];
       	}
        var frm = document.forms[0];
		var BuildingID = frm["input/BuildingID"].value;
		var LayerNO = frm["input/LayerNO"].value;
		var CurrDate = frm.CurrDate.value;
		var op = "<bean:write property="op"/>";
		self.location.href = "ICCard.prField.guestRoom4Day.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&op="+op;
	}
		
	function changeBuilding(){
        var frame = window.parent["topFrame"];
       	if(frame='undefined'){
       		frame = window.parent["ifAddList"];
       	}
        var frm = document.forms[0];
		var BuildingID = frm["input/BuildingID"].value;
		frm["input/LayerNO"].value = "";
		var LayerNO = frm["input/LayerNO"].value;
		var CurrDate = frm.CurrDate.value;
		var op = "<bean:write property="op"/>";
		self.location.href = "ICCard.prField.guestRoom4Day.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&op="+op;
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
	
	

	
  </script>
  