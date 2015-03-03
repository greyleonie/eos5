<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.storeOutProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;用品管理—&gt;用品申请查看</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="COMM_STOREOUT/_order/col1/field"/>
		<html:hidden  property="COMM_STOREOUT/_order/col1/asc" />
		
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
		
		<html:hidden property="COMM_STOREOUT/STOREOUTID"/> 
		<html:hidden property="COMM_STOREOUT/participant" />
		<html:hidden property="COMM_STOREOUT/passParticipant" />

	  </td>
    </tr>
  </table>
      <table width="100%" height="10"  bgcolor="#FFFFFF"  border="0" cellpadding="0" cellspacing="0"  id="listdetail">
        <tr>
          <td>
          
<!------------------------------  文头  ----------------------------->

			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"> <span id="printTable"></span>广州市党校用品领用申请</td>
				</tr>
			</table>
			
<!------------------------------  表单意见  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
                <tr> 
                  <td  align="right" class="td2">申请单编号：</td>
                  <td  class="td1">&nbsp;<bean:write property="COMM_STOREOUTVIEW/STOREOUTCODE"/>  </td>
                  <td  align="right" class="td2">申请日期：</td>
                  <td  class="td1">&nbsp; <bean:write property="COMM_STOREOUTVIEW/PURCHASEDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td  align="right" class="td2">申请部门：</td>
                  <td  class="td1">&nbsp; <bean:write   property="COMM_STOREOUTVIEW/BRANCHNAME" /> </td>
                  <td  align="right" class="td2">申 请 人：</td>
                  <td  class="td1">&nbsp;<bean:write property="COMM_STOREOUTVIEW/PROPOSERNAME" /> </td>
                </tr>
             </table>

              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
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
                      <logic:iterate id="detail" property="list[@type='COMM_STOREOUTDETAILVIEW']">
                        <%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
                         <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
                          <td align="center">&nbsp;<%=count %></td>
                          <td>&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/COMMNAME"/></td>
                          <td >&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/UNITNAME"/></td>
                          <td >&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/SPECIA"/></td>
                          <td >&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/PRICE"/></td>
                          <td >&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/QUANTITY"/></td>
                          <td >&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/AMOUNT"/></td>
                          <td >&nbsp;<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/REMARK"/></td>
                        </tr>
                        
                      </logic:iterate>
                         <tr>
             <td align="right" class="td1" colspan="8"> 合计金额：<bean:write property="AMOUNT"/>元</td>            
           </tr>
                </table>
         
              
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
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
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
				 <input name="ieprint" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
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
  	frm.action = "oa.prThingsManage.storeOutList.do";
	frm.submit();
  }

</script>