<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prCarManage.carInfoList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆登记 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prCarManage.carInfoList.do">
		<input type="hidden" name="viewaction" value="oa.prCarManage.carInfoView.do">
		<input type="hidden" name="addaction" value="oa.prCarManage.carInfoAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prCarManage.carInfoModify.do">
		<input type="hidden" name="deleteaction" value="oa.prCarManage.carInfoDelete.do">
		<html:hidden property="CAR_CARINFO/_order/col1/field"/>
		<html:hidden property="CAR_CARINFO/_order/col1/asc" />
		
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
	      <html:text property="CAR_CARINFO/CARNO/criteria/value" attributesText='class="input"' size="15"/>
	       <html:hidden property="CAR_CARINFO/CARNO/criteria/operator" value="like"/>
	        <html:hidden property="CAR_CARINFO/CARNO/criteria/likeRule" value="center"/>
        
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_OASYS_CARD_INFO.DX_OASYS_CARD_INFO_ADD" />
<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_OASYS_CARD_INFO.DX_OASYS_CARD_INFO_MODIFY" />
<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_CARD_INFO.DX_OASYS_CARD_INFO_DEL" />

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
            <td width="16%" align="center" nowrap id="CAR_CARINFO.MANUNO" onClick="talentsort()">厂牌型号</td>
            <td width="20%" align="center" nowrap id="CAR_CARINFO.CARNO" onClick="talentsort()">车牌号</td>
            <td width="14%" align="center" nowrap id="CAR_CARINFO.DRIVER" onClick="talentsort()">驾驶员</td>
            <td width="14%" align="center" nowrap id="CAR_CARINFO.CARTYPE" onClick="talentsort()">类 型 </td>
            <td width="18%" align="center" nowrap id="CAR_CARINFO.BUYDATE" onClick="talentsort()">购买日期</td>
            <td width="14%" align="center" nowrap id="CAR_CARINFO.STATE" onClick="talentsort()">状态</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='CAR_CARINFO']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
           <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CAR_CARINFO/CarID"/>','true')">
	             <td align="center">
	          
	           <html:checkbox name="list[@name='update']/CAR_CARINFO/CarID" id="resultset" property="CAR_CARINFO/CarID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="CAR_CARINFO/MANUNO"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="CAR_CARINFO/CARNO" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="CAR_CARINFO/DRIVER" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="CAR_CARINFO/CARTYPE" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="CAR_CARINFO/BUYDATE"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><dict:write businTypeId="dx_CARSTATE" id="resultset" property="CAR_CARINFO/STATE" /></td>
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