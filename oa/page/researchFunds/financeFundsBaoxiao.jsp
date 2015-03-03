<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>

<form method="post" enctype="multipart/form-data" action="oa.prResearchFunds.financeFundsBaoxiaoDo.do">		
		<html:hidden property="KetiLx/_order/col1/field"/>
		<html:hidden property="KetiLx/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="KetiLx/ketiLxID" />
		<html:hidden property="KetiLx/status" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;财务处经费管理</td>
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
            <bean:write property="KetiLx/name"/>
            </td>
			<td width="17%" class="td2">&nbsp;课题负责人</td>
            <td class="td1" colspan="2">&nbsp;
            <bean:write property="KetiLx/fuzeren"/>
            </td>
          </tr>
		  <tr>
            <td width="17%" class="td2">&nbsp;序号</td>
            <td width="17%" class="td1">&nbsp;
            <bean:write property="KetiLx/xuhao"/>
            </td>
			<td width="16%" class="td2">&nbsp;课题代码</td>
            <td width="17%" class="td1">&nbsp;
            <bean:write property="KetiLx/daima"/>
            </td>
			<td width="16%" class="td2">&nbsp;拨款总额(元)</td>
            <td width="17%" class="td1">&nbsp;
            <bean:write property="KetiLx/zonge"/>
			</td>
          </tr>
          <tr>
            <td width="17%"  class="td2" align="center">拨款日期</td>
            <td width="17%"  class="td2" align="center">金额(元)</td>
			<td width="16%"  class="td2" align="center">拨款日期</td>
            <td width="17%"  class="td2" align="center">金额(元)</td>
			<td width="16%"  class="td2" align="center">拨款日期</td>
            <td width="17%"  class="td2" align="center">金额(元)</td>
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
            <td width="17%"  class="td2">&nbsp;使用情况</td>
            <td  class="td1" colspan="5">&nbsp;
            <bean:write property="KetiLx/shiyong"/>
            </td>
          </tr>
		  <tr>
            <td width="17%"  class="td_title" align="center">日期</td>
            <td width="17%"  class="td_title" align="center">金额(元)</td>
			<td  class="td_title" colspan="2" align="center">金额明细</td>
			<td  class="td_title" align="center">报帐人签名</td>
			<td width="17%"  class="td_title" align="center">财务签名</td>
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
          </script>
          <tr>
            <td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/shiyongriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/jine"/></td>
			<td  class="td1" colspan="2" align="center"><a href="javascript:setDisplay('mx<bean:write id="resultset" property="KetiBz/ketiBzID"/>')">查看金额明细</a></td>
			<td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/baozhangren"/></td>
			<td width="17%"  class="td1" align="center"><bean:write id="resultset" property="KetiBz/caiwuqianming"/></td>
          </tr>
          <tr id='mx<bean:write id="resultset" property="KetiBz/ketiBzID"/>' style="display:none">
            <td class="td1" align="center">&nbsp;</td>
            <td class="td1" align="center">&nbsp;</td>
            <td class="td1" align="center" colspan="2">
				<table width="100%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
				  <tr>
					<td width="49%" class="td2">&nbsp;经费分类</td>
					<td width="51%" class="td2">&nbsp;金额(元)</td>
				  </tr>
				  <tr>
					<td width="49%" class="td1">&nbsp;管理费</td>
					<td width="51%" class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/guanlifei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;资料费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/ziliaofei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;调研差旅费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/chailvfei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;小型会议费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/huiyifei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;计算机及其辅助设备购置和使用费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/shiyongfei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;咨询费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/ziliaofei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;印刷费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/yinshuafei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;成果鉴定费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/jiandingfei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;劳务费</td>
					<td class="td1">&nbsp;<bean:write id="resultset" property="KetiBz/laowufei"/></td>
				  </tr>
				  <tr>
					<td class="td1">&nbsp;其它费</td>
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
            </td>
            <td width="17%"  class="room1" align="center"><html:text property="KetiBz/jine" attributesText='class="input" size="15"' readonly="true"/></td>
			<td  class="room1" colspan="2" align="center">（见使用金额明细表）</td>
			<td width="17%"  class="room1" align="center"><html:text property="KetiBz/baozhangren" attributesText='class="input" size="15"' readonly="true" /></td>
			<td width="17%"  class="room1" align="center"><input type="text" name="KetiBz/caiwuqianming" value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>' class="input" size="15" readonly="true"/></td>
          </tr>
		  <tr>
            <td width="17%"  class="td1">&nbsp;</td>
            <td width="17%"  class="td1">&nbsp;</td>
			<td  class="td1" colspan="2">&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
			<td width="17%"  class="td1">&nbsp;</td>
          </tr>
		  
		  <tr>
            <td width="17%"  class="td2" align="right">合计&nbsp;&nbsp;</td>
            <td width="17%"  class="td1" align="center"><span id="heji"></span></td>
			<td  class="td2" colspan="3" align="right">已使用总金额&nbsp;&nbsp;</td>
			<td width="17%"  class="td1" align="center"><span id="shiyongjine"></span></td>
          </tr>
        </table>
        <table width="96%" align="center" height="20"  border="0"  cellpadding="0" cellspacing="1" id="spaceup">
	       <tr>
		     <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">使用金额明细表</td>
		</tr>
	    </table>
        <table width="96%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr>
          	<td width="33%"  class="td_title">&nbsp;经费分类</td>
            <td width="34%"  class="td_title">&nbsp;金额(元)</td>
			<td width="33%"  class="td_title">&nbsp;合计(元)</td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;管理费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/guanlifei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="guanlifei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;资料费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/ziliaofei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="ziliaofei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;调研差旅费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/chailvfei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="chailvfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;小型会议费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/huiyifei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="huiyifei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;计算机及其辅助设备购置和使用费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/shiyongfei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="shiyongfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;咨询费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/zixunfei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="zixunfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;印刷费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/yinshuafei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="yinshuafei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;成果鉴定费</td>
            <td width="34%"  class="td1">&nbsp;<html:text property="KetiBz/jiandingfei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
			<td width="33%"  class="td1">&nbsp;<span id="jiandingfei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;劳务费</td>
            <td width="21%"  class="td1">&nbsp;<html:text property="KetiBz/laowufei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
            <td width="21%"  class="td1">&nbsp;<bean:write property="KetiLx/laowufei"/></td>
			<td width="21%"  class="td1">&nbsp;<span id="laowufei"></span></td>
          </tr>
		  <tr>
          	<td width="33%"  class="td2">&nbsp;其他费</td>
            <td width="21%"  class="td1">&nbsp;<html:text property="KetiBz/qitafei" maxlength="10" attributesText='class="input" size="15"' readonly="true"/></td>
            <td width="21%"  class="td1">&nbsp;<bean:write property="KetiLx/qitafei"/></td>
			<td width="21%"  class="td1">&nbsp;<span id="qitafei"></span></td>
          </tr>
        </table>
        <br>
        <table width="96%" align="center"  border="0"  cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <html:hidden property="KetiBz/ketiBzID"/>
          <tr>
          	<td width="17%"  class="td2" align="right">财务处报销&nbsp;</td>
            <td width="83%"  class="td1">
              &nbsp;<input type="radio" name="KetiBz/cwcbaoxiao" id="cwcbaoxiao1" value="1" checked onclick ="setDisplayYijian('yijian','cwcbaoxiao1')"/>报销
            &nbsp;<input type="radio" name="KetiBz/cwcbaoxiao" id="cwcbaoxiao2" value="2"  onclick ="setDisplayYijian('yijian','cwcbaoxiao2')"/>重审</td>
          </tr>
		  <tr id='yijian' style="display:none">
          	<td width="17%"  class="td2" align="right">重审原因&nbsp;</td>
            <td width="83%"  class="td1">
			  &nbsp;&nbsp;<textarea name="KetiBz/cwcbaoxiaoyj" cols="80" rows="4"></textarea>
            </td>
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
  document.getElementById("heji").innerHTML=count + '<bean:write property="KetiBz/jine"/>'* 1.0;
  document.getElementById("shiyongjine").innerHTML=count ;
  document.getElementById("guanlifei").innerHTML=guanlifei + '<bean:write property="KetiBz/guanlifei"/>'* 1.0;
  document.getElementById("ziliaofei").innerHTML=ziliaofei + '<bean:write property="KetiBz/ziliaofei"/>'* 1.0;
  document.getElementById("chailvfei").innerHTML=chailvfei + '<bean:write property="KetiBz/chailvfei"/>'* 1.0;
  document.getElementById("huiyifei").innerHTML=huiyifei + '<bean:write property="KetiBz/huiyifei"/>'* 1.0;
  document.getElementById("shiyongfei").innerHTML=shiyongfei + '<bean:write property="KetiBz/shiyongfei"/>'* 1.0;
  document.getElementById("zixunfei").innerHTML=zixunfei + '<bean:write property="KetiBz/zixunfei"/>'* 1.0;
  document.getElementById("yinshuafei").innerHTML=yinshuafei + '<bean:write property="KetiBz/yinshuafei"/>'* 1.0;
  document.getElementById("jiandingfei").innerHTML=jiandingfei + '<bean:write property="KetiBz/jiandingfei"/>'* 1.0;
  
  
  function save() {
  	var frm = document.forms[0];

  		if('<bean:write property="KetiLx/zonge"/>'*1.0 > count + '<bean:write property="KetiBz/jine"/>'* 1.0){
  			frm.elements["KetiLx/status"].value = "1" ;    //申报
  		}
  		else{
  			frm.elements["KetiLx/status"].value = "6" ;    //归档
  		}
	
	if(validater(frm)) frm.submit();
  
  }
  
  
    
  function setDisplay(id) {
	if(document.getElementById(id).style.display == 'none') {
		document.getElementById(id).style.display = '';
	} else {
		document.getElementById(id).style.display = 'none';
	}
  }
  
   function setDisplayYijian(id,id2) {
    var yj = document.getElementById(id2).value;
	if(yj == '2') {
		document.getElementById(id).style.display = '';   
		document.forms[0].elements["KetiBz/caiwuqianming"].value = "";
	} else {
		document.getElementById(id).style.display = 'none';
		document.forms[0].elements["KetiBz/caiwuqianming"].value = '<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>'
	}
  }
  </script>
 