<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.reportInfoList.do" name="opeForm" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ���ϸ����</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.reportInfoList.do">

	
		<html:hidden property="CAPT_INFO/_order/col1/field"/>
		<html:hidden property="CAPT_INFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden name="idMap"/>

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
             <a  title="���ղ��Ų�ѯ">�ʲ��������ţ�</a>
                <html:select property="CAPT_INFO/OWNER/criteria/value" styleClass="input" onchange="select()"> 
              <html:option value="" >-��ѡ��-</html:option> <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/> 
              </html:select>
				<a title="����,�ʲ����ƣ�Ʒ��,����ͺ� ">�ؼ��֣�</a>
				<html:text property="CAPT_INFO/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_INFO/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA"/>

        
			    <input name="query" type="button" class="button_02" value="ͳ ��" onClick="talentquery()">
                <input name="add" type="button" class="button_02" value="�ʲ���" onClick="zcPrint()">
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
         <td width="8%" align="center">���</td>
         <td width="15%" align="center"  id="CAPT_BORROWDETAILVIEW.CAPTCODE" onClick="talentsort()">�ʲ�����</td>
         <td width="20%" align="center"  id="CAPT_BORROWDETAILVIEW.CAPTNAME" onClick="talentsort()">�ʲ�����</td>
         <td width="12%" align="center"  id="CAPT_BORROWDETAILVIEW.TYPENAME" onClick="talentsort()">���</td>
         <td width="13%" align="center" nowrap id="CAPT_CAPT_capitalinfo.OWNER" onClick="talentsort()">��������</td>
          <td width="8%" align="center" id="CAPT_BORROWDETAILVIEW.PRICE" onClick="talentsort()">�ʲ��۸�</td>
          <td width="13%" align="center" id="CAPT_BORROWDETAILVIEW.SPECIA" onClick="talentsort()">����ͺ�</td>
           <td width="8%" align="center" id="CAPT_BORROWDETAILVIEW.QLDATE" onClick="talentsort()">�涨ʹ������</td>
          <td width="20%" align="center" id="CAPT_BORROWDETAILVIEW.STATE" onClick="talentsort()">״̬</td>
        </tr>
        
                    <%
		 		
			         int count=0;
			         String trClass = "result_content"; 
			        %>
       <logic:iterate property="list[type='CAPT_INFO']" id="resultset">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
			       
        <tr class="<%=trClass%>">
           <td align="center"><%=count %></td>
           <td align="center">
           	<bean:write id="resultset" property="CAPT_INFO/CAPTCODE"/>
           	  <script>
           opeForm["idMap"].value += <bean:write id="resultset" property="CAPT_INFO/CAPTID"/> + ",";
           </script>
           </td>
           <td align="center">
           <bean:write id="resultset" property="CAPT_INFO/CAPTNAME"/>
          </td>
              <td align="center">
           <bean:write id="resultset" property="CAPT_INFO/TYPENAME"/>
          </td>
          <td align="center">
           <bean:write id="resultset" property="CAPT_INFO/orgName" />
           </td>
         
          <td align="center">
           <bean:write id="resultset" property="CAPT_INFO/PRICE" />
          </td>
           
          <td align="center">
           <bean:write id="resultset" property="CAPT_INFO/SPECIA"/>
           </td>
           <td align="center">
           <bean:write id="resultset" property="CAPT_INFO/QLDATE"/>
           </td>
           <td align="center">
            <logic:equal id="resultset" property="CAPT_INFO/STATE" value="1">����</logic:equal>
           	<logic:equal id="resultset" property="CAPT_INFO/STATE" value="2">����</logic:equal>
           	<logic:equal id="resultset" property="CAPT_INFO/STATE" value="3">ά��</logic:equal>
           	<logic:equal id="resultset" property="CAPT_INFO/STATE" value="4">����</logic:equal>
           </td>

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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="�ʲ���ϸ����">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'CAPT_CAPITALINFO');
</script>
<script type="text/javascript">
	function select(){
	   var frm = document.forms[0];  
		frm.action = "oa.prAssetsManage.reportInfoList.do";
		frm.submit();
	
	}
function zcPrint(){
	var frm = document.forms[0];
	if (frm["idMap"].value == "") {
		alert("û���κ��ʲ�");
		return false;
	}
	frm.action = "oa.prAssetsManage.assetsCardPrint.do";
	frm.submit();
}
</script>