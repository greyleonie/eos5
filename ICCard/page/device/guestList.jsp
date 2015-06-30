<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDevice.elockList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
        <tr>
          <td width="15"></td>
          <td class="text_wirte">首页—&gt;一卡通—&gt;刷卡终端管理—&gt;散客住宿 </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDevice.elockList.do">
		<input type="hidden" name="zhushuaction" value="ICCard.prField.guestRoomBookAdd.do">
		<input type="hidden" name="tuifangaction" value="ICCard.prField.guestRoomCheckOut.do">
		<html:hidden property="QueryRoom/_order/col1/field"/>
		<html:hidden property="QueryRoom/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="input/LogsID"/>
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
            <td class="text">楼 名： <html:select property="QueryRoom/BuildingID/criteria/value"  attributesText='id="printTable"'  onchange="talentquery()"> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select> &nbsp;
			
			  &nbsp;
			 
			  <input name="modify" type="button" class="button_02" value="住宿登记" onClick="zhushu()">
			  <input name="add" type="button" class="button_02" value="退房管理" onClick="tuifang()">
			  <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
			  <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
			  服务端排序：
			  <input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">			 </td>
      </tr>
	  
	 
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> &nbsp;   </td>
                  <td width="16%" align="center" nowrap id="QueryRoom.Content" onClick="talentsort()">楼名</td>
                  <td width="16%" align="center" nowrap id="QueryRoom.CreatorName" onClick="talentsort()">房号</td>
                  <td width="16%" align="center" nowrap id="QueryRoom.ChangeTime" onClick="talentsort()">电话</td>
                  <td width="16%" align="center" nowrap id="QueryRoom.PublishTime" onClick="talentsort()">原有床位</td>
                  <td width="16%" align="center" nowrap id="QueryRoom.PublishTime" onClick="talentsort()">住宿类型</td>
                  <td width="15%" align="center" nowrap id="QueryRoom.PublishTime" onClick="talentsort()">价格</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryRoom']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="QueryRoom/RoomID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryRoom/RoomID">
				  	<html:radio id="resultset" name="input/RoomID" property="QueryRoom/RoomID"/>
				  </logic:present>				  </td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryRoom/BuildingName" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryRoom/RoomName" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryRoom/Tel"/></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryRoom/SeatNum"/></td>
                  <td nowrap align="center">
                	<%
                	String RoomTypeID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/RoomTypeID"));
                	if(RoomTypeID.equals("3")) out.println("散客关系");
                	else out.println("空房");
                	 %>
                  
                 </td>
                  <td nowrap align="center">0</td>
                  </tr>
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function zhushu(){
	var frm = document.forms[0];
	
	frm.action = frm.elements["zhushuaction"].value ;
   	frm.submit();

}
function tuifang(){
	var frm = document.forms[0];
	var logs=frm["input/LogsID"].value;
	if(logs == ""){
		alert("没有住房记录");
		return;
	}
	frm.action = frm.elements["tuifangaction"].value ;

   	frm.submit();

}
</script>