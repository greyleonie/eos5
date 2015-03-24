<%@ include file="/internet/WFCOMMON/wfappbase.jsp"%>

<display:pageHead bodyColor="#EEEEEE" />


<workflow:ShowGraphPanel processInstID="@processInstID"  iframeWidth="100%" iframeHeight="285" url="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryActivityInstances.do" target="activityList" xpath="WFActivityInstView" showUrl="true"/>


<html:hidden property="processInstID" />
<display:pageTail />
<%@include file="/internet/commonTail.jsp"%>
