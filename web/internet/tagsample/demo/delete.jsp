<%@ include file="./head.jsp" %> 
<form action="#" method="post">
<table width="100%"><tr><td align="center" >删除客户资料</td></tr>
<tr><td>
<display:table id="test" property="list" pageUrl="delete.jsp"  styleClass="input-tb" style="border-collapse: collapse" border="1" width="100%">
    <display:column property="Customer/CustID" title="  "  type="checkbox"  styleClass="Result-tb2"/>		
    <display:column property="index" sortable="true" title="序号" styleClass="Result-tb2"/>
    <display:column property="Customer/CustName" title="用户名称"   styleClass="Result-tb2"/>
    <display:column property="Customer/phone" title="电话"   styleClass="Result-tb2"/>
    <display:column property="Customer/sex"  title="性别"   styleClass="Result-tb2"/>
    <display:column property="Customer/address"  title="地址" sortable="true" styleClass="Result-tb2" >
    </display:column>
 
</display:table>

</td></tr>
<tr><td align="center">
<input type="submit" value="删除">
</td></tr></table>
</form>