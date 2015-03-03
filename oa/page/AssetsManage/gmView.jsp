<%@include file="/internet/common.jsp"%>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产信息</span>查看</td>
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
<!-- 资产信息*******************************************-->
              <tr> <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >资产信息</font></td></tr>
               <tr>
                  <td align="right" class="td2">资产编号：</td>
                  <td colspan="3" class="td1"><bean:write property="CAPT_CAPITALINFO/CAPTCODE"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">资产条码：</td>
                  <td colspan="3" class="td1">
                  <bean:write property="CAPT_CAPITALINFO/BARCODE"/>
                  </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">资产类型：</td>
                  <td class="td1">
                           <logic:iterate property="list[@type='CAPT_TYPE']" id="ResultSet">
                              <logic:equal property="CAPT_TYPE/TYPECODE" propertyId="ResultSet" valueType="variable" value="CAPT_CAPITALINFO/TYPECODE">
                                  <bean:write id="ResultSet" property="CAPT_TYPE/TYPENAME"/>
                              </logic:equal>
                           </logic:iterate>
                  </td>
                  <td align="right"  class="td2">计量单位：</td>
                  <td class="td1">
                          <logic:iterate property="list[@type='CAPT_UNIT']" id="ResultSet">
                          <logic:equal property="CAPT_UNIT/UNITCODE" propertyId="ResultSet" valueType="variable" value="CAPT_CAPITALINFO/UNITCODE">
                                  <bean:write id="ResultSet" property="CAPT_UNIT/UNITNAME"/>
                          </logic:equal>
                          </logic:iterate>
                  </td>
                </tr>
                <tr> 
                  <td width="13%" align="right"  class="td2">资产名称：</td>
                  <td colspan="3" class="td1"><bean:write property="CAPT_CAPITALINFO/CAPTNAME"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">生产厂商：</td>
                  <td colspan="3" class="td1"><bean:write property="CAPT_CAPITALINFO/MANUFACTURE"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">品&nbsp;&nbsp;&nbsp; 牌：</td>
                  <td width="45%" class="td1"><bean:write property="CAPT_CAPITALINFO/BRANDNAME"/></td>
                  <td width="14%" align="right"  class="td2">规格型号：</td>
                  <td width="28%" class="td1"><bean:write property="CAPT_CAPITALINFO/SPECIA"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">获得日期：</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>                          
               </td>
                  <td align="right" width=""  class="td2">使用年限：</td>
                  <td width="20%" class="td1">
                     <bean:write property="CAPT_CAPITALINFO/QLDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>                    
                 </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">购买价格：</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/PRICE"/></td>
                  <td align="right"  class="td2">采购资金来源：</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/FUNDORIGIN"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">资产所有：</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/OWNER"/></td>
                  <td align="right"  class="td2">保修期限：</td>
                  <td class="td1">
                      <bean:write property="CAPT_CAPITALINFO/BXDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>             
                 </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">备&nbsp;&nbsp;&nbsp; 注：</td>
                  <td colspan="3" height="80" class="td1">
                      <bean:write property="CAPT_CAPITALINFO/REMARK"  />
                  </td>
                </tr>
<!-- 供应商*******************************************-->
         <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >供应商信息</font></td>
	        </tr>
            <tr>
              <td width="13%" align="right"  class="td2">供应商名称：</td>
              <td colspan="3" class="td1"><bean:write property="CAPT_PROVIDER/PROVNAME"/></td>
              </tr>
            <tr>
              <td align="right"  class="td2">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/LINKMAN"/></td>
              <td align="right"  class="td2">联系电话：</td>
              <td class="td1"> <bean:write property="CAPT_PROVIDER/TEL"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
              <td width="45%" class="td1"><bean:write property="CAPT_PROVIDER/ADDRESS"/></td>
              <td width="14%" align="right"  class="td2">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
              <td width="28%" class="td1"><bean:write property="CAPT_PROVIDER/ZIPCODE"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">E-mail：</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/E_MAIL"/></td>
              <td align="right"  class="td2">传真号码：</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/FAX"/></td>
            </tr>
            <tr>
              <td align="right" class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                  <td colspan="3" height="50" class="td1">
               <bean:write property="CAPT_PROVIDER/REMARK" />
                  </td>
            </tr>
            
<!-- 售后服务商信息*******************************************-->
	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >售后服务商信息</font></td>
	        </tr>
            <tr>
              <td width="15%" align="right"  class="td2">维护单位名称：</td>
              <td colspan="3" class="td1"><bean:write property="CAPT_VINDICATOR/VINDNAME"/></td>
              </tr>
            <tr>
              <td align="right"  class="td2">联&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;人：</td>
              <td class="td1"><bean:write property="CAPT_VINDICATOR/LINKMAN"/></td>
              <td align="right"  class="td2">联系电话：</td>
              <td class="td1"><bean:write property="CAPT_VINDICATOR/TEL"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
              <td width="36%" class="td1"><bean:write property="CAPT_VINDICATOR/ADDRESS"/></td>
              <td width="6%" align="right"  class="td2">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
              <td width="48%" class="td1"><bean:write property="CAPT_VINDICATOR/ZIPCODE"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">Email：</td>
              <td width="36%" class="td1"><bean:write property="CAPT_VINDICATOR/EMAIL"/></td>
              <td width="6%" align="right"  class="td2">传&nbsp;&nbsp;&nbsp;&nbsp;真：</td>
              <td width="48%" class="td1"><bean:write property="CAPT_VINDICATOR/FAX"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                  <td colspan="3" height="50" class="td1">
                  <bean:write property="CAPT_VINDICATOR/REMARK" />
                  </td>
            </tr>
            
  <!-- 借用信息*******************************************-->
	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >借用信息</font></td>
	        </tr>          
       <tr class="td_title">
          <td width="13%" align="center" nowrap id="entity.BORROWER" >使用人</td>
          <td width="13%" align="center" nowrap id="entity.BORROWBRANCH" >使用部门</td>
          <td width="13%" align="center" nowrap id="entity.BORROWDATE" >借用日期</td>
          <td width="13%" align="center" nowrap id="entity.RETURNDATE" >归还日期</td>    
          </tr>
        
           
          <%		 		
			         int count=0;
			         String trClass = "result_content"; 
		   %>
       <logic:iterate property="list1" id="ResultSet">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
			       <tr class="<%=trClass%>">
		  	        <td align="left">
					<bean:write id="ResultSet" property="entity/BORROWER"/>
					</td>
					<td align="left">
						<bean:write id="ResultSet" property="entity/BORROWBRANCH"/>
					</td>
					<td align="left">
						<bean:write id="ResultSet" property="entity/BORROWDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
					</td>
					<td align="left">
						<bean:write id="ResultSet" property="entity/RETURNDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
					</td>
		  	        
		 	</tr>				
       </logic:iterate>
            
<!-- 维修信息*******************************************-->
	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >维修信息</font></td>
	        </tr>  
        <tr class="td_title">
          <td width="13%" align="center" nowrap id="entity.MAINTAINER" >维修人</td>
          <td width="13%" align="center" nowrap id="entity.servicer" >维护单位</td>
          <td width="13%" align="center" nowrap id="entity.MAINTAINDATE" >维护日期</td>
          <td width="13%" align="center" nowrap id="entity.RETURNDATE" >归还日期</td>
          </tr>
     
         <%
			         count=0;
			         trClass = "result_content"; 
		 %>
       <logic:iterate property="list2" id="ResultSet">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
		<tr class="<%=trClass%>">
		  	        <td align="left">
					<bean:write id="ResultSet" property="entity/MAINTAINER"/>
					</td>
					<td align="left">
						<bean:write id="ResultSet" property="entity/servicer"/>
					</td>
					<td align="left">
						<bean:write id="ResultSet" property="entity/MAINTAINDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
					</td>
					<td align="left">
						<bean:write id="ResultSet" property="entity/RETURNDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
					</td>
		  	        
		  	        
		 	</tr>				
       </logic:iterate>         
            
<!-- 报废信息*******************************************-->
     	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >报废信息</font></td>
	        </tr>  
          <tr class="td_title"> 
            <td width="15%" align="center" nowrap id="entity.BMJBR" >经办人</td>
            <td width="14%" align="center" nowrap id="entity.SQBM" >部门</td>
            <td width="22%" align="center" nowrap id="entity.ZCNC" >资产名称</td>
            <td width="12%" align="center" nowrap id="entity.BFDATE" >申请时间</td>
          </tr>
          <%		 		
	         count=0;
	         trClass = "td1"; 
	        %>
            <logic:iterate id="ResultSet" property="list3"  >
            <%
             
	       	if(count%2==0)
	       	    trClass = "td2";
	       	else
	       	    trClass = "td1";
	       	count++;
	       %>
			       
 		   <tr class="<%=trClass%>">
            <td>&nbsp;<bean:write id="ResultSet" property="entity/BMJBR" formatClass="username" formatType="userid" maxLength="7"/></td>
            <td>&nbsp;<bean:write id="ResultSet" property="entity/SQBM"/></td>
            <td>&nbsp;<a title="<bean:write id="ResultSet" property="entity/ZCNC"/>"><bean:write id="ResultSet" property="entity/ZCNC" maxLength="11"/></a></td>
            <td>&nbsp;<bean:write id="ResultSet" property="entity/BFDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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
<input type="hidden" name="title" value="资产信息">
<input type="hidden" name="xmlfcc">
</form>