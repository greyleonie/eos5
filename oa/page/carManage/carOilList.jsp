<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prCarManage.carOilList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆用油记录 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prCarManage.carOilList.do">
		<input type="hidden" name="viewaction" value="oa.prCarManage.carOilView.do">
		<input type="hidden" name="addaction" value="oa.prCarManage.carOilAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prCarManage.carOilModify.do">
		<input type="hidden" name="deleteaction" value="oa.prCarManage.carOilDelete.do">
		<html:hidden property="CAR_OIL/_order/col1/field"/>
		<html:hidden property="CAR_OIL/_order/col1/asc" />
		
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
	    <td height="30" class="text">车牌号：
	      <html:text property="CAR_OIL/CARNO/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="CAR_OIL/CARNO/criteria/operator" value="like"/>
        <html:hidden property="CAR_OIL/CARNO/DriverName/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_OASYS_CARD_OIL.DX_OASYS_CARD_OIL_ADD" />
<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_OASYS_CARD_OIL.DX_OASYS_CARD_OIL_MODIFY" />
<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_CARD_OIL.DX_OASYS_CARD_OIL_DEL" />
<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">


<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
服务端排序：
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="14%" align="center" nowrap id="CAR_OIL.CARNO" onClick="talentsort()">车牌号</td>
            <td width="18%" align="center" nowrap id="CAR_OIL.USEDATE" onClick="talentsort()">日期</td>
            <td width="14%" align="center" nowrap id="CAR_OIL.USEAMOUNT" onClick="talentsort()">加油量(升)</td>
            <td width="14%" align="center" nowrap id="CAR_OIL.PRICE" onClick="talentsort()">单价(元/升) </td>
            <td width="12%" align="center" nowrap id="CAR_OIL.SUMPRICE" onClick="talentsort()">金额(元)</td>
            <td width="12%" align="center" nowrap id="CAR_OIL.OILTYPE" onClick="talentsort()">油型号</td>
            <td width="12%" align="center" nowrap id="CAR_OIL.OPERATORID" onClick="talentsort()">经办人</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='CAR_OIL']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
           <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CAR_OIL/OilID"/>','true')">
	             <td align="center">
	          
	           <html:checkbox name="list[@name='update']/CAR_OIL/OilID" id="resultset" property="CAR_OIL/OilID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="CAR_OIL/CARNO"/></td>
	            <td nowrap align="center"><bean:write id="resultset" property="CAR_OIL/USEDATE"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="CAR_OIL/USEAMOUNT" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="CAR_OIL/PRICE" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="CAR_OIL/SUMPRICE" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="CAR_OIL/OILTYPE" /></td>
                <td  nowrap align="center"><bean:write  id="resultset" property="CAR_OIL/OPERATORID" formatClass="username" formatType="operatorID"/></td>
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
<script>

</script>