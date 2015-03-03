<%@include file="/internet/common.jsp"%>
<body>
<form method="post"  action="teachWorkManage.prNetCenter.videoRegAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;录像资料登记</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      
      
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		 <html:hidden property="VideoRegister/PlanType"/>
		 <html:hidden property="VideoRegister/PlanID" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">收录时间：</td>
            <td class="td1"><html:text  property="VideoRegister/RecordTime" attributesText='class="input" size="20" '/> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">题&nbsp;&nbsp;&nbsp;&nbsp;目：</td>
            <td class="td1"><html:text  property="VideoRegister/Title" maxlength="200"  attributesText='class="input" size="60" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">主讲人：</td>
            <td class="td1"><html:text  property="VideoRegister/Speaker" maxlength="20"  attributesText='class="input" size="20" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">单位：</td>
            <td class="td1"><html:text  property="VideoRegister/Org" maxlength="50"  attributesText='class="input" size="60" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">职务：</td>
            <td class="td1"><html:text  property="VideoRegister/Post" maxlength="50"  attributesText='class="input" size="60" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">收录人：</td>
            <td class="td1"><input class="input" size="30" name="VideoRegister/Recorder"  value="<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>"></td>
          </tr>
           <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">资料类型：</td>
            <td class="td1">            <html:select property="VideoRegister/DataType">
							<html:option value="">--请选择--</html:option>
							<html:option value="录像带">录像带</html:option>
							<html:option value="DV带">DV带</html:option>
							<html:option value="视频文件">视频文件</html:option>
							<html:option value="DVD">DVD</html:option>
							<html:option value="VCD">VCD</html:option>
							<html:option value="其它">其它</html:option>
			</html:select></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">资料来源：</td>
            <td class="td1">            <html:select property="VideoRegister/Source">
							<html:option value="">--请选择--</html:option>
							<html:option value="自录">自录</html:option>
							<html:option value="中央党校">中央党校</html:option>
							<html:option value="省党校">省党校</html:option>
							<html:option value="其他">其他</html:option>
			</html:select></td>
          </tr>
         <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">档案号：</td>
            <td class="td1"><html:text  property="VideoRegister/DocumentNO" maxlength="30"  attributesText='class="input" size="30" '/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">长度：</td>
            <td class="td1"><html:text  property="VideoRegister/Length"   attributesText='class="input" size="30" ValidateType="int",Msg="长度必须为数字" ' />分钟</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">录制好：</td>
            <td class="td1"><html:radio value="1" property="VideoRegister/IsOk" checked="true"/>
            是
            <html:radio value="0" property="VideoRegister/IsOk"/>
              否
            </td>
          </tr>
          

          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="td1"><textarea class="finput" name="VideoRegister/Remarks"  cols="80" rows="4"></textarea></td>
          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                 <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
    <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }

  </script>