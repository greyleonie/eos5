<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prMeetingManage.meetingRoomList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议管理—&gt;会议室使用情况 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.MeetingRoomUse.do">
		
		<html:hidden property="MR_REGISTER/_order/col1/field"/>
		<html:hidden property="MR_REGISTER/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		</td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">会议室名称：
	      <html:text property="MeetingRoomUse/mrname/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="MeetingRoomUse/mrname/criteria/operator" value="like"/>
        <html:hidden property="MeetingRoomUse/mrname/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()" >

<input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
服务端排序：
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
           
            <td width="14%" align="center" nowrap id="MeetingRoomUse.mrname" onClick="talentsort()">名称</td>
            <td width="12%" align="center" nowrap id="MeetingRoomUse.MeetingName" onClick="talentsort()">会议名称</td>
            <td width="20%" align="center" nowrap id="MeetingRoomUse.operatorName" onClick="talentsort()">申请人</td>
            <td width="20%" align="center" nowrap id="MeetingRoomUse.APPLYDATE" onClick="talentsort()">申请时间</td>
            <td width="20%" align="center" nowrap id="MeetingRoomUse.STARTDATE" onClick="talentsort()">开始时间</td>
            <td width="10%" align="center" nowrap id="MeetingRoomUse.ENDDATE" onClick="talentsort()">结束时间</td>
            <td width="10%" align="center" nowrap id="MeetingRoomUse.ENDDATE" onClick="talentsort()">当前使用情况</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='meetingRoomUse']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
            <tr class="<%=trClass%>" >
	          
	             <td nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/mrname"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MeetingRoomUse/MeetingName" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MeetingRoomUse/operatorName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/APPLYDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/ENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	             <td  nowrap align="center">
	            <logic:equal propertyId="resultset" value="-1" property="MeetingRoomUse/Status">
	            已结束
	            </logic:equal>
	             <logic:equal propertyId="resultset" value="0" property="MeetingRoomUse/Status">
	            <SPAN style="color:red">正在使用</SPAN>
	            </logic:equal>
	             <logic:equal propertyId="resultset" value="1" property="MeetingRoomUse/Status">
	             未开始
	            </logic:equal>
	            </td>
	            </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>