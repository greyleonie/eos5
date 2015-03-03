<%@include file="/internet/common.jsp"%>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.text.SimpleDateFormat stf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String curdate = sdf.format(date);
%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<body>
<form method="post" action="OMM.prRequest.prRoomList.do" >
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="8"></td>
    </tr>
    <tr>
      <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8" colspan="9">
		<input type="hidden" name="queryaction" value="OMM.prRequest.prRoomList.do">
		
		<html:hidden property="QueryRoom/_order/col1/field"/>
		<html:hidden property="QueryRoom/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
				 </td>
      </tr>
      <tr>
            <td colspan="9" class="text">
     房间类型： 
              <select name="RoomTypeID" onchange="GetBuildingId(this)">
              		<option value="-1">请选择房间类型</option>
					<option value="2">客房</option>
					<!--
					<option value="4">办公室</option>
					<option value="1">教室</option>
					<option value="3">讨论室</option>
					-->
			</select>       
            &nbsp;楼 宇： 
              <select name="QueryRoom/BuildingID/criteria/value" onchange="GetLayerNo(this)">
					<option value="-1">请选择楼宇</option>
			</select>
			  &nbsp;开始楼层：
	   <select name="QueryRoom/LayerNO/criteria/min" onchange="GetRoomID(this)">
			<option value="-1">请选择层号</option>
		</select> 
		<INPUT type="hidden" name="QueryRoom/LayerNO/criteria/max" value="-1">
		<INPUT type="hidden" name="QueryRoom/BeginTime[@pattern='yyyy-MM-dd']" value='<%=curdate%>'>
		<INPUT type="hidden" name="QueryRoom/EndTime[@pattern='yyyy-MM-dd']" value='<%=curdate%>'>
		&nbsp;<input name="query" type="button" class="button_02" value="查 询" onClick="toquery(0)">
		</td>
      </tr>
        
	     <tr>
	       <td width="7%" valign="center"><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
               <tr>
                 <td width="100%" class="td1">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">空闲</td>
	       <td width="7%" valign="center"><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0" >
               <tr>
                 <td width="100%" class="room1">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">未住满</td>
	       <td width="7%" valign="center" ><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0" >
               <tr>
                 <td width="100%" class="room2">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">住满</td>
	       <td width="7%" valign="center"><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0" >
               <tr>
                 <td width="100%" class="room3">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">已出租</td>
	       <td class="text" align="center">(空床位数,床位总数)</td>
	       </tr>
      <tr>
        <td height="8" colspan="9"> </td>
      </tr>
      <logic:notEqual value="-1" property="QueryRoom/BuildingID/criteria/value">
      <tr>
        <td colspan="9" valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <% int tempInt=0; %>
                <tr > 
                  <logic:iterate id="resultset" property="list[@type='QueryRoom']">
                  
                  
				  <%
				  String trClass = "td1";
				  int flag=1; //可选标志
					int VacancyNum =  talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/VacancyNum"),0);//空床位数
				  	String state =  base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/HousingState");//房间状态；
				  	int SeatNum =  talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/SeatNum"),0);//床位数
				  	String Sex= base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/Sex");//房间房客性别；
				  	String Name= base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/HousingList/HousingLogs/operatorName");//房间房客姓名；
				  	String userId= base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/HousingList/HousingLogs/UserID");//房间房客姓名；
				  	if(Name==null) Name="";
				  	if(Sex==null) Sex="";
				  	
				  	if(talent.core.TalentFunctions.getAvailStr(state).equals("3")){
				  		trClass = "room3";
				  		flag=0;
				  		}
				  		
				  	else{
				  		if(VacancyNum>0){
				  			if(VacancyNum<SeatNum){
				  				trClass = "room1";
				  				if(Sex.equals("2"))
				  					flag=0;
				  				}
				  		}
				  		else{
				  			trClass="room2";	
				  			flag=0;
				  		}
				  		
				  	}
				  	
				  	java.util.Hashtable h = new java.util.Hashtable();
					h.put("VacancyNum",String.valueOf(VacancyNum));
				  	h.put("Sex",Sex);
				   %>
				   <td align="center" class="td1" width="25%" onclick="SetValue(this,<bean:write id="resultset" property="QueryRoom/RoomTypeID"/>,<bean:write id="resultset" property="QueryRoom/RoomID"/>,<bean:write id="resultset" property="QueryRoom/BuildingID"/>,'<bean:write id="resultset" property="QueryRoom/BuildingName" />','<bean:write id="resultset" property="QueryRoom/RoomName"/>','<%=userId %>','<%=Name %>')" >
				  
				  <table width="100%" border="0" cellspacing="0" cellpadding="0"  height="100%">
				   
                    <tr>
                      <td style="font-size:12px;">
                      <logic:present  id="resultset" property="QueryRoom/RoomID">
				  </logic:present>	
						<input type="hidden"  name='VacancyNum<bean:write id="resultset" property="QueryRoom/RoomID" />' value="<%=VacancyNum %>"/>
                      <bean:write id="resultset" property="QueryRoom/BuildingName" /> 
                      <bean:write id="resultset" property="QueryRoom/RoomName" />                      </td>
                    </tr>
                    <tr>
                      <td style="font-size:12px;" align="center">
                    &nbsp;
                    <%if(Sex.equals("1")||Sex.equals("0")) {%>
                    <img src='/internet/image/sex<%=Sex %>.gif' >
                    <%} %>
                    <%if(Sex.equals("2")) {%>
                    <img src='/internet/image/sex1.gif' >
                    <%} %><BR>
                    <%=Name %>
                      (<%=VacancyNum %>,<%=SeatNum %>)                    </td>
                    </tr>
                  </table>				  </td>
                  <%
                  	tempInt=tempInt+1;
                  	if(tempInt==4){
                  		tempInt=0;
                   %>
                   </tr><tr>
                   <%} %>
                  </logic:iterate>
                  <%
                  	if(tempInt!=0){
                  	 for(int i=tempInt;i<4;i++){
                   %>
                   <td class="td1" width="25%">&nbsp;</td>
                   <%} }%>
                </tr>
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">			  	  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td colspan="9" class="text"></td>
      </tr>
      </logic:notEqual>
    </table>    </td>
  </tr>
</table></td>
    </tr>
  </table>
  <BR>
	<CENTER>
		<div id="info" style="color: red;font-size: 24px;"><input type="button" name="btnSubmit" value="确定" class="button_02" onclick="javascript:window.close();"/></div><BR>
		
	</CENTER>



</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	var gSelectedTD = null;
	var preTD = null;
	function SetValue(obj,roomTypeId,roomId,buildingId,buildingName,roomName,userId,userName){
		document.getElementById('info').innerHTML="你选择的是:"+buildingName+"&nbsp;<font color='#00A3E8'>"+roomName+"</font>&nbsp;&nbsp;<input type=\"button\" name=\"btnSubmit\" value=\"确定\" class=\"button_02\" onclick=\"javascript:window.close();\"/>";
	 	changeColor(obj);
		this.parent.window.opener.SetValue(roomTypeId,roomId,buildingId,buildingName,roomName,userId,userName);
		//window.close();
	}
	
	function changeColor(obj){
		if (gSelectedTD!=null){
			gSelectedTD.background = "";
		}else{
			if(typeof(document.all.initTD)!="undefined"){
				document.all.initTD.background = "image/select_room.jpg";
			}
		}
		gSelectedTD = obj;
		preTD = obj;
		obj.background = "image/select_room.jpg";
	}

    function GetRoomID(obj){
    	document.getElementById('QueryRoom/LayerNO/criteria/max').value=obj.value;
    }
    
	function GetBuildingId(obj){
		var objBuildingId=document.getElementById('QueryRoom/BuildingID/criteria/value');
		for (var i = objBuildingId.options.length; i > -1 ; i--) {
			objBuildingId.options.remove(i);
		}
		var varItem = new Option('请选择楼宇', -1);
		objBuildingId.options.add(varItem);
		var roomType=obj.value;
		if (roomType!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetBuildingList');
			sub.add("BuildingList/RoomTypeID/criteria/value", roomType);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='BuildingList']/BuildingList").length<1) {
					alert("楼宇查询错误，请重新查询！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='BuildingList']/BuildingList").length;i++) {
						var value=sub.getValues("root/data/list[@type='BuildingList']/BuildingList[@rowNum='"+i+"']/BuildingID");
						var option=sub.getValues("root/data/list[@type='BuildingList']/BuildingList[@rowNum='"+i+"']/BuildingName");
						var tempItem = new Option(option, value);
						objBuildingId.options.add(tempItem);
					}
				}
			}
		}
	}

	function GetLayerNo(obj) {
		var objLayerNo=document.getElementById('QueryRoom/LayerNO/criteria/min');
		for (var i = objLayerNo.options.length; i > -1 ; i--) {
			objLayerNo.options.remove(i);
		}
		var varItem = new Option('请选择层号', -1);
		objLayerNo.options.add(varItem);
		var buildingID=obj.value;
		var roomType=document.getElementById('RoomTypeID').value;
		if (buildingID!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetLayerNo');
			sub.add("LayerNo/BuildingID/criteria/value", buildingID);
			sub.add("LayerNo/RoomTypeID/criteria/value", roomType);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='LayerNo']/LayerNo").length<1) {
					alert("层号查询错误，请重新查询！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='LayerNo']/LayerNo").length;i++) {
						var no=sub.getValues("root/data/list[@type='LayerNo']/LayerNo[@rowNum='"+i+"']/LayerNO");
						var tempItem = new Option(no, no);
						objLayerNo.options.add(tempItem);
					}
				}
			}
		}
	}

	function toquery(n){
		
		var frm =document.forms[0];
		    frm.action=frm.elements["queryaction"].value;
		    if(n==2){
		    	frm.elements["QueryRoom/LayerNO/criteria/min"].value=null;
		    	frm.elements["QueryRoom/LayerNO/criteria/max"].value=null;
		    }
		frm.submit();
	}
	
	function viewLogs(RoomID){
		var frm =document.forms[0];
		var beginTime=frm.elements["QueryRoom/BeginTime[@pattern='yyyy-MM-dd']"].value;
		var endTime=frm.elements["QueryRoom/EndTime[@pattern='yyyy-MM-dd']"].value;
		var str="RoomID="+RoomID+"&QueryHousingLogs/BeginTime="+beginTime+"&QueryHousingLogs/EndTime="+endTime;
		
		window.open("studentmanage.prHousing.viewRoomHousingLogs.do?"+str,"","scrollbars=yes,width=500,height=350,top=100,left=200");
	}
</script>