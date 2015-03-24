<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>    
<display:pageHead bodyColor="#EEEEEE"/>

<form name="ProcInfo" action="WFDEFMGR.pr_automata.WFDEFMGR_P_SaveProcDef.do" method="post">

<html:hidden property="WFProcessDefine/processDefID" />
<html:hidden property="processDefID" />
<html:hidden property="tab" />

   		 <eos:tab id="test"  width="100%" height="100%" imgPath="/internet/WFCOMMON/images/tab0">
    		    <eos:tabtitle>
   		        	<eos:titleitem selected="true">基本信息</eos:titleitem>
    		     	<eos:titleitem>时间限制</eos:titleitem>
					<eos:titleitem>流程启动者</eos:titleitem>
     		    </eos:tabtitle>
     		    <eos:tabcontent style="tabstyle">
            		<eos:contentitem><%@include file="WFDEFMGR_WFProcessDefineModify_Tab1.jsp"%></eos:contentitem>
         			<eos:contentitem><%@include file="WFDEFMGR_WFProcessDefineModify_Tab2.jsp"%></eos:contentitem>
					<eos:contentitem><%@include file="WFDEFMGR_WFProcessDefineModify_Tab3.jsp"%></eos:contentitem>
       		    </eos:tabcontent>
    		</eos:tab>

</form>
<display:pageTail/>

<script language="JavaScript">
var
  t = '<bean:write property="tab"/>'
if (t!='')
{
showPane_test('test_<bean:write property="tab"/>');
setstyletab('test','<bean:write property="tab"/>');
}

</script>    

<%@include file="/internet/commonTail.jsp"%>    
