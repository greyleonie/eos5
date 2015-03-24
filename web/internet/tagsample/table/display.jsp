<%@ include file="../head.jsp" %> 
<display:table id="test" property="list[@name='table']" pageUrl="display.jsp" styleClass="input-tb" style="border-collapse: collapse" border="1" width="100%">
    <display:column property="index" sortable="true" title="序号" styleClass="Result-tb2"/>
    <display:column property="Customer/CustID" title="选项2" type="checkbox" styleClass="Result-tb2" />
    <display:column property="Customer/CustName" title="名称" staticUrl="a.htm" sortable="true" styleClass="Result-tb2">
        	<display:param property="Customer/CustID"/>
    </display:column>
    
    <display:column property="Customer/CustName" title="明细" url="Customer/url" sortable="true" styleClass="Result-tb2">
    	<display:param property="Customer/CustID"/>
    </display:column>
    
    <display:column property="Customer/phone"  title="电话" styleClass="Result-tb2"/>
    <display:column property="Customer/sex"  title="性别" styleClass="Result-tb2"/>
   
</display:table>

<p></p>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<p><a href="./displaysource.htm">查看源代码</a></p>
