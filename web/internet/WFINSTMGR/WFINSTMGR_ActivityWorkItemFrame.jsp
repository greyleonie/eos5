<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>show Activity & WorkItem tab</title>
<%
String showWhich=request.getParameter("WFActivityInst/showWhich");
    	//System.out.println("showWhich in frame is:"+showWhich);
    if(showWhich==null)
    	 showWhich="1";
%>
    </head>
	<body bgcolor="#EEEEEE">
    <html:hidden property="WFActivityInstView/activityInstID"/>
	<eos:tabframe id="aw"  width="100%"  height="90%"  frameborder="0" scrolling="auto" frameborder="0"  imgPath="/internet/WFCOMMON/images/tab0">
    		<eos:tabframetitle url="WFINSTMGR.pr_automata.WFINSTMGR_P_ShowActivityDetial.do" type="xpath" property="WFActivityInstView"  title="�ʵ����Ϣ" selected="true"/>
    		<eos:tabframetitle url="WFINSTMGR.pr_automata.WFINSTMGR_P_queryActivityInstWorkItems.do?PageCond/length=10" type="xpath" property="WFActivityInstView"   title="���������Ϣ"/>
    		<eos:tabframetitle url="WFINSTMGR.pr_automata.WFINSTMGR_P_preReassignWorkItem.do" type="xpath" property="WFActivityInstView"   title="���ɹ�����"/>
    	</eos:tabframe>
    </body>
</html>       