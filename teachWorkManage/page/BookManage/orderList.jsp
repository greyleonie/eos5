<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.orderList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;<span id="printTable">�̲Ķ����б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.orderList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.orderAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prBookManage.orderModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prBookManage.orderDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prBookManage.orderView.do">
		<html:hidden property="QueryTextbookOrder/_order/col1/field"/>
		<html:hidden property="QueryTextbookOrder/_order/col1/asc" />
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
			��ȣ�
			<html:select property="QueryTextbookOrder/Yearth/criteria/value">
			<html:option value="">��ѡ��</html:option>
			<%
			GregorianCalendar today=new GregorianCalendar();
          int thisYear=today.get(GregorianCalendar.YEAR);
			for(int i=thisYear+1;i>=thisYear-4;i--){%>
            <html:option value="<%=i+""%>"><%=i%></html:option>
           <%}%>
			</html:select>
			<html:hidden property="QueryTextbookOrder/Yearth/criteria/operator" value="="/>
            ʱ�ڣ�
           	<html:select property="QueryTextbookOrder/Season/criteria/value">		
                <html:option value="">��ѡ��</html:option>
                <html:option value="��">��</html:option>
                <html:option value="��">��</html:option>
                <html:option value="��">��</html:option>
                <html:option value="��">��</html:option>         
			</html:select>
            <html:hidden property="QueryTextbookOrder/Season/criteria/operator" value="like"/>
            <html:hidden property="QueryTextbookOrder/Season/criteria/likeRule" value="begin"/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">

              	<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_TEACH_MANAGE_BOOK_ORDER.DX_TEACH_MANAGE_BOOK_ORDER_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_TEACH_MANAGE_BOOK_ORDER.DX_TEACH_MANAGE_BOOK_ORDER_MODIFY"/> 
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_BOOK_ORDER.DX_TEACH_MANAGE_BOOK_ORDER_DELETE"/>
				<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"><br/>
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
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="10%" align="center" nowrap id="QueryTextbookOrder.Yearth" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="QueryTextbookOrder.Season" onClick="talentsort()">����</td>
                  <td width="65%" align="center" nowrap id="QueryTextbookOrder.OrderTitle" onClick="talentsort()">����</td>
                  <td width="12%" align="center" nowrap id="QueryTextbookOrder.OrderTime" onClick="talentsort()">����ʱ��</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='querytextbookorder']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryTextbookOrder/OrderTitle"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="QueryTextbookOrder/OrderTitle"> 
                  		<html:checkbox id="resultset" name="list[@type='update']/QueryTextbookOrder/OrderTitle" property="QueryTextbookOrder/OrderTitle" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/Yearth"/>��</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/Season"/>��</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/OrderTitle"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/OrderTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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
<input type="hidden" name="title" >
<input type="hidden" name="xmlfcc">
</form>
</body>


<script>
	loadOrderImg(document.forms[0],'QueryTextbookOrder');
</script>