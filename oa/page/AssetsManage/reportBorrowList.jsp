<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.reportBorrowList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ����ñ���</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.reportBorrowList.do">

	
		<html:hidden property="CAPT_BORROWDETAILVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_BORROWDETAILVIEW/_order/col1/asc" />
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
				<a title="�ʲ����룬�ʲ����ƣ�Ʒ�ƣ�����ͺ�,ʹ���ˣ�ʹ�ò���">�ؼ��֣� </a>
			    	<html:text property="CAPT_BORROWDETAILVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_BORROWDETAILVIEW/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA,BORROWERNAME,DepNAME"/>


			    <input name="query" type="button" class="button_02" value="ͳ ��" onClick="talentquery()">
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
		  <td width="5%" align="center"  >���</td>
          <td width="10%" align="center" id="CAPT_BORROWDETAILVIEW.CAPTCODE" onClick="talentsort()">�ʲ�����</td>
          <td width="25%" align="center" id="CAPT_BORROWDETAILVIEW.CAPTNAME" onClick="talentsort()">�ʲ�����</td>
          <td width="10%" align="center" id="CAPT_BORROWDETAILVIEW.BRANDNAME" onClick="talentsort()">Ʒ��</td>
          <td width="8%" align="center" id="CAPT_BORROWDETAILVIEW.SPECIA" onClick="talentsort()">����ͺ�</td>
          <td width="12%" align="center" id="CAPT_BORROWDETAILVIEW.BORROWERNAME" onClick="talentsort()">ʹ����</td>
          <td width="10%" align="center" id="CAPT_BORROWDETAILVIEW.DepName" onClick="talentsort()">ʹ�ò���</td>
          <td width="10%" align="center" id="CAPT_BORROWDETAILVIEW.BORROWDATE" onClick="talentsort()">��������</td>
          <td width="10%" align="center" id="CAPT_BORROWDETAILVIEW.RETURNDATE" onClick="talentsort()">�黹����</td>
        </tr>
        
                    <%
		 		
			         int count=0;
			         String trClass = "result_content"; 
			        %>
       <logic:iterate property="list[type='CAPT_BORROWDETAILVIEW']" id="resultset">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
           <tr class="<%=trClass%>">
			<td align="center"><%=count %> </td>
           <td>
           <bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/CAPTCODE"/>
          </td>
           <td>
           <bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/CAPTNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/BRANDNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/SPECIA"/>
           </td>
           <td align="left">
           	<bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/BORROWERNAME"/>
           </td>
           <td align="left">
           	<bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/DepName"/>
           </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/BORROWDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
           </td>
           <td align="left">
           <bean:write id="resultset" property="CAPT_BORROWDETAILVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
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
<input type="hidden" name="title" value="�ʲ����ñ���">
<input type="hidden" name="xmlfcc">
</form>
</body>