<%@include file="/internet/common.jsp"%>
<%
response.setContentType("application/msword;charset=gb2312");
%>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <tr><td > 
          <table width="100%"  border="0" align="center" cellpadding="0"   cellspacing="1"   >
          <%int i=0;
          	int j=0;
          	int k=0;
          	int l=0;
          
           %>
       <logic:iterate id="dateresult" property="list[@type='CenterTaskDate']">
       
  
          <tr align="center" >
            <td align="center" colspan="10">
            <bean:write id="dateresult" property="CenterTaskDate/TaskDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            星期<bean:write id="dateresult" property="CenterTaskDate/week"/></td>     
          </tr>
          <tr align="center" >
                <td width="10%">时间</td>
                <td width="10%">地点</td>
                <td width="15%">班级</td>
                <td width="15%">课程</td>
                <td width="10%">课程/任务说明</td>
                <td width="10%">任务</td>
                
              </tr><tr align="center" >
            <%i=0; %>  
          <logic:iterate id="noonresult" property="list[@type='CenterTaskNoon']" >
           <logic:equal property="CenterTaskNoon/TaskDate" propertyId="noonresult" value="CenterTaskDate/TaskDate" valueType="variable" valueId="dateresult">          
   			<% j=0;i++;if(i!=1){ %>
   			<tr  align="center" >
   			 <%} %>  
   			<td rowspan="<bean:write  property="CenterTaskNoon/RowSpan" id="noonresult"/>"><bean:write id="noonresult" property="CenterTaskNoon/TaskTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
   			<logic:iterate id="courseresult" property="list[@type='CenterTaskCourse']">
   			<logic:equal property="CenterTaskCourse/TaskDate" propertyId="courseresult" value="CenterTaskNoon/TaskDate" valueType="variable" valueId="noonresult">
   			<logic:equal property="CenterTaskCourse/TaskTime" propertyId="courseresult" value="CenterTaskNoon/TaskTime" valueType="variable" valueId="noonresult">
   			<% k=0;j++;if(j!=1){ %>
   			</tr><tr  align="center" class="td1" >
   			<%}%>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/ClassRoom" id="courseresult"/></td>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Class" id="courseresult" filter="false"/></td>
   			 <td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Course" id="courseresult"/></td>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Explain" id="courseresult"/></td>
	   		<logic:iterate id="taskresult" property="list[@type='NewTaskTask']">
	   		<logic:equal property="NewTaskTask/TaskDate" propertyId="taskresult" value="CenterTaskCourse/TaskDate" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/TaskTime" propertyId="taskresult" value="CenterTaskCourse/TaskTime" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/PlanID" propertyId="taskresult" value="CenterTaskCourse/PlanID" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/PlanType" propertyId="taskresult" value="CenterTaskCourse/PlanType" valueType="variable" valueId="courseresult">	
	   		<% k++;if(k!=1){ %>
   			</tr><tr  align="center" >
   			<%}%>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Task" id="taskresult"/></td>
   			</td>
	   		</logic:equal>
	   		</logic:equal>
	   		</logic:equal>
	   		</logic:equal>
	   		</logic:iterate>
	   		</logic:equal>
	   		</logic:equal>	
   			</logic:iterate>
   			</logic:equal>
   			</logic:iterate>
   			</logic:iterate> 			
       </table>  
       </td></tr></table>  
