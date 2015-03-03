<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prCardBase.cardList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;卡库管理—&gt;卡库列表
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prCardBase.cardList.do">
		<input type="hidden" name="addaction" value="ICCard.prCardBase.cardAdd.do">
		<input type="hidden" name="modifyaction" value="ICCard.prCardBase.cardModify.do">
		<input type="hidden" name="deleteaction" value="ICCard.prCardBase.cardDelete.do">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="Card/_order/col1/field"/>
		<html:hidden property="Card/_order/col1/asc" />
		
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
	   卡号:
	    <html:text property="Card/CardID/criteria/value" attributesText='class="input"' size="8"/>
	   卡面编号:
	    <html:text property="Card/CardCoverNO/criteria/value" attributesText='class="input"' size="8"/>
卡类型:
<html:select property="Card/CardTypeID/criteria/value">
	<html:option value="">请选择</html:option>
	<html:option value="1">个性卡</html:option>
	<html:option value="2">通用卡</html:option>
</html:select>
卡状态:
<html:select property="Card/StateID/criteria/value">
	<html:option value="">请选择</html:option>
	<html:option value="1">未使用</html:option>
	<html:option value="2">使用中</html:option>
	<html:option value="3">坏卡</html:option>
	<html:option value="4">挂失</html:option>
	<html:option value="5">冻结</html:option>
</html:select>
&nbsp;服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_CARD_MANAGE_CARDBASE.DX_CARD_MANAGE_CARDBASE_ADD"/>
<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_CARD_MANAGE_CARDBASE.DX_CARD_MANAGE_CARDBASE_ADD"/>
<qx:talentButton property="del" type="button" styleClass="button_02" value="删 除" onclick="carddel()" operation="DX_CARD_MANAGE_CARDBASE.DX_CARD_MANAGE_CARDBASE_DEL"/>
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
            <td width="12%" align="center" nowrap id="Card.CardID" onClick="talentsort()">物理卡号</td>
            <td width="10%" align="center" nowrap id="Card.CardTypeID" onClick="talentsort()">卡类型</td>
            <td width="12%" align="center" nowrap id="Card.CardCoverNO" onClick="talentsort()">卡面编号</td>
            <td width="8%" align="center" nowrap id="Card.StateID" onClick="talentsort()">卡状态</td>
            <td width="12%" align="center" nowrap id="Card.RegisterTime" onClick="talentsort()">注册时间</td>
            <td width="12%" align="center" nowrap id="Card.CancelTime" onClick="talentsort()">注销时间</td>
            <td width="8%" align="center" nowrap id="Card.Cost" onClick="talentsort()">工本费</td>
            <td width="20%" align="center" nowrap id="Card.Remark" onClick="talentsort()">备注</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='Card']">
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
	          
	           <html:checkbox name="list[@name='update']/Card/CardID" id="resultset" property="Card/CardID" indexed="true" attributes="<%=h%>" /> 
	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="Card/CardID"/></td>
	            <td nowrap align="center"><dict:write  id="resultset" property="Card/CardTypeID" businTypeId="dx_cardTypeID"/></td>
	            <td nowrap align="center"><bean:write id="resultset" property="Card/CardCoverNO"/></td>
	            <td nowrap align="center"><dict:write  id="resultset" property="Card/StateID" businTypeId="dx_cardStateID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="Card/RegisterTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="Card/CancelTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="Card/Cost"/></td>
	            <td  nowrap>&nbsp;<bean:write id="resultset" property="Card/Remark"/></td>
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
 function carddel(){
 	if(window.confirm("确定要删除吗")){
 		var frm =document.forms[0];
 		var i=0;
	    var j=0;
		eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var StateID = obj.getAttribute("StateID");
				    if(StateID!=1){
				    	alert("您选中的卡中存在非新卡，不可以直接删除！");
				    	return;
				    }
				    j++;
				}
			}
			i++;
		}
		if(j==0){
			alert("请至少选择一条记录");
			return;
		}
		frm.action = frm.elements["deleteaction"].value;
    	frm.submit();
 	}
 }

</script>