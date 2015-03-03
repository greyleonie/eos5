<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/fccnewtab.js"></SCRIPT>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<body>
<form action="" method="post">
	<table align="center" width="200">
		<!--<tr>
			<td nowrap class="td2" align="center" width="50%">
				<html:radio name="appointArea" onclick="onSelect(this)" value="1"/>所有区域
			</td>
			<td nowrap class="td2" align="center" width="50%">
				<html:radio name="appointArea" onclick="onSelect(this)" value="2" checked="true"/>指定区域
			</td>
		</tr>-->
		<tr>
			<td nowrap class="td2"  width="100" colspan="1">
				<html:radio name="checkappointType" onclick="onSelect(this)" value="1" checked="true"/>指定房间类型
				
				<!--<html:radio name="appointType" onclick="onSelect(this)" value="1"/>指定房间类型-->
			</td>
			<td nowrap class="td2"  width="100" colspan="1" align="center">
				<html:radio name="checkappointType" onclick="onSelect(this)" value="2" />指定房间
				<!--<html:checkbox name="addBuildOrRoom" onclick="addBuildOrRoom1(this)" value="2" disabled="true"/>-->
			</td>
		</tr>
		<tr>
			<td nowrap class="td2" align="center" colspan="2" >
				<html:radio name="roomType" value="0" onclick="roomTypeClick(this)" checked="true"/>所有类型
				<html:radio name="roomType" value="1" onclick="roomTypeClick(this)" />教室
				<html:radio name="roomType" value="2" onclick="roomTypeClick(this)" />客房
				<html:radio name="roomType" value="3" onclick="roomTypeClick(this)" />讨论室
				<html:radio name="roomType" value="4" onclick="roomTypeClick(this)" />办公室
			</td>
		</tr>
		<tr>
			<td nowrap class="td2" align="center" colspan="1">
				<!--<html:radio  name="addBuildOrRoom" onclick="addBuildOrRoom1(this)" value="1" disabled="true"/>增加楼宇-->
				<html:checkbox name="addBuildOrRoom" onclick="addBuildOrRoom1(this)" value="1" checked="true"/>指定楼宇
			</td>
			<td nowrap class="td2" align="center" colspan="1">
				<!--<html:radio  name="addBuildOrRoom" onclick="addBuildOrRoom1(this)" value="2" checked="true"/>增加房间-->
				
				楼宇:
				<!--<select name="input/BuildingID" id="select1" bizAction="ICCard.bizField.selectBuilding2"-->
				<select style="width:85px;" name="input/BuildingID" id="select1" bizAction="ICCard.bizField.selectBuilding"
				paramXML="" listXpath="list[@type='Building']" entityName="Building" valueField="BuildingID"
				textField="BuildingName" childID="select2" nullLable="true"
				nullLableText="请选择楼宇"
				nullLableValue="-1" onchange="refreshChild_DS(this),changeBuilding(this)"
				class="input" >
				</select>
				<!-- <bean:write property="input/BuildingName"/> <bean:write property="input/BuildingID"/>  -->
			</td>
		</tr>
		<tr>
			<td nowrap class="td2" align="left" colspan="1">
				预览:<FONT color="red"><LABEL id="pointOut">指定房间类型</LABEL></FONT>
			</td>
			<td nowrap class="td2" align="center" colspan="1">
				楼层:
				<select style="width:85px;" name="input/LayerNO" id="select2" bizAction="ICCard.bizField.selectLayer2" paramXML=""
					listXpath="list[@type='LayerNO']" entityName="LayerNO" valueField="LayerNO" textField="LayerNO" childID=""
					mainSelectID="select1" nullLable="true" nullLableText="请选择楼层"
					nullLableValue="-1" onchange="doChange(this)" class="input" disabled="true">
				</select>
				<!-- nullLableText="<bean:write property="input/LayerNO"/>"  nullLableValue="<bean:write property="input/LayerNO"/>"  -->
				<script language="JavaScript" type="text/JavaScript">
					initSel_DS(document.getElementById("select1"));
				</script>
			</td>
		</tr>
		<tr>
			<td class="td2" colspan="2">
				
			</td>
		</tr>
	</table>
	<table align="center">
		<tr class="td3" width="200" >
			<td>
				<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" class="state_empty"></td>
					</tr>
				</table>
			</td>
			<td width="100">空闲</td>
			<td>
				<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" class="state_school"></td>
					</tr>
				</table>
			</td>
			<td width="100">校内使用</td>
			<td>
				<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" class="state_other"></td>
					</tr>
				</table>
			</td>
			<td width="100">出租</td>
			<td>
				<table border="1" width="25" height="15" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100%" class="state_book"></td>
					</tr>
				</table>
			</td>
			<td width="100">预订</td>
		</tr>
		<tr>
	        <td valign="top" class="text" colspan="8">
	        <DIV id="testTable"></DIV>
	      	 <!--<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail" style="cursor:hand">
	
					<%
			             //int count=0;
			             //int colPerRow =10;
				           //String trClass = "td1"; 
			  
			  		%>
			  		<logic:iterate id="layerset" property="list[@type='LayerNO']">
			  		<%
			            // count=0;
			  		%>
			  		<tr class="td1"><td colspan="10" align="center"><b><bean:write property="LayerNO/LayerNO" id="layerset"/>层</b></td></tr>
					<logic:iterate id="resultset" property="list[@type='Room']">
					<logic:equal id="resultset" property="Room/LayerNO" valueType="variable" valueId="layerset" value="LayerNO/LayerNO">
						<%
						//if(count%colPerRow==0){	
				       %>
				       <tr> 
				    <%//}%>
	                  <td  height="25" align="center" width="10%"  onmouseover='doMsg(this)' onmouseout='doHidePane()' onclick="doClick2(this)" ondblclick='doClick(this)'   
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
	                  <input type='hidden' name="Room/RoomTypeID" value='<bean:write id="resultset" property="Room/RoomTypeID" />'/>
	                  <input type='hidden' value='<bean:write id="resultset" property="Room/HousingLogsID" />'/>
	                  <input type='hidden' value='<bean:write id="resultset" property="Room/State" />'/>
	                  <input type='hidden' value='<bean:write id="resultset" property="Room/SeatNum" />'/>
	                  <bean:write id="resultset" property="Room/RoomName" />
	                <% 
					//count++;
					//输出行尾
					//if(count%colPerRow==0){%>
						</tr>
					<%//} %>
					</logic:equal>
					</logic:iterate>
						<%
		      //补齐行尾
				//count = count%colPerRow;
				//if(count<colPerRow&&count!=0){
					//for(int x=count; x<colPerRow; x++){%>
						<td class="td1">&nbsp;</td>
					<%//}%>
					</tr>
					<%//}%>
					</logic:iterate>
	              </table>-->
			  </td>
	      </tr>
		<tr align="center">
			<td colspan="8">
			<input name="B6" type="button" class="button_02" value="增加" onclick="add()">
			<input name="B6" type="button" class="button_02" value="关闭" onclick="cancel()">
			</td>
		</tr>
	</table>
	<html:hidden  name="roomTypeMark" property="roomTypeMark" value="1"/>
	<html:hidden  name="roomTypeID" property="roomTypeID" value="0"/>
	<html:hidden  name="buildAndRoomMark" property="buildAndRoomMark" value="-1"/>
	<html:hidden  name="buildingID" property="input/BuildingID"/>
	<html:hidden  name="buildingName" property="input/BuildingName" />
	<html:hidden  name="roomID" property="roomID" value="-1"/>
	<html:hidden  name="roomName" property="roomName" value="-0"/>
	<!--<input type="hidden" name="roomTypeMark" value="2" >
	<input type="hidden" name="roomTypeID">
	<input type="hidden" name="buildAndRoomMark" value="2">
	<input type="hidden" name="buildingID">
	<input type="hidden" name="buildingName">
	<input type="hidden" name="roomID">
	<input type="hidden" name="roomName">-->
</form>
<form name="frm2" method="post" >
<html:hidden property="input/degree"/>
<html:hidden property="input/BeginDate"/>
<html:hidden property="input/EndDate"/>
</form>
<div id="msgpane" style="display:none;position:absolute;z-index:100;font-size:9pt;border:1px inset #000000;background-color:#FAFAD2">
</div>
<!--<center>
		<INPUT type="button" value="ajax" onclick="testAjax1()">
		<input type="button" value="clear" onclick="clearAjax()">
		<input type="button" value="test" onclick="test()">
		</center>-->
</body>
<script>


	
	var testTable = document.getElementById("testTable");

	function clearAjax(){
		testTable.innerHTML = "";
	}
	
	function testAjax1(){
		
		var sub = new HiddenSubmit('OMM.bizDevUsingLogs.getGuestRoom');
		
		var obj1 = getEById("select1");
		var obj2 = getEById("select2");
		var selectValue1 = obj1.options[obj1.selectedIndex].value;
		var selectValue2 = obj2.options[obj2.selectedIndex].value;
		sub.add("input/LayerNO",selectValue2);
		sub.add("input/BuildingID",selectValue1);
		sub.add("input/BuildingName","勤学楼");
		
		if(sub.submit()){
			//alert("调用业务逻辑success!");
			if(sub.getValues("root/data/list[@type='Room']/Room").length<1){
				testTable.innerHTML = "<center><font color='red'>不存在记录!</font></center>";
			}else{
				var layerset = "";
				var resultset = "";
				var count = 0;
				var colPerRow = 10;
				var trClass = "td1";
				var tableBody = "";
				tableBody += '<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail" style="cursor:hand">';
				
				//////////////////////////////////////////////////////////////
				
				//tableBody += '<tr><td>asdfasdf</td></tr>';
				
				//////////////////////////////////////////////////////////////
				
				for(var i = 0; i < sub.getValues("root/data/list[@type='LayerNO']/LayerNO").length; i++){
					count = 0;
					var layerNO = sub.getValues("root/data/list[@type='LayerNO']/LayerNO/LayerNO");
					tableBody += '<tr class="td1"><td colspan="10" align="center"><b>'+layerNO+'层</b></td></tr>';
					for(var j = 0; j < sub.getValues("root/data/list[@type='Room']/Room").length; j++){
						layerset = sub.getValues("root/data/list[@type='LayerNO']//LayerNO/LayerNO");
						resultset = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+j+"']/LayerNO");
						//alert("layerset: "+layerset+"    resultset: "+resultset);
						if(parseInt(layerset) == parseInt(resultset)){
							if(count%colPerRow == 0){
								tableBody += '<tr>';
							}
							//alert(tableBody);
							tableBody += '<td  height="25" align="center" width="10%"  onmouseover="doMsg(this)" onmouseout="doHidePane()" onclick="doClick2(this)" ondblclick="doClick(this)" ';
							tableBody += 'class="';
							var roomState = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+j+"']/State");
							if(roomState == 4){
								tableBody += 'state_book">';
							}else if(roomState != 4){
								var usingType = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+j+"']/UsingType");
								if(usingType == 1){
									tableBody += 'state_empty">';
								}else if(usingType == 2){
									tableBody += 'state_school">';		
								}else if(usingType == 3){
									tableBody += 'state_other">';
								}
							}
							var roomID = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+j+"']/RoomID");
							var roomName = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+j+"']/RoomName");
							var roomTypeID = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+j+"']/RoomTypeID");
							//alert(roomID+"   "+roomName+"   "+roomTypeID);
							tableBody += '<input type="hidden" name="Room/RoomID" value='+roomID+' />';
							tableBody += '<input type="hidden" name="Room/RoomName" value='+roomName+' />';
							tableBody += '<input type="hidden" name="Room/RoomTypeID" value='+roomTypeID+' />';/**/
							
							tableBody += roomName+'</td>';
							
							count++;
							//输出行尾
							if(count%colPerRow == 0){
								tableBody += '</tr>';
							}
							
						}
					}
					//补齐行尾
					count = count%colPerRow;
					if(count<colPerRow&&count!=0){
						for(var x = count; x < colPerRow; x++){
							tableBody += '<td class="td1">&nbsp;</td>';
						}
						tableBody += '</tr>';
					}
				}
				
				tableBody += '</table>';
				//alert(tableBody);
				testTable.innerHTML = tableBody;
				
			}
		}else{
			alert("调用业务逻辑失败!");
		}
		
	}

















	function test(){
	
		/*var obj1 = getEById("select1");
		var obj2 = getEById("select2");
		alert(obj1.options[obj1.selectedIndex].value+"   "+obj2.options[obj2.selectedIndex].value);*/
		
		
		var checkappointType = document.getElementsByName("checkappointType");
		
		var checkappointTypeValue = checkappointType[0].value;
		var roomTypeMark	 = frm["roomTypeMark"].value;
		var roomTypeID 		 = frm["roomTypeID"].value;
		var buildAndRoomMark = frm["buildAndRoomMark"].value;
		var buildingID       = frm["buildingID"].value;
		var buildingName     = frm["buildingName"].value;
		var roomID           = frm["roomID"].value;
		var roomName         = frm["roomName"].value;
		alert("roomTypeMark: "+roomTypeMark+"  roomTypeID: "+ roomTypeID+"  buildAndRoomMark: "+ buildAndRoomMark+
			"  buildingID: "+ buildingID+"  buildingName: "+ buildingName+
			"  roomID: "+ roomID+"  roomName: "+ roomName +"   checkappointTypeValue:"+ checkappointTypeValue);
	}
	
	var frm=document.forms[0];
	var gSelectedTD = null;
	var preTD = null;
	var checkLayerClick = false;
	var checkRoomClick = false;
	
	
	//双击房间
	function doClick(obj){
		checkRoomClick = true;
		frm["roomID"].value = obj.all["Room/RoomID"].value;
		frm["roomName"].value = obj.all["Room/RoomName"].value;
		frm["roomTypeID"].value = obj.all["Room/RoomTypeID"].value;
		changeColor(obj);
	}
	
	//单击房间
	function doClick2(obj){
		var pointOut = getEById("pointOut");
		checkRoomClick = true;
		changeColor(obj);
		frm["roomID"].value = obj.all["Room/RoomID"].value;
		frm["roomName"].value = obj.all["Room/RoomName"].value;
		frm["roomTypeID"].value = obj.all["Room/RoomTypeID"].value;
		
		var buildingName     = frm["buildingName"].value;
		var roomName         = frm["roomName"].value;
		pointOut.innerText = ""+buildingName+roomName+"房";
	}
	
	//换颜色
	function changeColor(obj){
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
	}
	
	//换楼层显示房间表格
	function doChange(obj){
		checkLayerClick = true;
		frm["roomID"].value = obj.value;
		var BuildingID			 = frm["input/BuildingID"].value;
		var LayerNO        		 = frm["input/LayerNO"].value;
		var roomTypeMark         = frm["roomTypeMark"].value;
		var roomTypeID 	 		 = frm["roomTypeID"].value;
		var buildAndRoomMark     = frm["buildAndRoomMark"].value;
		var buildingID           = frm["buildingID"].value;
		var buildingName         = frm["buildingName"].value;
		var roomID               = frm["roomID"].value;
		var roomName             = frm["roomName"].value;
		
		
		testAjax1();
		//var roomTypeID           = frm["roomTypeID"].value;
		/*frm.action="OMM.prOMM_MaintenanceMapping.prAreaSelect.do?input/BuildingID="+BuildingID+"&input/LayerNO="+LayerNO+"&roomTypeMark="+roomTypeMark
					+"&roomTypeID="+roomTypeID+"&buildAndRoomMark="+buildAndRoomMark+"&buildingID="+buildingID+"&buildingName="+buildingName
					+"&roomID="+roomID+"&roomName="+roomName;
					//+"&roomTypeID="+roomTypeID
		frm.submit();*/
	}
	
	function getEById(idString){
		return document.getElementById(idString);
	}
	
	//改变区域
	function onSelect(obj){
		//alert(obj.checked);
		
		var appointValue = obj.value;
		//var checkappointType = getEById("checkappointType");
		var buildAndRoom = document.getElementsByName("addBuildOrRoom");
		var roomType = document.getElementsByName("roomType");
		
		if(appointValue == 1){
			roomType[0].checked = true;
			//if(roomType[0].checked == false){
			//	buildAndRoom[1].disabled = false;
			//}
			//buildAndRoom[1].disabled = false;
			//buildAndRoom[1].checked = false;
			buildAndRoom[0].disabled = false;
			buildAndRoom[0].checked = true;
			disabledOr(false);
			roomTypeState(false);
			if(buildAndRoom[0].checked == false){
				frm["buildAndRoomMark"].value = -1;
			}
			frm["roomTypeMark"].value= 1;
			//预览
			getEById("pointOut").innerText = "指定房间类型";
			getEById("select2").disabled = true;
		}else if(appointValue == 2){
			//if(buildAndRoom[1].checked == true){
			//	getEById("select2").disabled = true;
			//}
			getEById("select1").disabled = false;
			getEById("select2").disabled = false;
			//buildAndRoom[1].checked = false;
			//buildAndRoom[1].disabled = true;
			buildAndRoom[0].checked = false;
			buildAndRoom[0].disabled = true;
			//buildAndRoom[0].checked = true;
			//buildAndRoom[0].disabled = false;
			disabledOr(true);
			roomTypeState(true);
			frm["buildAndRoomMark"].value = 1;
			frm["roomTypeMark"].value= 2;
			getEById("pointOut").innerText = "指定房间";
		}
	}
	
	function changeBuilding(obj){
		frm["buildingID"].value = obj.value;
		frm["buildingName"].value = obj.options[obj.selectedIndex].innerText;
		frm["buildAndRoomMark"].value = 1;////
		changeBuildingAsign(obj);
	}
	
	function changeBuildingAsign(obj){
		var selectValue = obj.options[obj.selectedIndex].innerText;
		var radioValues = document.getElementsByName("roomType");
		//getEById("pointOut").innerText = ""+selectValue;
		//alert(radioValues.length);
		for(var i = 0; i < radioValues.length; i++){
			if(radioValues[i].checked == true){
				if(radioValues[i].value == 0){
					getEById("pointOut").innerText = selectValue+"所有房间";
					break;
				}else if(radioValues[i].value == 1){
					getEById("pointOut").innerText = selectValue+"所有教室";
					break;
				}else if(radioValues[i].value == 2){
					getEById("pointOut").innerText = selectValue+"所有客房";
					break;
				}else if(radioValues[i].value == 3){
					getEById("pointOut").innerText = selectValue+"所有讨论室";
					break;
				}else if(radioValues[i].value == 4){
					getEById("pointOut").innerText = selectValue+"所有办公室";
					break;
				}
			}
		}
		
		
	}
	
	function roomTypeState(TFvalue){
		var roomType = document.getElementsByName("roomType");
		for(i = 0; i < roomType.length; i++){
			roomType[i].checked = false;
			roomType[i].disabled = TFvalue;
		}
		if(!TFvalue){
			roomType[0].checked = true;
			frm["roomTypeID"].value = 0;
		}
	}
	
	function roomTypeClick(obj){
		var buildAndRoom = document.getElementsByName("addBuildOrRoom");
		var roomType = document.getElementsByName("roomType");
		
		
		frm["roomTypeID"].value = obj.value;
		//if(obj.value == 0){
			//getEById("select1").disabled = true;
			//buildAndRoom[1].checked = false;
			//buildAndRoom[1].disabled = true;
			//frm["roomTypeID"].value = obj.value;
		//}else{
			//frm["roomTypeID"].value = obj.value;
			//buildAndRoom[1].disabled = false;
		//}
		var buildCheck = document.getElementsByName("addBuildOrRoom");
		
		if(buildCheck[0].value == -1){
			if(obj.value == 0){
				getEById("pointOut").innerText = "党校所有房间";
			}else if(obj.value == 1){
				getEById("pointOut").innerText = "党校所有教室";
			}else if(obj.value == 2){
				getEById("pointOut").innerText = "党校所有客房";
			}else if(obj.value == 3){
				getEById("pointOut").innerText = "党校所有讨论室";
			}else if(obj.value == 4){
				getEById("pointOut").innerText = "党校所有办公室";
			}
		}else if(buildCheck[0].value == 1){
			var objSelect1 = getEById("select1");
			var selectValue = objSelect1.options[objSelect1.selectedIndex].innerText;
			//getEById("pointOut").innerText = selectValue
			if(objSelect1.value==-1){
				getEById("pointOut").innerText = "错误!请选择楼宇!";
			}else{
				if(obj.value == 0){
					getEById("pointOut").innerText = selectValue+"所有房间";
				}else if(obj.value == 1){
					getEById("pointOut").innerText = selectValue+"所有教室";
				}else if(obj.value == 2){
					getEById("pointOut").innerText = selectValue+"所有客房";
				}else if(obj.value == 3){
					getEById("pointOut").innerText = selectValue+"所有讨论室";
				}else if(obj.value == 4){
					getEById("pointOut").innerText = selectValue+"所有办公室";
				}
			}
		}
	}

	//指定楼房或指定房间
	function addBuildOrRoom1(obj){
		var buildAndRoom = document.getElementsByName("addBuildOrRoom");
		var addValue = obj.checked;
		var radios = document.getElementsByName("appointType");
		
		if(obj.checked == true){
			obj.value = 1;
		}else if(obj.checked == false){
			obj.value = -1;
		}
		
		if(addValue == true){
			/*if(buildAndRoom[1].checked == true){
				frm["buildAndRoomMark"].value = 1;
			}else if(buildAndRoom[1].checked == false){
				frm["buildAndRoomMark"].value = -1;
			}*/
			frm["buildAndRoomMark"].value = 1;
			getEById("select1").disabled = false;
			getEById("select2").disabled = true;
			
		}else if(addValue == false){
		
			getEById("select1").disabled = true;
			/*if(buildAndRoom[1].checked == true){
				frm["buildAndRoomMark"].value = 2;
			}else if(buildAndRoom[1].checked == false){
				frm["buildAndRoomMark"].value = -1;
			}*/
			frm["buildAndRoomMark"].value = -1;
			for(i = 0; i < radios.length; i++){
				if(radios[i].checked){
					if(radios[i].value == 1){
						getEById("select2").disabled = true;
					}else if(radios[i].value == 2) {
						getEById("select2").disabled = false;
					}
				}
			}
		}
	}
	
	//取得到所有值
	
	//增加
	function add(){
		var checkappointType = document.getElementsByName("checkappointType");
		var obj = getEById("select1");
		var buildAndRoom = document.getElementsByName("addBuildOrRoom");
		var pointOut = getEById("pointOut");
		
		
		var roomTypeMark	 = frm["roomTypeMark"].value;
		var roomTypeID 		 = frm["roomTypeID"].value;
		var buildAndRoomMark = frm["buildAndRoomMark"].value;
		var buildingID       = frm["buildingID"].value;
		var buildingName     = frm["buildingName"].value;
		var roomID           = frm["roomID"].value;
		var roomName         = frm["roomName"].value;
		//alert("roomTypeMark  "+roomTypeMark+"  roomTypeID  "+roomTypeID+"  buildAndRoomMark  "+buildAndRoomMark+"  buildingID  "+buildingID+"  buildingName  "+buildingName+"  roomID  "+roomID+"  roomName  "+roomName);
		
		if(obj.options[obj.selectedIndex].value == -1 && buildAndRoom[0].checked == true){
			getEById("pointOut").innerText = "错误!请选择楼宇!";
			return;
		}//做到这里
		if(checkappointType[1].checked == true){
			if(obj.options[obj.selectedIndex].value == -1){
				pointOut.innerText = "错误!请选择楼宇!";
				return;
			}
			if(!checkLayerClick){
				pointOut.innerText = "错误!请选择楼层!";
				return;
			}
			if(!checkRoomClick){
				pointOut.innerText = "错误!请选择房间!";
				return;
			}
			
		}
		//alert("roomTypeMark  "+roomTypeMark+"  roomTypeID  "+roomTypeID+"  buildAndRoomMark  "+buildAndRoomMark+"  buildingID  "+buildingID+"  buildingName  "+buildingName+"  roomID  "+roomID+"  roomName  "+roomName);
		//return;
		//alert("add()");
		addOption(parseInt(roomTypeMark),parseInt(roomTypeID),parseInt(buildAndRoomMark),parseInt(buildingID),buildingName,parseInt(roomID),roomName);
		this.parent.window.close();
		
	}
	
	function addOption(roomTypeMark,roomTypeID,buildAndRoomMark,buildingID,buildingName,roomID,roomName){
		//alert("add()AddOption");
		this.parent.window.opener.addOption(roomTypeMark,roomTypeID,buildAndRoomMark,buildingID,buildingName,roomID,roomName);
	}
	
	function disabledOr(TFvalue){
		var objs = document.getElementsByName("roomType");
		for(i = 0; i < objs.length; i++){
			objs[i].disabled = TFvalue;
		}
		//getEById("select1").disabled = TFvalue;
		//getEById("select1").disabled = !TFvalue;
		//getEById("select2").disabled = !TFvalue;
	}
	
	
	function cancel(){
		this.parent.window.close();
	}
</script>