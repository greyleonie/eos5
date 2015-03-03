<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.storeOutProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;用品管理—&gt;用品采购申请查看<span id="printTable"></span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="COMM_PURCHASE/_order/col1/field"/>
		<html:hidden  property="COMM_PURCHASE/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />

		<html:hidden property="WFWorkItem/submitType" />
		
		<html:hidden property="WFWorkItem/workItemID" />
		
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		
		
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		
		<html:hidden property="COMM_PURCHASE/PURCHASEID"/> 
		<html:hidden property="COMM_PURCHASE/participant" />
		<html:hidden property="COMM_PURCHASE/passParticipant" />
		

		
	  </td>
    </tr>
  </table>
      <table width="100%" height="10"  bgcolor="#FFFFFF"  border="0" cellpadding="0" cellspacing="0"  id="listdetail">
        <tr>
          <td>
          
<!------------------------------  文头  ----------------------------->

			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"> 广州市党校用品采购申请</td>
				</tr>
			</table>
			
<!------------------------------  表单意见  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
                <tr> 
                  <td    width="10%"  align="right" class="td2">申请单编号：</td>
                  <td    width="10%" class="td1">&nbsp;<bean:write property="COMM_PURCHASEVIEW/PURCHASECODE"/>  </td>
                  <td    width="10%" align="right" class="td2">申请日期：</td>
                  <td    width="10%" class="td1">&nbsp; <bean:write property="COMM_PURCHASEVIEW/PURCHASEDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td    width="10%"    align="right" class="td2">申请部门：</td>
                  <td    width="20%"  class="td1">&nbsp; <bean:write   property="COMM_PURCHASEVIEW/BRANCHNAME" /> </td>
                  <td    width="10%"  align="right" class="td2">申 请 人：</td>
                  <td    width="20%" class="td1">&nbsp;<bean:write property="COMM_PURCHASEVIEW/PROPOSERNAME" />  </td>
                </tr>
		</table>
			<!--<logic:greaterThan property="rowNum1" value="0">
			
			<table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
			<td align="center" class="td1"><b>领用申请库存不足用品（已审批）</b></td>       

            </tr>
			</table>
			
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="olddetail">
                <tr class="td_title">
				  <td width="5%" align="center">序号</td>
                  <td width="15%" align="center">品名</td>
                  <td width="10%" align="center">领用单编号</td>
                  <td width="15%" align="center">领用部门</td>
                  <td width="10%" align="center">领用人</td>
                  <td width="10%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="10%" align="center">数量</td>
                  <td width="*" align="center">合计金额（元）</td>
                </tr>
                    <%
		             int count1=0;
			         String trClass1 = ""; 
		  
		  		%>
                      <logic:iterate id="detail2" property="list[@type='COMM_SHORTAGEDETAILVIEW']">
                        <%
				     
			       	if(count1%2==0)
			       	    trClass1 = "td1";
			       	else
			       	    trClass1 = "td2";
			       	count1++;
			       %>
                         <tr class="<%=trClass1%>" onClick="changeTRBgColor(this)" >  
                          <td  nowrap="nowrap" align="center">&nbsp;<%=count1 %></td>
                          <td nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/COMMNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/STOREOUTCODE"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/BRANCHNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/PROPOSERNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/SPECIA"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/PRICE"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/QUANTITY"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail2" property="COMM_SHORTAGEDETAILVIEW/AMOUNT"/></td>
                        </tr>
                      </logic:iterate>
                
              </table>	
              
              </logic:greaterThan>
                            <table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
				            
		
              <td align="right" height="30">
                &nbsp; </td>
            </tr>
			</table>-->
			
			
              <logic:greaterThan property="rowNum2" value="0">
			<table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
				            
		     <td align="center" class="td1">
		     <b>计划采购用品</b></td> 
            </tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" >
                <tr class="td_title">
				  <td width="5%" align="center">序号</td>
                  <td width="25%" align="center">品名</td>
                  <td width="10%" align="center">计量单位</td>
                  <td width="10%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="10%" align="center">数量</td>
                  <td width="15%" align="center">合计金额（元）</td>
                  <td width="15%" align="center">备注</td>
                </tr>
                 <%
		             int count=0;
			         String trClass = ""; 
		  
		  		%>
                      <logic:iterate id="detail" property="list[@type='COMM_PURCHASEDETAILVIEW']">
                        <%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
                         <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
                          <td  nowrap="nowrap" align="center">&nbsp;<%=count %></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/COMMNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/UNITNAME"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/SPECIA"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/PRICE"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/QUANTITY"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/AMOUNT"/></td>
                          <td  nowrap="nowrap">&nbsp;<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/REMARK"/></td>
                        </tr>
                      </logic:iterate>
                
              </table>	
               </logic:greaterThan>
         
              
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25"  nowrap class="td1"><div class="divwf1">【部门负责人签批意见】</div>
		          <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25"  nowrap class="td1"><div class="divwf1">【财务处签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></div></td>
		      </tr>
		      <tr>
			    <td height="25"    nowrap class="td1"><div class="divwf1">【校领导签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX4" list="list[@type='wfdata']" /></div></td>
		      </tr>
		</table>
<!------------------------------  流转  ----------------------------->
		<!--   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="100%" align="left" nowrap  bgcolor="#FFFFFF">
		  <iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"  name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
		  </td>
        </tr>
      </table>
      -->
<!------------------------------  文尾  ----------------------------->			
	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
		</table>

 </td></tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <!--
				 <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()"> -->
				 
				 <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				 <input name="ieprint" type="button" class="button_02" value="返 回" onClick="history.go(-1)"></td>
				</tr>
     </table>
</form>

<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.purchaseList.do";
	frm.submit();
  }

</script>