<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.buildingList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;<span id="printTable">楼宇信息列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prField.buildingList.do">
		<input type="hidden" name="addaction" value="ICCard.prField.buildingAdd.do?viewType=0">
		<input type="hidden" name="modifyaction" value="ICCard.prField.buildingModify.do?viewType=0">
		<input type="hidden" name="deleteaction" value="ICCard.prField.buildingDelete.do">
		<html:hidden property="Building/_order/col1/field"/>
		<html:hidden property="Building/_order/col1/asc" />
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
              楼宇名称：<html:text property="Building/BuildingName/criteria/value" attributesText='class="input" size="30"' maxlength="50"/>
              <html:hidden property="Building/BuildingName/criteria/operator" value="like"/>
              <html:hidden property="Building/BuildingName/criteria/likeRule" value="center"/>
             
                 <br/>
                 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">  
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentaddNew()">
				<input name="modify" type="button" class="button_02" value="修 改" onClick="modifyBuilding()">
				<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				<input name="viewType" type="radio"  value="0"  checked="checked">列表
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">平铺
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" > 
                  </td>
                  <td width="37%" align="center" nowrap id="Building.BuildingName" onClick="talentsort()">楼宇名称</td>
                  <td width="30%" align="center" nowrap id="Building.LayerNum" onClick="talentsort()">层数</td>
                  <td width="30%" align="center" nowrap id="Building.RoomNum" onClick="talentsort()">房间总数</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='Building']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td align="center">
				  <logic:present  id="resultset" property="Building/BuildingID">
				  	<html:checkbox id="resultset" name="list[@name='update']/Building/BuildingID" property="Building/BuildingID" indexed="true"/>
				  </logic:present>
				  </td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Building/BuildingName" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Building/LayerNum" /></td>
                  <td  align="center" nowrap><bean:write id="resultset" property="Building/RoomNum" /></td>
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
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
function changeViewType() {
	window.location.href="ICCard.prField.buildingAll.do";
}


//修改
function modifyBuilding() {
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
    	}
		if(chechedCount(frm)==1){
			id = getChechedValue(frm);
    		frm.action = frm.elements["modifyaction"].value;
    		frm.action += "&fid=" + id;
			frm.submit();		
    	}
		

}
</script>
<script>
	loadOrderImg(document.forms[0],'Building');
</script>