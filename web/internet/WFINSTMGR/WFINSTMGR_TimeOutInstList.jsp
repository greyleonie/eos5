<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
  <HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<script  language="JavaScript">
     function query(){ 
    	queryForm.submit();    	
     	   	
      }
 //    function reset(){    	
 //   }
       function previousPage(){
        document.queryForm.elements("PageCond/begin").value = parseInt(resultForm.elements("PageCond/begin").value) - parseInt(resultForm.elements("PageCond/length").value);
    	document.queryForm.submit();    
     }
     function nextPage(){
        document.queryForm.elements("PageCond/begin").value =  parseInt(resultForm.elements("PageCond/begin").value) + parseInt(resultForm.elements("PageCond/length").value);
    	document.queryForm.submit();  
     }
</script>
</HEAD>
<display:pageHead bodyColor="#EEEEEE"/>
<display:queryHead title="��ʱ����ʵ�����" />
        
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryTimeOutProcessInstance.do" name="queryForm" method="POST">
        <html:hidden   property="list[@name='procInst']"/>       
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
    <!--��ѯ������ʾ-->
  <table border="0" cellspacing="1" cellpadding="1" class="result" align="center" width="100%" >
  
  <tr> 
      <td width="10%" class="queryLabelTD" height="24">ҵ������&nbsp;</td>
      <td width="37%" class="queryFieldTD" height="24"> <html:select property="WFProcessInstView/processDefName" size="1" style="width:150px"> <option value="" selected> 
        --��ѡ��--&nbsp;&nbsp;&nbsp;</option> <html:options  labelProperty="list[name='procDef']/WFProcessDefine/processChName" property="list[name='procDef']/WFProcessDefine/processDefName"/> 
        </html:select> </td>
      <td width="10%" class="queryLabelTD" height="24">����״̬&nbsp; </td>
      <td width="45%"class="queryFieldTD" height="24"> <dict:select businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" nullOption="true"  nullLabel="--��ѡ��--"  style="width:152px"/> 
      </td>
  </tr>
    
  <tr> 
      <td width="10%" class="queryLabelTD">������&nbsp;</td>
      <td width="37%" class="queryFieldTD"> <html:text property="WFProcessInstView/creator" size="20" /> 
      </td>
      <td width="10%" class="queryLabelTD">����ʱ��&nbsp; </td>
      <td width="45%" class="queryFieldTD"> <html:text  property="WFProcessInstView/createTime[name='start']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements['8']&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
        - <html:text  property="WFProcessInstView/createTime[name='end']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[9]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
      </td>
  </tr>
    
  <tr> 
      <td width="10%" class="queryLabelTD">���̰����� </td>
      <td width="37%" class="queryFieldTD"> <html:text property="WFProcessInstView/packageName" size="20" /> 
      </td>
      <td width="10%" class="queryLabelTD">����ʱ��</td>
      <td width="45%" class="queryFieldTD"> <html:text  property="WFProcessInstView/startTime[name='start']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[11]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
        - <html:text  property="WFProcessInstView/startTime[name='end']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[12]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
      </td>
  </tr>
  
  <tr> 
      <td width="10%" class="queryLabelTD">���ȼ�&nbsp; </td>
      <td width="37%" class="queryFieldTD"> <dict:select businTypeId="WFDICT_Priority" property="WFProcessInstView/priority" nullOption="true"  nullLabel="--��ѡ��--"  style="width:152px"/> 
      </td>
      <td width="10%" class="queryLabelTD">����ʱ��&nbsp; </td>
      <td width="45%" class="queryFieldTD"> <html:text  property="WFProcessInstView/endTime[name='start']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[14]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
        - <html:text  property="WFProcessInstView/endTime[name='end']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[15]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
      </td>
  </tr> 
  
 <tr> 
    <td align="center" colspan="4">
    	<input type="button" class="button" value = "��ѯ" onclick="javascript:query();"> &nbsp;<input type="reset" class="button" value = "����"">
    </td>
  </tr>
</table>
</form>
<display:queryTail/>

<!--�б���Ϣ��ʾ-->    
  <form name="resultForm">
<display:resultHead  />   
        <html:hidden property="PageCond/begin"/>
        <html:hidden property="PageCond/length"/>
        <html:hidden property="PageCond/count"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
          <tr class="tableHeadTR">             	      
    <td width="6%" nowrap >����ID</td>           	      
    <td width="8%" nowrap >����</td>          	      
    <td width="4%" nowrap >״̬</td>           	      
    <td width="6%" nowrap>��ʱ��</td>           	      
    <td width="6%" nowrap >���ȼ�</td>      	      
    <td width="6%" nowrap >������</td>         	      
    <td width="18%" nowrap>����ʱ��</td>          
    <td width="18%" nowrap>����ʱ��</td>   
          </tr>
     <% int flag =0;%>
            <logic:iterate id="ResultSet" property="list[name='procInst']">
  <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>"> 
    <td width="6%" ><bean:write id="ResultSet" property="WFProcessInstView/processInstID"/></td>                
    <td width="8%" ><bean:write id="ResultSet" property="WFProcessInstView/processInstName"/></td>                
    <td width="4%" ><dict:write id="ResultSet" businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState"/></td>                
    <td width="6%"  ><bean:write id="ResultSet" property="WFProcessInstView/timeOutNumDesc"/></td>                
    <td width="6%"  ><dict:write id="ResultSet" businTypeId="WFDICT_Priority"  property="WFProcessInstView/priority"/></td>                
    <td width="6%"  ><bean:write id="ResultSet" property="WFProcessInstView/creator"/></td>                 
    <td width="18%"  ><bean:write id="ResultSet" property="WFProcessInstView/startTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                 
    <td width="18%"  ><bean:write id="ResultSet" property="WFProcessInstView/endTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                                   
           </tr>
            <% 	flag++;  %>
            </logic:iterate>
 
    </table>
<display:resultTail/>

<table border="0" width="100%">    
       <tr>                          
	   <td colspan="10" align="right" class="detailLabelTD">  
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