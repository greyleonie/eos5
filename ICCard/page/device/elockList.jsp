<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDevice.elockList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;刷卡终端管理—&gt;电子门锁管理
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDevice.elockList.do">
		<input type="hidden" name="addaction" value="ICCard.prDevice.elockAdd.do">
		<input type="hidden" name="modifyaction" value="ICCard.prDevice.elockModify.do">
		<input type="hidden" name="deleteaction" value="ICCard.prDevice.elockDelete.do">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="QueryElock/_order/col1/field"/>
		<html:hidden property="QueryElock/_order/col1/asc" />
		<html:hidden property="QueryElock/ElockID" />
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
	    <td height="30" class="text">
	   服务器:
	    	<html:select property="QueryElock/ElockServerID/criteria/value"  > 
					<html:option  value="">---请选择---</html:option> 
					<html:options property="list[@type='ElockServer']/ElockServer/ElockServerID" labelProperty="list[@type='ElockServer']/ElockServer/IP"/> 
			</html:select>
	   楼房:
	    	<html:select property="QueryElock/BuildingName/criteria/value" onchange="toquery()" > 
					<html:option  value="">---请选择---</html:option> 
					<html:options property="list[@type='Building']/Building/BuildingName" labelProperty="list[@type='Building']/Building/BuildingName"/> 
			</html:select>
	   楼层:
	    	<html:select property="QueryElock/LayerNO/criteria/value" onchange="toquery()" >
					<option value="">---请选择---</option>
					<html:options property="list[@type='Layer']/Layer/LayerNO" labelProperty="list[@type='Layer']/Layer/LayerNO" />
			</html:select>
			<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
			<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_CARD_MANAGE_DEVICE_ELOCK.DX_CARD_MANAGE_DEVICE_ELOCK_ADD"/>
			<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_CARD_MANAGE_DEVICE_ELOCK.DX_CARD_MANAGE_DEVICE_ELOCK_ADD"/>
			<qx:talentButton property="del" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_CARD_MANAGE_DEVICE_ELOCK.DX_CARD_MANAGE_DEVICE_ELOCK_DEL"/>
			<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
			<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
		</td>
	  </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="6%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="12%" align="center" nowrap id="QueryElock.ElockID" onClick="talentsort()">门锁编号</td>
            <td width="10%" align="center" nowrap id="QueryElock.ElockServerID" onClick="talentsort()">服务器编号</td>
            <td width="10%" align="center" nowrap id="QueryElock.ReaderID" onClick="talentsort()">设备编号</td>
            <td width="10%" align="center" nowrap id="QueryElock.BuildingName" onClick="talentsort()">楼房</td>
            <td width="10%" align="center" nowrap id="QueryElock.RoomName" onClick="talentsort()">房间</td>
            <td width="20%" align="center" nowrap id="QueryElock.IP" onClick="talentsort()">服务器IP</td>
            <td width="20%" align="center" nowrap id="QueryElock.LastUpdatingTime" onClick="talentsort()">最近下传时间</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryElock']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String StateID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","Card/StateID"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("StateID", StateID);
						
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/QueryElock/ElockID" id="resultset" property="QueryElock/ElockID" indexed="true" attributes="<%=h%>" /> 
	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryElock/ElockID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryElock/ElockServerID"/></td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryElock/ReaderID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryElock/BuildingName"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryElock/RoomName"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryElock/IP"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryElock/LastUpdatingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
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
<SCRIPT type="text/javascript" language="javascript">
		function toquery(){
			var frm =document.forms[0];
			frm.action=frm.elements["queryaction"].value;
			frm.submit();
		}
</SCRIPT>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>