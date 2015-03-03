<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>

<form method="post" enctype="multipart/form-data" action="oa.prResearchFunds.officeFundsModifyDo.do">		
		<html:hidden property="KetiLx/_order/col1/field"/>
		<html:hidden property="KetiLx/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="KetiLx/ketiLxID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;科研处经费管理—&gt;立项登记修改</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0"  cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td >
	    <table width="96%" align="center" height="20"  border="0"  cellpadding="0" cellspacing="1" id="spaceup">
	       <tr>
		     <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">课题经费管理登记表</td>
		</tr>
	    </table>
	  </td> 
	</tr>
	<tr>
	  <td class="text">    
	    <table width="96%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="17%"  class="td2">&nbsp;课题名称</td>
            <td class="td1" colspan="2">&nbsp;
            <html:text property="KetiLx/name" maxlength="50" readonly="true" attributesText='class="input" size="30" ValidateType="notempty" Msg="课题名称不能为空"'/>
            <span class="text_red">*</span></td>
			<td width="17%" class="td2">&nbsp;课题负责人</td>
            <td class="td1" colspan="2">&nbsp;
            <html:text property="KetiLx/fuzeren" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="课题负责人不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr>
			<td width="17%" class="td2">&nbsp;课题代码</td>
            <td class="td1" colspan="2">&nbsp;
            <html:text property="KetiLx/daima" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="课题代码不能为空"'/>
            <span class="text_red">*</span></td>
			<td width="17%" class="td2">&nbsp;拨款总额(元)</td>
            <td class="td1" colspan="2">&nbsp;
            <input type="text" name="KetiLx/zonge" maxlength="10" class="input" size="30" 
            value = '<bean:write property="KetiLx/zonge"/>' 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" />
			<span class="text_red">*</span></td>
          </tr>
          <tr>
            <td width="17%"  class="td2">&nbsp;拨款日期</td>
            <td width="17%"  class="td2">&nbsp;金额(元)</td>
			<td width="16%"  class="td2">&nbsp;拨款日期</td>
            <td width="17%"  class="td2">&nbsp;金额(元)</td>
			<td width="16%"  class="td2">&nbsp;拨款日期</td>
            <td width="17%"  class="td2">&nbsp;金额(元)</td>
          </tr>
		  <tr>
            <td width="17%"  class="td1">&nbsp;
			<html:text property="KetiLx/riqi1" maxlength="50" attributesText='class="input" size="13"'/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["KetiLx/riqi1"],"yyyy-MM-dd")></td>
            <td width="17%" class="td1" >&nbsp;
            <input type="text" name="KetiLx/jine1" maxlength="10" class="input" size="15" 
            value = '<bean:write property="KetiLx/jine1"/>' 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" />
            </td>
			<td width="16%"  class="td1">&nbsp;
			<html:text property="KetiLx/riqi2" maxlength="50" attributesText='class="input" size="13"'/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["KetiLx/riqi2"],"yyyy-MM-dd")></td>
            <td width="17%" class="td1" >&nbsp;
            <input type="text" name="KetiLx/jine2" maxlength="10" class="input" size="15" 
            value = '<bean:write property="KetiLx/jine2"/>' 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" />
            </td>
			<td width="16%"  class="td1">&nbsp;
			<html:text property="KetiLx/riqi3" maxlength="50" attributesText='class="input" size="13"'/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["KetiLx/riqi3"],"yyyy-MM-dd")></td>
            <td width="17%" class="td1" >&nbsp;
            <input type="text" name="KetiLx/jine3" maxlength="10" class="input" size="15" 
            value = '<bean:write property="KetiLx/jine3"/>' 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" />
            </td>
          </tr>
		  <tr>
            <td width="17%"  class="td2">&nbsp;使用情况</td>
            <td  class="td1" colspan="5">&nbsp;
            <html:text property="KetiLx/shiyong" maxlength="100" attributesText='class="input" size="100"'/></td>
          </tr>
		  <tr>
            <td width="17%"  class="td_title">&nbsp;日期</td>
            <td width="17%"  class="td_title">&nbsp;金额(元)</td>
			<td  class="td_title" colspan="3" align="center">金额明细</td>
			<td width="17%"  class="td_title">&nbsp;财务签名</td>
          </tr>
		  <tr>
            <td width="17%"  class="td1">&nbsp;</td>
            <td width="17%"  class="td1">&nbsp;</td>
			<td  class="td1" colspan="3">&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
          </tr>
		  
		  <tr>
            <td width="17%"  class="td2" align="right">合计&nbsp;&nbsp;</td>
            <td width="17%"  class="td1">&nbsp;</td>
			<td  class="td2" colspan="3" align="right">已使用总金额&nbsp;&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
          </tr>
        </table>
        <table width="96%" align="center" height="20"  border="0"  cellpadding="0" cellspacing="1" id="spaceup">
	       <tr>
		     <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">各项经费使用预算</td>
		</tr>
	    </table>
        <table width="65%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr>
          	<td width="50%"  class="td_title" align="center">&nbsp;经费分类</td>
            <td width="50%"  class="td_title">&nbsp;金额(元)</td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;管理费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/guanlifei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/guanlifei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;资料费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/ziliaofei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/ziliaofei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;调研差旅费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/chailvfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/chailvfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;小型会议费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/huiyifei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/huiyifei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;计算机及其辅助设备购置和使用费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/shiyongfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/shiyongfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;咨询费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/zixunfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/zixunfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;印刷费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/yinshuafei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/yinshuafei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;成果鉴定费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/jiandingfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/jiandingfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;劳务费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/laowufei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/laowufei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;其它费</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/qitafei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/qitafei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
        </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
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

	if(checks())
	  frm.submit();
  
  }
  
  function getcount(obj,id){
    var zonge = 0;
    var count = 0;
    var frm = document.forms[0];
    
    if (obj.value != "") {
    if (frm.elements["KetiLx/zonge"].value != "")
       zonge = document.forms[0].elements["KetiLx/zonge"].value * 1.0
    else {
       alert("拨款总额不能为空，请输入拨款总额！");
       obj.value = "";
       document.forms[0].elements["KetiLx/zonge"].focus();
       return false;
    }
    }
	
  	if (frm.elements["KetiLx/guanlifei"].value!="" && frm.elements["KetiLx/guanlifei"].value*1.0 == frm.elements["KetiLx/guanlifei"].value) {
	   count += frm.elements["KetiLx/guanlifei"].value*1.0;
	}
	if (frm.elements["KetiLx/ziliaofei"].value!="" && frm.elements["KetiLx/ziliaofei"].value*1.0 == frm.elements["KetiLx/ziliaofei"].value) {
	   count += frm.elements["KetiLx/ziliaofei"].value*1.0;
	}
	if (frm.elements["KetiLx/chailvfei"].value!="" && frm.elements["KetiLx/chailvfei"].value*1.0 == frm.elements["KetiLx/chailvfei"].value) {
	   count += frm.elements["KetiLx/chailvfei"].value*1.0;
	}
	if (frm.elements["KetiLx/huiyifei"].value!="" && frm.elements["KetiLx/huiyifei"].value*1.0 == frm.elements["KetiLx/huiyifei"].value) {
	   count += frm.elements["KetiLx/huiyifei"].value*1.0;
	}
	if (frm.elements["KetiLx/shiyongfei"].value!="" && frm.elements["KetiLx/shiyongfei"].value*1.0 == frm.elements["KetiLx/shiyongfei"].value) {
	   count += frm.elements["KetiLx/shiyongfei"].value*1.0;
	}
	if (frm.elements["KetiLx/zixunfei"].value!="" && frm.elements["KetiLx/zixunfei"].value*1.0 == frm.elements["KetiLx/zixunfei"].value) {
	   count += frm.elements["KetiLx/zixunfei"].value*1.0;
	}
	if (frm.elements["KetiLx/yinshuafei"].value!="" && frm.elements["KetiLx/yinshuafei"].value*1.0 == frm.elements["KetiLx/yinshuafei"].value) {
	   count += frm.elements["KetiLx/yinshuafei"].value*1.0;
	}
	if (frm.elements["KetiLx/jiandingfei"].value!="" && frm.elements["KetiLx/jiandingfei"].value*1.0 == frm.elements["KetiLx/jiandingfei"].value) {
	   count += frm.elements["KetiLx/jiandingfei"].value*1.0;
	}
	if (frm.elements["KetiLx/laowufei"].value!="" && frm.elements["KetiLx/laowufei"].value*1.0 == frm.elements["KetiLx/laowufei"].value) {
	   count += frm.elements["KetiLx/laowufei"].value*1.0;
	}
	if (frm.elements["KetiLx/qitafei"].value!="" && frm.elements["KetiLx/qitafei"].value*1.0 == frm.elements["KetiLx/qitafei"].value) {
	   count += frm.elements["KetiLx/qitafei"].value*1.0;
	}
	if (obj.value != "" && count > zonge) {
	   alert("各项经费预算总额不能超过拨款总额！");
	   obj.focus();
       return false;
	}
  }
  
  function checks() {
			var msg = "";
            var zonge = 0;
            var count = 0;
			var ok = true;
			var frm = document.forms[0];
			if(frm.elements["KetiLx/name"].value == "") {
				msg += "--课题名称不能为空！\n";
				ok = false;
			}
			if(frm.elements["KetiLx/fuzeren"].value == "") {
				msg += "--课题负责人不能为空！\n";
				ok = false;
			}
			if(frm.elements["KetiLx/daima"].value == "") {
				msg += "--课题代码不能为空！\n";
				ok = false;
			}
			if(frm.elements["KetiLx/zonge"].value == "") {
				msg += "--拨款总额不能为空！\n";
				ok = false;
			} else if(frm.elements["KetiLx/zonge"].value*1.0 != frm.elements["KetiLx/zonge"].value) {
				msg += "--拨款总额必须为数字！\n";
				ok = false;
			}else{

			var pipei = "";
			var sum = 0;
			zonge = frm.elements["KetiLx/zonge"].value*1.0;
			for(i=1;i<3;i++) {
				var kkkk = eval("frm.elements['KetiLx/riqi"+i+"'].value == ''");
				var llll = eval("frm.elements['KetiLx/jine"+i+"'].value == ''");
				if(kkkk != llll) {
					pipei = "--拨款日期与拨款金额不匹配！\n";
					ok = false;
				}
				if(eval("frm.elements['KetiLx/jine"+i+"'].value*1.0 != frm.elements['KetiLx/jine"+i+"'].value")) {
					msg += "--拨款金额必须为数字！\n";
					ok = false;
				}else{
				  if(eval("frm.elements['KetiLx/jine"+i+"'].value!=''")){
				     var num = eval("frm.elements['KetiLx/jine"+i+"'].value");

					sum += num * 1.0 ;
				  }
				}
			}
			
			msg += pipei;
			if(sum > frm.elements["KetiLx/zonge"].value * 1.0){
				msg += "--分批拨款总金额不得超过拨款总额,请审核！\n";
				ok = false;
			}
            }
            
            
			
    if (frm.elements["KetiLx/guanlifei"].value!="" && frm.elements["KetiLx/guanlifei"].value*1.0 == frm.elements["KetiLx/guanlifei"].value) {
	   count += frm.elements["KetiLx/guanlifei"].value*1.0;
	}
	if (frm.elements["KetiLx/ziliaofei"].value!="" && frm.elements["KetiLx/ziliaofei"].value*1.0 == frm.elements["KetiLx/ziliaofei"].value) {
	   count += frm.elements["KetiLx/ziliaofei"].value*1.0;
	}
	if (frm.elements["KetiLx/chailvfei"].value!="" && frm.elements["KetiLx/chailvfei"].value*1.0 == frm.elements["KetiLx/chailvfei"].value) {
	   count += frm.elements["KetiLx/chailvfei"].value*1.0;
	}
	if (frm.elements["KetiLx/huiyifei"].value!="" && frm.elements["KetiLx/huiyifei"].value*1.0 == frm.elements["KetiLx/huiyifei"].value) {
	   count += frm.elements["KetiLx/huiyifei"].value*1.0;
	}
	if (frm.elements["KetiLx/shiyongfei"].value!="" && frm.elements["KetiLx/shiyongfei"].value*1.0 == frm.elements["KetiLx/shiyongfei"].value) {
	   count += frm.elements["KetiLx/shiyongfei"].value*1.0;
	}
	if (frm.elements["KetiLx/zixunfei"].value!="" && frm.elements["KetiLx/zixunfei"].value*1.0 == frm.elements["KetiLx/zixunfei"].value) {
	   count += frm.elements["KetiLx/zixunfei"].value*1.0;
	}
	if (frm.elements["KetiLx/yinshuafei"].value!="" && frm.elements["KetiLx/yinshuafei"].value*1.0 == frm.elements["KetiLx/yinshuafei"].value) {
	   count += frm.elements["KetiLx/yinshuafei"].value*1.0;
	}
	if (frm.elements["KetiLx/jiandingfei"].value!="" && frm.elements["KetiLx/jiandingfei"].value*1.0 == frm.elements["KetiLx/jiandingfei"].value) {
	   count += frm.elements["KetiLx/jiandingfei"].value*1.0;
	}
	if (frm.elements["KetiLx/laowufei"].value!="" && frm.elements["KetiLx/laowufei"].value*1.0 == frm.elements["KetiLx/laowufei"].value) {
	   count += frm.elements["KetiLx/laowufei"].value*1.0;
	}
	if (frm.elements["KetiLx/qitafei"].value!="" && frm.elements["KetiLx/qitafei"].value*1.0 == frm.elements["KetiLx/qitafei"].value) {
	   count += frm.elements["KetiLx/qitafei"].value*1.0;
	}
	if (count > zonge) {
	   msg="各项经费预算总额不能超过拨款总额！";
       ok = false;
	}
	
			if(ok) {
				return true;
			} else {
				alert(msg);
				return false;
			}
		}
  </script>
 