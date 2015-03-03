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
            <td class="text_wirte">首页—&gt;一卡通—&gt;卡注销—&gt;销卡登记</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>


<form name="curcardForm" method="POST"><!-- 步骤一：查询绿卡信息 -->
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤一：查询卡信息</td>
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
		<td width="12%" align="right" nowrap class="td2">操作说明：</td>
		<td width="88%" class="td1">请准确填写卡面编号和持卡人的用户密码，然后查询其信息。
		
		</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">卡面编号：</td>
	  <td width="88%" class="td1" align="left">
	 
	  <html:text  property="QueryCard/CardCoverNO"
			styleClass="input" size="30" />(例如：DX00048、00256等，注意区分大小写)</td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">用户密码：</td>
	  <td width="88%" class="td1" align="left"><input type="password" name="QueryCard/password" size="30" value="" class="input" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2"></td>
	  <td width="88%" class="td1">
	  <html:button property="startButton" value="查询" onclick="Query()" styleClass="button_02"/>
	  &nbsp;
		<qx:talentButton type="button" property="selectSt" value="选择学员" styleClass="button_02" onclick="selectStudent()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_SElSTU"/>
		<qx:talentButton type="button"  property="selectTe" value="选择教工" styleClass="button_02" onclick="selectTeacher()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_SElTEA"/>
	  <FONT color="RED"><bean:write property="info"/></FONT>
	  </td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">持 卡 人：</td>
	  <td width="88%" class="td1" align="left"><html:text  property="QueryCard/operatorName"
			styleClass="input" size="30" readonly="true" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">发卡时间：</td>
	  <td width="88%" class="td1" align="left"><html:text  property="QueryCard/TimeOfIssueCard"
			styleClass="input" size="30" readonly="true" /></td>
	</tr>
	<tr>
		<td width="6%" align="right" nowrap class="td2">卡内余额：</td>
		<td width="88%" class="td1" align="left"><logic:present  property="QueryCard/CardLastSum">
			<input type="text" name="QueryCard/CardLastSumExt" Class="input" size="30"
				readonly="true"
				value="<bean:write  property="QueryCard/CardLastSum"/>  (这可能不是最新余额)" />
		</logic:present> <logic:notPresent 
			property="QueryCard/CardLastSum">
			<input type="text" name="QueryCard/CardLastSumExt" Class="input" size="30"
				readonly="true" value="" />
	  </logic:notPresent> (人民币：元)</td>
	</tr>
</table>
</form>


<html:form name="destroyForm" action="ICCard.prDestroyCard.destroyCardDO.do" method="POST">
	<!-- 步骤二：销卡登记 -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                    <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">步骤二：销卡登记</td>
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
			<td width="12%" align="right" nowrap class="td2">操作说明：</td>
			<td width="88%" class="td1">确定信息无误后请选择销卡原因并提交。</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">销卡原因：</td>
			<td width="88%" class="td1" align="left"><input type="radio" name="DestroyCard/ReasonID" value="2"
				checked="true" />失 卡 <input type="radio" name="DestroyCard/ReasonID" value="1" />坏
		  卡</td>
		</tr>
		
		<html:hidden  property="QueryCard/CardID"  name="DestroyCard/CardID"/>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td width="88%" class="td1">
			<logic:present  property="QueryCard/InnerCardID">
				<input type="submit" name="tosubmit"  class="button_02" value="提交"/>
				
			</logic:present> 
			<logic:notPresent 
				property="QueryCard/InnerCardID">
				<input type="submit"  name="tosubmit" class="button_02" value="提交" disabled="disabled"/>
		  </logic:notPresent>
		  &nbsp;&nbsp;
		  <input name="button" type="button" class="button_02" onClick="goBack()" value="返 回"/>
		  </td>
		</tr>
  </table>
</html:form>
<br>
</html>
<script>
	function selectStudent(){
		curcardForm.reset();
		destroyForm.tosubmit.disabled="disabled";
		window.open("ICCard.prDestroyCard.selectStudent.do","","scrollbars=yes,height=450,width=600,top=100,left=200");
	}
	function selectTeacher(){
		curcardForm.reset();
		destroyForm.tosubmit.disabled="disabled";
		window.open("ICCard.prDestroyCard.selectTeacher.do","","scrollbars=yes,height=450,width=600,top=100,left=200");
	}

</script>