<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>    

<display:pageHead bodyColor="#EEEEEE"/>

<form name="ActyInfo" action="WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef.do" method="post">

<html:hidden property="WFProcessDefine/Activity/activityId" />
<html:hidden property="processDefID" />
<html:hidden property="activityDefID" />
<html:hidden property="activityType" />
<html:hidden property="tab" />

	 <eos:tab id="test"  width="100%" height="100%" imgPath="/internet/WFCOMMON/images/tab0">
	    <eos:tabtitle>
	        <eos:titleitem selected="true">基本信息</eos:titleitem>
	        <eos:titleitem >参与者信息</eos:titleitem>
	        <eos:titleitem >时间限制</eos:titleitem>
	        <eos:titleitem >回退信息</eos:titleitem>
	        <eos:titleitem >多工作项设置</eos:titleitem>
	    </eos:tabtitle>
	    <eos:tabcontent style="tabstyle">
	    	<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityModify_Tab1.jsp"%></eos:contentitem>
	 		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityModify_Tab2.jsp"%></eos:contentitem>
	 		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityModify_Tab3.jsp"%></eos:contentitem>
	 		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityModify_Tab4.jsp"%></eos:contentitem>
	 		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityModify_Tab5.jsp"%></eos:contentitem>
	    </eos:tabcontent>
	</eos:tab>
	
</form>

<display:pageTail/>
<%@include file="/internet/commonTail.jsp"%>

<script language="JavaScript">
var
  t = '<bean:write property="tab"/>'
if (t!='')
{
showPane_test('test_<bean:write property="tab"/>');
setstyletab('test','<bean:write property="tab"/>');
}
</script>
