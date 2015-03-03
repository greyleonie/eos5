<%@include file="/internet/common.jsp"%>
<%@page import="java.util.ArrayList,tools.util.WorkFlowData" %>
<%
 String userId=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
 String arrangeDate=base.util.TalentContext.getValue(pageContext,null,"time");
 tools.util.DeskInfo.queryWorkArrange(request,arrangeDate,userId);

 int records=0;
 ArrayList workArrangeList=(ArrayList)request.getAttribute("workArrangeList");
 if(workArrangeList!=null)records=workArrangeList.size();
 String arrangeTime=(String)request.getAttribute("arrangeDate");
 if(arrangeTime==null)arrangeTime="";
%>
<table  width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
<tr>
<td class="td2" align="center">
<a href="javascript:toLink('DX_OASYS_WORK','DX_OASYS_WORK_DAYPLAN','oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?date=<%=arrangeTime%>')"><font color="red"><%=arrangeTime%></font></a>
<a href="javascript:toLink('DX_OASYS_WORK','DX_OASYS_WORK_DAYPLAN','oa.prPersonOffice.prQueryCalendarArrange.do?year=&month=')">
工作日历</a>
</td>
</tr>

<%if(records>0){
	for(int k=0;k<records;k++){
	  tools.util.WorkArrange workArrange=(tools.util.WorkArrange)workArrangeList.get(k);

	%> 
<tr>
<td class="td1" title='工作日历内容:<%=workArrange.getTaskContent()%>'>&nbsp;<a href="javascript:toLink('DX_OASYS_WORK','DX_OASYS_WORK_DAYPLAN','oa.prPersonOffice.pr_ToView1CalendarArrange.do?DBCLK=1&DBCLICK/Schedule/ScheduleID=<%=workArrange.getId()%>')"><%=workArrange.getTaskSum()%></a></td>
</tr>
<%
	}//end for
}//end if
%>
<%if(records>2){%>
<tr>
<td align="right" class="td1"><a href="javascript:toLink('DX_OASYS_WORK','DX_OASYS_WORK_DAYPLAN','oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?date=<bean:write property="Schedule/CurTime"/>')"><font color="#723429">更多...</font></a>&nbsp;&nbsp;</td>
</tr>
<%}else if(records==0)
{
%>


<tr>
<td class="td1" align="center" height=30><font color="#BFBFB9">当前还没有日程安排!</font></td>
</tr>
<%} %>
</table>
<script>
function toLink(pid,leftID,subaction){

	window.parent.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
	
	window.parent.parent.mainFrame.location.href  = subaction;

}
</script>