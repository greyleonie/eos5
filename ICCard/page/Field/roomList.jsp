<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.roomList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���ع���&gt;<span id="printTable">
            <logic:equal property="RoomTypeID" value="1">������Ϣ�б�</logic:equal>
            <logic:equal property="RoomTypeID" value="2">�ͷ���Ϣ�б�</logic:equal>
            <logic:equal property="RoomTypeID" value="3">��������Ϣ�б�</logic:equal>
            <logic:equal property="RoomTypeID" value="4">����������Ϣ�б�</logic:equal>
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
              ���������<html:select property="Room/BuildingID/criteria/value" > 
              <html:option value="">--��ѡ��--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select>
              <html:hidden property="Room/BuildingID/criteria/operator" value="="/>
              ��������<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="2"> 
              ���������<html:select property="Room/BuildingID/criteria/value" > 
              <html:option value="">--��ѡ��--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select>
              <html:hidden property="Room/BuildingID/criteria/operator" value="="/>
             �ͷ��ţ�<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="3"> 
              ���������<html:select property="Room/BuildingID/criteria/value" > 
              <html:option value="">--��ѡ��--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select>
              <html:hidden property="Room/BuildingID/criteria/operator" value="="/>
              ����������<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
               <logic:equal property="RoomTypeID" value="4"> 
               ��������<html:text property="Room/RoomName/criteria/value" attributesText='class="input" size="30"' maxlength="100"/>
              <html:hidden property="Room/RoomName/criteria/operator" value="like"/>
              <html:hidden property="Room/RoomName/criteria/likeRule" value="center"/>
              </logic:equal>
                 <br/>
                 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">  
                <input name="add" type="button" class="button_02" value="�� ��" onClick="talentaddNew()">
				<input name="modify" type="button" class="button_02" value="�� ��" onClick="modifyRoom()">
				<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				<input name="viewType" type="radio"  value="0"  checked="checked">�б�
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">ƽ��
				
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
               	  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">����¥��</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">����¥��</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">��λ��</td>
             
                  <td width="17%" align="center" nowrap id="Room.POTID" onClick="talentsort()">���ڻ�ID</td>
                  <td width="10%" align="center" nowrap id="Room.Price1" onClick="talentsort()">���쿪<br/>�յ���</td>
                  <td width="10%" align="center" nowrap id="Room.Price2" onClick="talentsort()">������<br/>�յ���</td>
                  <td width="10%" align="center" nowrap id="Room.Price3" onClick="talentsort()">���Ͽ�<br/>�յ���</td>
                  <td width="10%" align="center" nowrap id="Room.Price4" onClick="talentsort()">������<br/>�յ���</td>
                  
              </logic:equal>
              <logic:equal property="RoomTypeID" value="2">
                  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">����</td>
                  <td width="10%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">����¥��</td>
                  <td width="10%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">����¥��</td>
                  <td width="10%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">��λ��</td>
                  
                  <td width="17%" align="center" nowrap id="Room.Tel" onClick="talentsort()">�绰</td>
                  <td width="10%" align="center" nowrap id="Room.Price1" onClick="talentsort()">���쿪<br/>�յ���</td>
                  <td width="10%" align="center" nowrap id="Room.Price2" onClick="talentsort()">������<br/>�յ���</td>
                  <td width="10%" align="center" nowrap id="Room.Price3" onClick="talentsort()">���Ͽ�<br/>�յ���</td>
                  <td width="10%" align="center" nowrap id="Room.Price4" onClick="talentsort()">������<br/>�յ���</td>
             </logic:equal>
              <logic:equal property="RoomTypeID" value="3">
                  <td width="20%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">��������</td>
                  <td width="20%" align="center" nowrap id="Room.BuildingName" onClick="talentsort()">����¥��</td>
                  <td width="20%" align="center" nowrap id="Room.LayerNO" onClick="talentsort()">����¥��</td>
                  <td width="20%" align="center" nowrap id="Room.SeatNum" onClick="talentsort()">��λ��</td>
                 
                  <td width="17%" align="center" nowrap id="Room.Tel" onClick="talentsort()">�绰</td>
              </logic:equal>
              <logic:equal property="RoomTypeID" value="4">
                  <td width="10%" align="center" nowrap id="Room.RoomName" onClick="talentsort()">������</td>
                 
                  <td width="10%" align="center" nowrap id="Room.Tel" onClick="talentsort()">�绰</td>
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
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />��</td>
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
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />��</td>
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
                  <td  align="center" nowrap><bean:write id="resultset" property="Room/LayerNO" />��</td>
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
//�޸�
function modifyRoom() {
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
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