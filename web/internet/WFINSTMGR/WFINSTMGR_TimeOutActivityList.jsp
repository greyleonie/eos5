<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
  <HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<script  language="JavaScript">
     function query(){ 
    	queryForm.submit();    	   	   	
      }
</script>
</HEAD>
<display:pageHead bodyColor="#EEEEEE"/>
<display:queryHead title="【超时活动监控】" />
        
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryTimeOutActivityInstance.do" name="queryForm" method="POST">
        <html:hidden   property="PageCond"/>       
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
    <!--查询条件显示-->
  <table border="0" cellspacing="1" cellpadding="1" class="result" align="center" width="100%" >
  
  <tr> 
      <td width="10%" class="queryLabelTD" >活动名称</td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFWorkItemView/activityInstName" style="width:150px" /> 
      </td>
      <td width="10%" class="queryLabelTD" >活动状态 </td>
      <td width="41%" class="queryFieldTD"> <dict:select businTypeId="WFDICT_ActivityState" property="WFWorkItemView/currentState" nullOption="true"  nullLabel="--请选择--" style="width:150px"/> 
      </td>
  </tr>
    
  <tr> 
      <td width="10%" class="queryLabelTD" >活动ID</td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFWorkItemView/activityInstID" style="width:150px" /> 
      </td>
      <td width="10%" class="queryLabelTD" >创建时间</td>
      <td width="41%" class="queryFieldTD"> <html:text  property="WFWorkItemView/createTime[name='start']" size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[7]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
        - <html:text  property="WFWorkItemView/createTime[name='end']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[8]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
      </td>
  </tr>
    
  <tr> 
      <td width="10%" class="queryLabelTD" >优先级</td>
      <td width="39%" class="queryFieldTD"> <dict:select businTypeId="WFDICT_Priority" property="WFWorkItemView/priority" style="width:150px"  nullOption="true"  nullLabel="--请选择--" /> 
      </td>
      <td width="10%" class="queryLabelTD" >开始时间</td>
      <td width="41%" class="queryFieldTD"> <html:text  property="WFWorkItemView/startTime[name='start']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[10]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
        - <html:text  property="WFWorkItemView/startTime[name='end']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[11]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
      </td> 
  </tr>
  
  <tr>
      <td width="10%" class="queryLabelTD" >活动类型 </td>
      <td width="39%" class="queryFieldTD"> <dict:select businTypeId="WFDICT_ActivityType" property="WFWorkItemView/activityType" style="width:150px" nullOption="true"  nullLabel="--请选择类型--"/> 
      </td>
      <td width="10%" class="queryLabelTD" >完成时间 </td>
      <td width="41%" class="queryFieldTD"> <html:text  property="WFWorkItemView/endTime[name='start']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[13]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
        - <html:text  property="WFWorkItemView/endTime[name='end']"  size="10" /> 
        <a href="javascript:show_calendar(&quot;queryForm.elements[14]&quot;,null,null,'YYYYMMDD')"><img src="/internet/theme/style0/calendar.gif" width="37" height="19" border="0"></a> 
      </td> 
  </tr> 
  <tr>
      <td width="10%" class="queryLabelTD" >业务流程</td>
      <td width="39%" class="queryFieldTD"> <html:select property="WFWorkItemView/processDefName" size="1" style="width:150px"> <option value="" selected> 
        --请选择--&nbsp;&nbsp;&nbsp;</option> <html:options  labelProperty="list[name='procDef']/WFProcessDefine/processChName" property="list[name='procDef']/WFProcessDefine/processDefName"/> 
        </html:select> </td>
      <td width="10%" class="queryLabelTD" > </td>
      <td width="41%" class="queryFieldTD"> </td> 
  </tr> 
 <tr> 
    <td align="center" colspan="4">
<input type="submit" name="Submit" value="查询">
<input type="reset" name="Submit" value="重置">
<html:hidden name="list[name='activityInst']"/></td>
  </tr>
</table>
</form>
<display:queryTail/>

<!--列表信息显示-->  
<display:resultHead  />        
<form  name="resultForm">
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
  <tr class="tableHeadTR">             	      
    <td width="6%" nowrap >活动ID</td>           	      
    <td width="8%" nowrap >名称</td>          	      
    <td width="4%" nowrap >状态</td>         	      
    <td width="6%" nowrap>超时数</td>           	      
    <td width="6%" nowrap >优先级</td>      	      
    <td width="6%" nowrap >流程实例ID</td>          	      
    <td width="18%" nowrap>开始时间</td>        	      
    <td width="18%" nowrap>完成时间</td>        	      
  </tr>
     <% int flag =0;%>
            <logic:iterate id="ResultSet" property="list[name='activityInst']">
  <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center"> 
    <td width="6%"><bean:write id="ResultSet" property="WFWorkItemView/activityInstID"/></td>                
    <td width="8%"><bean:write id="ResultSet" property="WFWorkItemView/activityInstName"/></td>               
    <td width="4%"><dict:write id="ResultSet" businTypeId="WFDICT_WorkItemState" property="WFWorkItemView/currentState"/></td>                
    <td width="6%"><bean:write id="ResultSet" property="WFWorkItemView/timeOutNumDesc"/></td>                
    <td width="6%"><dict:write id="ResultSet" businTypeId="WFDICT_Priority" property="WFWorkItemView/priority"/></td>               
    <td width="6%"><bean:write id="ResultSet" property="WFWorkItemView/processInstID"/></td>                 
    <td width="18%"><bean:write id="ResultSet" property="WFWorkItemView/startTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                 
    <td width="18%"><bean:write id="ResultSet" property="WFWorkItemView/endTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                               
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
              第<script>document.write(myPage.current)</script>页/共<script>document.write(myPage.total)</script>页
              -->
              <script>myPage.printPageCode(<%=flag%>)</script>
           </logic:present>
         </td>
      </tr>
	  </table>
    </form>
<display:pageTail/></HTML>