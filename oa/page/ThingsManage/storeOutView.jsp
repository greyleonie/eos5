<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.storeOutProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;��Ʒ����&gt;��Ʒ����鿴</td>
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
          
<!------------------------------  ��ͷ  ----------------------------->

			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"> <span id="printTable"></span>�����е�У��Ʒ��������</td>
				</tr>
			</table>
			
<!------------------------------  �����  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
                <tr> 
                  <td  align="right" class="td2">���뵥��ţ�</td>
                  <td  class="td1">&nbsp;<bean:write property="COMM_STOREOUTVIEW/STOREOUTCODE"/>  </td>
                  <td  align="right" class="td2">�������ڣ�</td>
                  <td  class="td1">&nbsp; <bean:write property="COMM_STOREOUTVIEW/PURCHASEDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td  align="right" class="td2">���벿�ţ�</td>
                  <td  class="td1">&nbsp; <bean:write   property="COMM_STOREOUTVIEW/BRANCHNAME" /> </td>
                  <td  align="right" class="td2">�� �� �ˣ�</td>
                  <td  class="td1">&nbsp;<bean:write property="COMM_STOREOUTVIEW/PROPOSERNAME" /> </td>
                </tr>
             </table>

              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
                <tr class="td_title">
				  <td width="5%" align="center">���</td>
                  <td width="25%" align="center">Ʒ��</td>
                  <td width="10%" align="center">������λ</td>
                  <td width="10%" align="center">���</td>
                  <td width="10%" align="center">���ۣ�Ԫ��</td>
                  <td width="10%" align="center">����</td>
                  <td width="15%" align="center">�ϼƽ�Ԫ��</td>
                  <td width="15%" align="center">��ע</td>
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
             <td align="right" class="td1" colspan="8"> �ϼƽ�<bean:write property="AMOUNT"/>Ԫ</td>            
           </tr>
                </table>
         
              
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25"  nowrap class="td1"><div class="divwf1">�����Ÿ�����ǩ�������</div>
		          <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25"  nowrap class="td1"><div class="divwf1">������ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></div></td>
		      </tr>
		      <tr>
			    <td height="25"    nowrap class="td1"><div class="divwf1">��У�쵼ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX4" list="list[@type='wfdata']" /></div></td>
		      </tr>
		</table>
<!------------------------------  ��ת  ----------------------------->
		<!--   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="100%" align="left" nowrap  bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
		  </td>
        </tr>
      </table>
      -->
<!------------------------------  ��β  ----------------------------->			
	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
		</table>

 </td></tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <!--
				 <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"> -->
				 
				 <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				 <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="goBack()"></td>
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