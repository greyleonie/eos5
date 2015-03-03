<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prMeetingManage.meetingRoomModifyDO.do">
  <html:hidden property="MR_REGISTER/MRCODE"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议管理—&gt;会议室修改</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">名&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
            <td width="35%" class="td1">&nbsp;<html:text property="MR_REGISTER/MRNAME" attributesText='class="input" size="30" ValidateType="notempty" Msg="名称不能为空"'/></td>
            <td width="15%" align="right" class="td2">容纳人数：</td>
            <td width="35%" class="td1">&nbsp;<html:text property="MR_REGISTER/PERSON" attributesText='class="input" size="30" ValidateType="int" Msg="人数必须为整数"'/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">类&nbsp;&nbsp;&nbsp;&nbsp;型：</td>
            <td class="td1">&nbsp;<html:text property="MR_REGISTER/MRTYPE" attributesText='class="input" size="30" '/></td>
            <td align="right" class="td2">地&nbsp;&nbsp;&nbsp;&nbsp;点：</td>
            <td class="td1">&nbsp;<html:text property="MR_REGISTER/ADDRESS" attributesText='class="input" size="30" '/></td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">设备情况：</td>
            <td colspan="3" class="td1">&nbsp;<html:textarea property="MR_REGISTER/Equipment" rows="5" size="66"  attributesText='class="input"   maxlength="500"'/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">描&nbsp;&nbsp;&nbsp;&nbsp;述：</td>
            <td colspan="3" class="td1">&nbsp;<html:textarea property="MR_REGISTER/REMARK" rows="5" size="66"  attributesText='class="input"   maxlength="300"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">签到机：</td>
            <td colspan="3" class="td1">&nbsp;<html:text property="POT_NAME"  readonly="readonly" attributesText='class="input" size="30" ' />
            	<html:hidden property="MR_REGISTER/ConferencPOTID"  attributesText=' ValidateType="notempty" Msg="请选择签到机"' />
      
              <input type="button" name="receiver" class="button_02"  value="选择" elname="MR_REGISTER/ConferencPOTID,POT_NAME" onClick="selectConferencePOT()">
			  
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">管理员：</td>
            <td colspan="3" class="td1">&nbsp;<input type="text" name="EMCEE_NAME"  readonly="readonly" class="input" size="30"  value='<bean:write property="MR_REGISTER/ManagerID" formatClass="username" formatType="operatorID"/>' >
            	
            	<html:hidden property="MR_REGISTER/ManagerID"  attributesText=' ValidateType="notempty" Msg="请选择管理员"' />
     
              <input type="button" name="receiver" class="button_02"  value="选择" elname="MR_REGISTER/ManagerID,EMCEE_NAME" onClick="singleselectUser()">
            </td>
          </tr>
          <!--<tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">使用状态：</td>
            <td colspan="3" class="td1">&nbsp;<dict:select property="MR_REGISTER/STATECODE" businTypeId="dx_MR_STATECODE"></dict:select>
            </td>
          </tr>
          
        --></table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  </script>
 