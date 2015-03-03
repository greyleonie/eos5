<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prHousing.roomList.do" >
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="8"></td>
    </tr>
    <tr>
      <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8" colspan="9">
		<input type="hidden" name="queryaction" value="studentmanage.prHousing.roomList.do">
		<input type="hidden" name="viewaction" value="studentmanage.prThesis.thesisView.do">
		
		<html:hidden property="QueryRoom/_order/col1/field"/>
		<html:hidden property="QueryRoom/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
				 </td>
      </tr>
      <tr>
            <td colspan="9" class="text">楼 宇： 
            <html:select property="QueryRoom/BuildingID/criteria/value" onchange="toquery(2)" attributesText='id="printTable"'> 
               <html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
              </html:select> 
			  &nbsp;开始楼层：
	   <html:select property="QueryRoom/LayerNO/criteria/min"  attributesText='id="printTable"'> 
              <logic:iterate id="layers" property="list[@type='Layer']">
              <html:option id="layers" property="Layer/LayerNO">
  				第<bean:write id="layers" property="Layer/LayerNO"/>层              </html:option>
              </logic:iterate>
       </html:select> 
		&nbsp;结束楼层：
	   <html:select property="QueryRoom/LayerNO/criteria/max"  attributesText='id="printTable"'> 
              <logic:iterate id="layers" property="list[@type='Layer']">
              <html:option id="layers" property="Layer/LayerNO">
  				第<bean:write id="layers" property="Layer/LayerNO"/>层              </html:option>
              </logic:iterate>
       </html:select>		    </td>
      </tr>
	  
	  <tr>
	    <td height="30" colspan="9" class="text">
	  
      状 态：
		<html:select property="QueryRoom/stateFlag" attributesText='id="printTable"'> 
             <html:option value="-1">全部</html:option> 
             <html:option value="1">可安排</html:option> 
             <html:option value="0">空闲</html:option> 
        </html:select>
     
     &nbsp;楼层标识:
		<html:select property="QueryRoom/leftflag/criteria/value" attributesText='id="printTable"'> 
             <html:option value="-1">不区分</html:option> 
             <html:option value="1">楼宇（左）</html:option> 
             <html:option value="0">楼宇（右）</html:option> 
        </html:select>
        &nbsp;
        <input name="query" type="button" class="button_02" value="查 询" onClick="toquery(0)">	    	</td>
	    </tr>
	     <tr>
        <td height="30" colspan="9" class="text"> 
        开始时间：<html:text property="QueryRoom/BeginTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryRoom/BeginTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
	    	结束时间：<html:text property="QueryRoom/EndTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryRoom/EndTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>        &nbsp;&nbsp;全选:
        <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">&nbsp;</td>
      </tr>
	     <tr>
	       <td width="7%" valign="center"><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0">
               <tr>
                 <td width="100%" class="td1">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">空闲</td>
	       <td width="7%" valign="center"><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0" >
               <tr>
                 <td width="100%" class="room1">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">未住满</td>
	       <td width="7%" valign="center" ><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0" >
               <tr>
                 <td width="100%" class="room2">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">住满</td>
	       <td width="7%" valign="center"><table border="1" width="93%" height="10" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="0" >
               <tr>
                 <td width="100%" class="room3">　</td>
               </tr>
           </table></td>
	       <td width="10%" class="text">已出租</td>
	       <td class="text" align="center">(空床位数,床位总数)</td>
	       </tr>
      <tr>
        <td height="8" colspan="9"> </td>
      </tr>
      <logic:notEqual value="-1" property="QueryRoom/BuildingID/criteria/value">
      <tr>
        <td colspan="9" valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <% int tempInt=0; %>
                <tr > 
                  <logic:iterate id="resultset" property="list[@type='QueryRoom']">
                  
                  <td align="center" class="td1" width="25%" ondblclick="viewLogs(<bean:write id="resultset" property="QueryRoom/RoomID"/>)">
				  
				  <table width="100%" border="0" cellspacing="0" cellpadding="0"  height="100%">
				  <%
				  String trClass = "td1";
				  int flag=1; //可选标志
					int VacancyNum =  talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/VacancyNum"),0);//空床位数
				  	String state =  base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/HousingState");//房间状态；
				  	int SeatNum =  talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/SeatNum"),0);//床位数
				  	String Sex= base.util.TalentContext.getValue(pageContext,"resultset","QueryRoom/Sex");//房间房客性别；
				  	if(Sex==null) Sex="";
				  	
				  	if(talent.core.TalentFunctions.getAvailStr(state).equals("3")){
				  		trClass = "room3";
				  		flag=0;
				  		}
				  		
				  	else{
				  		if(VacancyNum>0){
				  			if(VacancyNum<SeatNum){
				  				trClass = "room1";
				  				if(Sex.equals("2"))
				  					flag=0;
				  				}
				  		}
				  		else{
				  			trClass="room2";	
				  			flag=0;
				  		}
				  		
				  	}
				  	
				  	java.util.Hashtable h = new java.util.Hashtable();
					h.put("VacancyNum",String.valueOf(VacancyNum));
				  	h.put("Sex",Sex);
				   %>
				   
				   
                    <tr>
                      <td class="<%=trClass%>">
                      <logic:present  id="resultset" property="QueryRoom/RoomID">
                      <%if(flag==1){ %>
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryRoom/RoomID" property="QueryRoom/RoomID" indexed="true"    attributes="<%=h %>"/>
				  	
				  	
				  <%}else{ %>
				  <html:checkbox id="resultset" name="list[@name='update']/QueryRoom/RoomID" property="QueryRoom/RoomID" indexed="true" disabled="true"/>
				  <%} %>
				  </logic:present>	
						<input type="hidden"  name='VacancyNum<bean:write id="resultset" property="QueryRoom/RoomID" />' value="<%=VacancyNum %>"/>
                      <bean:write id="resultset" property="QueryRoom/BuildingName" /> 
                      <bean:write id="resultset" property="QueryRoom/RoomName" />                      </td>
                    </tr>
                    <tr>
                      <td class="<%=trClass%>" align="center">
                    &nbsp;
                    <%if(Sex.equals("1")||Sex.equals("0")) {%>
                    <img src='/internet/image/sex<%=Sex %>.gif' >
                    <%} %>
                    <%if(Sex.equals("2")) {%>
                    <img src='/internet/image/sex1.gif' >
                    <%} %>
                      (<%=VacancyNum %>,<%=SeatNum %>)                    </td>
                    </tr>
                  </table>				  </td>
                  <%
                  	tempInt=tempInt+1;
                  	if(tempInt==4){
                  		tempInt=0;
                   %>
                   </tr><tr>
                   <%} %>
                  </logic:iterate>
                  <%
                  	if(tempInt!=0){
                  	 for(int i=tempInt;i<4;i++){
                   %>
                   <td class="td1" width="25%">&nbsp;</td>
                   <%} }%>
                </tr>
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">			  	  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td colspan="9" class="text"></td>
      </tr>
      </logic:notEqual>
    </table>    </td>
  </tr>
</table></td>
    </tr>
  </table>
  




</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	function toquery(n){
		
		var leftForm=window.parent.document.leftFrame.document.forms[0];
		var frm =document.forms[0];
		
		if(n==1)
			frm.action=frm.elements["queryaction"].value+"?QueryRoom/ClassID/criteria/value="+leftForm.elements["QueryStudentRoom/ClassID/criteria/value"].value;
		else{
		    if(frm.elements["QueryRoom/BeginTime[@pattern='yyyy-MM-dd']"].value==""&&
				frm.elements["QueryRoom/EndTime[@pattern='yyyy-MM-dd']"].value==""){
				alert("请选择时间!");
				return;
			}
		    frm.action=frm.elements["queryaction"].value;
		    if(n==2){
		    	frm.elements["QueryRoom/LayerNO/criteria/min"].value=null;
		    	frm.elements["QueryRoom/LayerNO/criteria/max"].value=null;
		    }
		    }
		frm.submit();
	}
	
	function viewLogs(RoomID){
		var frm =document.forms[0];
		var beginTime=frm.elements["QueryRoom/BeginTime[@pattern='yyyy-MM-dd']"].value;
		var endTime=frm.elements["QueryRoom/EndTime[@pattern='yyyy-MM-dd']"].value;
		var str="RoomID="+RoomID+"&QueryHousingLogs/BeginTime="+beginTime+"&QueryHousingLogs/EndTime="+endTime;
		
		window.open("studentmanage.prHousing.viewRoomHousingLogs.do?"+str,"","scrollbars=yes,width=500,height=350,top=100,left=200");
	}
</script>