<%@ include file="./head.jsp" %> 
<display:table id="test" property="list" pageUrl="select.jsp" styleClass="input-tb" style="border-collapse: collapse" border="1" width="100%">
    <display:column property="index" sortable="true" title="���"  styleClass="Result-tb2"/>
    <display:column property="Customer/CustName" title="�û�����"   styleClass="Result-tb2"/>
    <display:column property="Customer/phone" title="�绰"   styleClass="Result-tb2"/>
    <display:column property="Customer/sex"  title="�Ա�"   styleClass="Result-tb2"/>
    <display:column property="Customer/address"  title="��ַ" sortable="true"  styleClass="Result-tb2">
    </display:column>
 
</display:table>