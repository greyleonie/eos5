<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.roomList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;<span id="printTable">
            <logic:equal property="RoomTypeID" value="1">课室信息列表</logic:equal>
            <logic:equal property="RoomTypeID" value="2">客房信息列表</logic:equal>
            <logic:equal property="RoomTypeID" value="3">讨论室信息列表</logic:equal>
            <logic:equal property="RoomTypeID" value="4">其它场地信息列表</logic:equal>
            </span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prField.roomList.do?RoomTypeID=<bean:write property="RoomTypeID"/>" />
		<input type="hidden" name="addaction" value="ICCard.prField.roomAdd.do?RoomTypeID=<bean:write property="RoomTypeID"/>&viewType=0" />
		<input type="hidden" name="modifyaction" value="ICCard.prField.roomModify.do?RoomTypeID=<bean:write property="RoomTypeID"/>&viewType=0" />
		<input type="hidden" name="deleteaction" value="ICCard.prField.roomDelete.do?RoomTypeID=<bean:write property="RoomTypeID"/>" />
		<html:hidden property="Room/_order/col1/field"/>
		<html:hidden property="Room/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="RoomTypeID" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>

            
            <td height="30" class="text">
              <logic:equal property="RoomTypeID" value="1"> 
              所属建筑物：<html:select property="Room/BuildingID/criteria/value" > 
              <html:option value="">--请选择--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select>
              <html:hidden property="Room/BuildingID/criteria/operator" value="="/>
              课室名：<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="2"> 
              所属建筑物：<html:select property="Room/BuildingID/criteria/value" > 
              <html:option value="">--请选择--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select>
              <html:hidden property="Room/BuildingID/criteria/operator" value="="/>
             客房号：<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="3"> 
              所属建筑物：<html:select property="Room/BuildingID/criteria/value" > 
              <html:option value="">--请选择--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select>
              <html:hidden property="Room/BuildingID/criteria/operator" value="="/>
              讨论室名：<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
               <logic:equal property="RoomTypeID" value="4"> 
               场地名：<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
                 <br/>
                 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">  
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentaddNew()">
				<input name="modify" type="button" class="button_02" value="修 改" onClick="modifyRoom()">
				<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				<input name="viewType" type="radio"  value="0"  checked="checked">列表
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">平铺
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" > 
                  </td>
               <logic:equal property="RoomTypeID" value="1">
               	  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">教室名</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">所在楼宇</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">所在楼层</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">座位数</td>
             
                  <td width="17%" align="center" nowrap id="Room.POTID" onClick="talentsort()">考勤机ID</td>
                  <td width="10%" align="center" nowrap id="Room.Price1" onClick="talentsort()">白天开<br/>空调价</td>
                  <td width="10%" align="center" nowrap id="Room.Price2" onClick="talentsort()">白天无<br/>空调价</td>
                  <td width="10%" align="center" nowrap id="Room.Price3" onClick="talentsort()">晚上开<br/>空调价</td>
                  <td width="10%" align="center" nowrap id="Room.Price4" onClick="talentsort()">晚上无<br/>空调价</td>
                  
              </logic:equal>
              <logic:equal property="RoomTypeID" value="2">
                  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">房号</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">所在楼宇</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">所在楼层</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">床位数</td>
                  
                  <td width="17%" align="center" nowrap id="Room.Tel" onClick="talentsort()">电话</td>
                  <td width="10%" align="center" nowrap id="Room.Price1" onClick="talentsort()">白天开<br/>空调价</td>
                  <td width="10%" align="center" nowrap id="Room.Price2" onClick="talentsort()">白天无<br/>空调价</td>
                  <td width="10%" align="center" nowrap id="Room.Price3" onClick="talentsort()">晚上开<br/>空调价</td>
                  <td width="10%" align="center" nowrap id="Room.Price4" onClick="talentsort()">晚上无<br/>空调价</td>
             </logic:equal>
              <logic:equal property="RoomTypeID" value="3">
                  <td width="20%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">讨论室名</td>
                  <td width="20%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">所在楼宇</td>
                  <td width="20%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">所在楼层</td>
                  <td width="20%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">座位数</td>
                 
                  <td width="17%" align="center" nowrap id="Room.Tel" onClick="talentsort()">电话</td>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="4">
                  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">场地名</td>
                 
                  <td width="10%" align="center" nowrap id="Room.Tel" onClick="talentsort()">电话</td>
             </logic:equal> 
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='Room']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td align="center">
				  <logic:present  id="resultset" property="Room/RoomID">
				  	<html:checkbox id="resultset" name="list[@name='update']/Room/RoomID" property="Room/RoomID" indexed="true"/>
				  </logic:present>
				  </td>
				    <logic:equal property="RoomTypeID" value="1">
               	   <td  align="center" nowrap><bean:write id="resultset" property="Room/RoomName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/BuildingName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />层</td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/SeatNum" /></td>
                
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/POTID" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price1" language="zh" country="CN"/></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price2" language="zh" country="CN"/></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price3" language="zh" country="CN"/></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price4" language="zh" country="CN"/></td>
                  
              </logic:equal>
              <logic:equal property="RoomTypeID" value="2">
               <td  align="center" nowrap><bean:write id="resultset" property="Room/RoomName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/BuildingName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />层</td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/SeatNum" /></td>
                  
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Tel" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price1" language="zh" country="CN"/></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price2" language="zh" country="CN"/></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price3" language="zh" country="CN"/></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Price4" language="zh" country="CN"/></td>
             </logic:equal>
              <logic:equal property="RoomTypeID" value="3">
                   <td  align="center" nowrap><bean:write id="resultset" property="Room/RoomName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/BuildingName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />层</td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/SeatNum" /></td>
                 
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Tel" /></td>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="4">
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/RoomName" /></td>
                  
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/Tel" /></td>
             </logic:equal> 
				  
				  
				  
                
                </tr>
				</logic:iterate>
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		     </script>
			  </td>
            </tr>
			 
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
function changeViewType() {
	var frm = document.forms[0];
	var RoomTypeID = frm["RoomTypeID"].value;
	window.location.href="ICCard.prField.roomAll.do?RoomTypeID="+RoomTypeID;
}
//修改
function modifyRoom() {
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
    	}
		if(chechedCount(frm)==1){
			id = getChechedValue(frm);
    		frm.action = frm.elements["modifyaction"].value;
    		frm.action += "&fid=" + id;
			frm.submit();		
    	}
		

}




</script>
<script>
	loadOrderImg(document.forms[0],'Room');
</script>