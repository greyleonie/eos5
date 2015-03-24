<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<%@ page import="com.primeton.eos.wf.web.manager.WFManagerUtil,com.primeton.eos.wf.web.util.EOSWebUtil" %>
<%
	int num=0;
	String defID="";
	defID=EOSWebUtil.getStringInRequestDom(request,"processDefID");
//	System.out.println("defID="+defID);
	num=WFManagerUtil.instUsingOldVersion(defID);
//	System.out.println("numOfVersion="+num);
%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>instanceList</title>
</head>
<script  language="JavaScript">
  
      function previousPage(){
        document.queryForm.elements("PageCond/begin").value = parseInt(queryForm.elements("PageCond/begin").value) - parseInt(queryForm.elements("PageCond/length").value);
    	document.queryForm.submit();    
     }
     function nextPage(){
     if(parseInt(<bean:write property="PageCond/begin"/>/<bean:write property="PageCond/length"/>)!=parseInt(<bean:write property="PageCond/count"/>/<bean:write property="PageCond/length"/>))
        {
        	document.queryForm.elements("PageCond/begin").value =  parseInt(queryForm.elements("PageCond/begin").value) + parseInt(queryForm.elements("PageCond/length").value);
    		document.queryForm.submit();    
    	}else{
    		alert("这是最后一页");
    	}
     }
     
     function UpgradeProcessInstancesWithoutVersion(){  
     if(confirm("该操作将使用该流程定义的其他版本的流程实例升级到当前最新版本，确实要执行吗？")){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_UpgradeProcessInstancesWithoutVersion.do?processDefName=<bean:write  property="list/WFProcessInstView/processDefName"/>";  
     	document.queryForm.submit();
     }     
     }
     
     function UpgradeProcessInstancesWithVersion(){  
     if(confirm("该操作将使用该版本流程定义的所有流程实例升级到当前最新版本，确实要执行吗？")){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_UpgradeProcessInstancesWithVersion.do?processDefID=<bean:write  property="list/WFProcessInstView/processDefID"/>";  
     	document.queryForm.submit();
     }  
     }
      
</script>
<display:pageHead bodyColor="#EEEEEE"/>
<form name="queryForm" method="post">
<display:resultHead  title="使用该模板的流程实例列表"/>
	<html:hidden   property="processDefID"/>
	<html:hidden name="processInstID"  property="WFProcessInstView/processInstID"/>
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
    <!--列表信息显示-->	
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
    <tr class="tableHeadTR">         	      
      <td width="7%" nowrap >流程实例ID</td>    	      
      <td width="13%" nowrap >名称</td>          	      
      <td width="6%" nowrap >状态</td>          	      
      <td width="8%" nowrap>是否超时</td>       	      
      <td width="7%" nowrap >优先级</td>      	      
      <td width="8%" nowrap >创建者</td>        	      
      <td width="21%" nowrap>开始时间</td>       	      
      <td width="30%" nowrap>完成时间</td>           
   </tr>
     <% int flag =0;%>
 <logic:iterate id="ResultSet" property="list">
    <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center">             
      <td width="7%" nowrap ><bean:write id="ResultSet" property="WFProcessInstView/processInstID"/></td>    	    
      <td width="13%" nowrap ><html:hidden property="WFProcessInstView/processInstID"/> 
        <a href="WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do?WFProcessInst/processInstID=<bean:write id="ResultSet" property="WFProcessInstView/processInstID"/>"> 
        <bean:write id="ResultSet" property="WFProcessInstView/processInstName"/></a></td>       
      <td width="6%" nowrap ><dict:write id="ResultSet" businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState"/></td>                
      <td width="8%" nowrap  ><dict:write id="ResultSet" businTypeId="WFDICT_YN"          property="WFProcessInstView/isTimeOut"/></td>                
      <td width="7%" nowrap  ><dict:write id="ResultSet" businTypeId="WFDICT_Priority" property="WFProcessInstView/priority"/></td>                
      <td width="8%" nowrap  ><bean:write id="ResultSet" property="WFProcessInstView/creator"/></td>                 
      <td width="21%" nowrap  ><bean:write id="ResultSet" property="WFProcessInstView/startTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                
      <td width="30%" nowrap  ><bean:write id="ResultSet" property="WFProcessInstView/endTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                             
   </tr><% 	flag++;  %>
 </logic:iterate>
      <%for(int i=flag;i<10;i++){%>
      <tr class="<%=i%2==1?"tableContentTR":"tableContentTR"%>">      
      <td width="7%" ></td>     
      <td width="13%" ></td>                
      <td width="6%" ></td>                
      <td width="8%" ></td>                
      <td width="7%"  ></td>                
      <td width="8%"  ></td>                
      <td width="21%"  ></td>     
      <td width="30%"  ></td>         
      </tr><%}%>
      </table>     
<display:resultTail/>
  
<table border="0" width="100%" >
             <tr>
             	<td  width="50%">
	             	<logic:equal  property="WFProcessDefine/currentFlag"  value="1">
	             	<input type="button" name="u1" class="button"  style="width:80" value = "升级老版本" onclick="javascript:UpgradeProcessInstancesWithoutVersion();">
	             	
	             	<!--
	             		<a href="javascript:UpgradeProcessInstancesWithoutVersion()">[升级所有流程到该版本]</a>
	             		-->
	             	</logic:equal>
	             	<logic:equal  property="WFProcessDefine/currentFlag"  value="0">
	             	<input type="button" name="u2" class="button"  style="width:80" value = "升级" onclick="javascript:UpgradeProcessInstancesWithVersion();">
	             	
	             	<!--
	             		<a href="javascript:UpgradeProcessInstancesWithVersion()">[将该版本下的流程实例升级到最新]</a>
	             		-->
	             	</logic:equal>
             	</td>
			   	<td  width="40%">  
			   	<!--
		           <input type="button" class="button" value = "上一页" onclick="javascript:myPage.previousPage();">
		           <input type="button" class="button" value = "下一页" onclick="javascript:myPage.nextPage();">
		           -->
		           </td>
			   	<td align="right" width="10%"  class="detailFieldTD" nowrap>
		           <!--
		            <a href="javascript:myPage.previousPage();">
		            <img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
		              <a href="javascript:myPage.nextPage();">
		            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
		              第<script>document.write(myPage.current)</script>页
		            -->
		              
              <script>myPage.printPageCode(<%=flag%>)</script>
		        </td>
             </tr>
    </table>
</form>    
<display:pageTail/>
<script  language="JavaScript">
var num=<%=num%>
if (num==0) {
	if(document.queryForm.u1 != null){
		document.queryForm.u1.disabled=true;
	}else if(document.queryForm.u2 != null){
		document.queryForm.u2.disabled=true;
	}
	}

</script>

</html>
