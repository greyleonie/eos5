 <%@include file="/internet/common.jsp"%>
<body>
<form>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;�ʲ�����&gt;��������鿴</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_WRITEOFFVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_WRITEOFFVIEW/_order/col1/asc" />
		
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><span id="printTable"> �����е�У�ʲ���������</span></td>
				</tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                 <tr class="td1"> 
                  <td  align="right" class="td2" colspan="2">���뵥��ţ�</td>
                  <td  class="td1" ><bean:write property="CAPT_WRITEOFFVIEW/WRITEOFFCODE" /></td>

                  <td align="right" class="td2"  >���벿�ţ�</td>
 					<td  class="td1" ><bean:write property="CAPT_WRITEOFFVIEW/DepName" /></td>
                  <td align="right" class="td2" >�� �� �ˣ�</td>
 				<td  class="td1" ><bean:write property="CAPT_WRITEOFFVIEW/RequestName" /></td>
                  <td  align="right" class="td2" >�������ڣ�</td>
                  <td  class="td1" ><bean:write  property="CAPT_WRITEOFFVIEW/WRITEOFFDATE"  formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                </tr>
                <tr class="td2"> 
                  <td align="right" class="td2" colspan="2">�������ɣ�</td>
                  <td colspan="7" class="td1"><bean:write   property="CAPT_WRITEOFFVIEW/Reason"/>
                  </td>
                </tr>
             <tr> <td valign="bottom" colspan="9" class="td1" align="center"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >����������ϸ</font></td></tr>
                
                
                <tr class="td_title">
                  <td width="5%" align="center">���</td>
                  <td width="25%" align="center" colspan="2">Ʒ��</td>
                  <td width="20%" align="center" colspan="2">����</td>
                  <td width="20%" align="center" >������λ</td>
                  <td width="20%" align="center" colspan="2">���</td>
                  <td width="10%" align="center">���ۣ�Ԫ��</td>
                </tr>
                
                     <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[type='CAPT_WRITEOFFDETAILVIEW']"> 
                <%
					count++;
			       %>
              <tr class="td1"    id="row_<%=count%>">
                <td nowrap align="center"><%=count %> </td>
                <td nowrap  colspan="2"><bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTNAME" /> </td>
                <td nowrap colspan="2"><bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTCODE"/></td>
                <td nowrap ><bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/UNITNAME"/></td>
                <td nowrap colspan="2" ><bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/SPECIA"/></td>
                <td nowrap ><bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/PRICE" language="zh" country="CN"/></td>
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
<input type="hidden" name="title" value="���������">
<input type="hidden" name="xmlfcc">
</form>
</body>


<script>
 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.writeOffList.do";
	frm.submit();
  }
</script>