<%@ include file="./head.jsp" %> 
<form action="#" method="post">
<table width="100%"><tr><td align="center" >ɾ���ͻ�����</td></tr>
<tr><td>
<display:table id="test" property="list" pageUrl="delete.jsp"  styleClass="input-tb" style="border-collapse: collapse" border="1" width="100%">
    <display:column property="Customer/CustID" title="  "  type="checkbox"  styleClass="Result-tb2"/>		
    <display:column property="index" sortable="true" title="���" styleClass="Result-tb2"/>
    <display:column property="Customer/CustName" title="�û�����"   styleClass="Result-tb2"/>
    <display:column property="Customer/phone" title="�绰"   styleClass="Result-tb2"/>
    <display:column property="Customer/sex"  title="�Ա�"   styleClass="Result-tb2"/>
    <display:column property="Customer/address"  title="��ַ" sortable="true" styleClass="Result-tb2" >
    </display:column>
 
</display:table>

</td></tr>
<tr><td align="center">
<input type="submit" value="ɾ��">
</td></tr></table>
</form>