 <%@include file="/internet/common.jsp"%>
<body>
<form>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;�ʲ�����&gt;�ʲ����ò鿴</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_BORROWVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_BORROWVIEW/_order/col1/asc" />
		
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><span id="printTable"> �����е�У�ʲ�����</span></td>
				</tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                <tr > 
                  <td align="right" class="td2">ʹ�ò��ţ�</td>
                  <td class="td1" colspan="2"><bean:write  property="CAPT_BORROWVIEW/DepNAME"   />
                   </td>
                  <td align="right" class="td2">ʹ �� �ˣ�</td>
                  <td class="td1" colspan="2"><bean:write  property="CAPT_BORROWVIEW/BORROWERNAME"  />
                  </td>
                </tr>
                
                <tr class="td1"> 
                  <td width="20%" align="right" class="td2">�������ڣ�</td>
                  <td width="30%" class="td1" colspan="2">
                 <bean:write  property="CAPT_BORROWVIEW/BORROWDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                  
                  </td>
                <td width="20%" align="right" class="td2">�黹���ڣ�</td>
                  <td width="30%" class="td1" colspan="2">
               <bean:write property="CAPT_BORROWVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                  </td>
                </tr>
                <tr class="td2"> 
                  <td align="right" class="td2">��ע��</td>
                  <td colspan="5" class="td1"><bean:write  property="CAPT_BORROWVIEW/REMARK" />
                  </td>
                </tr>
             <tr> <td valign="bottom" colspan="7" class="td1" align="center"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >�ʲ�������ϸ</font></td></tr>
                
                
               <tr class="td_title">
				  <td width="5%" align="center">���</td>
                  <td width="35%" align="center">Ʒ��</td>
                  <td width="10%" align="center">����</td>
                  <td width="20%" align="center">���</td>
                  <td width="10%" align="center">���ۣ�Ԫ��</td>
                  <td width="*" align="center">��ע</td>
                </tr>
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=CAPT_BORROWDETAILVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass %>" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td align="center"> 
				<%=count%>
				</td>
                <td nowrap><bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTNAME'/></td> 
                <td nowrap> <bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTCODE'/></td>
                <td nowrap><bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/SPECIA' /></td>
                <td nowrap><bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/PRICE'/></td>
                <td nowrap><bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/REMARK'/></td>
              </tr>
				</logic:iterate>
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
<input type="hidden" name="title" value="�ʲ����ñ�">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script type="text/javascript">

<!--

  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.borrowList.do";
	frm.submit();
  }
//-->
</script>
