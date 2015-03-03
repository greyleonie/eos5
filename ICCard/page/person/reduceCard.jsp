<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>注销卡</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<script language="JavaScript">
		function Query(){
			if(curcardForm.elements["QueryCard/CardCoverNO"].value.length==0){
				alert("卡面编号不得为空！");
			}
			else  if(curcardForm.elements["QueryCard/password"].value.length==0){
				alert("密码不得为空！");
			}
			else{
				curcardForm.submit();
			}
		}
			
		function goBack(){
			window.navigate("ICCard.prDestroyCard.destroyList.do");
		}
		</script>
</head>

<body>
<!-- 导航条 -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;个人信息—&gt;自卡还原</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>

<logic:in property="Card/StateID" value="3,4">
<html:form name="reduceForm" action="ICCard.prPerson.reduceCardDO.do" method="POST">
<html:hidden name="list[@name='update']/DestroyCard[@hciTagIndex='0']/DestroyCardID" property="DestroyCard/DestroyCardID"/>
<html:hidden name="list[@name='update']/DestroyCard[@hciTagIndex='0']/CardID" property="DestroyCard/CardID"/>
<html:hidden property="DestroyCard/CardLastSumCache"/>
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">自卡还原</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td> </td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td height="2" colspan="2"> </td>
            </tr>
  </table>

	<table width="98%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
		<td width="6%" align="right" nowrap class="td2">用户密码：</td>
	    <td width="88%" class="td1" align="left">
	    <input type="password" name="DestroyCard/password" size="30" value="" class="input"  ValidateType="notempty" Msg="密码不能为空"/>
	    <font color="red">（此密码与登陆密码相同）</font>
	    </td>
	</tr>
	    <tr>
			<td width="12%" align="right" nowrap class="td2">状态：</td>
			<td width="88%" class="td1" align="left">
			<logic:equal property="Card/StateID" value="3">
			<font color="red">坏卡（损坏的卡）</font>
			</logic:equal>
			<logic:equal property="Card/StateID" value="4">
			<font color="red">失卡（丢失的卡）</font>
			</logic:equal>
			</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td width="88%" class="td1">
				<input type="button" name="tosubmit"  class="button_02" value="还原" onClick="save()"/>
		  </td>
		</tr>
  </table>
</html:form>
</logic:in>
<logic:equal property="Card/StateID" value="1">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">自卡还原</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;此卡还未使用，不能还原！</font></td>
            </tr>
  </table>
</logic:equal>
<logic:equal property="Card/StateID" value="2">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">自卡还原</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;此卡在使用中，不能还原！</font></td>
            </tr>
  </table>
</logic:equal>
<logic:equal property="Card/StateID" value="5">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">自卡还原</td>
                    <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
                  </tr>
              </table></td>
              <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;此卡已冻结，不能还原！</font></td>
            </tr>
  </table>
</logic:equal>
</html>
<script type="text/javascript">
 function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
</script>