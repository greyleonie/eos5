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
            <td class="text_wirte">首页—&gt;一卡通—&gt;个人信息—&gt;销卡登记</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>

<logic:equal property="Card/StateID" value="2">
<html:form name="destroyForm" action="ICCard.prPerson.destroyCardDO.do" method="POST">
	<!-- 步骤二：销卡登记 -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">销卡登记</td>
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
			<td width="88%" class="td1" align="left"><font color="red">使用中</font></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">销卡原因：</td>
			<td width="88%" class="td1" align="left">
			<input type="radio" name="DestroyCard/ReasonID" value="2" checked="true" />失 卡（丢失的卡）&nbsp;&nbsp;
			<input type="radio" name="DestroyCard/ReasonID" value="1" />坏 卡（损坏的卡）
			</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td width="88%" class="td1">
			
				<input type="button" name="tosubmit"  class="button_02" value="提交" onClick="save()"/>
				
			
		  
		  </td>
		</tr>
  </table>
</html:form>
</logic:equal>
<logic:equal property="Card/StateID" value="4">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">销卡登记</td>
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
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;此卡已挂失，不能再挂失！</font></td>
            </tr>
  </table>
</logic:equal>
<logic:equal property="Card/StateID" value="3">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">销卡登记</td>
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
              <td colspan="2" width="96%" height="50" valign="middle"><font color="red">&nbsp;&nbsp;此卡已作坏卡登记，不能再作销卡登记！</font></td>
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