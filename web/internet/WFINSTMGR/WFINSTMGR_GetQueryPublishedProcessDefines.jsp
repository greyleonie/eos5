<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
  <HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
</HEAD>
<script  language="JavaScript">
	function checkRadioBox(radioBoxObj){
		if(radioBoxObj != null && radioBoxObj.length == null){
			if(radioBoxObj.checked)
				return true;
		}
		for(i=0;radioBoxObj != null && i<radioBoxObj.length;i++){
			if(radioBoxObj[i].checked){
				return true;
			}
		}
		return false;
	}
     function doActionChangeProcessDefine(){ 
     	if(!checkRadioBox(document.queryForm.processDefID)){
     		alert("��ѡ�����̶��壡");
     		return;
     	}
     	document.queryForm.elements("PageCond/begin").value="0";
    	document.queryForm.elements("PageCond/count").value="noCount";  
    	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ChangeProcessDefine.do?";
    	queryForm.submit();  
    	//alert("submit");
      }
  
      function previousPage(){
        document.queryForm.elements("PageCond/begin").value = parseInt(queryForm.elements("PageCond/begin").value) - parseInt(queryForm.elements("PageCond/length").value);
    	document.queryForm.submit();    
     }
     function nextPage(){
        document.queryForm.elements("PageCond/begin").value =  parseInt(queryForm.elements("PageCond/begin").value) + parseInt(queryForm.elements("PageCond/length").value);
    	document.queryForm.submit();    
     }   
     
</script>
<display:pageHead bodyColor="#EEEEEE"/>
<display:queryHead title="����ѡ��һ�����̶��塿" />

<!--�б���Ϣ��ʾ-->    
  <form name="queryForm" method="GET">
<display:resultHead  />   
        <html:hidden property="PageCond/begin"/>
        <html:hidden property="PageCond/length"/>
        <html:hidden property="PageCond/count"/>
        <html:hidden property="WFProcessInstView/processInstID"/>
        <html:hidden property="WFProcessInstView/processDefID"/>
        
        <html:hidden property="WFProcessInstView/isTimeOut"/>
        <html:hidden  property="WFProcessInstView/processInstName"/>
        <html:hidden  property="WFProcessInstView/timeOutNumDesc"/>
        <html:hidden  property="WFProcessInstView/creator"/>
        <html:hidden property="WFProcessInstView/currentState"/>
        <html:hidden  property="WFProcessInstView/priority"/>
        <html:hidden  property="WFProcessInstView/parentProcID"/>
        <html:hidden  property="WFProcessInstView/createTim"/>
        <html:hidden  property="WFProcessInstView/packageName"/>
        <html:hidden  property="WFProcessInstView/startTime"/>
        <html:hidden  property="WFProcessInstView/processChName"/>
        <html:hidden  property="WFProcessInstView/endTime"/>
        <html:hidden  property="WFProcessInstView/processInstDesc"/>
  <script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
  <tr class="tableHeadTR"> 
      <td width="16%"  nowrap>���̶���ID</td>
      <td width="16%"  nowrap>����</td>
      <td width="8%"  nowrap>״̬</td>
      <td width="8%" nowrap>�汾��</td>
      <td width="12%" nowrap>����ʱ��</td>
      <td width="12%"  nowrap>�޸�ʱ��</td>
      <td width="10%"  nowrap>����</td>
      <td width="18%" nowrap>������</td>
  </tr>
     <% int flag=0;%>
     <logic:iterate id="ResultSet" property="list">
     <logic:notEqual  id="ResultSet" property="WFProcessDefine/processDefID" value="WFProcessInstView/processDefID" valueType="variable">
  <tr class="<%=((flag%2)==1)?"tableContentTR":"tableContentTR"%>" align="center"> 
      <td  >
      <input type="radio" name="processDefID" value="<bean:write id="ResultSet" property="WFProcessDefine/processDefID"/>"> 
      <bean:write id="ResultSet" property="WFProcessDefine/processDefID"/></td>
	  <td  ><bean:write id="ResultSet" property="WFProcessDefine/processDefName"/></td>                
      <td  ><bean:write id="ResultSet" property="WFProcessDefine/currentState"/></td>                
      <td  ><bean:write id="ResultSet" property="WFProcessDefine/versionSign"/></td>
      <td  ><bean:write id="ResultSet" property="WFProcessDefine/createTime"  formatType='yyyy��MM��dd��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>	  </td>
      <td  ><bean:write id="ResultSet" property="WFProcessDefine/updateTime"  formatType='yyyy��MM��dd��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>	  </td>                              
      <td  ><bean:write id="ResultSet" property="WFProcessDefine/packageName"/></td>                 
      <td > <bean:write id="ResultSet" property="WFProcessDefine/operator"/></td>                          
  </tr>
              <% 	flag++;  %>
   	</logic:notEqual>   
     </logic:iterate>
    </table>
<display:resultTail/>

<table border="0" width="100%">    
       <tr align="center">            
	   <td colspan="10" align="center" class="detailLabelTD">  
<input type="button" name="Submit3" value="����ģ��" onClick="doActionChangeProcessDefine();">
<input type="button" name="Submit3" value="����" onClick="javascript:history.go(-1);">
           <logic:present property="PageCond/begin">
           <!--
            <a href="javascript:myPage.previousPage();"><img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
              <a href="javascript:myPage.nextPage();">
            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
              ��<script>document.write(myPage.current)</script>ҳ/��<script>document.write(myPage.total)</script>ҳ
              -->
              <script>myPage.printPageCode(<%=flag%>)</script>
           </logic:present>
         </td>
      </tr>
	  </table>
    </form>
<display:pageTail/></HTML>
