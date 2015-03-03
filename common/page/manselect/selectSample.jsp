<%@include file="/internet/common.jsp"%>

<body>
<form method="post" action="">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">人员及部门选择</td>
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
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="16%" align="right" nowrap class="td2">人员选择： </td>
            <td width="35%" class="td1"><html:text property="EOSORG_T_Organization/managerName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc"'/> 
              <html:hidden property="EOSORG_T_Organization/managerID"/> <input name="Button" type="button" class="button_02" value="选 择" elname="EOSORG_T_Organization/managerID,EOSORG_T_Organization/managerName" onClick="selectSysUser()"> 
            </td>
            <td width="12%" align="right" nowrap class="td2">单个人选择：</td>
            <td width="37%" class="td1"><html:text property="EOSORG_T_Organization/auxiliaryManagerName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc"'/> 
              <html:hidden property="EOSORG_T_Organization/auxiliaryManagerID" /> 
              <input name="Button" type="button" class="button_02" value="选 择" elname="EOSORG_T_Organization/auxiliaryManagerID,EOSORG_T_Organization/auxiliaryManagerName" onClick="selectSysUser('yes')"> 
            </td>
          </tr>
		  <tr> 
            <td width="16%" align="right" nowrap class="td2">部门选择： </td>
            <td width="35%" class="td1"><html:text property="TempEntity/tempName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc"'/> 
              <html:hidden property="TempEntity/tempID"/> <input name="Button" type="button" class="button_02" value="选 择" elname="TempEntity/tempID,TempEntity/tempName" onClick="selectSysOrg()"> 
            </td>
            <td width="12%" align="right" nowrap class="td2">单部门选择：</td>
            <td width="37%" class="td1"><html:text property="TempSingleEntity/tempName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc"'/> 
              <html:hidden property="TempSingleEntity/tempID" /> 
              <input name="Button" type="button" class="button_02" value="选 择" elname="TempSingleEntity/tempID,TempSingleEntity/tempName" onClick="selectSysOrg('yes')"> 
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center">&nbsp; </td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
 