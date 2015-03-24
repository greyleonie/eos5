<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
  <HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
</HEAD>
<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#FFFFFF">
<table width="100%" cellspacing="0" cellpadding="0" height="99%" border="0">
		  <tr> 
		    <td valign="top">
		      <table width="100%"  cellspacing="0" cellpadding="0">
		        <tr> 
		          <td><br>
		            <table width="100%" cellpadding="0"  cellspacing="0">
		              <tr> 
		                <td> 
		                  <table width="96%" align="center" cellpadding="0"  cellspacing="0">
		                    <tr> 
		                      <td ><!-- Page start -->
<script  language="JavaScript"> 
     function query(){ 
    	document.queryForm.elements("PageCond/begin").value="0";
//    	document.queryForm.elements("PageCond/count").value="";   
    	document.queryForm.elements("PageCond/count").value="noCount";   	
        document.queryForm.selectedActionType.value=queryForm.elements("WFAuditLog/actionType").options.selectedIndex;
    	queryForm.submit();   	
     	   	
      }
</script>
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryAuditLogList.do" name="queryForm" method="GET">    
        <html:hidden property="PageCond/begin"/>
        <html:hidden property="PageCond/length"/>
        <html:hidden property="PageCond/count"/>     
<eos:OneTab name="审计日志监控" imagePath="/internet/WFCOMMON/images/tt.gif" >	
<display:tabHead contentWidth="95%" topSpace="10" bgColor="#EEEEEE"/>
<display:queryHead  />
    <!--查询条件显示-->
  <table border="0" cellspacing="1" cellpadding="1" align="center" width="100%"  bgColor="#EEEEEE">
  
  <tr> 
      <td width="12%" class="queryLabelTD">操作类别 </td>
      <td width="32%" class="queryFieldTD"> <dict:select  businTypeId="WFDICT_AuditType" property="WFAuditLog/auditType" nullOption="true" onchange="redirect(this.options.selectedIndex)"  nullLabel="--请选择--" style="width:152px" />	
      <td width="10%" class="queryLabelTD"> 操作</td>
      <td width="39%" class="queryFieldTD"> 
        <select  name="WFAuditLog/actionType" style="width:152px" >
    <option value="">--请先确定类别--</option>
    </select>
   </td>
  </tr>
  <tr> 
      <td width="12%" class="queryLabelTD">操作员</td>
      <td width="32%" class="queryFieldTD"><html:text property="WFAuditLog/operatorID"  style="width:152px" /> 
      </td>
      <td width="10%" class="queryLabelTD"> 操作名称 </td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFAuditLog/actionName"  style="width:152px" /> 
      </td>
  </tr>
  <tr> 
      <td width="12%" class="queryLabelTD">日志编号</td>
      <td width="32%" class="queryFieldTD"> <html:text property="WFAuditLog/auditID"  style="width:152px" /> 
      <td width="10%" class="queryLabelTD"> 操作结果</td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFAuditLog/actionResult"  style="width:152px" /> 
      </td>
  </tr>
    <tr>
      <td width="12%" class="queryLabelTD"> 流程实例名称</td>
      <td width="32%" class="queryFieldTD"><html:text property="WFAuditLog/processInstName"  style="width:152px" /> 
      </td>
      <td width="10%" class="queryLabelTD"> 流程实例ID</td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFAuditLog/processInstID"  style="width:152px" /> 
      </td>
  </tr>
    <tr>
      <td width="12%" class="queryLabelTD"> 活动实例名称</td>
      <td width="32%" class="queryFieldTD"><html:text property="WFAuditLog/activityInstName"  style="width:152px" /> 
      </td>
      <td width="10%" class="queryLabelTD"> 活动实例ID</td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFAuditLog/activityInstID"  style="width:152px" /> 
      </td>
  </tr>
    <tr> 
      <td width="12%" class="queryLabelTD"> 工作项名称</td>
      <td width="32%" class="queryFieldTD"> <html:text property="WFAuditLog/workItemName"  style="width:152px" /> 
      </td>
      <td width="10%" class="queryLabelTD">工作项ID </td>
      <td width="39%" class="queryFieldTD"> <html:text property="WFAuditLog/workItemID"  style="width:152px" /> 
      </td>
  </tr>
    <tr> 
      <td width="12%" class="queryLabelTD"> 业务流程</td>
      <td width="32%" class="queryFieldTD"> <html:select property="WFAuditLog/processDefName" size="1" style="width:152px">
       <option value=""> 
        --请选择--&nbsp;&nbsp;&nbsp;</option> <html:options  labelProperty="list[name='procDef']/WFProcessDefine/processChName" property="list[name='procDef']/WFProcessDefine/processDefName"/> 
        </html:select> </td>
      <td width="10%" class="queryLabelTD">操作日期</td>
      <td width="39%" class="queryFieldTD">
       <input type="text"  name="WFAuditLog/occurDate[name='start']" value="<bean:write property="WFAuditLog/occurDate[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFAuditLog/occurDate[name='start']">
	   -  <input type="text"  name="WFAuditLog/occurDate[name='end']" value="<bean:write property="WFAuditLog/occurDate[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFAuditLog/occurDate[name='end']">
	  </td>    
  </tr>
  <tr>
    <td align="center" colspan="4">
    	<input type="button" class="button" value = "查询" onclick="javascript:query();">
        <input type="reset" class="button" value = "重置"">
      </td>
  </tr>
</table>
<html:hidden property="selectedAuditType"/>
<html:hidden property="selectedActionType"/>
<display:queryTail/>
<!--列表信息显示-->   
<table width="96%" height="46%" border="0" align="center">
  <tr>
      <td  valign="top">
<display:resultHead  />   
<!--
  		<html:hidden property="WFAuditLog"/>
        <html:hidden name="PageCond/begin"  property="PageCond/begin"/>
        <html:hidden name="PageCond/length"  property="PageCond/length"/>
        <html:hidden name="PageCond/count"  property="PageCond/count"/>
        
        <html:hidden property="WFAuditLog/auditType" /> 
		<html:hidden property="WFAuditLog/actionType"/>
		<html:hidden property="WFAuditLog/operatorID" />
		<html:hidden property="WFAuditLog/actionName"/>
		<html:hidden property="WFAuditLog/auditID"/> 
		<html:hidden property="WFAuditLog/processInstName"/>
		<html:hidden property="WFAuditLog/processInstID"/> 
		<html:hidden property="WFAuditLog/activityInstName" /> 
		<html:hidden property="WFAuditLog/activityInstID"/>
		<html:hidden property="WFAuditLog/workItemName"/>
		<html:hidden property="WFAuditLog/workItemID" /> 
		<html:hidden property="WFAuditLog/processDefName" />
		<html:hidden property="WFAuditLog/occurDate[name='start']" /> 
		<html:hidden property="WFAuditLog/occurDate[name='end']" /> 
		<html:hidden property="selectedAuditType"/>
		<html:hidden property="selectedActionType"/>
-->		        
        <script>
			var myPage = new page();
			myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
		</script>
		
		
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
  <tr class="tableHeadTR">
      <td width="7%" height="16" nowrap>日志编号</td>
      <td width="8%" height="16" nowrap>操作员ID</td>
      <td width="11%" height="16" nowrap>操作名称</td>
      <td width="8%"  nowrap>操作结果</td>
      <td width="8%" nowrap>流程实例名称</td>
      <td width="10%" nowrap>活动实例名称</td>
      <td width="16%" nowrap>发生时间</td>
  </tr>
     <% int flag =0;%>
            <logic:iterate id="ResultSet" property="list[type='auditlog']">
            
  <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center"> 
      <td nowrap > <a href="WFINSTMGR.pr_automata.WFINSTMGR_P_ShowAuditLogDetail.do?WFAuditLog/auditID=<bean:write id="ResultSet" property="WFAuditLog/auditID"/>"> <bean:write id="ResultSet" property="WFAuditLog/auditID"/></a></td>
      <td nowrap ><bean:write id="ResultSet" property="WFAuditLog/operatorID"/></td>     
			<td nowrap ><bean:write id="ResultSet" property="WFAuditLog/actionName" /></td>           
            <td nowrap ><bean:write id="ResultSet" property="WFAuditLog/actionResult"/></td>   
      <td nowrap ><bean:write id="ResultSet" property="WFAuditLog/processInstName"/></td>             
      <td nowrap ><bean:write id="ResultSet" property="WFAuditLog/activityInstName"/></td>    
      <td nowrap ><bean:write id="ResultSet" property="WFAuditLog/occurDate"  formatType='yyyy年MM月dd日' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>          
                       
  </tr>
              <% 	flag++;  %>
            </logic:iterate>
    </table>
<display:resultTail/>
<table border="0" width="100%">    
       <tr>                          
	   <td colspan="10" align="right" class="detailLabelTD">  
           <logic:present property="PageCond/begin">
              <script>myPage.printPageCode(<%=flag%>)</script>
           </logic:present>
         </td>
      </tr>
	  </table>
         </td>
      </tr>
	  </table>
		  <display:tabTail/>
</eos:OneTab>
</form>
<!-- Page end -->
			        </td>
		                    </tr>
		                  </table>
		                </td>
		              </tr>
		            </table>
		            <br>
		          </td>
		        </tr>
		      </table>
		    </td>
		  </tr>
		</table></body>
</HTML>
<script language="JavaScript">
<!--
 //  alert(document.queryForm.elements[3].options.length);
var groups=document.queryForm.elements[3].options.length ;
var group=new Array(groups) ;
for (i=0; i<groups; i++) 
group[i]=new Array() ;
group[0][0]=new Option("--请先选择操作类别--"," "); 

group[5][0]=new Option("--所有工作项操作--",""); 
group[5][1]=new Option("提交","300"); 
group[5][2]=new Option("挂起","301"); 
group[5][3]=new Option("中止","302"); 
group[5][4]=new Option("恢复","303"); 
group[5][5]=new Option("领取","305"); 
group[5][6]=new Option("退回","306"); 
group[5][7]=new Option("改派","307"); 

group[1][0]=new Option("--所有活动实例操作--",""); 
group[1][1]=new Option("提交","200"); 
group[1][2]=new Option("中止","201"); 
group[1][3]=new Option("回退","202"); 
group[1][4]=new Option("启动","203"); 
group[1][5]=new Option("取消","204"); 
group[1][6]=new Option("重起","205"); 

group[3][0]=new Option("--所有流程定义操作--",""); 
group[3][1]=new Option("创建","400"); 
group[3][2]=new Option("升级","401"); 
group[3][3]=new Option("修改","402"); 
group[3][4]=new Option("改变状态","403"); 

group[4][0]=new Option("--所有流程实例操作--",""); 
group[4][1]=new Option("创建","100"); 
group[4][2]=new Option("启动","101"); 
group[4][3]=new Option("唤醒","102"); 
group[4][4]=new Option("挂起","103"); 
group[4][5]=new Option("改变状态","104"); 
group[4][6]=new Option("中止","105"); 
group[4][7]=new Option("更换实例模板","106"); 
group[4][8]=new Option("修改相关数据","107"); 
group[4][9]=new Option("非正常取消","108"); 
group[4][10]=new Option("结束","109"); 

group[2][0]=new Option("--所有其他操作--",""); 
group[2][1]=new Option("流程超时","1001"); 
group[2][2]=new Option("流程提醒","1002"); 
group[2][3]=new Option("活动超时","1003"); 
group[2][4]=new Option("活动提醒","1004"); 
group[2][3]=new Option("设置参与者","1005"); 
group[2][4]=new Option("设置后继活动","1006"); 


if(document.queryForm.selectedAuditType.value!=""){
	redirect(document.queryForm.selectedAuditType.value);
	document.queryForm.elements['WFAuditLog/actionType'].options[document.queryForm.selectedActionType.value].selected=true;
}

function redirect(x){
    for (i=0;x>0&&i<group[x].length;i++){ 
      document.queryForm.elements['WFAuditLog/actionType'].options[i]=new Option(group[x][i].text,group[x][i].value);
    } 

  //  document.queryForm.elements['WFAuditLog/actionType'].options[0].selected=true;
      document.queryForm.selectedAuditType.value=x;
      document.queryForm.elements['WFAuditLog/actionType'].length=group[x].length;
}

//-->
</script>
