<%@ include file="/internet/common.jsp" %>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��Ʒ����&gt;<span id="printTable">��Ʒ��ⵥ</span>�鿴</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
		<input type="hidden" name="viewaction" >
	
		<html:hidden property="COMM_STOREIN/_order/col1/field"/>
		<html:hidden property="COMM_STOREIN/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		
		<html:hidden property="COMM_STOREIN/STOREID"/>
	  </td>
    </tr>
  </table>
  

		<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                  <tr> 
                  <td width="10%" align="right" class="td1">����ţ�</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_STOREIN/STORECODE"/></td>
                  <td width="10%" align="right" class="td1">������ڣ�</td>
                  <td width="20%"  class="td1"><bean:write  property="COMM_STOREIN/STOREDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%" align="right" class="td1">�� �� �ˣ�</td>
                  <td  width="30%" class="td1" colspan="2"><bean:write  property="COMM_STOREIN/operatorName"/></td>
                </tr>
                
                <tr class="td_title"> 
                  <td width="27%" align="center" nowrap id="COMM_COMMODITYINFO.COMMNAME" onClick="talentsort()">Ʒ��</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.UNIT" onClick="talentsort()">������λ</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.SPECIA" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.PRICE" onClick="talentsort()">���ۣ�Ԫ)</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.QUANTITY" onClick="talentsort()">����</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.AMOUNT" onClick="talentsort()">�ϼƽ�Ԫ)</td>
                   <td width="20%" align="center" nowrap id="COMM_COMMODITYINFO.REMARK" onClick="talentsort()">��ע</td>
                </tr>
                <%
		         int count=0;
		         int totalCount = 0;
		         float totalAmount = 0;
			      String trClass = "result_content";
		          String nextTrClass = "result_content";
		  		%>
                <logic:iterate id="resultset" property="list[@type=COMM_STOREINDETAILVIEW']"> 
                <%
				     
						if(count%2==0) {
							trClass = "td1";
							nextTrClass = "td2"; }
						else {
							trClass = "td2";
							nextTrClass = "td1"; }
						count++;
						
						totalCount += Integer.parseInt(base.util.TalentContext.getValue(pageContext,"resultset","COMM_STOREINDETAILVIEW/QUANTITY"));
						totalAmount += Float.parseFloat(base.util.TalentContext.getValue(pageContext,"resultset","COMM_STOREINDETAILVIEW/AMOUNT"));
			       %>
               <tr class="<%=trClass %>" onClick="changeTRBgColor(this)" id="row_<%=count%>">  
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/COMMNAME'/></td> 
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/UNITNAME'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/SPECIA' /></td>
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/PRICE'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/QUANTITY'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/AMOUNT'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_STOREINDETAILVIEW/REMARK'/></td>
              </tr>
				</logic:iterate>
			  <tr class="<%=nextTrClass%>">
			  <td colspan="4" nowrap>�ϼƣ�</td>
			  <td nowrap><%=totalCount%></td>
			  <td colspan="2" nowrap><%=totalAmount%></td>
			  </tr>
              </table>
  
  
             <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				 <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="window.location.href='oa.prThingsManage.storeInList.do'"></td>
				</tr>
     </table>

</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="��Ʒ����б�">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.storeInList.do";
	frm.submit();
  }


</script>