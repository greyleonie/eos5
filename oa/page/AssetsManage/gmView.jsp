<%@include file="/internet/common.jsp"%>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ���Ϣ</span>�鿴</td>
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
<!-- �ʲ���Ϣ*******************************************-->
              <tr> <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >�ʲ���Ϣ</font></td></tr>
               <tr>
                  <td align="right" class="td2">�ʲ���ţ�</td>
                  <td colspan="3" class="td1"><bean:write property="CAPT_CAPITALINFO/CAPTCODE"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">�ʲ����룺</td>
                  <td colspan="3" class="td1">
                  <bean:write property="CAPT_CAPITALINFO/BARCODE"/>
                  </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">�ʲ����ͣ�</td>
                  <td class="td1">
                           <logic:iterate property="list[@type='CAPT_TYPE']" id="ResultSet">
                              <logic:equal property="CAPT_TYPE/TYPECODE" propertyId="ResultSet" valueType="variable" value="CAPT_CAPITALINFO/TYPECODE">
                                  <bean:write id="ResultSet" property="CAPT_TYPE/TYPENAME"/>
                              </logic:equal>
                           </logic:iterate>
                  </td>
                  <td align="right"  class="td2">������λ��</td>
                  <td class="td1">
                          <logic:iterate property="list[@type='CAPT_UNIT']" id="ResultSet">
                          <logic:equal property="CAPT_UNIT/UNITCODE" propertyId="ResultSet" valueType="variable" value="CAPT_CAPITALINFO/UNITCODE">
                                  <bean:write id="ResultSet" property="CAPT_UNIT/UNITNAME"/>
                          </logic:equal>
                          </logic:iterate>
                  </td>
                </tr>
                <tr> 
                  <td width="13%" align="right"  class="td2">�ʲ����ƣ�</td>
                  <td colspan="3" class="td1"><bean:write property="CAPT_CAPITALINFO/CAPTNAME"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">�������̣�</td>
                  <td colspan="3" class="td1"><bean:write property="CAPT_CAPITALINFO/MANUFACTURE"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">Ʒ&nbsp;&nbsp;&nbsp; �ƣ�</td>
                  <td width="45%" class="td1"><bean:write property="CAPT_CAPITALINFO/BRANDNAME"/></td>
                  <td width="14%" align="right"  class="td2">����ͺţ�</td>
                  <td width="28%" class="td1"><bean:write property="CAPT_CAPITALINFO/SPECIA"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">������ڣ�</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>                          
               </td>
                  <td align="right" width=""  class="td2">ʹ�����ޣ�</td>
                  <td width="20%" class="td1">
                     <bean:write property="CAPT_CAPITALINFO/QLDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>                    
                 </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">����۸�</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/PRICE"/></td>
                  <td align="right"  class="td2">�ɹ��ʽ���Դ��</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/FUNDORIGIN"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">�ʲ����У�</td>
                  <td class="td1"><bean:write property="CAPT_CAPITALINFO/OWNER"/></td>
                  <td align="right"  class="td2">�������ޣ�</td>
                  <td class="td1">
                      <bean:write property="CAPT_CAPITALINFO/BXDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>             
                 </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">��&nbsp;&nbsp;&nbsp; ע��</td>
                  <td colspan="3" height="80" class="td1">
                      <bean:write property="CAPT_CAPITALINFO/REMARK"  />
                  </td>
                </tr>
<!-- ��Ӧ��*******************************************-->
         <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >��Ӧ����Ϣ</font></td>
	        </tr>
            <tr>
              <td width="13%" align="right"  class="td2">��Ӧ�����ƣ�</td>
              <td colspan="3" class="td1"><bean:write property="CAPT_PROVIDER/PROVNAME"/></td>
              </tr>
            <tr>
              <td align="right"  class="td2">��&nbsp;&nbsp;ϵ&nbsp;&nbsp;�ˣ�</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/LINKMAN"/></td>
              <td align="right"  class="td2">��ϵ�绰��</td>
              <td class="td1"> <bean:write property="CAPT_PROVIDER/TEL"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
              <td width="45%" class="td1"><bean:write property="CAPT_PROVIDER/ADDRESS"/></td>
              <td width="14%" align="right"  class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</td>
              <td width="28%" class="td1"><bean:write property="CAPT_PROVIDER/ZIPCODE"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">E-mail��</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/E_MAIL"/></td>
              <td align="right"  class="td2">������룺</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/FAX"/></td>
            </tr>
            <tr>
              <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                  <td colspan="3" height="50" class="td1">
               <bean:write property="CAPT_PROVIDER/REMARK" />
                  </td>
            </tr>
            
<!-- �ۺ��������Ϣ*******************************************-->
	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >�ۺ��������Ϣ</font></td>
	        </tr>
            <tr>
              <td width="15%" align="right"  class="td2">ά����λ���ƣ�</td>
              <td colspan="3" class="td1"><bean:write property="CAPT_VINDICATOR/VINDNAME"/></td>
              </tr>
            <tr>
              <td align="right"  class="td2">��&nbsp;&nbsp;&nbsp;ϵ&nbsp;&nbsp;&nbsp;�ˣ�</td>
              <td class="td1"><bean:write property="CAPT_VINDICATOR/LINKMAN"/></td>
              <td align="right"  class="td2">��ϵ�绰��</td>
              <td class="td1"><bean:write property="CAPT_VINDICATOR/TEL"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
              <td width="36%" class="td1"><bean:write property="CAPT_VINDICATOR/ADDRESS"/></td>
              <td width="6%" align="right"  class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</td>
              <td width="48%" class="td1"><bean:write property="CAPT_VINDICATOR/ZIPCODE"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">Email��</td>
              <td width="36%" class="td1"><bean:write property="CAPT_VINDICATOR/EMAIL"/></td>
              <td width="6%" align="right"  class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�棺</td>
              <td width="48%" class="td1"><bean:write property="CAPT_VINDICATOR/FAX"/></td>
            </tr>
            <tr>
              <td align="right"  class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                  <td colspan="3" height="50" class="td1">
                  <bean:write property="CAPT_VINDICATOR/REMARK" />
                  </td>
            </tr>
            
  <!-- ������Ϣ*******************************************-->
	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >������Ϣ</font></td>
	        </tr>          
       <tr class="td_title">
          <td width="13%" align="center" nowrap id="entity.BORROWER" >ʹ����</td>
          <td width="13%" align="center" nowrap id="entity.BORROWBRANCH" >ʹ�ò���</td>
          <td width="13%" align="center" nowrap id="entity.BORROWDATE" >��������</td>
          <td width="13%" align="center" nowrap id="entity.RETURNDATE" >�黹����</td>    
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
            
<!-- ά����Ϣ*******************************************-->
	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >ά����Ϣ</font></td>
	        </tr>  
        <tr class="td_title">
          <td width="13%" align="center" nowrap id="entity.MAINTAINER" >ά����</td>
          <td width="13%" align="center" nowrap id="entity.servicer" >ά����λ</td>
          <td width="13%" align="center" nowrap id="entity.MAINTAINDATE" >ά������</td>
          <td width="13%" align="center" nowrap id="entity.RETURNDATE" >�黹����</td>
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
            
<!-- ������Ϣ*******************************************-->
     	        <tr>
	          <td valign="bottom" colspan="4" class="td1"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >������Ϣ</font></td>
	        </tr>  
          <tr class="td_title"> 
            <td width="15%" align="center" nowrap id="entity.BMJBR" >������</td>
            <td width="14%" align="center" nowrap id="entity.SQBM" >����</td>
            <td width="22%" align="center" nowrap id="entity.ZCNC" >�ʲ�����</td>
            <td width="12%" align="center" nowrap id="entity.BFDATE" >����ʱ��</td>
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
              <td align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
               </td>
            </tr>
 </table>
 
 		</td>
 	</tr>
 </table>
 
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="�ʲ���Ϣ">
<input type="hidden" name="xmlfcc">
</form>