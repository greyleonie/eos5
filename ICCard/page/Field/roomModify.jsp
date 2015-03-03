<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.roomModifyDo.do">
<logic:greaterThan property="count" value="1"><script> alert("房名已存在");</script> </logic:greaterThan>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
              <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;<span id="printTable">
              <logic:equal property="RoomTypeID" value="1">课室信息修改</logic:equal>
            <logic:equal property="RoomTypeID" value="2">客房信息修改</logic:equal>
            <logic:equal property="RoomTypeID" value="3">讨论室信息修改</logic:equal>
            <logic:equal property="RoomTypeID" value="4">其它场地信息修改</logic:equal></span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="Room/_order/col1/field"/>
		<html:hidden property="Room/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="Room/RoomTypeID"/>
		<html:hidden property="Room/RoomID"  />
		<input type="hidden" name="RoomTypeID"  value="<bean:write property="Room/RoomTypeID"/>" />
		<html:hidden property="viewType"  />
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">  
	    <logic:equal property="RoomTypeID" value="1"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">所属建筑物：</td>
            <td class="td1"> <html:select property="Room/BuildingID"  attributesText=' ValidateType="notempty"  Msg="所属建筑物不能为空"'> 
              <html:option value="">--请选择--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select><span class="text_red">*</span>
			 </td>
			 <td align="right" class="td2">所在楼层： </td>
          <td  class="td1" ><html:text property="Room/LayerNO" attributesText='class="input" size="20"  ValidateType="notempty,int"  Msg="所在楼层不能为空;所在楼层必须是数字"'/> <span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">房间名称： </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="房间名称不能为空"'/> <span class="text_red">*</span>
           </td>
            <td align="right" class="td2">座位数： </td>
          <td class="td1" ><html:text property="Room/SeatNum" attributesText='class="input" size="20" ValidateType="int,notempty" Msg="床位数必须为数字;座位数不能为空"'/> <span class="text_red">*</span>
           </td>

        </tr>
        <tr> 
          <td align="right" class="td2">考勤机ID：</td>
         <td class="td1" colspan="3"><html:text property="Room/POTID" attributesText='class="input" size="20"'/> </td>
         
       
        </tr>
        <tr> 
          <td align="right" class="td2">白天开空调价： </td>
          <td class="td1"><html:text property="Room/Price1" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字" '/></td>
          <td align="right" class="td2">白天无空调价：</td>
           <td class="td1"><html:text property="Room/Price2" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字"'/></td></tr>
           <tr> 
          <td align="right" class="td2">晚上开空调价： </td>
          <td class="td1"><html:text property="Room/Price3" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字"'/></td>
          <td align="right" class="td2">晚上无空调价：</td>
           <td class="td1"><html:text property="Room/Price4" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字"'/></td></tr>
      </table>
      </logic:equal>
      
      
       <logic:equal property="RoomTypeID" value="2"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">所属建筑物：</td>
            <td class="td1"> <html:select property="Room/BuildingID"  attributesText=' ValidateType="notempty"  Msg="所属建筑物不能为空"'> 
              <html:option value="">--请选择--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select><span class="text_red">*</span>
			 </td>
			 <td align="right" class="td2">所在楼层： </td>
          <td  class="td1" ><html:text property="Room/LayerNO" attributesText='class="input" size="20"  ValidateType="notempty,int"  Msg="所在楼层不能为空;所在楼层必须是数字"'/> <span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">房间名称： </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="房间名称不能为空"'/> <span class="text_red">*</span>
           </td>
            <td align="right" class="td2">床位数： </td>
          <td class="td1" ><html:text property="Room/SeatNum" attributesText='class="input" size="20" ValidateType="int" Msg="床位数必须为数字"'/> 
           </td>

        </tr>
        <tr> 
        
          <td align="right" class="td2">电话： </td>
          <td class="td1" colspan="3"><html:text property="Room/Tel" attributesText='class="input" size="20" ValidateType="int" Msg="电话必须为数字"'/> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">白天开空调价： </td>
          <td class="td1"><html:text property="Room/Price1" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字" '/></td>
          <td align="right" class="td2">白天无空调价：</td>
           <td class="td1"><html:text property="Room/Price2" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字"'/></td></tr>
           <tr> 
          <td align="right" class="td2">晚上开空调价： </td>
          <td class="td1"><html:text property="Room/Price3" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字"'/></td>
          <td align="right" class="td2">晚上无空调价：</td>
           <td class="td1"><html:text property="Room/Price4" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字"'/></td></tr>
      </table>
      </logic:equal>
       
       <logic:equal property="RoomTypeID" value="3"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">所属建筑物：</td>
            <td class="td1"> <html:select property="Room/BuildingID"  attributesText=' ValidateType="notempty"  Msg="所属建筑物不能为空"'> 
              <html:option value="">--请选择--</html:option> 
              <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select><span class="text_red">*</span>
			 </td>
			 <td align="right" class="td2">所在楼层： </td>
          <td  class="td1" ><html:text property="Room/LayerNO" attributesText='class="input" size="20"  ValidateType="notempty,int"  Msg="所在楼层不能为空;所在楼层必须是数字"'/> <span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">讨论室名称： </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="房间名称不能为空"'/> <span class="text_red">*</span>
           </td>
            <td align="right" class="td2">座位数： </td>
          <td class="td1" ><html:text property="Room/SeatNum" attributesText='class="input" size="20" ValidateType="int" Msg="床位数必须为数字"'/> 
           </td>
        </tr>
                <tr> 
          <td align="right" class="td2">电话号码：</td>
         <td class="td1" colspan="3"><html:text property="Room/Tel" attributesText='class="input" size="20"'/> </td>
          
       
        </tr>
      </table>
      </logic:equal>
      
      
       <logic:equal property="RoomTypeID" value="4"> <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr> 
          <td align="right" class="td2">场地名称： </td>
          <td class="td1" ><html:text property="Room/RoomName" attributesText='class="input" size="20" ValidateType="notempty" Msg="场地名称不能为空"' /> <span class="text_red">*</span>
          <html:hidden property="Room/LayerNO"/>
          <html:hidden property="Room/BuildingID"/>
          </td>
        </tr>
        
        <tr>
          <td align="right" class="td2">电话： </td>
          <td class="td1"><html:text property="Room/Tel" attributesText='class="input" size="20" ValidateType="int" Msg="电话必须为数字"'/> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">价格： </td>
          <td class="td1"><html:text property="Room/Price1" attributesText='class="input" size="20" ValidateType="money" Msg="价格必须为数字" '/></td>
         </tr>
      </table></logic:equal>
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
          </table>
      
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
  	// 返回到查询页面
function goBack() {
		var frm = document.forms[0];
		var viewType = frm.viewType.value;
		var RoomTypeID = frm["RoomTypeID"].value;
		if(viewType == 1){
		window.location.href = "ICCard.prField.roomAll.do?RoomTypeID="+RoomTypeID;
		}else{
		window.location.href = "ICCard.prField.buildingList.do?RoomTypeID="+RoomTypeID;
		}
	}
  
  </script>
  