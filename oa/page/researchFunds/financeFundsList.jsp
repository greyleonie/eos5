<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchFunds.financeFundsList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���й���&gt;���񴦾��ѹ���</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchFunds.financeFundsList.do">
		<input type="hidden" name="baoxiaoaction" value="oa.prResearchFunds.financeFundsBaoxiao.do">
		<input type="hidden" name="viewaction" value="oa.prResearchFunds.groupFundsView.do">

		<html:hidden property="KetiLxSearch/_order/col1/field"/>
		<html:hidden property="KetiLxSearch/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td height="30" class="text">
                <a title='��������"' id="keytitle">��������</a>�� 
			    <html:text property="KetiLxSearch/name" attributesText='class="input" size="15"'/>
			    &nbsp;
				<a title='�������"' id="keytitle">�������</a>�� 
			    <html:text property="KetiLxSearch/xuhao" attributesText='class="input" size="15"'/>
				&nbsp;
				<a title='�������"' id="keytitle">�������</a>��
				<html:text property="KetiLxSearch/daima" attributesText='class="input" size="15"'/>
				&nbsp;
				
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">

			</td>
      </tr>
	  <tr>
	  	<td class="text">
				
           <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
           <qx:talentButton value="�� ӡ" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_FINANCEFUNDS.DX_OASYS_RESEARCH_FINANCEFUNDS_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="�� ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_FINANCEFUNDS.DX_OASYS_RESEARCH_FINANCEFUNDS_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           			
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="KetiLxSearch.xuhao" onClick="talentsort()">���</td>
                  <td width="19%" align="center" nowrap id="KetiLxSearch.name" onClick="talentsort()">��������</td>
                  <td width="14%" align="center" nowrap id="KetiLxSearch.daima" onClick="talentsort()">�������</td>
                  <td width="11%" align="center" nowrap id="KetiLxSearch.zonge" onClick="talentsort()">�����ܶ�</td>
                  <td width="16%" align="center" nowrap id="KetiLxSearch.fuzeren" onClick="talentsort()">�����鸺����</td>
				  <td width="12%" align="center" nowrap id="KetiLxSearch.status" onClick="talentsort()" >״̬</td>
                  <td width="14%" align="center" >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='KetiLx']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="KetiLx/ketiLxID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="KetiLxSearch/ketiLxID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/KetiLx/ketiLxID" property="KetiLxSearch/ketiLxID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap  align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/xuhao"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiLxSearch/KetiName"/></td>
                <td nowrap  align="center"><bean:write id="resultset" property="KetiLxSearch/daima"/></td>
                <td nowrap  align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/zonge"/></td>
                <td nowrap  align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/fuzeren"/></td>
				<td nowrap align="center">
				<logic:equal id="resultset" property="KetiLxSearch/status" value="0">����Ǽ�</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="1">���뱨��</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="2">��˱���</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="3">������</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="4">���±���</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="5">����</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="6">���й鵵</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="7">�鵵</logic:equal>
				</td>
                <td align="center">
                <logic:equal id="resultset" property="KetiLxSearch/status" value="3">
                <a href='#' onClick="baoxiao('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">����</a> 
                </logic:equal>
                <logic:equal id="resultset" property="KetiLxSearch/status" value="5">
                <a href='#' onClick="baoxiao('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">����</a>
                </logic:equal>
                </td>
              </tr>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
			  </td>
            </tr>
          </table>
		  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" align="center">
              <IMG src="/internet/image/research/research15.jpg">
			  </td>
            </tr>
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function baoxiao(id){
		var frm = document.forms[0];
		frm.action = frm.elements["baoxiaoaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
}
</script>