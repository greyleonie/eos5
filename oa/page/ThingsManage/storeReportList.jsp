<%@include file="/internet/common.jsp"%>
<logic:equal property="PageCond/count" value="0">
<script>
alert("û�з��ϲ�ѯ��������Ʒ");
</script>
</logic:equal>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��Ʒ����&gt;<span id="printTable">��Ʒ����</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.storeReportList.do">
	
		<html:hidden property="COMM_COMMODITYINFO/_order/col1/field"/>
		<html:hidden property="COMM_COMMODITYINFO/_order/col1/asc" />
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
            	��Ʒ���<html:select property="COMM_COMMODITYINFO/TYPEID/criteria/value" onchange="talentquery()" > 
              <html:option value="">--��ѡ�����--</html:option> <html:options property="list[@type='COMM_TYPE']/COMM_TYPE/TYPEID" labelProperty="list[@type='COMM_TYPE']/COMM_TYPE/TYPENAME"/> 
              </html:select> 
			    <a title="��Ʒ����,��� ">�ؼ��֣�</a>
				<html:text property="COMM_COMMODITYINFO/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="COMM_COMMODITYINFO/searchField" value="COMMNAME,SPECIA"/>
			    <input name="query" type="button" class="button_02" value="ͳ ��" onClick="talentquery()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
		<tr class="td_title"> 
				 <td width="20%" align="center" nowrap id="COMM_COMMODITYINFO.TYPEID" onClick="talentsort()">���</td>
                 <td width="20%" align="center" nowrap id="COMM_COMMODITYINFO.COMMNAME" onClick="talentsort()">Ʒ��</td>   
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.SPECIA" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.UNITID" onClick="talentsort()">������λ</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.PRICE" onClick="talentsort()">���ۣ�Ԫ)</td>
                  <td width="17%" align="center" nowrap id="COMM_COMMODITYINFO.REMARK" onClick="talentsort()">����</td>
                </tr>
                <logic:greaterThan property="PageCond/count" value="0">
                
                <%
		             int count=0;
		             int i=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="typeset" property="list[@type='TYPE']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
				<td nowrap rowspan="<bean:write id="typeset" property="TYPE/RowSpan"/>">&nbsp;<bean:write id="typeset" property="TYPE/TYPENAME"/></td>
				
				
				  <logic:iterate id="resultset" property="list[@type='COMM_COMMODITYINFO']"> 
                	<logic:equal id="resultset" property="COMM_COMMODITYINFO/TYPEID" value="TYPE/TYPEID" valueType="variable" valueId="typeset">
				
				<%i++;if(i!=1){%>
				<tr  class="<%=trClass%>">
				<% } %>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_COMMODITYINFO/COMMNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_COMMODITYINFO/SPECIA"/></td>
                <td nowrap >&nbsp;<dict:write id="resultset" businTypeId="dx_unit" property="COMM_COMMODITYINFO/UNITID"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_COMMODITYINFO/PRICE"       language="zh" country="CN"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_COMMODITYINFO/STORAGE" /></td>
				</tr>
				</logic:equal>
				</logic:iterate>
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
			 </logic:greaterThan>
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
<input type="hidden" name="title" value="��Ʒ����">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'COMM_COMMODITYINFO');
</script>