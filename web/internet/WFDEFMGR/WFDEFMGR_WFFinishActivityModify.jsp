<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>  

<display:pageHead bodyColor="#EEEEEE"/>
<form name="ActyInfo" action="WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef.do" method="post">

<html:hidden property="WFProcessDefine/Activity/activityId" />
<html:hidden property="processDefID" />
<html:hidden property="activityDefID" />
<html:hidden property="activityType" />
<html:hidden property="tab" />

   		 <eos:tab id="test"  width="100%" height="100%"  imgPath="/internet/WFCOMMON/images/tab0">
    		    <eos:tabtitle>
   		        <eos:titleitem selected="true">结束活动详细信息</eos:titleitem>
     		    </eos:tabtitle>
     		    <eos:tabcontent style="tabstyle">
            		<eos:contentitem><%@include file="WFDEFMGR_WFFinishActivityModify_Tab1.jsp"%></eos:contentitem>
       		    </eos:tabcontent>
    		</eos:tab>
    
</form>
<display:pageTail/>
　　　　　　　
<%@include file="/internet/commonTail.jsp"%>