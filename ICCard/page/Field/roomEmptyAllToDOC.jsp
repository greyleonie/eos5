<%@include file="/internet/common.jsp"%> 
<%
response.setContentType("application/msword;charset=gb2312");
%>

<div align="center" class="td1"><b>
			<logic:equal property="RoomTypeID" value="1">课室信息</logic:equal>
            <logic:equal property="RoomTypeID" value="2">客房信息</logic:equal>
            <logic:equal property="RoomTypeID" value="3">讨论室信息</logic:equal>
            <logic:equal property="RoomTypeID" value="4">其它场所信息</logic:equal></b></div>
<table width="98%"  border="1" align="center" cellpadding="0" cellspacing="1" >
              
				<%
		             int count=0;
		             int colPerRow =10;
			         String trClass = "result_content"; 
		  
		  		%>
		  		
		  		
		  		<logic:notEqual  property="RoomTypeID" value="4">
		  		<logic:iterate id="buildingset" property="list[@type='Building']">
		  		<%
		             count=0;
		  		%>
		  		<tr class="td1"><td colspan="10"><b><bean:write property="Building/BuildingName" id="buildingset"/></b></td></tr>
				<logic:iterate id="resultset" property="list[@type='Room']">
				<logic:equal id="resultset" property="Room/BuildingID" valueType="variable" valueId="buildingset" value="Building/BuildingID">
					<%
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td1";
					if(count%colPerRow==0){	
			       %>
			       <tr> 
			    <%}%>
                  <td  align="center" width="10%" class="<%=trClass%>"> <bean:write id="resultset" property="Room/RoomName" /> </td>
                <% 
				count++;
				//输出行尾
				if(count%colPerRow==0){%>
					</tr>
				<%} %>
				</logic:equal>
				</logic:iterate>
					<%
	      //补齐行尾
			count = count%colPerRow;
			if(count<colPerRow&&count!=0){
				for(int x=count; x<colPerRow; x++){%>
					<td class="td1">&nbsp;</td>
				<%}%>
				</tr>
				<%}%>
				</logic:iterate>
			</logic:notEqual>
			<logic:equal  property="RoomTypeID" value="4">
			<logic:iterate id="resultset" property="list[@type='Room']">
					<%
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td1";
					if(count%colPerRow==0){	
			       %>
			       <tr> 
			    <%}%>
                  <td  align="center" width="10%" class="<%=trClass%>">

                  <bean:write id="resultset" property="Room/RoomName" />
                  </td>
                <% 
				count++;
				//输出行尾
				if(count%colPerRow==0){%>
					</tr>
				<%} %>
				</logic:iterate>
					<%
	      //补齐行尾
			count = count%colPerRow;
			if(count<colPerRow&&count!=0){
				for(int x=count; x<colPerRow; x++){%>
					<td class="td1">&nbsp;</td>
				<%}%>
				</tr>
				<%}%>
			</logic:equal>
				
 </table>