<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<body>
<form method="post" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲Ķ�����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
         <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="10%" align="right" nowrap class="td2">��ȣ� </td>
            <td width="10%" class="td1"><bean:write property="TextbookOrder/Yearth"/>��</td>
            <td width="10%" align="right" nowrap class="td2">ʱ�ڣ� </td>
            <td width="10%" class="td1"><bean:write property="TextbookOrder/Season"/>��</td>
            <td width="10%" align="right" nowrap class="td2">�������ƣ� </td>
            <td width="50%" class="td1"> <span id="printTable"> <bean:write property="TextbookOrder/OrderTitle"/> </span></td>
          </tr>
  
           <tr><td align="center" colspan="6" height="30" class="td1">������ϸһ���� </td></tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
        
         <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> �� ��</td>
                  <td width="25%" align="center" nowrap id="TextbookOrder.Title" onClick="talentsort()">�� ��</td>
                  <td width="25%" align="center" nowrap id="TextbookOrder.Title" onClick="talentsort()">������</td>
                  <td width="5%" align="center" nowrap id="TextbookOrder.Price" onClick="talentsort()">����</td>
                  <td width="32%" align="center" nowrap id="TextbookOrder.UseClasses" onClick="talentsort()">���</td>
                  <td width="5%" align="center" nowrap id="TextbookOrder.Stock" onClick="talentsort()">���</td>
                  <td width="5%" align="center" nowrap id="TTextbookOrder.OrderNum" onClick="talentsort()">����</td>
                </tr>
            
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbookorderdetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"><%=count%></td>
                <td >&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Title"/></td>
                <td >&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Publisher"/></td>
                <td >&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Price"/></td>
                <td >&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/UseClasses"/></td>
                <td >&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Stock"/></td>
                <td >&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/OrderNum"/></td>
              </tr>
                </logic:iterate> 
                <tr class="td1"  style="display: none"><td colspan="7" >
		    �Ʊ��ˣ�
			   <bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
	   ����ˣ�
	   <bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>
                
                <td></tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
			  <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" >
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
	// ҳ���ʼ������
	function pageOnLoad() {
    	var frm = document.forms[0];
    	frm.elements["TextbookOrder/OrderTime[@pattern='yyyy-MM-dd']"].value = getCurDateValue2();
	}

</script>