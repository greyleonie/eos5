<%@include file="/internet/common.jsp"%>
<%
response.setContentType("application/msword;charset=gb2312");
%>



  <table width="100%"   id="listdetail"  border="1">
          <tr><td> 
          <%int i=0;
          	int j=0;
          	int k=0;
          	int l=0;
          
           %>
       <logic:iterate id="dateresult" property="list[@type='CenterTaskDate']">
       
        <table width="100%" border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td align="center" colspan="10">
            <bean:write id="dateresult" property="CenterTaskDate/TaskDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            ����<bean:write id="dateresult" property="CenterTaskDate/week"/></td>     
          </tr>
          <tr align="center" class="td2"  border="0"  cellpadding="0"   cellspacing="1">
                <td width="10%">ʱ��</td>
                <td width="10%">�ص�</td>
                <td width="10%">�༶</td>
                <td width="10%">�γ�</td>
                <td width="15%">�γ�/����˵��</td>
                <td width="10%">����</td>
                <td width="10%">������</td>
                <td width="10%">Э����</td>
                <td width="10%">��ע</td>
              </tr><tr align="center" class="td1" >
            <%i=0; %>  
          <logic:iterate id="noonresult" property="list[@type='CenterTaskNoon']">
           <logic:equal property="CenterTaskNoon/TaskDate" propertyId="noonresult" value="CenterTaskDate/TaskDate" valueType="variable" valueId="dateresult">          
   			<% j=0;i++;if(i!=1){ %>
   			<tr  align="center" class="td1" >
   			 <%} %>  
   			<td rowspan="<bean:write  property="CenterTaskNoon/RowSpan" id="noonresult"/>"><bean:write id="noonresult" property="CenterTaskNoon/TaskTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
   		
   			<logic:iterate id="courseresult" property="list[@type='CenterTaskCourse']">
   			<logic:equal property="CenterTaskCourse/TaskDate" propertyId="courseresult" value="CenterTaskNoon/TaskDate" valueType="variable" valueId="noonresult">
   			<logic:equal property="CenterTaskCourse/TaskTime" propertyId="courseresult" value="CenterTaskNoon/TaskTime" valueType="variable" valueId="noonresult">
   			<% k=0;j++;if(j!=1){ %>
   			<tr  align="center" class="td1" >
   			<%}%>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/ClassRoom" id="courseresult"/></td>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Class" id="courseresult"/></td>
   			 <td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Course" id="courseresult"/></td>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Explain" id="courseresult"/></td>
	   		
	   		<logic:iterate id="taskresult" property="list[@type='NewTaskTask']">
	   		<logic:equal property="NewTaskTask/TaskDate" propertyId="taskresult" value="CenterTaskCourse/TaskDate" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/TaskTime" propertyId="taskresult" value="CenterTaskCourse/TaskTime" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/PlanID" propertyId="taskresult" value="CenterTaskCourse/PlanID" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/PlanType" propertyId="taskresult" value="CenterTaskCourse/PlanType" valueType="variable" valueId="courseresult">	
	   		<% k++;if(k!=1){ %>
   			<tr  align="center" class="td1" >
   			<%}%>
   			
   			<td>&nbsp;<bean:write  property="NewTaskTask/Task" id="taskresult"/></td>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Director" id="taskresult"/>&nbsp;</td>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Assistant" id="taskresult"/>&nbsp;</td>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Remarks" id="taskresult"/>&nbsp;</td>
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
   			</table>
   			</logic:iterate> 			
       </td></tr></table>  