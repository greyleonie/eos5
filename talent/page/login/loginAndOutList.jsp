<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.pr.loginAndOutList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;系统日志</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.pr.loginAndOutList.do">
		<input type="hidden" name="addaction" value="">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="talent.pr.loginAndoutDelete.do">
		<input type="hidden" name="viewaction" value="">
		<input type="hidden" name="modifytoSave" value="">
		<html:hidden property="QuerySysLog/_order/col1/field"/>
		<html:hidden property="QuerySysLog/_order/col1/asc" />
		
		
		
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<INPUT value="like" type="hidden" name="QuerySysLog/operatorName/criteria/operator">
		<INPUT value="center" type="hidden" name="QuerySysLog/operatorName/criteria/likeRule">
		
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
            <td height="30" class="text">
				<a id="keytitle">用户名称</a>： 
			    <html:text property="QuerySysLog/operatorName/criteria/value" attributesText='class="input"'/>&nbsp;
				登录时间:
				<html:text property="QuerySysLog/search" attributesText='class="input" readonly="fcc"' onclick="calendar(this,'yyyy-MM-dd')"/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
              <input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
              <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="14%" align="center" nowrap id="QuerySysLog.operatorName" onClick="talentsort()">用户名称</td>
                  <td width="25%" align="center" nowrap id="QuerySysLog.IP" onClick="talentsort()">所在机器IP</td>
                  <td width="27%" align="center" nowrap id="QuerySysLog.LOGINDATE" onClick="talentsort()">登录时间</td>
				  <td width="32%" align="center" nowrap id="QuerySysLog.LOGOUTDATE">退出时间</td>
                  
                  
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='syslog']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QuerySysLog/LOGID"/>','false')">  
                <td align="center"> 
					<logic:present  id="resultset" property="QuerySysLog/LOGID">
						
                  		
                  			<html:checkbox id="resultset" name="list[@name='update']/QuerySysLog/LOGID" property="QuerySysLog/LOGID" indexed="true" /> 
                  
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QuerySysLog/operatorName"/></td>
                
                  <td nowrap align="center" ><bean:write id="resultset" property="QuerySysLog/IP" /></td>
                <td align="center" nowrap ><bean:write id="resultset" property="QuerySysLog/LOGINDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
				<td align="center" nowrap ><bean:write id="resultset" property="QuerySysLog/LOGOUTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
                
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
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
	loadOrderImg(document.forms[0],'QuerySysLog');
</script>




