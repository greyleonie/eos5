<%@include file="/internet/common.jsp"%> 
<%
response.setContentType("application/msword;charset=gb2312");
%>

<div align="center" class="td1"><b>¥����Ϣ</b></div>
<table width="98%"  border="1" align="center" cellpadding="0" cellspacing="1" >
              
				<%
		             int count=0;
		             int colPerRow =5;

		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='Building']">
					<%
					if(count%colPerRow==0){	
			       %>
			       <tr> 
			    <%}%>
                  <td   align="center" width="20%"  nowrap>
                  <bean:write id="resultset" property="Building/BuildingName" />
                  </td>
                <% 
				count++;
				//�����β
				if(count%colPerRow==0){%>
					</tr>
				<%} %>
				</logic:iterate>
				<%
	      //������β
			count = count%colPerRow;
			if(count<colPerRow&&count!=0){
				for(int x=count; x<colPerRow; x++){%>
					<td class="td1">&nbsp;</td>
				<%}%>
				</tr>
				<%}%>
              </table>