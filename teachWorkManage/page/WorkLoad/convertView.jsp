<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prWorkLoad.convertModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ʦ������ͳ�ơ�&gt;�����׼</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td>
	

		
		
		
	  </td>
    </tr>
  </table>
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
      <tr><td>
      			<input name="ieprint" type="button" class="button_02" value="�� ��" onClick="talentAddNew()">
      			<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
      </td></tr>
      <tr><td class="td1" align="center">��ʦ�����������׼</td></tr>
      </table>
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	  
	  <tr class="td_title"> 
                  <td width="10%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">���</td>
                  <td width="50%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">��Ŀ</td>
                  <td width="10%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">�Ƿ����</td>
                  <td width="30%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()" colspan="2">�����׼</td>
                </tr>
                <%
		             int count=0;
		             int i=0;
		             int j=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="typeresult" property="list[@type='WorkType']"> 
                
                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
              
                <td nowrap rowspan="<bean:write id="typeresult" property="WorkType/TypeNum"/>"><bean:write id="typeresult" property="WorkType/WorkType"/> </td>
                
                <logic:iterate id="convertresult" property="list[@type='WorkLoadConvert']"> 
                	<logic:equal id="convertresult" property="WorkLoadConvert/WorkType" value="WorkType/WorkType" valueType="variable" valueId="typeresult">
		                              <%i++;j++; if(i!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%>
		                <td><bean:write id="convertresult" property="WorkLoadConvert/WorkItem"/></td>
		                <td align="center"><html:checkbox property="WorkLoadConvert/IsAdopted" value='1'/> </td>
		                <td ><bean:write id="convertresult" property="WorkLoadConvert/ClassNum"/>
		                <bean:write id="convertresult" property="WorkLoadConvert/Unit"/></td></tr>
	               </logic:equal>
                </logic:iterate>
             
                </logic:iterate> 
        </table>
    </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>