<%@ include file="../head.jsp" %> 
<display:table id="test" property="list[@name='table']" pageUrl="display.jsp" styleClass="input-tb" style="border-collapse: collapse" border="1" width="100%">
    <display:column property="index" sortable="true" title="���" styleClass="Result-tb2"/>
    <display:column property="Customer/CustID" title="ѡ��2" type="checkbox" styleClass="Result-tb2" />
    <display:column property="Customer/CustName" title="����" staticUrl="a.htm" sortable="true" styleClass="Result-tb2">
        	<display:param property="Customer/CustID"/>
    </display:column>
    
    <display:column property="Customer/CustName" title="��ϸ" url="Customer/url" sortable="true" styleClass="Result-tb2">
    	<display:param property="Customer/CustID"/>
    </display:column>
    
    <display:column property="Customer/phone"  title="�绰" styleClass="Result-tb2"/>
    <display:column property="Customer/sex"  title="�Ա�" styleClass="Result-tb2"/>
   
</display:table>

<p></p>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<p><a href="./displaysource.htm">�鿴Դ����</a></p>
