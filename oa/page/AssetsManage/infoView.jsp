<%@include file="/internet/common.jsp"%>
<form>
<html:hidden property="CAPT_CAPITALINFO/STATE" value="1"/>
<div style="display: none" id="printTable">资产卡</div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  
    <tr>
      <td height="5">

	  </td>
    </tr>
  </table>

<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="15"> </td>
      </tr>
  <tr><td>
	<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		     <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
           
                <tr>
               
                  <td align="right" nowrap="nowrap"  class="td2" >资产编码：</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                      <%
                  String code = base.util.TalentContext.getValue(pageContext,null,"CAPT_CAPITALINFO/CAPTCODE");
                  String imgPath = "";
                  if (code != null && !"".equals(code)) {
					 imgPath = common.assets.Barcode.getImgPath(code,request,180,100);
	        	  %>
                  <img src="<%=imgPath%>">
                  <%}%>
                    </td>
                </tr>
                
                <tr> 
                  <td align="right" nowrap="nowrap"  class="td2" >资产条码：</td>
                  <td  nowrap="nowrap"  class="td1" >
                  <bean:write   property="CAPT_CAPITALINFO/BARCODE" />
                  </td>
                     <td  nowrap="nowrap" align="right"  class="td2" >资产所属部门：</td>
                  <td  nowrap="nowrap"  class="td1" >
                      <bean:write property="CAPT_CAPITALINFO/OWNERNAME" /> 
            
                  </td>
                </tr>
               <tr>
                  <td align="right" nowrap="nowrap"  class="td2" >资产类型：</td>
                  <td  nowrap="nowrap"  class="td1" ><bean:write  property="CAPT_CAPITALINFO/TYPENAME"  /> 
            </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >计量单位：</td>
                  <td  nowrap="nowrap"  class="td1" ><dict:write   businTypeId="dx_unit" property="CAPT_CAPITALINFO/UNITCODE"   /></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap"  align="right"  class="td2" >资产名称：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><bean:write   property="CAPT_CAPITALINFO/CAPTNAME"   /> </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >生产厂商：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><bean:write   property="CAPT_CAPITALINFO/MANUFACTURE" /> </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >品&nbsp;&nbsp;&nbsp;&nbsp;牌：</td>
                  <td  nowrap="nowrap"  class="td1" ><bean:write   property="CAPT_CAPITALINFO/BRANDNAME" /></td>
                  <td  nowrap="nowrap"  align="right"  class="td2" >规格型号：</td>
                  <td  nowrap="nowrap"  class="td1" ><bean:write   property="CAPT_CAPITALINFO/SPECIA" /></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >供 应 商：</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" >
              <bean:write property="CAPT_CAPITALINFO/PROVNAME" />
                   </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >售后服务商：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" >
                  <bean:write property="CAPT_CAPITALINFO/VINDNAME" />
                  </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >获得日期：</td>
                  <td  nowrap="nowrap"  class="td1" >
              <bean:write   property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          
               </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >清理日期：</td>
                  <td  nowrap="nowrap"   class="td1" >
            <bean:write   property="CAPT_CAPITALINFO/QLDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
       
                 </td></tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >购买价格：</td>
                  <td  nowrap="nowrap"  class="td1" ><bean:write   property="CAPT_CAPITALINFO/PRICE" language="zh" country="CN" />元</td>
                  <td  nowrap="nowrap" align="right"  class="td2" >采购资金来源：</td>
                  <td  nowrap="nowrap"  class="td1" ><bean:write   property="CAPT_CAPITALINFO/FUNDORIGIN"   /></td>
                </tr>
                <tr> 
               
                  <td  nowrap="nowrap" align="right"  class="td2" >保修期限：</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" >
        <bean:write   property="CAPT_CAPITALINFO/BXDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />
      
           </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><bean:write  property="CAPT_CAPITALINFO/REMARK" /></td>
                </tr>
              </table> 
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="资产卡">
<input type="hidden" name="xmlfcc">
</form>