 <%@include file="/internet/common.jsp"%>
<body>
<form>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;�ʲ�����&gt;�ɹ�����鿴</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_PURCHASEVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_PURCHASEVIEW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
	  </td>
    </tr>
  </table>
      <table width="96%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8"></td>
      </tr>

               
            <tr><td>
            
            
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><span id="printTable"> �����е�У�ʲ��ɹ�����</span></td>
				</tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                 <tr class="td1"> 
                  <td  align="right" class="td2">���뵥��ţ�</td>
                  <td  class="td1"  ><bean:write property="CAPT_PURCHASEVIEW/PURCHASECODE" /></td>
                  <td align="right" class="td2" >���벿�ţ�</td>
 					<td  class="td1" ><bean:write property="CAPT_PURCHASEVIEW/DepName" /></td>
                  <td align="right" class="td2" >�� �� �ˣ�</td>
 				<td  class="td1"  ><bean:write property="CAPT_PURCHASEVIEW/RequestName" /></td>
                  <td  align="right" class="td2">�������ڣ�</td>
                  <td  class="td1" ><bean:write  property="CAPT_PURCHASEVIEW/PURCHASEDATE"  formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                </tr>
                <tr class="td2"> 
                  <td align="right" class="td2">�������ɣ�</td>
                  <td colspan="7" class="td1"><bean:write   property="CAPT_PURCHASEVIEW/Reason"/>
                  </td>
                </tr>
             <tr> <td valign="bottom" colspan="8" class="td1" align="center"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >�ɹ�������ϸ</font></td></tr>
                
                
                <tr class="td_title">
                  <td width="20%" nowrap="nowrap" align="center" colspan="2">Ʒ��</td>
                  <td width="10%" nowrap="nowrap" align="center">������λ</td>
                  <td width="10%" nowrap="nowrap" align="center">���</td>
                  <td width="10%" nowrap="nowrap" align="center">����</td>
                  <td width="10%" nowrap="nowrap" align="center">��Ӧ��1����</td>
                  <td width="10%" nowrap="nowrap" align="center">��Ӧ��2����</td>
                  <td width="10%" nowrap="nowrap" align="center">��Ӧ��3����</td>
                </tr>
                
                     <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[type='CAPT_PURCHASEDETAIL']"> 
                <%
					count++;
			       %>
              <tr class="td1"    id="row_<%=count%>"> 
                <td nowrap colspan="2"><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/CAPTNAME" /> </td>
                <td nowrap ><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/businName"/></td>
                <td nowrap ><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/SPECIA"/></td>
                <td nowrap ><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/QUANTITY"/></td>
                <td nowrap ><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE1" language="zh" country="CN"/></td>
				<td nowrap ><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE2"language="zh" country="CN"/></td>
				<td nowrap ><bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE3"language="zh" country="CN"/></td>
				</tr>
				</logic:iterate>
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
				<fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></div></td>
		      </tr>
		</table>
			  </td>
        </tr>
</table>


	  <table width="96%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="�� ��" onClick="goBack()">
               </td>
            </tr>
          </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="�ɹ������">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.purchaseList.do";
	frm.submit();
  }
</script>