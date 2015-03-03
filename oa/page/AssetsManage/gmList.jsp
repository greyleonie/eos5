<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/autoSelect3.js" ></SCRIPT>
<body>
<form method="post" action="oa.prAssetsManage.gmList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产信息列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.gmView.do">
	
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/field"/>
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<!--传递给选择用品层的参数-->
		<html:hidden property="detailName"/>
		<html:hidden property="index"/>
		<html:hidden property="goodIDs" />
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
				<a title="编码,资产名称，品牌,规格型号 ">关键字：</a>
				<html:text property="CAPT_CAPITALINFO/searchText" attributesText='class="input" size="30"' onclick="selectGood(this,0)"  onkeyup="selectGood(this,0)" onblur="f_OnBlur()"/>
				<html:hidden property="CAPT_CAPITALINFO/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA"/>
 				 入账日期：从
            	<html:text property="CAPT_CAPITALINFO/HQDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/HQDATE/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="CAPT_CAPITALINFO/HQDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/HQDATE/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="CAPT_CAPITALINFO/HQDATE/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="CAPT_CAPITALINFO/HQDATE/criteria/operator" value="between"/>
				<br/>  
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">

              	<input name="delete" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                 <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.CAPTCODE" onClick="talentsort()">编码</td>
          <td width="27%" align="center" nowrap id="CAPT_CAPITALINFO.CAPTNAME" onClick="talentsort()">资产名称</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.BRANDNAME" onClick="talentsort()">品牌</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.SPECIA" onClick="talentsort()">规格型号</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.HQDATE" onClick="talentsort()">入账日期</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.PRICE" onClick="talentsort()">购买价格(元)</td>
          <td width="10%"  align="center" nowrap id="CAPT_CAPITALINFO.STATE" onClick="talentsort()">状态</td>
          <td width="10%"   align="center" nowrap id="CAPT_CAPITALINFO.REMARK" onClick="talentsort()">备注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CAPT_CAPITALINFO']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CAPT_CAPITALINFO/CAPTID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CAPT_CAPITALINFO/CAPTID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_CAPITALINFO/CAPTID" property="CAPT_CAPITALINFO/CAPTID" indexed="true"/> 
                  	</logic:present> 
				</td>
               <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/CAPTCODE"/></td>
		  	   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/CAPTNAME" maxLength="15" /></td>
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/BRANDNAME" maxLength="8"/></td>
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/SPECIA" maxLength="8"/></td>
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>	
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/PRICE"  language="zh" country="CN"/></td>
			   <td nowrap="nowrap">
			   
					<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="1">
					    空闲
					</logic:equal>
				 	<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="2">
					    使用中
					</logic:equal>
					<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="3">
					   维修
					</logic:equal>
					<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="4">
					   报废
					</logic:equal>				
					</td>
					<td  nowrap="nowrap">
					<a title="<bean:write id="resultset" property="CAPT_CAPITALINFO/REMARK"/>"><bean:write id="resultset" property="CAPT_CAPITALINFO/REMARK" maxLength="15"/></a>
					</td>
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
<input type="hidden" name="title" value="资产信息列表">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script> 

function getGoodIDs() {  //得到已加入的物品
	var goodIDs = document.all['goodID'];
	var goodIDArray = new Array();
	if(goodIDs != null) {
		
		if(typeof(goodIDs.length) == "undefined") {
			return document.all['goodID'].value;
		} else {
			for(var i=0 ;i< goodIDs.length ; i++) {
				if(goodIDs[i].value != ""){
					goodIDArray[i] = goodIDs[i].value;
				}
			}
		}
	}
	return goodIDArray.join();
}

   function selectGood(obj,index) {  //选择物品
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "COMM_PURCHASEDETAIL";
	frm["index"].value = index;
	frm["goodIDs"].value = goodIDs;
	f_InitDivData(obj); //此函数在autoSelect文件中
	
	
}
	loadOrderImg(document.forms[0],'CAPT_CAPITALINFO');
</script>