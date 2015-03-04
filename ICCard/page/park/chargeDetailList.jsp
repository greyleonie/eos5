<%@include file="/internet/common.jsp"%>
<body >
<form method="post" action="ICCard.prPark.chargeDetailList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;停车管理—&gt;停车费用明细
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prPark.chargeDetailList.do">
		
		<html:hidden property="QueryBusinessLogs/_order/col1/field"/>
		<html:hidden property="QueryBusinessLogs/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<input type="hidden" name="Card/fromCardData0" />
		<input type="hidden" name="Card/fromCardData1" />
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
	   持卡人：
	    <html:text property="QueryBusinessLogs/UserName/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp; 卡编号：
	    <html:text property="QueryBusinessLogs/CardID/criteria/value" attributesText='class="input"' size="15"/>

&nbsp; 录入时间：从 <html:text property="QueryBusinessLogs/HappeningTime/criteria/min" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryBusinessLogs/HappeningTime/criteria/min"],"yyyy-MM-dd")>
	    	至 <html:text property="QueryBusinessLogs/HappeningTime/criteria/max" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryBusinessLogs/HappeningTime/criteria/max"],"yyyy-MM-dd")>
			<INPUT type="hidden" name="QueryBusinessLogs/HappeningTime/criteria/operator" value="between">
			<INPUT type="hidden" name="QueryBusinessLogs/HappeningTime/criteria/criteriaPattern" value="yyyy-MM-dd">

				</td>
	    </tr>
	  <tr>
	    <td height="30" class="text">
	    交易类型：
	    <html:select property="QueryBusinessLogs/BusinessTypeID/criteria/value" styleClass="input">
	    	<html:option value="">全部</html:option>
	    	<html:option value="9">月保卡现金充值</html:option>
	    	<html:option value="10">月保卡刷卡充值</html:option>
	    	<html:option value="11">停车现金消费</html:option>
	    	<html:option value="12">停车刷卡消费</html:option>
	    </html:select>
	   &nbsp; 
	  
<input name="B32" type="button" class="button_02" value="查 询" onclick="talentquery()">
<input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
	服务端排序：<input type="checkbox" name="checkbox" onclick="servertoorder()" marked="">	
		</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap ><input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" ></td>
            <td width="16%" align="center" nowrap id="QueryBusinessLogs.CardID" onclick="talentsort()">卡编号</td>
            <td width="16%" align="center" nowrap id="QueryBusinessLogs.UserName" onclick="talentsort()">持卡人</td>
            <td width="20%" align="center" nowrap id="QueryBusinessLogs.HappeningTime" onclick="talentsort()">收费时间</td>
            <td width="14%" align="center" nowrap id="QueryBusinessLogs.BusinessMoney" onclick="talentsort()">收费金额</td>
            <td width="14%" align="center" nowrap id="QueryBusinessLogs.userTypeID" onclick="talentsort()">卡类型</td>
            <td width="16%" align="center" nowrap id="QueryBusinessLogs.BusinessType" onclick="talentsort()">交易类型</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryBusinessLogs']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String CardID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryBusinessLogs/CardID"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("CardID", CardID);
						
			       %>
            <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
              <td nowrap align="center">
			  <html:checkbox name="list[@name='update']/BusinessLogs/BusinessLogsID" id="resultset" property="QueryBusinessLogs/BusinessLogsID" indexed="true" attributes="<%=h%>" /> </td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryBusinessLogs/CardID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryBusinessLogs/UserName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryBusinessLogs/HappeningTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryBusinessLogs/BusinessMoney" />元</td>
	            <td  nowrap align="center"><dict:write id="resultset" businTypeId="dx_userTypeID" property="QueryBusinessLogs/userTypeID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryBusinessLogs/BusinessType"/></td>
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
<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</body>
<script>
 function cancelDeposit(){
 	if(window.confirm("确定要撤消吗")){
 		var frm =document.forms[0];
 		var i=0;
	    var j=0;
		eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
					j++;
				    if(j>1){
				    	alert("只能选择一条记录");
				    	return;
				    }
				    var CardID = obj.getAttribute("CardID");
				    var id=cardcontrol.GetCardID();
				    if(id==-2)
				    	return;
				    if(CardID!=id){
				    	alert("该充值记录所属卡编号与读卡机上的卡编号不符，不可以进行操作！");
				    	return;
				    }
				    
				}
			}
			i++;
		}
		if(j==0){
			alert("请至少选择一条记录");
			return;
		}
		var errinfo="此卡还未注册或者还未使用！";
		var data2=cardcontrol.ReadData(7,2);
		if(data2.length==0){
			errinfo="此卡还未注册入党校卡库！";
			alert(errinfo);
			return;
		}else if(data2==0 || isContainChar(data2,"f",30,false)){	//2区全为0视为未注册卡，或者超过25个f字符的也视为未注册卡
			errinfo="此卡还未发行使用，请发卡后再充值！";
			alert(errinfo);
			return;
		}
		var data0=cardcontrol.ReadData(7,0);
		var data1=cardcontrol.ReadData(7,1);
		if(data0.length==0){
			alert(errinfo);
		}
		else if(data1.length==0){
			alert(errinfo);
		}else{
			frm.elements["Card/fromCardData0"].value=data0;
			frm.elements["Card/fromCardData1"].value=data1;
			fid = getChechedValue(frm);
			frm.action = frm.elements["cancelaction"].value;
			frm.action += "?fid=" + fid;
    		frm.submit();
    	}
 	}
 }

	function isContainChar(srcString,chr,len,mode){
		rtv = false;
		match = 0;
		for(i=0;i<srcString.length;i++){
			if (mode){
				if( chr==srcString.charAt(i)){
					match++;
				}
			}else{
				if(chr.toLowerCase()==srcString.charAt(i).toLowerCase()){
					match++;
				}
			}
		}
		if(match>=len){
			rtv = true;
		}
		return rtv;
	}

</script>