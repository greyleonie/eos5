<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>  
<display:pageHead bodyColor="#EEEEEE"/>
	 <eos:tab id="test" width="100%" height="100%" imgPath="/internet/WFCOMMON/images/tab0">
	    <eos:tabtitle>
	        <eos:titleitem selected="true">开始活动详细信息</eos:titleitem>
	    </eos:tabtitle>
	    <eos:tabcontent style="tabstyle">
    		<eos:contentitem><%@include file="WFDEFMGR_WFStartActivityDetail_Tab1.jsp"%></eos:contentitem>
	    </eos:tabcontent>
	</eos:tab>
<display:pageTail/>
<%@include file="/internet/commonTail.jsp"%>