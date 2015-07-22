<%@include file="/internet/common.jsp"%>
<%
	//权限控制
	base.util.RightParse RP = new base.util.RightParse();
	boolean thaw = RP.parse("DX_CARD_MANAGE_ISSUECARD_ROOM.DX_CARD_MANAGE_ISSUECARD_ROOM_THAW",session) ;
 	boolean congeal = RP.parse("DX_CARD_MANAGE_ISSUECARD_ROOM.DX_CARD_MANAGE_ISSUECARD_ROOM_CONGEAL",session) ;
 
 %>
<body>
<form method="post" action="ICCard.prIssueCard.roomManagerList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;发卡管理—&gt;总管卡管理              </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prIssueCard.roomManagerList.do">
		<input type="hidden" name="addaction" value="ICCard.prIssueCard.roomManagerAdd.do">
		<input type="hidden" name="modifyaction" value="ICCard.prIssueCard.roomManagerModify.do">
		<input type="hidden" name="deleteaction" value="ICCard.prIssueCard.roomManagerDelete.do">
		<input type="hidden" name="thawaction" value="ICCard.prIssueCard.thawCard.do">
		<input type="hidden" name="congealaction" value="ICCard.prIssueCard.congealCard.do">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="QueryRoomManager/_order/col1/field"/>
		<html:hidden property="QueryRoomManager/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		</td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	   卡类别：
<html:select property="QueryRoomManager/type"  > 
			<html:option  value="-1">请选择</html:option> 
			<html:option value="1">楼层卡</html:option>
			<html:option value="2">总管卡</html:option>
</html:select>
受权楼房：
<html:select property="QueryRoomManager/BuildingID/criteria/value"  > 
			<html:option  value="-1">--请选择--</html:option> 
			<html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
		</html:select>


&nbsp; 
	  
<input name="B32" type="button" class="button_02" value="查 询" onclick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_CARD_MANAGE_ISSUECARD_ROOM.DX_CARD_MANAGE_ISSUECARD_ROOM_ADD"/>
<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_CARD_MANAGE_ISSUECARD_ROOM.DX_CARD_MANAGE_ISSUECARD_ROOM_MODIFY"/>
<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_CARD_MANAGE_ISSUECARD_ROOM.DX_CARD_MANAGE_ISSUECARD_ROOM_DEL"/>
<input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onclick="servertoorder()" marked=""></td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">
            </td>
            <td width="12%" align="center" nowrap id="QueryRoomManager.operatorname" onclick="talentsort()">管理卡编号</td>
            <td width="10%" align="center" nowrap id="QueryRoomManager.orgName" onclick="talentsort()">卡类型</td>
            <td width="10%" align="center" nowrap id="QueryRoomManager.TeacherType" onclick="talentsort()">受权楼房</td>
            <td width="10%" align="center" nowrap id="QueryRoomManager.DutyTechnicalPost" onclick="talentsort()">受权楼层</td>
            <td width="12%" align="center" nowrap id="QueryRoomManager.IsRetire" onclick="talentsort()">发卡时间</td>
            <td width="12%" align="center" nowrap id="QueryRoomManager.EndTime" onclick="talentsort()">失效时间</td>
            <td width="10%" align="center" nowrap id="QueryRoomManager.StateID" onclick="talentsort()">持卡人</td>
            <td width="10%" align="center" nowrap id="QueryRoomManager.StateID" onclick="talentsort()">卡状态</td>
            <td width="10%" align="center" nowrap onclick="talentsort()">操作</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryRoomManager']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
           <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
             <td align="center"><html:checkbox id="resultset" name="list[@name='update']/RoomManager/RoomManagerID" property="QueryRoomManager/RoomManagerID" indexed="true"/>
             </td>
             <td nowrap align="center"><bean:write id="resultset" property="QueryRoomManager/CardCoverNO"/></td>
	            <td nowrap align="center">
	            	<logic:greaterThan id="resultset" property="QueryRoomManager/LayerNO" value="0">
						楼层卡
					</logic:greaterThan>
					<logic:lessEqual id="resultset" property="QueryRoomManager/LayerNO" value="0">
						楼房总管卡
					</logic:lessEqual>
	            </td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryRoomManager/BuildingName"/></td>
	            <td nowrap align="center">
	            <logic:greaterThan id="resultset" property="QueryRoomManager/LayerNO" value="0">
						 <bean:write  id="resultset" property="QueryRoomManager/LayerNO" />层
					</logic:greaterThan>
					<logic:lessEqual id="resultset" property="QueryRoomManager/LayerNO" value="0">
						全部楼层
					</logic:lessEqual>
	            
	           </td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryRoomManager/TimeOfIssueCard"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryRoomManager/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryRoomManager/Cardholder" /></td>
	            <td  nowrap align="center">
	            <%
	            String cardID= base.util.TalentContext.getValue(pageContext,"resultset","QueryRoomManager/CardID");
	            String stateID= base.util.TalentContext.getValue(pageContext,"resultset","QueryRoomManager/StateID");
	            if(cardID==null)
	            	out.println("<font color='red'>未发卡</font>");
	            else
	            	if(stateID!=null){
	            		if(stateID.equals("1")) out.println("未使用");
	            		if(stateID.equals("2")) out.println("使用中");
	            		if(stateID.equals("3")) out.println("坏卡");
	            		if(stateID.equals("4")) out.println("挂失");
	            		if(stateID.equals("5")) out.println("<font color='red'>冻结</font>");
	            	}
	             %>	            </td>
	            <td  nowrap align="center">
	         
	           <%if(stateID!=null&&stateID.equals("5")){
	           	if(thaw){
	           %>
	            <input name="thaw" type="button" class="button_02" value="解 冻" onclick="thawCard(<bean:write id="resultset" property="QueryRoomManager/CardID"/>)">
	           <%}}
	           else if(congeal){
	           %>
	            <input name="congeal" type="button" class="button_02" value="冻 结" onclick="congealCard(<bean:write id="resultset" property="QueryRoomManager/CardID"/>)">
	           <%
	           } %>	            </td>
            </tr>
          </logic:iterate>
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
<script >
	function issueCard(id){
		window.open("ICCard.prIssueCard.issueCard.do?fid="+id,"","height=250,width=460,top=130,left=300");
	}
	
	function thawCard(id){
		if(window.confirm("确定要解冻吗")){
			var frm =document.forms[0];
			frm.action = frm.elements["thawaction"].value+".do?fid="+id;
    		frm.submit();
		}
	}
	
	function congealCard(id){
		if(window.confirm("确定要冻结吗")){
			var frm =document.forms[0];
			frm.action = frm.elements["congealaction"].value+".do?fid="+id;
    		frm.submit();
		}
	}
</script>