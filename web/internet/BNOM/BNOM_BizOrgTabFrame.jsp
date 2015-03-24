<%@ include file="/internet/BNOM/omappbase.jsp" %> 

<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<logic:notEqual property="orgID" value="-1">
	<eos:tabframe id="bizOrg"  width="100%" height="490" frameborder="0" scrolling="auto" imgPath="/internet/WFCOMMON/images/tab">
	    <eos:tabframetitle url="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition=" property="url1" type="xpath" 	title="业务子机构信息" selected="true" />
	    <eos:tabframetitle url="BNOM.pr_automata.BNOM_P_QueryEmpsByOrg.do?QueryCondition=" type="xpath" property="url2" 	title="用户信息"/>
	    <eos:tabframetitle url="BNOM.pr_automata.BNOM_P_QuerySubEmpsByOrg.do?QueryCondition=" type="xpath" property="url3" 	title="附属用户信息"/>
	</eos:tabframe>
</logic:notEqual>

<logic:equal property="orgID" value="-1">
	<eos:tabframe id="bizOrg"  width="100%" height="490" frameborder="0" scrolling="auto" imgPath="/internet/WFCOMMON/images/tab">
    <eos:tabframetitle url="BNOM.pr_automata.BNOM_P_QueryBizOrgsList.do?QueryCondition="  property="url1" type="xpath" title="业务子机构信息" selected="true" />    
	</eos:tabframe>
</logic:equal>

</body>