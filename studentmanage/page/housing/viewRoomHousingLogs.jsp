<%@include file="/internet/common.jsp"%>

<body >
<form method="post" action="studentmanage.prThesis.thesisAssignDo.do">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr> 
		  <td height="24" background="/internet/image/lz_bg.gif"> 
		  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
			  <tr> 
				<td width="15"> </td>
				<td class="text_wirte">学员管理—&gt;住宿管理—&gt;<bean:write property="QueryRoom/BuildingName"/><bean:write property="QueryRoom/RoomName"/>住房记录</td>
			  </tr>
			</table></td>
		</tr>
		<tr>
		  <td height="5">
			<input type="hidden" name="queryaction" value="studentmanage.prHousing.viewRoomHousingLogs.do">
			
			
			
			<html:hidden property="PageCond/begin"/>
			<html:hidden property="PageCond/count"/>
			<html:hidden property="PageCond/length" />
			<html:hidden property="RoomID"/>
			
		  </td>
		</tr>
	  </table>
	
	
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
	  <tr>
		<td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
		  
		  
		  <tr>
		    <td valign="top" class="text">
			开始时间：<html:text property="QueryHousingLogs/BeginTime" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryHousingLogs/BeginTime"],"yyyy-MM-dd")>
	    	结束时间：<html:text property="QueryHousingLogs/EndTime" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryHousingLogs/EndTime"],"yyyy-MM-dd")> 
			<input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			
			</td>
	      </tr>
		  <tr>
		    <td valign="top" class="text">&nbsp;</td>
	      </tr>
		  <tr>
			  <td valign="top" class="text">
				<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="20%" align="center" nowrap  onClick="talentsort()">开始时间</td>
                  <td width="20%" align="center" nowrap  onClick="talentsort()">结束时间</td>
                  <td width="15%" align="center" nowrap  onClick="talentsort()">住房类型</td>
                  <td width="15%" align="center" nowrap  onClick="talentsort()">人员</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">性别</td>
                  <td width="20%" align="center" nowrap>备注</td>
                  </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='tmp']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                 <tr class="<%=trClass%>">
                  <td nowrap align="center"><bean:write id="resultset" property="entity/beginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap align="center"><bean:write id="resultset" property="entity/endTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap align="center">
						<logic:present id="resultset" property="entity/housingTypeID">
							<logic:equal id="resultset" property="entity/housingTypeID" value="2">
								校内使用
							</logic:equal>
							<logic:equal id="resultset" property="entity/housingTypeID" value="3">
								出租
							</logic:equal>
						</logic:present>
					</td>
                  <td nowrap align="center"><bean:write id="resultset" property="entity/operatorname" /></td>
                  <td nowrap align="center"><dict:write businTypeId="BNDICT_gender" property="entity/studentSex" id="resultset"/>
                  <dict:write businTypeId="BNDICT_gender" property="entity/guestSex" id="resultset"/>
                   </td>
                   <td nowrap align="center"><bean:write id="resultset" property="entity/className" /></td>
                  </tr>
				</logic:iterate>
              </table>		</td>
	   </tr>
		<tr>
			<td class="text">&nbsp;
			
			
			</td>
		</tr>
	  </table>    
	 </td>
	</tr>
	</table>
	<div align="center">
	<input name="closeW" type="button" class="button_02" value="关 闭" onClick="window.close()">
         </div>
</form>

</body>
<script language="JavaScript">

</script>