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
    		alert("�������һҳ");
    	}
     }
     
     function UpgradeProcessInstancesWithoutVersion(){  
     if(confirm("�ò�����ʹ�ø����̶���������汾������ʵ����������ǰ���°汾��ȷʵҪִ����")){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_UpgradeProcessInstancesWithoutVersion.do?processDefName=<bean:write  property="list/WFProcessInstView/processDefName"/>";  
     	document.queryForm.submit();
     }     
     }
     
     function UpgradeProcessInstancesWithVersion(){  
     if(confirm("�ò�����ʹ�øð汾���̶������������ʵ����������ǰ���°汾��ȷʵҪִ����")){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_UpgradeProcessInstancesWithVersion.do?processDefID=<bean:write  property="list/WFProcessInstView/processDefID"/>";  
     	document.queryForm.submit();
     }  
     }
      
</script>
<display:pageHead bodyColor="#EEEEEE"/>
<form name="queryForm" method="post">
<display:resultHead  title="ʹ�ø�ģ�������ʵ���б�"/>
	<html:hidden   property="processDefID"/>
	<html:hidden name="processInstID"  property="WFProcessInstView/processInstID"/>
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
    <!--�б���Ϣ��ʾ-->	
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
    <tr class="tableHeadTR">         	      
      <td width="7%" nowrap >����ʵ��ID</td>    	      
      <td width="13%" nowrap >����</td>          	      
      <td width="6%" nowrap >״̬</td>          	      
      <td width="8%" nowrap>�Ƿ�ʱ</td>       	      
      <td width="7%" nowrap >���ȼ�</td>      	      
      <td width="8%" nowrap >������</td>        	      
      <td width="21%" nowrap>��ʼʱ��</td>       	      
      <td width="30%" nowrap>���ʱ��</td>           
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
      <td width="21%" nowrap  ><bean:write id="ResultSet" property="WFProcessInstView/startTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                
      <td width="30%" nowrap  ><bean:write id="ResultSet" property="WFProcessInstView/endTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                             
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
	             	<input type="button" name="u1" class="button"  style="width:80" value = "�����ϰ汾" onclick="javascript:UpgradeProcessInstancesWithoutVersion();">
	             	
	             	<!--
	             		<a href="javascript:UpgradeProcessInstancesWithoutVersion()">[�����������̵��ð汾]</a>
	             		-->
	             	</logic:equal>
	             	<logic:equal  property="WFProcessDefine/currentFlag"  value="0">
	             	<input type="button" name="u2" class="button"  style="width:80" value = "����" onclick="javascript:UpgradeProcessInstancesWithVersion();">
	             	
	             	<!--
	             		<a href="javascript:UpgradeProcessInstancesWithVersion()">[���ð汾�µ�����ʵ������������]</a>
	             		-->
	             	</logic:equal>
             	</td>
			   	<td  width="40%">  
			   	<!--
		           <input type="button" class="button" value = "��һҳ" onclick="javascript:myPage.previousPage();">
		           <input type="button" class="button" value = "��һҳ" onclick="javascript:myPage.nextPage();">
		           -->
		           </td>
			   	<td align="right" width="10%"  class="detailFieldTD" nowrap>
		           <!--
		            <a href="javascript:myPage.previousPage();">
		            <img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
		              <a href="javascript:myPage.nextPage();">
		            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
		              ��<script>document.write(myPage.current)</script>ҳ
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
