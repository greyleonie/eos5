<%@include file="/internet/common.jsp"%>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产卡</span>查看</td>
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
  
  <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table" >
      <tr>
      <td height="8"></td>
      </tr>
      
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
<!-- 资产卡*******************************************-->
          <logic:iterate property="list[@name='update']" id="ResultSet">
          <tr ><td colspan="4" height="30" class="td1">  &nbsp;&nbsp;</td></tr>
               <tr>
                  <td align="right" class="td2">资产编号：</td>
                  <td colspan="3" height="80" valign="bottom" class="td1">
                  <%
                  String code = base.util.TalentContext.getValue(pageContext,"ResultSet","CAPT_CAPITALINFO/CAPTCODE");
                  String imgPath = "";
                  if (code != null && !"".equals(code)) {
					 imgPath = common.assets.Barcode.getImgPath(code,request,180,100);
	        	  %>
                  <img src="<%=imgPath%>">
                  <%}%>
                  </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">资产条码：</td>
                  <td colspan="3" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/BARCODE"/></td>
                </tr>
                <tr>
                  <td width="16%" align="right"  class="td2">资产名称：</td>
                  <td colspan="3" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/CAPTNAME"/></td>
                </tr>
                <tr>
                  <td align="right"  class="td2">品&nbsp;&nbsp;&nbsp; 牌：</td>
                  <td width="45%" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/BRANDNAME"/></td>
                  <td width="14%" align="right"  class="td2">规格型号：</td>
                  <td width="28%" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/SEPCIFICATION"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">获得日期：</td>
                  <td class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>                          
               </td>
                  <td align="right"  class="td2">购买价格：</td>
                  <td width="20%" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/PURCHPRICE"/>
                 </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">供 应 商：</td>
                  <td colspan="3" class="td1">
                  <bean:write id="ResultSet" property="CAPT_CAPITALINFO/PROVNAME"/>
                  </td>
                </tr>
                <tr>
                  <td align="right"  class="td2">售后服务商：</td>
                  <td colspan="3" class="td1"> 
                  <bean:write id="ResultSet" property="CAPT_CAPITALINFO/VINDNAME"/> 
                  </td>
                </tr>
                <tr>
                  <td align="right"  class="td2">备&nbsp;&nbsp;&nbsp; 注：</td>
                  <td colspan="3" height="80" class="td1">

                  </td>
                </tr>

              </logic:iterate>
     
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
 
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="资产卡">
<input type="hidden" name="xmlfcc">
</form>