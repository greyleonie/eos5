<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>    
<display:pageHead bodyColor="#EEEEEE"/>

   		 <eos:tab id="test"  width="100%" height="80%" imgPath="/internet/WFCOMMON/images/tab0">
    		    <eos:tabtitle>
   		        <eos:titleitem selected="true">������Ϣ</eos:titleitem>
    		        <eos:titleitem >��������Ϣ</eos:titleitem>
    		        <eos:titleitem >ʱ��������Ϣ</eos:titleitem>
    		        <eos:titleitem >������Ϣ</eos:titleitem>
    		        <eos:titleitem >�๤��������</eos:titleitem>
     		    </eos:tabtitle>
     		    <eos:tabcontent style="tabstyle">
            		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityDetail_Tab1.jsp"%></eos:contentitem>
         		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityDetail_Tab2.jsp"%> </eos:contentitem>
			<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityDetail_Tab3.jsp"%></eos:contentitem>
         		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityDetail_Tab4.jsp"%> </eos:contentitem>
         		<eos:contentitem><%@include file="WFDEFMGR_WFManualActivityDetail_Tab5.jsp"%> </eos:contentitem>
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
