<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>

<form method="post" enctype="multipart/form-data" action="oa.prResearchFunds.groupFundsApplyDo.do">		
		<html:hidden property="KetiLx/_order/col1/field"/>
		<html:hidden property="KetiLx/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="KetiLx/ketiLxID" />
		<html:hidden property="KetiLx/guanlifei" />
		<html:hidden property="KetiLx/ziliaofei" />
		<html:hidden property="KetiLx/chailvfei" />
		<html:hidden property="KetiLx/huiyifei" />
		<html:hidden property="KetiLx/shiyongfei" />
		<html:hidden property="KetiLx/zixunfei" />
		<html:hidden property="KetiLx/yinshuafei" />
		<html:hidden property="KetiLx/jiandingfei" />
		<html:hidden property="KetiLx/laowufei" />
		<html:hidden property="KetiLx/qitafei" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;�����龭�ѹ���&gt;�޸ı���</td>
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
            <bean:write property="KetiLx/name"/>
            </td>
			<td width="17%" class="td2">&nbsp;�����鸺����</td>
            <td class="td1" colspan="2">&nbsp;
            <bean:write property="KetiLx/fuzeren"/>
            </td>
          </tr>
		  <tr>
            <td width="17%" class="td2">&nbsp;���</td>
            <td width="17%" class="td1">&nbsp;
            <bean:write property="KetiLx/xuhao"/>
            </td>
			<td width="16%" class="td2">&nbsp;�������</td>
            <td width="17%" class="td1">&nbsp;
            <bean:write property="KetiLx/daima"/>
            </td>
			<td width="16%" class="td2">&nbsp;�����ܶ�(Ԫ)</td>
            <td width="17%" class="td1">&nbsp;
            <bean:write property="KetiLx/zonge"/>
			</td>
          </tr>
          <tr>
            <td width="17%"  class="td2" align="center">��������</td>
            <td width="17%"  class="td2" align="center">���(Ԫ)</td>
			<td width="16%"  class="td2" align="center">��������</td>
            <td width="17%"  class="td2" align="center">���(Ԫ)</td>
			<td width="16%"  class="td2" align="center">��������</td>
            <td width="17%"  class="td2" align="center">���(Ԫ)</td>
          </tr>
		  <tr>
            <td width="17%"  class="td1" align="center">
            <bean:write property="KetiLx/riqi1"/>
			</td>
            <td width="17%" class="td1" align="center">
            <bean:write property="KetiLx/jine1"/>
            </td>
			<td width="16%"  class="td1" align="center">
			<bean:write property="KetiLx/riqi2"/>
			</td>
            <td width="17%" class="td1" align="center">
            <bean:write property="KetiLx/jine2"/>
            </td>
			<td width="16%"  class="td1" align="center">
			<bean:write property="KetiLx/riqi3"/>
			</td>
            <td width="17%" class="td1" align="center">
            <bean:write property="KetiLx/jine3"/>
            </td>
          </tr>
		  <tr>
            <td width="17%"  class="td2">&nbsp;ʹ�����</td>
            <td  class="td1" colspan="5">&nbsp;
            <bean:write property="KetiLx/shiyong"/>
            </td>
          </tr>
		  <tr>
            <td width="17%"  class="td_title" align="center">����</td>
            <td width="17%"  class="td_title" align="center">���(Ԫ)</td>
			<td  class="td_title" colspan="2" align="center">�����ϸ</td>
			<td  class="td_title" align="center">������ǩ��</td>
			<td width="17%"  class="td_title" align="center">����ǩ��</td>
          </tr>
          <script>
            var count = 0;
            var guanlifei = 0;
            var ziliaofei = 0;
            var chailvfei = 0;
            var huiyifei = 0;
            var shiyongfei = 0;
            var zixunfei = 0;
            var yinshuafei = 0;
            var jiandingfei = 0;
            var laowufei = 0;
            var qitafei = 0;
          </script>
          <logic:iterate id="resultset" property="list[@type='KetiBz']"> 
          <script>
           count += '<bean:write id="resultset" property="KetiBz/jine"/>'* 1.0; 
           guanlifei += '<bean:write id="resultset" property="KetiBz/guanlifei"/>'* 1.0; 
           ziliaofei += '<bean:write id="resultset" property="KetiBz/ziliaofei"/>'* 1.0; 
           chailvfei += '<bean:write id="resultset" property="KetiBz/chailvfei"/>'* 1.0; 
           huiyifei += '<bean:write id="resultset" property="KetiBz/huiyifei"/>'* 1.0; 
           shiyongfei += '<bean:write id="resultset" property="KetiBz/shiyongfei"/>'* 1.0; 
           zixunfei += '<bean:write id="resultset" property="KetiBz/zixunfei"/>'* 1.0; 
           yinshuafei += '<bean:write id="resultset" property="KetiBz/yinshuafei"/>'* 1.0; 
           jiandingfei += '<bean:write id="resultset" property="KetiBz/jiandingfei"/>'* 1.0; 
           laowufei += '<bean:write id="resultset" property="KetiBz/laowufei"/>'* 1.0; 
           qitafei += '<bean:write id="resultset" property="KetiBz/qitafei"/>'* 1.0; 
          </script>
          <tr>
            <td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/shiyongriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/jine"/></td>
			<td  class="td1" colspan="2" align="center"><a href="javascript:setDisplay('mx<bean:write id="resultset" property="KetiBz/ketiBzID"/>')">�鿴�����ϸ</a></td>
			<td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/baozhangren"/></td>
			<td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/caiwuqianming"/></td>
          </tr>
          <tr id='mx<bean:write id="resultset" property="KetiBz/ketiBzID"/>' style="display:none">
            <td class="td1" align="center">&nbsp;</td>
            <td class="td1" align="center">&nbsp;</td>
            <td class="td1" align="center" colspan="2">
				<table width="100%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
				  <tr>
					<td width="49%" class="td2">&nbsp;���ѷ���</td>
					<td width="51%" class="td2">&nbsp;���(Ԫ)</td>
				  </tr>
				  <tr>
					<td width="49%" class="td1">&nbsp;�����</td>
					<td width="51%" class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/guanlifei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;���Ϸ�</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/ziliaofei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;���в��÷�</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/chailvfei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;С�ͻ����</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/huiyifei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;��������丨���豸���ú�ʹ�÷�</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/shiyongfei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;��ѯ��</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/ziliaofei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;ӡˢ��</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/yinshuafei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;�ɹ�������</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/jiandingfei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;�����</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/laowufei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;������</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/qitafei"/></td>
				  </tr>
				</table>
            </td>
            <td class="td1" align="center">&nbsp;</td>
            <td class="td1" align="center">&nbsp;</td>
          </tr>
          </logic:iterate>
		  <tr>
            <td width="17%"  class="room1" align="center"><html:text property="KetiBz/shiyongriqi" attributesText='class="input" size="15"' readonly="true" />
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["KetiBz/shiyongriqi"],"yyyy-MM-dd")></td>
            <td width="17%"  class="room1" align="center"><html:text property="KetiBz/jine" attributesText='class="input" size="15"'/></td>
			<td  class="room1" colspan="2" align="center">����ʹ�ý����ϸ��</td>
			<td width="17%"  class="room1" align="center"><html:text property="KetiBz/baozhangren" attributesText='class="input" size="15"' readonly="true" /></td>
			<td width="17%"  class="room1">&nbsp;</td>
          </tr>
		  <tr>
            <td width="17%"  class="td1">&nbsp;</td>
            <td width="17%"  class="td1">&nbsp;</td>
			<td  class="td1" colspan="2">&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
          </tr>
		  
		  <tr>
            <td width="17%"  class="td2" align="right">�ϼ�&nbsp;&nbsp;</td>
            <td width="17%"  class="td1" align="center"><span id="heji"></span></td>
			<td  class="td2" align="right">��ʹ���ܽ��&nbsp;&nbsp;</td>
			<td width="17%"  class="td1" align="center"><span id="shiyongjine"></span></td>
			<td  class="td2" align="right">���&nbsp;&nbsp;</td>
			<td width="17%"  class="td1" align="center"><span id="yue"></span></td>
          </tr>
        </table>
        <table width="96%" align="center" height="20"  border="0"  cellpadding="0" cellspacing="1" id="spaceup">
	       <tr>
		     <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">ʹ�ý����ϸ��</td>
		</tr>
	    </table>
        <table width="96%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr>
          	<td width="33%"  class="td_title">&nbsp;���ѷ���</td>
            <td width="34%"  class="td_title">&nbsp;���(Ԫ)</td>
			<td width="33%"  class="td_title">&nbsp;�ϼ�(Ԫ)</td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;�����</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/guanlifei" maxlength="10" class="input" size="15"
            value='<bean:write property="KetiBz/guanlifei"/>' 
            onblur="getcount(this,'guanlifei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/guanlifei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="guanlifei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;���Ϸ�</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/ziliaofei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/ziliaofei"/>'
            onblur="getcount(this,'ziliaofei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/ziliaofei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="ziliaofei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;���в��÷�</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/chailvfei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/chailvfei"/>'
            onblur="getcount(this,'chailvfei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/chailvfei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="chailvfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;С�ͻ����</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/huiyifei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/huiyifei"/>'
            onblur="getcount(this,'huiyifei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/huiyifei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="huiyifei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;��������丨���豸���ú�ʹ�÷�</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/shiyongfei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/shiyongfei"/>'
            onblur="getcount(this,'shiyongfei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/shiyongfei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="shiyongfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;��ѯ��</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/zixunfei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/zixunfei"/>'
            onblur="getcount(this,'zixunfei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/ziliaofei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="zixunfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;ӡˢ��</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/yinshuafei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/yinshuafei"/>'
            onblur="getcount(this,'yinshuafei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/yinshuafei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="yinshuafei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;�ɹ�������</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/jiandingfei" maxlength="10" class="input" size="15" 
            value='<bean:write property="KetiBz/jiandingfei"/>'
            onblur="getcount(this,'jiandingfei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/jiandingfei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="jiandingfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;�����</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/laowufei" maxlength="10" class="input" size="15" 
            onblur="getcount(this,'laowufei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/laowufei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="laowufei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;������</td>
            <td width="34%"  class="td1">&nbsp;<input type="text" name="KetiBz/qitafei" maxlength="10" class="input" size="15" 
            onblur="getcount(this,'qitafei')"
            onkeypress="var   k=event.keyCode;   return   (k>=48&&k<=57||k==46)"   
            onkeyup="return   value=value.replace(/^(\d+\.\d{1,2})(.*)?$/,'$1')"   
            onpaste="return   !clipboardData.getData('text').match(/\D/)"   
            ondragenter="return   false"  style="ime-mode:Disabled" /><font color="red">(Ԥ����Ϊ��<bean:write property="KetiLx/qitafei" />)</font></td>
			<td width="33%"  class="td1">&nbsp;<span id="qitafei"></span></td>
          </tr>
        </table>
        <br>
        <table width="96%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <html:hidden property="KetiBz/ketiBzID" />
		  <tr>
          	<td width="17%"  class="td2" align="right">���д�������&nbsp;</td>
            <td width="83%"  class="td1">
			  &nbsp;<bean:write property="KetiBz/kycshenheyj"/> 
            </td>
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
  var bokuan1 = <bean:write property='KetiLx/jine1'/>*1.0;
  var bokuan2 = <bean:write property='KetiLx/jine2'/>*1.0;
  var bokuan3 = <bean:write property='KetiLx/jine3'/>*1.0;
  
  document.getElementById("heji").innerHTML=count;
  document.getElementById("shiyongjine").innerHTML=count;
  document.getElementById("guanlifei").innerHTML=guanlifei;
  document.getElementById("ziliaofei").innerHTML=ziliaofei;
  document.getElementById("chailvfei").innerHTML=chailvfei;
  document.getElementById("huiyifei").innerHTML=huiyifei;
  document.getElementById("shiyongfei").innerHTML=shiyongfei;
  document.getElementById("zixunfei").innerHTML=zixunfei;
  document.getElementById("yinshuafei").innerHTML=yinshuafei;
  document.getElementById("jiandingfei").innerHTML=jiandingfei;
  document.getElementById("laowufei").innerHTML=laowufei;
  document.getElementById("qitafei").innerHTML=qitafei;
  document.getElementById("yue").innerHTML=(bokuan1+bokuan2+bokuan3)-count;
  
  function checkMon(obj){
  	if(isNaN(obj.value)){
      alert('--������벻��ȷ��')
       obj.value = "";
       return false;
    }
  }
  
  function getcount(obj,id){
  	var frm = document.forms[0];
	var guanli = frm.elements["KetiLx/guanlifei"].value;
	var ziliao = frm.elements["KetiLx/ziliaofei"].value;
	var chailv = frm.elements["KetiLx/chailvfei"].value;
	var huiyi = frm.elements["KetiLx/huiyifei"].value;
	var shiyong = frm.elements["KetiLx/shiyongfei"].value;
	var zixun = frm.elements["KetiLx/zixunfei"].value;
	var yinshua = frm.elements["KetiLx/yinshuafei"].value;
	var jianding = frm.elements["KetiLx/jiandingfei"].value;
	var laowu = frm.elements["KetiLx/laowufei"].value;
	var qita = frm.elements["KetiLx/qitafei"].value;
	
	checkMon(obj);
	
  	if(obj.value!=""){
  	    if(id=='heji') document.getElementById(id).innerHTML= count + obj.value*1.0;
  	    if(id=='guanlifei') {
  	    if((guanlifei + obj.value*1.0) <= guanli) document.getElementById(id).innerHTML= guanlifei + obj.value*1.0;
  	    else {
  	       alert("--����Ѳ��ܳ���Ԥ����"+guanli+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/guanlifei").value = "";
  	       document.getElementById("KetiBz/guanlifei").focus();
  	       return false;
  	    } }
  	    if(id=='ziliaofei') {
  	    if((ziliaofei + obj.value*1.0) <= ziliao) document.getElementById(id).innerHTML= ziliaofei + obj.value*1.0;
  	    else {
  	       alert("--���ϷѲ��ܳ���Ԥ����"+ziliao+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/ziliaofei").value = "";
  	       document.getElementById("KetiBz/ziliaofei").focus();
  	       return false;
  	    } }
  	    if(id=='chailvfei') {
  	    if((chailvfei + obj.value*1.0) <= chailv) document.getElementById(id).innerHTML= chailvfei + obj.value*1.0;
  	    else {
  	       alert("--���в��÷Ѳ��ܳ���Ԥ����"+chailv+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/chailvfei").value = "";
  	       document.getElementById("KetiBz/chailvfei").focus();
  	       return false;
  	    } }
  	    if(id=='huiyifei') {
  	    if((huiyifei + obj.value*1.0) <= huiyi) document.getElementById(id).innerHTML= huiyifei + obj.value*1.0;
  	    else {
  	       alert("--С�ͻ���Ѳ��ܳ���Ԥ����"+huiyi+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/huiyifei").value = "";
  	       document.getElementById("KetiBz/huiyifei").focus();
  	       return false;
  	    } }
  	    if(id=='shiyongfei') {
  	    if((shiyongfei + obj.value*1.0) <= shiyong) document.getElementById(id).innerHTML= shiyongfei + obj.value*1.0;
  	    else {
  	       alert("--��������丨���豸���ú�ʹ�÷Ѳ��ܳ���Ԥ����"+shiyong+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/shiyongfei").value = "";
  	       document.getElementById("KetiBz/shiyongfei").focus();
  	       return false;
  	    } }
  	    if(id=='zixunfei') {
  	    if((zixunfei + obj.value*1.0) <= zixun) document.getElementById(id).innerHTML= zixunfei + obj.value*1.0;
  	    else {
  	       alert("--��ѯ�Ѳ��ܳ���Ԥ����"+zixun+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/zixunfei").value = "";
  	       document.getElementById("KetiBz/zixunfei").focus();
  	       return false;
  	    } }
  	    if(id=='yinshuafei') {
  	    if((yinshuafei + obj.value*1.0) <= yinshua) document.getElementById(id).innerHTML= yinshuafei + obj.value*1.0;
  	    else {
  	       alert("--ӡˢ�Ѳ��ܳ���Ԥ����"+yinshua+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/yinshuafei").value = "";
  	       document.getElementById("KetiBz/yinshuafei").focus();
  	       return false;
  	    } }
  	    if(id=='jiandingfei') {
  	    if((jiandingfei + obj.value*1.0) <= jianding) document.getElementById(id).innerHTML= jiandingfei + obj.value*1.0;
  	    else {
  	       alert("--�ɹ������Ѳ��ܳ���Ԥ����"+jianding+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/jiandingfei").value = "";
  	       document.getElementById("KetiBz/jiandingfei").focus();
  	       return false;
  	    } }
  	    if(id=='laowufei') {
  	    if((laowufei + obj.value*1.0) <= laowu) document.getElementById(id).innerHTML= laowufei + obj.value*1.0;
  	    else {
  	       alert("--����Ѳ��ܳ���Ԥ����"+laowu+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/laowufei").value = "";
  	       document.getElementById("KetiBz/laowufei").focus();
  	       return false;
  	    } }
  	    if(id=='qitafei') {
  	    if((qitafei + obj.value*1.0) <= qita) document.getElementById(id).innerHTML= qitafei + obj.value*1.0;
  	    else {
  	       alert("--�����Ѳ��ܳ���Ԥ����"+qita+"Ԫ�����������룡");
  	       document.getElementById("KetiBz/qitafei").value = "";
  	       document.getElementById("KetiBz/qitafei").focus();
  	       return false;
  	    } }
  	}
  }
  
  function save() {
  	var frm = document.forms[0];
  	
	if(checks()) frm.submit();
  
  }
  
  function checks(){
    var msg = "";
	var ok = true;
    var frm = document.forms[0];
	var jine = frm.elements["KetiBz/jine"].value;
	var shijibokuan = bokuan1 + bokuan2 + bokuan3;
	
  	if(jine==""){
  		msg += "--����Ϊ�գ�\n";
  		ok = false;
  	}else if(jine * 1.0 != jine){
  		msg += "--������Ϊ���֣�\n";
  		ok = false;
  	}
  	if((count+(jine * 1.0)) > shijibokuan){
  		msg += "--���ܳ���ʵ�ʲ����ܽ�\n";
  		ok = false;
  	}
  	
  	var feiyong = frm.elements["KetiBz/guanlifei"].value * 1.0 + frm.elements["KetiBz/ziliaofei"].value * 1.0 + frm.elements["KetiBz/chailvfei"].value * 1.0 + 
  	frm.elements["KetiBz/huiyifei"].value * 1.0 + frm.elements["KetiBz/shiyongfei"].value * 1.0 + frm.elements["KetiBz/zixunfei"].value * 1.0 + 
  	frm.elements["KetiBz/yinshuafei"].value * 1.0 + frm.elements["KetiBz/jiandingfei"].value * 1.0 + frm.elements["KetiBz/laowufei"].value * 1.0 +
  	frm.elements["KetiBz/qitafei"].value * 1.0;
  	if(feiyong * 1.0 != jine * 1.0){
  		msg += "--��������ܶ�����뱨�ʽ����ȣ�\n";
  		ok = false;
  	}
  	if(ok) {
		return true;
	} else {
		alert(msg);
		return false;
	}
  }
  
  function checkMoney(obj){
   if(obj.value!=""){
  	if   (!(/^[0-9]+(.[0-9]{2})?$/.test(obj.value))   ){
  	  alert('--������Ϊ����,���ֻ����λС������Ч����');   
  	  obj.value='';
  	  obj.focus();
  	}
   }
  }
  
    
  function setDisplay(id) {
	if(document.getElementById(id).style.display == 'none') {
		document.getElementById(id).style.display = '';
	} else {
		document.getElementById(id).style.display = 'none';
	}
  }
  
  </script>