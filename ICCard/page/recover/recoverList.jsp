<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prRecover.recoverList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;�����չ���&gt;����ԭ��¼
            </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prRecover.recoverList.do">
		<html:hidden property="QueryDestroyCard/_order/col1/field"/>
		<html:hidden property="QueryDestroyCard/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<input type="hidden" name="Card/fromCardData0" />
		<input type="hidden" name="Card/fromCardData1" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	   �ֿ��ˣ�
	    <html:text property="QueryDestroyCard/UserName/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp; ����ţ�
	    <html:text property="QueryDestroyCard/CardID/criteria/value" attributesText='class="input"' size="15"/>

&nbsp; ����ʱ�䣺�� <html:text property="QueryDestroyCard/DestroyTime/criteria/min" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryDestroyCard/DestroyTime/criteria/min"],"yyyy-MM-dd")>
	    	�� <html:text property="QueryDestroyCard/DestroyTime/criteria/max" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryDestroyCard/DestroyTime/criteria/max"],"yyyy-MM-dd")>
			<INPUT type="hidden" name="QueryDestroyCard/DestroyTime/criteria/operator" value="between">
			<INPUT type="hidden" name="QueryDestroyCard/DestroyTime/criteria/criteriaPattern" value="yyyy-MM-dd">
&nbsp; 
	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="24%" align="center" nowrap id="QueryDestroyCard.CardID" onClick="talentsort()">�����</td>
            <td width="24%" align="center" nowrap id="QueryDestroyCard.UserName" onClick="talentsort()">�ֿ���</td>
            <td width="24%" align="center" nowrap id="QueryDestroyCard.DestroyTime" onClick="talentsort()">����ʱ��</td>
            <td width="24%" align="center" nowrap id="QueryDestroyCard.OperatorName" onClick="talentsort()">����Ա</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryDestroyCard']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/DestroyCard/DestroyCardID" id="resultset" property="QueryDestroyCard/DestroyCardID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryDestroyCard/CardID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryDestroyCard/UserName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryDestroyCard/DestroyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryDestroyCard/OperatorName"/></td>
            </tr>
          </logic:iterate>
        </table>
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
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
    </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</body>
<script>
 

</script>