<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.textbookModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲���Ϣ����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td>
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="Textbook/TextbookID" /> 
		
		
		
	  </td>
    </tr>
  </table>
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	  
	  <tr class="td_title"> 
                  <td width="30%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">����</td>
                  <td width="20%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">����</td>
                  <td width="20%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">������</td>
                  <td width="12%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">��������</td>
                  <td width="8%" align="center" nowrap id="Textbook.Price" onClick="talentsort()">�۸�(Ԫ)</td>
                  <td width="10%" align="center" nowrap id="Textbook.TextbookType" onClick="talentsort()">���</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbook']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Title" value="<bean:write id="resultset" property="Textbook/Title"/>" class="input"  size="30" style="100%" maxlength="50" ValidateType="notempty" Msg="��������Ϊ��" />
                			<input type="hidden" name="booklist/Textbook[@hciTagIndex='<%=count%>']/TextbookID" value="<bean:write id="resultset" property="Textbook/TextbookID"/>" />
                </td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Author" value="<bean:write id="resultset" property="Textbook/Author"/>" class="input"  style="100%" maxlength="20"   /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Publisher" value="<bean:write id="resultset" property="Textbook/Publisher"/>" class="input"  style="100%"  maxlength="50"  /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']" value="<bean:write id="resultset" property="Textbook/PublishTime[@pattern='yyyy-MM-dd']"/>" class="input"  style="100%" />
                			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Price" value="<bean:write id="resultset" property="Textbook/Price"/>" class="input"  style="100%"  ValidateType="money" Msg="�۸����Ϊ����" /></td>
                <td nowrap ><select name="booklist/Textbook[@hciTagIndex='<%=count%>']/TextbookType"  class="input" style="100%" >
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="-1" ><option value="-1" selected>--��ѡ��--</option><option value="����">����</option><option value="��ѧ">��ѧ</option><option value="����">����</option>
                				<OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="����"><option value="-1" >--��ѡ��--</option><option value="����" selected>����</option><option value="��ѧ">��ѧ</option><option value="����">����</option>
                				<OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="��ѧ"><option value="-1" >--��ѡ��--</option><option value="����">����</option><option value="��ѧ" selected>��ѧ</option><option value="����">����</option>
                				<OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="����"><option value="-1" >--��ѡ��--</option><option value="����">����</option><option value="��ѧ" >��ѧ</option><option value="����" selected>����</option>
                				<OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                			</select></td>
              
              </tr>
                </logic:iterate> 
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
</script>