<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>JSP Page</title>
    </head>
    <body>
<%
	String id = request.getParameter("WFProcessInst/processInstID");
	
%>
		  <eos:tabframe id="ID"  width="100%" height="99%" frameborder="0" scrolling="no" imgPath="/internet/WFCOMMON/images/tab">
	    		<eos:tabframetitle url="WFINSTMGR.pr_automata.WFINSTMGR_P_preQueryProcessActivityInstTab.do" type="xpath" property="WFProcessInst"  title="����ͼ" selected="true"/>
	    		<eos:tabframetitle url="WFINSTMGR.pr_automata.WFINSTMGR_P_ShowProcessInstDetialTab.do" type="xpath" property="WFProcessInst"   title="������Ϣ"/>
	    		<eos:tabframetitle url="WFINSTMGR.pr_automata.WFINSTMGR_P_GetRelevantDataXMLTab.do" type="xpath" property="WFProcessInst"  title="�����������"/>
	      </eos:tabframe>
</body></html>