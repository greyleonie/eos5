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
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;���д����ѹ���&gt;����Ǽ��޸�</td>
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
		     <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">���⾭�ѹ���ǼǱ�</td>
		</tr>
	    </table>
	  </td> 
	</tr>
	<tr>
	  <td class="text">    
	    <table width="96%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="17%"  class="td2">&nbsp;��������</td>
            <td class="td1" colspan="2">&nbsp;
            <html:text property="KetiLx/name" maxlength="50" readonly="true" attributesText='class="input" size="30" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/>
            <span class="text_red">*</span></td>
			<td width="17%" class="td2">&nbsp;���⸺����</td>
            <td class="td1" colspan="2">&nbsp;
            <html:text property="KetiLx/fuzeren" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="���⸺���˲���Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr>
			<td width="17%" class="td2">&nbsp;�������</td>
            <td class="td1" colspan="2">&nbsp;
            <html:text property="KetiLx/daima" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="������벻��Ϊ��"'/>
            <span class="text_red">*</span></td>
			<td width="17%" class="td2">&nbsp;�����ܶ�(Ԫ)</td>
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
            <td width="17%"  class="td2">&nbsp;��������</td>
            <td width="17%"  class="td2">&nbsp;���(Ԫ)</td>
			<td width="16%"  class="td2">&nbsp;��������</td>
            <td width="17%"  class="td2">&nbsp;���(Ԫ)</td>
			<td width="16%"  class="td2">&nbsp;��������</td>
            <td width="17%"  class="td2">&nbsp;���(Ԫ)</td>
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
            <td width="17%"  class="td2">&nbsp;ʹ�����</td>
            <td  class="td1" colspan="5">&nbsp;
            <html:text property="KetiLx/shiyong" maxlength="100" attributesText='class="input" size="100"'/></td>
          </tr>
		  <tr>
            <td width="17%"  class="td_title">&nbsp;����</td>
            <td width="17%"  class="td_title">&nbsp;���(Ԫ)</td>
			<td  class="td_title" colspan="3" align="center">�����ϸ</td>
			<td width="17%"  class="td_title">&nbsp;����ǩ��</td>
          </tr>
		  <tr>
            <td width="17%"  class="td1">&nbsp;</td>
            <td width="17%"  class="td1">&nbsp;</td>
			<td  class="td1" colspan="3">&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
          </tr>
		  
		  <tr>
            <td width="17%"  class="td2" align="right">�ϼ�&nbsp;&nbsp;</td>
            <td width="17%"  class="td1">&nbsp;</td>
			<td  class="td2" colspan="3" align="right">��ʹ���ܽ��&nbsp;&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
          </tr>
        </table>
        <table width="96%" align="center" height="20"  border="0"  cellpadding="0" cellspacing="1" id="spaceup">
	       <tr>
		     <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">�����ʹ��Ԥ��</td>
		</tr>
	    </table>
        <table width="65%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr>
          	<td width="50%"  class="td_title" align="center">&nbsp;���ѷ���</td>
            <td width="50%"  class="td_title">&nbsp;���(Ԫ)</td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;�����</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/guanlifei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/guanlifei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;���Ϸ�</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/ziliaofei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/ziliaofei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;���в��÷�</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/chailvfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/chailvfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;С�ͻ����</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/huiyifei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/huiyifei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;��������丨���豸���ú�ʹ�÷�</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/shiyongfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/shiyongfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;��ѯ��</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/zixunfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/zixunfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;ӡˢ��</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/yinshuafei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/yinshuafei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;�ɹ�������</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/jiandingfei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/jiandingfei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;�����</td>
            <td width="50%"  class="td1">&nbsp;<input type="text" name="KetiLx/laowufei" maxlength="10" class="input" size="25" 
            value = '<bean:write property="KetiLx/laowufei"/>' 
            onblur="getcount(this)" 
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /></td>
          </tr>
		  <tr>
          	<td width="50%"  class="td2" align="center">&nbsp;������</td>
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
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
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
       alert("�����ܶ��Ϊ�գ������벦���ܶ");
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
	   alert("�����Ԥ���ܶ�ܳ��������ܶ");
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
				msg += "--�������Ʋ���Ϊ�գ�\n";
				ok = false;
			}
			if(frm.elements["KetiLx/fuzeren"].value == "") {
				msg += "--���⸺���˲���Ϊ�գ�\n";
				ok = false;
			}
			if(frm.elements["KetiLx/daima"].value == "") {
				msg += "--������벻��Ϊ�գ�\n";
				ok = false;
			}
			if(frm.elements["KetiLx/zonge"].value == "") {
				msg += "--�����ܶ��Ϊ�գ�\n";
				ok = false;
			} else if(frm.elements["KetiLx/zonge"].value*1.0 != frm.elements["KetiLx/zonge"].value) {
				msg += "--�����ܶ����Ϊ���֣�\n";
				ok = false;
			}else{

			var pipei = "";
			var sum = 0;
			zonge = frm.elements["KetiLx/zonge"].value*1.0;
			for(i=1;i<3;i++) {
				var kkkk = eval("frm.elements['KetiLx/riqi"+i+"'].value == ''");
				var llll = eval("frm.elements['KetiLx/jine"+i+"'].value == ''");
				if(kkkk != llll) {
					pipei = "--���������벦���ƥ�䣡\n";
					ok = false;
				}
				if(eval("frm.elements['KetiLx/jine"+i+"'].value*1.0 != frm.elements['KetiLx/jine"+i+"'].value")) {
					msg += "--���������Ϊ���֣�\n";
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
				msg += "--���������ܽ��ó��������ܶ�,����ˣ�\n";
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
	   msg="�����Ԥ���ܶ�ܳ��������ܶ";
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
 