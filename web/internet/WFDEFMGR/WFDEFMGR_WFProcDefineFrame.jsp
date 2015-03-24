<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>
<body topmargin="10" rightmargin="0" bottommargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#FFFFFF">
	     <eos:tabframe id="test123" width="100%" height="95%" frameborder="0" scrolling="no" imgPath="/internet/WFCOMMON/images/tab">
		<eos:tabframetitle url="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDefFrame.do" type="xpath" property="process"  title="流程图" selected="true"/>	     
    		<eos:tabframetitle url="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDef.do" type="xpath" property="process"  title="流程信息"/>
	     </eos:tabframe>
</body>
<%@include file="/internet/commonTail.jsp"%>