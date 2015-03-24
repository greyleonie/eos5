<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>    

<display:pageHead bodyColor="#EEEEEE"/>

	 <eos:tab id="test"  width="100%" height="100%" imgPath="/internet/WFCOMMON/images/tab0">
	    <eos:tabtitle>
	        <eos:titleitem selected="true">基本信息</eos:titleitem>
	        <eos:titleitem >时间限制</eos:titleitem>
	        <eos:titleitem >回退信息</eos:titleitem>
	    </eos:tabtitle>
	    <eos:tabcontent style="tabstyle">
    		<eos:contentitem><%@include file="WFDEFMGR_WFSubflowActivityDetail_Tab1.jsp"%></eos:contentitem>
 		<eos:contentitem><%@include file="WFDEFMGR_WFSubflowActivityDetail_Tab2.jsp"%> </eos:contentitem>
 		<eos:contentitem><%@include file="WFDEFMGR_WFSubflowActivityDetail_Tab3.jsp"%> </eos:contentitem>
	    </eos:tabcontent>
	</eos:tab>

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


