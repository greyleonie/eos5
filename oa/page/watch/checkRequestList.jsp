<%@include file="/internet/common.jsp"%>
<%
	//权限控制
	base.util.RightParse RP = new base.util.RightParse();
	boolean duban = RP.parse("DX_OASYS_WATCH_CHECK.DX_OASYS_WATCH_CHECK_DB",session) ;
 
 %>
<body>
<form method="post" action="oa.prWatch.checkRequestList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;流程监控—&gt;领用支票审批</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prWatch.checkRequestList.do">
		<input type="hidden" name="deleteaction" value="oa.prFinance.checkRequestDelete.do">
		<input type="hidden" name="viewaction" value="oa.prFinance.checkRequestView.do">
		<html:hidden property="CheckRequest/_order/col1/field"/>
		<html:hidden property="CheckRequest/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				领用人： 
			    <html:text property="CheckRequest/UserName" attributesText='class="input"'/>
				&nbsp;
				领用时间：
				<INPUT value="yyyy-MM-dd" type="hidden" name="CheckRequest/ConsumDate/criteria/criteriaPattern">		
				<html:text property="CheckRequest/ConsumDate/criteria/value" attributesText='class="input"'/>
				 <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CheckRequest/ConsumDate/criteria/value"],"yyyy-MM-dd")>
				&nbsp;
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_WATCH_CHECK.DX_OASYS_WATCH_CHECK_DEL" />
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
                  <td width="11%" align="center"  id="CheckRequest.UserID" onClick="talentsort()">领用人</td>
                  <td width="14%" align="center"  id="CheckRequest.Advance" onClick="talentsort()">预支金额</td>
                  <td width="13%" align="center"  id="CheckRequest.ConsumDate" onClick="talentsort()">领用时间</td>
                  <td width="16%" align="center" >处理人员</td>
                  <td width="16%" align="center" >当前环节</td>
                  <td width="20%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CheckRequest']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CheckRequest/RequestID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CheckRequest/RequestID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CheckRequest/RequestID" property="CheckRequest/RequestID" indexed="true"/> 
                  	</logic:present>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/UserID" formatClass="username" formatType="operatorID"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/Advance"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/ConsumDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center">
				<fcc:toname dom="resultset" path="CheckRequest/participant"/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="CheckRequest/workItemName"/></td>
                <td nowrap>&nbsp;
				 <%if(duban){ %>
				<logic:present id="resultset"  property="CheckRequest/currentState">
               <logic:notEqual id="resultset"  property="CheckRequest/currentState" value="">
                <a href="javascript:toWfSupervise('<bean:write id="resultset" property="CheckRequest/workItemID"/>','<bean:write id="resultset" property="CheckRequest/participant"/>')">督办</a>
				</logic:notEqual>
                </logic:present>
                <%} %>
                <a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="CheckRequest/processInstID"/>','<bean:write id="resultset" property="CheckRequest/archiveTitle"/>')">流程日志</a>				</td>
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