<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.buildingList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;<span id="printTable">楼宇信息</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prField.buildingList.do">
		<input type="hidden" name="addaction" value="ICCard.prField.buildingAdd.do?viewType=1">
		<input type="hidden" name="modifyaction" value="ICCard.prField.buildingModify.do?viewType=1">
		<input type="hidden" name="deleteaction" value="ICCard.prField.buildingDelete.do">
		<html:hidden property="Building/_order/col1/field"/>
		<html:hidden property="Building/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<input type="hidden" name="docmarked" value="1">
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
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentaddNew()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="domToDoc()">
				<input name="viewType" type="radio"  value="0" onClick="changeViewType()" >列表
				<input name="viewType" type="radio"  value="1" onClick="" checked="checked">平铺
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
              
				<%
		             int count=0;
		             int colPerRow =5;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='Building']">
					<%
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
					if(count%colPerRow==0){	
			       %>
			       <tr> 
			    <%}%>
                  <td  align="center" width="20%" class="<%=trClass%>" onmouseover='doMsg(this)' onmouseout='doHidePane()' onclick='doClick(this)' nowrap>
                  <input type='hidden' value='层&nbsp;&nbsp;数：<bean:write id="resultset" property="Building/LayerNum" /> <br/> 房间数：<bean:write id="resultset" property="Building/RoomNum"/> '/>
                  <input type='hidden' value='<bean:write id="resultset" property="Building/BuildingID" />'/>
                  <bean:write id="resultset" property="Building/BuildingName" />
                  </td>
                <% 
				count++;
				//输出行尾
				if(count%colPerRow==0){%>
					</tr>
				<%} %>
				</logic:iterate>
				<%
	      //补齐行尾
			count = count%colPerRow;
			if(count<colPerRow&&count!=0){
				for(int x=count; x<colPerRow; x++){%>
					<td class="td1">&nbsp;</td>
				<%}%>
				</tr>
				<%}%>
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
<div id="msgpane" style="display:none;position:absolute;z-index:100;font-size:9pt;border:1px inset #000000;background-color:#FAFAD2"></div>
<p><font color="#C0C0C0"><b>说明：</b></font></p>
<p><font color="#C0C0C0">单击鼠标修改</font></p>

</body>
<script>
function changeViewType() {
	window.location.href="ICCard.prField.buildingList.do";
}
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}

	function doMsg(obj){
		var msgpane = document.all.msgpane;
		var msg = obj.children[0].value;
		msgpane.innerHTML = msg;
		msgpane.style.display = "";
		msgpane.style.top = event.y+document.body.scrollTop ;
		msgpane.style.left = event.x+document.body.scrollLeft;
	}

	function doHidePane(){
		var msgpane = document.all.msgpane;
		msgpane.style.display = "none";
	}

	var gSelectedTD = null;
	function doClick(obj){
	var frm = document.forms[0];
	var id = obj.children[1].value;
	var modifyAction = frm["modifyaction"].value;
	window.location.href = modifyAction+"&fid="+id;
	}
	
	
function domToDoc(){
    	var frm =document.forms[0];
    		frm.action = "ICCard.prField.buildingAll.do";
			frm.target = "_blank";
			frm.submit();			
}
</script>