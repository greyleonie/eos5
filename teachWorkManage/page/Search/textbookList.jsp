<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.textbookList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѯͳ�ơ�&gt;<span id="printTable">�̲Ŀ���ѯ</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.textbookList.do">
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
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
            ������
			<html:text property="Textbook/Title/criteria/value" attributesText='class="input" size="20" '/>
			<html:hidden property="Textbook/Title/criteria/operator" value="like"/>
			<html:hidden property="Textbook/Title/criteria/likeRule" value="center"/>
			���
			<html:select property="Textbook/TextbookType/criteria/value" attributesText='class="input"'>
			<html:option value="">��ѡ��</html:option>
			<html:option value="����">����</html:option>
			<html:option value="��ѧ">��ѧ</html:option>
			<html:option value="����">����</html:option>
			<html:option value="����">����</html:option>
			</html:select>
			<html:hidden property="Textbook/TextbookType/criteria/operator" value="="/>	
			<input name="view" type="button" class="button_02" value="��ѯ" onClick="talentquery()">
			<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
			<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
			���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      
      
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title">
                <td width="3%" align="center" nowrap >�� ��</td>
                  <td width="30%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">�� ��</td>
                  <td width="27%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">�� ��</td>
                  <td width="30%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">������</td>
                  <td width="5%" align="center" nowrap id="Textbook.TextbookType" onClick="talentsort()">�� ��</td>
                  <td width="5%" align="center" nowrap id="Textbook.StockNum" onClick="talentsort()">��ǰ�����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='Textbook']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
                  <td  nowrap align="center"><%=count%></td>  
                  <td  nowrap align="center"><bean:write id="resultset" property="Textbook/Title"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="Textbook/Author"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="Textbook/Publisher"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="Textbook/TextbookType"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="Textbook/StockNum"/></td>
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
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>
<script>
	loadOrderImg(document.forms[0],'Textbook');
</script>