<%@include file="/internet/common.jsp"%>
<body>
<form method="post"  action="oa.prwfAgent.saveAgent.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;ί�й���&gt;�鿴ί����Ϣ</td>
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
            <td width="12%" align="right" class="td2">�������ƣ� </td>
            <td colspan="3" class="td1">
            <logic:equal property="WFAgent/processDefID" value="0">
                	ȫ������
                </logic:equal>
                 <logic:notEqual property="WFAgent/processDefID" value="0">
                	<bean:write property="WFAgent/defName"/>   
                </logic:notEqual>  
           </td>
          </tr>
            <tr> 
            <td width="12%" align="right" class="td2">��ί���ˣ� </td>
            <td colspan="3" class="td1">
            <bean:write property="agent"/>           
          </td>
          </tr>
          <tr> 
            <td align="right" class="td2">����ʱ�䣺 </td>
            <td width="36%" class="td1">
             <bean:write property="WFAgent/startTime[@pattern='yyyy-MM-dd']"/>
       </td>
            <td width="12%" align="right" class="td2">����ʱ�䣺 </td>
            <td width="40%" class="td1">
          <bean:write property="WFAgent/endTime[@pattern='yyyy-MM-dd']"/>
           </td>
          </tr>
          <tr> 
            <td align="right" class="td2">ί��ԭ��</td>
            <td colspan="3" class="td1"><bean:write property="WFAgent/agentCause"/>
            </td>
          </tr>
		
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr><td align="center">         
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.go(-1)"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
</html>