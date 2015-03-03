<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/pageComponent/resources/scripts/editor.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/datacell.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/dataset.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">




<logic:greaterThan property="count" value="0">
<script>
alert("已经存在此资产");
</script>
</logic:greaterThan>
<form method="post" action="oa.prAssetsManage.assetsAddDo.do">
<html:hidden property="CAPT_CAPITALINFO/STATE" value="1"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产入库新增</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/field"/>
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>




<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr><td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		     <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
               <!--  
                <tr>
               
                  <td align="right" nowrap="nowrap"  class="td2" >资产编码：</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                       <html:text property="CAPT_CAPITALINFO/CAPTCODE" maxlength="20" attributesText='class="input" size="30"' readonly="true"/> (自动产生)
                    </td>
                </tr>
                -->
                <tr> 
                  <td align="right" nowrap="nowrap"  class="td2" >资产条码：</td>
                  <td  nowrap="nowrap"  class="td1" >
                  <html:text property="CAPT_CAPITALINFO/BARCODE" maxlength="50" attributesText='class="input" size="30"'/>
                  </td>
                     <td  nowrap="nowrap" align="right"  class="td2" >资产所属部门：</td>
                  <td  nowrap="nowrap"  class="td1" >
                      <html:select property="CAPT_CAPITALINFO/OWNER" styleClass="input" > 
              <html:option value="" >-请选择-</html:option> <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/> 
              </html:select>
                  </td>
                </tr>
               <tr>
                  <td align="right" nowrap="nowrap"  class="td2" >资产类型：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:select property="CAPT_CAPITALINFO/TYPECODE"  attributesText='ValidateType="notempty" Msg="资产类型不能为空" '> 
              <html:option value="">-请选择-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>&nbsp;<span class="text_red">*</span></td>
                  <td  nowrap="nowrap" align="right"  class="td2" >计量单位：</td>
                  <td  nowrap="nowrap"  class="td1" ><dict:select  businTypeId="dx_unit" property="CAPT_CAPITALINFO/UNITCODE"  nullOption="false" nullLabel="-请选择-"  />&nbsp;<span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap"  align="right"  class="td2" >资产名称：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:text property="CAPT_CAPITALINFO/CAPTNAME"  maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="资产名称不能为空"' /> 
                    <span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >生产厂商：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:text property="CAPT_CAPITALINFO/MANUFACTURE" maxlength="100" attributesText='class="input" size="50" ValidateType="notempty" Msg="生产厂商不能为空"' /> 
                    <span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >品&nbsp;&nbsp;&nbsp;&nbsp;牌：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/BRANDNAME" maxlength="30" attributesText='class="input" size="20" ' /></td>
                  <td  nowrap="nowrap"  align="right"  class="td2" >规格型号：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/SPECIA"  maxlength="100" attributesText='class="input" size="20" '/></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >供 应 商：</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" >
                <richclient:selectText textId="text1" buttonId="bt1" nameField="PROVNAME" filterField="PROVNAME" >
     				  <richclient:optionTable tableId="optionsTable1" action="oa.bizAssetsManage.selectProvider" xpaths="list" width="400" height="100"  onclick="setPROVValue">
           				<TABLE id="optionsTable1" class="RC_DATACELL_OPTIONTABLE">
           					<tbody>
           						<tr>
					              <TD width="240" name="PROVNAME"></TD>
					              <TD width="80" name="LINKMAN"></TD>
					              <TD width="80" name="TEL"></TD>
				           	  </tr>
				           </tbody>
				       </TABLE>   
				       </richclient:optionTable>
				       <input type="text" name="CAPT_CAPITALINFO/PROVNAME" value='<bean:write property="CAPT_CAPITALINFO/PROVNAME"/>'   id="text1"  size="50"  class="input"  />
				        &nbsp;<input class="button_02" type="button" id="bt1" value="选择"/>
				</richclient:selectText>
				<html:hidden property="CAPT_CAPITALINFO/PROVCODE"/>
                   </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >售后服务商：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" >
                     <richclient:selectText textId="text2" buttonId="bt2"  nameField="VINDNAME" filterField="VINDNAME" >
     				  <richclient:optionTable  tableId="optionsTable2" action="oa.bizAssetsManage.selectVindicator" xpaths="list" width="400" height="100" onclick="setVINDValue" >
           				<TABLE id="optionsTable2" class="RC_DATACELL_OPTIONTABLE" >
           					<tbody>
           						<tr>
					              <TD width="240" name="VINDNAME"></TD>
					              <TD width="80" name="LINKMAN"></TD>
					              <TD width="80" name="TEL"></TD>
				           	  </tr>
				           </tbody>
				       </TABLE>   
				       </richclient:optionTable>
				       <input type='text' name="CAPT_CAPITALINFO/VINDNAME"  value='<bean:write  property="CAPT_CAPITALINFO/VINDNAME"/>'   id="text2"  size="50" class="input"  />
				       
				       &nbsp;<input class="button_02" type="button" id="bt2" value="选择"/>
				</richclient:selectText>
				<html:hidden property="CAPT_CAPITALINFO/VINDCODE"/>
                  </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >入账日期：</td>
                  <td  nowrap="nowrap"  class="td1" >
              <html:text property="CAPT_CAPITALINFO/HQDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/HQDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
               </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >使用年限：</td>
                  <td  nowrap="nowrap"   class="td1" >
                  <html:text property="CAPT_CAPITALINFO/QLDATE"   attributesText='class="input" size="10"' value="6"/> 年
           
                 </td></tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >购买价格：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/PRICE"  attributesText='class="input" size="10" ValidateType="money" Msg="购买价格必须为数字"'/>元</td>
                      <td  nowrap="nowrap" align="right"  class="td2" >保修期限：</td>
                  <td  nowrap="nowrap"  class="td1" >
        <html:text property="CAPT_CAPITALINFO/BXDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/BXDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           </td>

                </tr>
                <tr> 
                              
                  
                  <td  nowrap="nowrap" align="right"  class="td2"  >采购资金来源：</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" ><html:text property="CAPT_CAPITALINFO/FUNDORIGIN"   maxlength="50" attributesText='class="input" size="50"'/></td>   
              
                </tr>
                  <tr> 
                              
                  
                  <td  nowrap="nowrap" align="right"  class="td2"  >入库数量：</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" ><html:text property="CAPT_CAPITALINFO/NUM"   attributesText='class="input" size="10"' value="1"/></td>   
              
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:textarea name="CAPT_CAPITALINFO/REMARK" cols="80" rows="5"/></td>
                </tr>
              </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
            
              
              <input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:save()">
                             <input name="Button" type="button" class="button_02" value="返 回" onClick="goBack()">
              </td>
            
            </tr>
          </table>
    	  </td>
      </tr>
    </table>
        	  </td>
      </tr>
    </table>
</form>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.assetsList.do";
	frm.submit();
  }
  
  function setPROVValue(entity){
     var frm = document.forms[0];
     var str=entity.getProperty("PROVCODE");
     frm["CAPT_CAPITALINFO/PROVCODE"].value=str;

    }

  function setVINDValue(entity){
     var frm = document.forms[0];
     var str=entity.getProperty("VINDCODE");
     frm["CAPT_CAPITALINFO/VINDCODE"].value=str;

    }
  
 </script>