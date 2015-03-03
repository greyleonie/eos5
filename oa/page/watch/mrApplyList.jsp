<%@include file="/internet/common.jsp"%>
<%
	//权限控制
	base.util.RightParse RP = new base.util.RightParse();
	boolean duban = RP.parse("DX_OASYS_WATCH_MRAPPLY.DX_OASYS_WATCH_MRAPPLY_DB",session) ;
 
 %>
<body>
<form method="post" action="oa.prWatch.mrApplyList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;流程监控—&gt;会议申请</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prWatch.mrApplyList.do">
		
		<input type="hidden" name="deleteaction" value="oa.prMeetingManage.mrApplyDelete.do">
		<input type="hidden" name="viewaction" value="oa.prMeetingManage.mrApplyView.do">
		<html:hidden property="MR_APPLY/_order/col1/field"/>
		<html:hidden property="MR_APPLY/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				会议名称： 
			    <html:text property="MR_APPLY/MeetingName/criteria/value" attributesText='class="input"'/>
			    <html:hidden property="MR_APPLY/MeetingName/criteria/operator" value="like"/>
			    <html:hidden property="MR_APPLY/MeetingName/criteria/likeRule" value="center"/>
				&nbsp;
				申请时间：从
				<INPUT value="yyyy-MM-dd" type="hidden" name="MR_APPLY/APPLYDATE/criteria/criteriaPattern">
				<INPUT value="between" type="hidden" name="MR_APPLY/APPLYDATE/criteria/operator">
				<html:text property="MR_APPLY/APPLYDATE/criteria/min" attributesText='class="input"'  size="10"/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["MR_APPLY/APPLYDATE/criteria/min"],"yyyy-MM-dd")>
				到
				<html:text property="MR_APPLY/APPLYDATE/criteria/max" attributesText='class="input"' size="10"/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["MR_APPLY/APPLYDATE/criteria/max"],"yyyy-MM-dd")>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_WATCH_MRAPPLY.DX_OASYS_WATCH_MRAPPLY_DEL" />
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
		
		
		
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" > <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="11%" align="center"  id="MR_APPLY.UserID" onClick="talentsort()">申请人</td>
                  <td width="14%" align="center"  id="MR_APPLY.APPLYDATE" onClick="talentsort()">申请时间</td>
                  <td width="13%" align="center"  id="MR_APPLY.MeetingName" onClick="talentsort()">会议名称</td>
                  <td width="16%" align="center" >处理人员</td>
                  <td width="16%" align="center" >当前环节</td>
                  <td width="20%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='MR_APPLY']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="MR_APPLY/APPLYID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="MR_APPLY/APPLYID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/MR_APPLY/APPLYID" property="MR_APPLY/APPLYID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/UserID" formatClass="username" formatType="operatorID"/></td>
                
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/APPLYDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center" title=<bean:write id="resultset" property="MR_APPLY/MeetingName"/>><bean:write id="resultset" property="MR_APPLY/MeetingName" maxLength="30" maxLengthString=".."/>				</td>
                <td nowrap align="center">
				<fcc:toname dom="resultset" path="MR_APPLY/participant"/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="MR_APPLY/workItemName"/></td>
                <td nowrap>&nbsp;
                <%if(duban){ %>
				<logic:present id="resultset"  property="MR_APPLY/currentState">
               <logic:notEqual id="resultset"  property="MR_APPLY/currentState" value="">
                <a href="javascript:toWfSupervise('<bean:write id="resultset" property="MR_APPLY/workItemID"/>','<bean:write id="resultset" property="MR_APPLY/participant"/>')">督办</a>
				</logic:notEqual>
                </logic:present>
                <%} %>
                <a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="MR_APPLY/processInstID"/>','会议申请')">流程日志</a>				</td>
              </tr>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
			  </td>
            </tr>
			 
          </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>