<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prPsAddressList.txlGroupList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���˰칫��&gt;����ͨѶ¼��&gt;������</td>
          </tr>
        </table></td>
    </tr>

    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prPsAddressList.txlGroupList.do">
		<input type="hidden" name="addaction" value="oa.prPsAddressList.txlGroupAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prPsAddressList.txlGroupModify.do">
		<input type="hidden" name="deleteaction" value="oa.prPsAddressList.txlGroupDelete.do">
		<input type="hidden" name="viewaction" value="oa.prPsAddressList.txlGroupView.do">
		<input type="hidden" name="backaction" value="oa.prPsAddressList.pubAddressList.do">
		<html:hidden property="AddressListGroup/_order/col1/field"/>
		<html:hidden property="AddressListGroup/_order/col1/desc" />
		
	  </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
	  	<td class="text">
			<input name="add" type="button" class="button_02" value="�� ��" onClick="talentadd()">
			<input name="add" type="button" class="button_03" value="����ͨѶ¼" onClick="addressadd()">
			<input name="modify" type="button" class="button_02" value="�� ��" onClick="talentmodify()">
			<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
            <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
            <input name="back" type="button" class="button_02" value="�� ��" onClick="goback()">
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="6%" align="center" nowrap id="AddressList.CARDID" onClick="talentsort()">�������</td>
                  <td width="12%" align="center" nowrap id="AddressList.CUSTOMER" onClick="talentsort()">��ע</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='AddressListGroup']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="AddressListGroup/GroupID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="AddressListGroup/GroupID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/AddressListGroup/GroupID" property="AddressListGroup/GroupID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressListGroup/GroupName"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressListGroup/Remark"/></td>               
              </tr>
                </logic:iterate> 
              </table>

		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>
function goback(){
    var frm =document.forms[0];
	frm.action = frm.elements["backaction"].value;
    frm.submit();
}

function addressadd() {
   window.location.href = 'oa.prPsAddressList.pubAddressListAdd.do';
}
</script>