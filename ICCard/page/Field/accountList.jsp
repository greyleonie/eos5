<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.receptionList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���ع���&gt;<span id="printTable">���Ӱ��б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prField.receptionList.do">
		<input type="hidden" name="addaction" value="ICCard.prField.receptionAdd.do">
		<input type="hidden" name="modifyaction" value="ICCard.prField.receptionModify.do">
		<input type="hidden" name="deleteaction" value="ICCard.prField.receptionDelete.do">
		<input type="hidden" name="viewaction" value="ICCard.prField.receptionView.do">
		<html:hidden property="tblReceptionChangeRec/_order/col1/field"/>
		<html:hidden property="tblReceptionChangeRec/_order/col1/asc" />
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
            	�� �ڣ���<html:text property="tblReceptionChangeRec/CreatedTime/criteria/min" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["tblReceptionChangeRec/CreatedTime/criteria/min"],"yyyy-MM-dd")> 
                ��<html:text property="tblReceptionChangeRec/CreatedTime/criteria/max" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["tblReceptionChangeRec/CreatedTime/criteria/max"],"yyyy-MM-dd")> 
                 <html:hidden  property="tblReceptionChangeRec/CreatedTime/criteria/operator" value="between" />
               �Ǽ��ˣ� <html:text property="tblReceptionChangeRec/Author/criteria/value" attributesText='class="input" size="30"' maxlength="50"/>
              <html:hidden property="tblReceptionChangeRec/Author/criteria/operator" value="like"/>
              <html:hidden property="tblReceptionChangeRec/Author/criteria/likeRule" value="center"/>
                 <br/>
                 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">  
                <input name="add" type="button" class="button_02" value="�� ��" onClick="talentaddNew()">
				<input name="modify" type="button" class="button_02" value="�� ��" onClick="talentmodify()">
				<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
				<input name="delete" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">		
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" > 
                  </td>
                  <td width="37%" align="center" nowrap id="tblReceptionChangeRec.Author" onClick="talentsort()">������</td>
                  <td width="30%" align="center" nowrap id="tblReceptionChangeRec.Range" onClick="talentsort()">��&nbsp;��</td>
                  <td width="30%" align="center" nowrap id="tblReceptionChangeRec.Date" onClick="talentsort()">����ʱ��</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='tblReceptionChangeRec']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td align="center">
				  <logic:present  id="resultset" property="tblReceptionChangeRec/ID">
				  	<html:checkbox id="resultset" name="list[@name='update']/tblReceptionChangeRec/ID" property="tblReceptionChangeRec/ID" indexed="true"/>
				  </logic:present>
				  </td>
				   <td  align="center" nowrap><bean:write id="resultset" property="tblReceptionChangeRec/Author" /></td>
                  <td  align="center" nowrap><logic:equal id="resultset" property="tblReceptionChangeRec/Range" value="0">���</logic:equal>
                  <logic:equal id="resultset" property="tblReceptionChangeRec/Range" value="1">�а�</logic:equal>
                  <logic:equal id="resultset" property="tblReceptionChangeRec/Range" value="2">ҹ��</logic:equal></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="tblReceptionChangeRec/CreatedTime" formatType="yyyy-MM-dd HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
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
	loadOrderImg(document.forms[0],'tblReceptionChangeRec');
</script>