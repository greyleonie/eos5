<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.roomEmptyList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;<span id="printTable">
            <logic:equal property="RoomTypeID" value="1">空闲课室列表</logic:equal>
            <logic:equal property="RoomTypeID" value="2">空闲客房列表</logic:equal>
            <logic:equal property="RoomTypeID" value="3">空闲讨论室列表</logic:equal>
            </span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prField.roomEmptyList.do?RoomTypeID=<bean:write property="RoomTypeID"/>" />
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

				日 期：从<html:text property="tblReceptionChangeRec/CreatedTime/criteria/min" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["tblReceptionChangeRec/CreatedTime/criteria/min"],"yyyy-MM-dd")> 
                到<html:text property="tblReceptionChangeRec/CreatedTime/criteria/max" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["tblReceptionChangeRec/CreatedTime/criteria/max"],"yyyy-MM-dd")> 
                 <html:hidden  property="tblReceptionChangeRec/CreatedTime/criteria/operator" value="between" />

                 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">   
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
               <logic:equal property="RoomTypeID" value="1">
               	  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">教室名</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">所在楼宇</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">所在楼层</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">座位数</td>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="2">
                  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">房号</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">所在楼宇</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">所在楼层</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">床位数</td>

             </logic:equal>
              <logic:equal property="RoomTypeID" value="3">
                  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">讨论室名</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">所在楼宇</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">所在楼层</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">座位数</td>
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
               	   <td  align="center" nowrap><bean:write id="resultset" property="Room/RoomName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/BuildingName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />层</td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/SeatNum" /></td>  
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