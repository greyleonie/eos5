<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prCarManage.comeOutList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������м�¼ </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prCarManage.comeOutList.do">
		<input type="hidden" name="viewaction" value="oa.prCarManage.comeOutView.do">
		<html:hidden property="QueryUseCarRequest/_order/col1/field"/>
		<html:hidden property="QueryUseCarRequest/_order/col1/asc" />
		
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
	    <td height="30" class="text">�����ˣ�
	      <html:text property="QueryUseCarRequest/operatorName/criteria/value" attributesText='class="input"' size="15"/>
	       <html:hidden property="QueryUseCarRequest/operatorName/criteria/operator" value="like"/>
	       <html:hidden property="QueryUseCarRequest/operatorName/criteria/likeRule" value="center"/>
        &nbsp;���ƺţ�
	      <html:text property="QueryUseCarRequest/CarNO/criteria/value" attributesText='class="input"' size="15"/>
	      	       <html:hidden property="QueryUseCarRequest/CarNO/criteria/operator" value="like"/>
	       <html:hidden property="QueryUseCarRequest/CarNO/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
���������
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="16%" align="center" nowrap id="QueryUseCarRequest.orgName" onClick="talentsort()">�ó�����</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.operatorName" onClick="talentsort()">������</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.Dest" onClick="talentsort()">Ŀ�ĵ�</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.Kms" onClick="talentsort()">�����(km) </td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.OutTime" onClick="talentsort()">����ʱ��</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.BackTime" onClick="talentsort()">�س�ʱ��</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.CarNO" onClick="talentsort()">���ƺ�</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.Driver" onClick="talentsort()">˾��</td>
            <td width="10%" align="center" nowrap id="QueryUseCarRequest.Senter" onClick="talentsort()">�ɳ���</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryUseCarRequest']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryUseCarRequest/RequestID"/>','true')">
	             <td align="center">
	           <html:checkbox name="list[@name='update']/QueryUseCarRequest/RequestID" id="resultset" property="QueryUseCarRequest/RequestID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryUseCarRequest/orgName"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryUseCarRequest/operatorName" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryUseCarRequest/Dest" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryUseCarRequest/Kms" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryUseCarRequest/OutTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryUseCarRequest/BackTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryUseCarRequest/CarNO" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryUseCarRequest/Driver" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryUseCarRequest/Senter" /></td>
           </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
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

</script>