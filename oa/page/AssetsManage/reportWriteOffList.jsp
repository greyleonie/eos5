<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.reportWriteOffList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ����ϱ���</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.reportWriteOffList.do">
		
			
		<html:hidden property="CAPT_WRITEOFFDETAILVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_WRITEOFFDETAILVIEW/_order/col1/asc" />
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
				<a title="�ʲ����룬�ʲ����ƣ�Ʒ�ƣ�����ͺ�,�����ˣ�����">�ؼ��֣� </a>
			   	<html:text property="CAPT_WRITEOFFDETAILVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_WRITEOFFDETAILVIEW/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA,RequestName,DepName"/>
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
		  <td width="5%" align="center">���</td>
          <td width="10%" align="center" id="CAPT_WRITEOFFDETAILVIEW.CAPTCODE" onClick="talentsort()">�ʲ�����</td>
          <td width="25%" align="center" id="CAPT_WRITEOFFDETAILVIEW.CAPTNAME" onClick="talentsort()">�ʲ�����</td>
          <td width="10%" align="center" id="CAPT_WRITEOFFDETAILVIEW.BRANDNAME" onClick="talentsort()">Ʒ��</td>
          <td width="15%" align="center" id="CAPT_WRITEOFFDETAILVIEW.SPECIA" onClick="talentsort()">����ͺ�</td>
          <td width="10%" align="center" id="CAPT_WRITEOFFDETAILVIEW.RequestName" onClick="talentsort()">������</td>
          <td width="15%" align="center" id="CAPT_WRITEOFFDETAILVIEW.DepName" onClick="talentsort()">����</td>
          <td width="10%" align="center" id="CAPT_WRITEOFFDETAILVIEW.WRITEOFFDATE" onClick="talentsort()">��������</td>
        </tr>
        
               <%
		 		
			         int count=0;
			         String trClass = "result_content"; 
			        %>
       <logic:iterate property="list[type='CAPT_WRITEOFFDETAILVIEW']" id="resultset">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
		<logic:equal property="CAPT_WRITEOFFDETAILVIEW/state" id="resultset" value="4">
           <tr class="<%=trClass%>">
			<td align="center"><%=count %> </td>
           <td>
           <bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTCODE"/>
          </td>
           <td>
           <bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/CAPTNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/BRANDNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/SPECIA"/>
           </td>
           <td align="left">
           	<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/RequestName"/>
           </td>
           <td align="left">
           	<bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/DepName"/>
           </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_WRITEOFFDETAILVIEW/WRITEOFFDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
           </td>
        </tr>   
        </logic:equal>      
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
<input type="hidden" name="title" value="�ʲ����ϱ���">
<input type="hidden" name="xmlfcc">
</form>
</body>