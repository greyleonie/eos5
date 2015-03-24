<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
  <HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<script  language="JavaScript">
     function query(){ 
    	document.queryForm.elements("PageCond/begin").value="0";
    	document.queryForm.elements("PageCond/count").value="noCount";  
    	queryForm.submit();    	
     	   	
      }

</script>
</HEAD>
<display:pageHead bodyColor="#EEEEEE"/>
<display:queryHead title="【查询工作项】" />
        
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryWorkItems.do" name="queryForm" method="GET">
       
    <!--查询条件显示-->
  <table width="100%" >
  <tr> 
      <td width="10%" class="queryLabelTD">工作项名称</td>
      <td width="38%" class="queryFieldTD"> <html:text property="WFWorkItemView/workItemName"  style="width:150px"  /> 
      </td>
      <td width="12%" class="queryLabelTD">&nbsp;</td>
      <td width="42%" class="queryFieldTD"></td>
  </tr>
    
    <tr>
      <td width="10%" class="queryLabelTD">工作项ID</td>
      <td width="38%" class="queryFieldTD"> <html:text property="WFWorkItemView/workItemID" style="width:150px"  />
      </td>
      <td width="12%" class="queryLabelTD">流程实例名称</td>
      <td width="42%" class="queryFieldTD"> <html:text property="WFWorkItemView/processInstName" size="20" /></td>
  </tr> 
    <tr> 
      <td width="10%" class="queryLabelTD">参与者</td>
      <td width="38%" class="queryFieldTD"> <html:text property="WFWorkItemView/participant" style="width:150px"  /> 
      </td>
      <td width="12%" class="queryLabelTD">流程实例ID</td>
      <td width="42%" class="queryFieldTD"> <html:text property="WFWorkItemView/processInstID"  style="width:150px" /> </td>
  </tr>
 <tr> 
  <tr>
      <td width="10%" class="queryLabelTD">是否超时</td>
      <td width="38%" class="queryFieldTD"> <dict:select businTypeId="WFDICT_YN" property="WFWorkItemView/isTimeOut" nullOption="true"  style="width:150px"  nullLabel="--请选择--" />	
      </td>
      <td width="12%" class="queryLabelTD">创建时间 </td>
      <td width="42%" class="queryFieldTD">
       <input type="text"  name="WFWorkItemView/createTime[name='start']" value="<bean:write property="WFWorkItemView/createTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFWorkItemView/createTime[name='start']">
	   -  <input type="text"  name="WFWorkItemView/createTime[name='end']" value="<bean:write property="WFWorkItemView/createTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFWorkItemView/createTime[name='end']">
     </td>
  </tr>
    
  <tr class="result_content_" align="left"> 
      <td width="10%" class="queryLabelTD">工作项状态 </td>
      <td width="38%" class="queryFieldTD"> <dict:select businTypeId="WFDICT_WorkItemState" property="WFWorkItemView/currentState" nullOption="true"  style="width:150px"   nullLabel="--请选择状态--" /> 
      </td>
      <td width="12%" class="queryLabelTD">开始时间</td>
      <td width="42%" class="queryFieldTD">
       <input type="text"  name="WFWorkItemView/startTime[name='start']" value="<bean:write property="WFWorkItemView/startTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFWorkItemView/startTime[name='start']">
	   -  <input type="text"  name="WFWorkItemView/startTime[name='end']" value="<bean:write property="WFWorkItemView/startTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFWorkItemView/startTime[name='end']">
     </td>
  </tr>
  
  <tr>
      <td width="10%" class="queryLabelTD">业务流程 </td>
      <td width="38%" class="queryFieldTD">
       <html:select property="WFWorkItemView/processDefName" size="1" style="width:150px"> <option value="" selected>
        --请选择业务流程--&nbsp;&nbsp;&nbsp;</option> <html:options  labelProperty="list[name='procDef']/WFProcessDefine/processChName" property="list[name='procDef']/WFProcessDefine/processDefName"/> 
        </html:select> </td>
      <td width="12%" class="queryLabelTD">完成时间</td>
      <td width="42%" class="queryFieldTD">     
       <input type="text"  name="WFWorkItemView/endTime[name='start']" value="<bean:write property="WFWorkItemView/endTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFWorkItemView/endTime[name='start']">
	   -  <input type="text"  name="WFWorkItemView/endTime[name='end']" value="<bean:write property="WFWorkItemView/endTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFWorkItemView/endTime[name='end']">
	  </td>
  </tr>
    <td align="center" colspan="4">
    	<input type="button" class="button" value = "查询" onclick="javascript:query();">
        <input type="reset" class="button" value = "重置"">
        <html:hidden property="PageCond/begin"/>
        <html:hidden property="PageCond/length"/>
        <html:hidden property="PageCond/count"/>
  		<input type="hidden" name="list[name='procDef']" value="">
  		<input type="hidden" name="list[name='wi']" value="">
	</td>
  </tr>
</table>
</form>

<display:queryTail/>

<!--列表信息显示-->    
  <form name="resultForm" onSubmit="javascript:go();">
<display:resultHead  />   
  		<html:hidden property="WFWorkItemView"/>
        <html:hidden name="PageCond/begin"  property="PageCond/begin"/>
        <html:hidden name="PageCond/length"  property="PageCond/length"/>
        <html:hidden name="PageCond/count"  property="PageCond/count"/>
<!--        
        <html:hidden property="WFWorkItemView/workItemName" /> 
		<html:hidden property="WFWorkItemView/workItemID"/>
		<html:hidden property="WFWorkItemView/processInstName" />
		<html:hidden property="WFWorkItemView/participant"/>
		<html:hidden property="WFWorkItemView/processInstID"/> 
		<html:hidden property="WFWorkItemView/isTimeOut"/>
		<html:hidden property="WFWorkItemView/createTime[name='start']"/> 
		<html:hidden property="WFWorkItemView/createTime[name='end']" /> 
		<html:hidden property="WFWorkItemView/currentState"/>
		<html:hidden property="WFWorkItemView/startTime[name='start']"/>
		<html:hidden property="WFWorkItemView/startTime[name='end']" /> 
		<html:hidden property="WFWorkItemView/processDefName" />
		<html:hidden property="WFWorkItemView/endTime[name='start']" /> 
		<html:hidden property="WFWorkItemView/endTime[name='end']" /> 
	-->	        
        <script>
			var myPage = new page();
			myPage.init("resultForm", "PageCond/begin", "PageCond/length", "PageCond/count");
		</script>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
  <tr class="tableHeadTR"> 
    <td width="4%" nowrap >ID</td>
    <td width="8%" nowrap >名称</td>
    <td width="4%" nowrap >状态</td>
    <td width="6%" nowrap >所属流程实例</td>
    <td width="6%" nowrap>是否超时</td>
    <td width="4%" nowrap >优先级</td>
    <td width="6%" nowrap >参与者</td>
    <td width="16%" nowrap>开始时间</td>
    <td width="16%" nowrap>完成时间</td>
  </tr>
  <% int flag =0;%>
  <logic:iterate id="ResultSet" property="list[name='wi']"> 
  <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center">
    <td width="4%" nowrap ><bean:write id="ResultSet" property="WFWorkItemView/workItemID"/>

    </td>
    <td width="8%" ><a  href="WFINSTMGR.pr_automata.WFINSTMGR_P_queryWorkItemDetail.do?WFWorkItemView/workItemID=<bean:write id="ResultSet" property="WFWorkItemView/workItemID"/>" ><bean:write id="ResultSet" property="WFWorkItemView/workItemName"/></a></td>
    <td width="4%" ><dict:write id="ResultSet" businTypeId="WFDICT_WorkItemState" property="WFWorkItemView/currentState" /></td>
    <td width="6%" ><bean:write id="ResultSet" property="WFWorkItemView/processInstName"/></td>
    <td width="6%" ><dict:write id="ResultSet" businTypeId="WFDICT_YN" property="WFWorkItemView/isTimeOut" /></td>
    <td width="4%" ><dict:write id="ResultSet" businTypeId="WFDICT_Priority" property="WFWorkItemView/priority"/></td>
    <td width="6%" ><bean:write id="ResultSet" property="WFWorkItemView/participant"/></td>
    <td width="16%"><bean:write id="ResultSet" property="WFWorkItemView/startTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
    <td width="16%"><bean:write id="ResultSet" property="WFWorkItemView/endTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
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
