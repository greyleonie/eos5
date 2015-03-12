<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prHousing.studentHouseList.do" >
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="8"></td>
    </tr>
    <tr>
      <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8" colspan="2">
		<input type="hidden" name="queryaction" value="studentmanage.prHousing.studentHouseList.do">
		<input type="hidden" name="returnaction" value="studentmanage.prHousing.classStudentList.do">
		
		<html:hidden property="QueryStudentRoom/_order/col1/field"/>
		<html:hidden property="QueryStudentRoom/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />		 </td>
      </tr>
      <tr>
            <td colspan="2" class="text">班 级： 
            <html:select property="QueryStudentRoom/ClassID/criteria/value" onchange="toquery(1)" attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
&nbsp;		    </td>
      </tr>
	  
	  <tr>
	    <td height="30" colspan="2" class="text">
	   组  别：
	   <html:select property="QueryStudentRoom/TeamID/criteria/value" onchange="toquery(0)" > 
              <html:option value="-1">全部</html:option> <html:options property="list[@type='Team']/Team/TeamID" labelProperty="list[@type='Team']/Team/TeamName"/> 
              </html:select> 
       性  别：       
       <html:select property="QueryStudentRoom/Sex/criteria/value" onchange="toquery(0)" > 
             <html:option value="-1">全部</html:option> 
             <html:option value="1">男</html:option> 
             <html:option value="0">女</html:option> 
        </html:select>        
       分  配：       
       <html:select property="QueryStudentRoom/fenpei" onchange="toquery(0)" > 
             <html:option value="-1">全部</html:option>
             <html:option value="1">已分配</html:option> 
             <html:option value="0">未分配</html:option>  
        </html:select>	    	</td>
	    </tr>
	    <tr>
        <td height="30" class="text"><input name="lookList" type="button" class="button_02" value="返回管理" onClick="returnForManage()">      
        <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">	
          </td>
        <td align="right" class="text">&nbsp; </td>
	    </tr>
      <tr>
        <td height="8" colspan="2"> </td>
      </tr>
      <logic:notEqual value="-1" property="QueryStudentRoom/ClassID/criteria/value">
      <tr>
        <td colspan="2" valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="14%" align="center" nowrap id="QueryStudentRoom.StudentNO" onClick="talentsort()">学号</td>
                  <td width="13%" align="center" nowrap id="QueryStudentRoom.operatorname" onClick="talentsort()">姓名</td>
                  <td width="12%" align="center" nowrap id="QueryStudentRoom.BuildingName" onClick="talentsort()">楼宇</td>
                  <td width="9%" align="center" nowrap id="QueryStudentRoom.RoomName" onClick="talentsort()">房间</td>
                  <td width="16%" align="center" nowrap id="QueryStudentRoom.userID" onClick="talentsort()">账号</td>
                  <td width="9%" align="center" nowrap id="QueryStudentRoom.TeamName" onClick="talentsort()">组别</td>
                  <td width="9%" align="center" nowrap id="QueryStudentRoom.Sex" onClick="talentsort()">性别</td>
                  <td width="9%" align="center" nowrap id="QueryStudentRoom.RoomTel" onClick="talentsort()">电话</td>
                  <td width="9%" align="center" nowrap id="QueryStudentRoom.SeatNum" onClick="talentsort()">床位数</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryStudentRoom']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                 <tr class="<%=trClass%>">
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/StudentNO"/></td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/operatorname" /></td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/BuildingName" /></td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/RoomName"/> </td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/userID" /></td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/TeamName" /></td>
                  <td nowrap align="center">&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudentRoom/Sex" id="resultset"/></td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/RoomTel"/></td>
                  <td nowrap align="center">&nbsp;<bean:write id="resultset" property="QueryStudentRoom/SeatNum" />                   </td>
                  </tr>
				</logic:iterate>
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">			  	  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td colspan="2" class="text"></td>
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
		
		var frm =document.forms[0];
		if(frm.elements["QueryStudentRoom/ClassID/criteria/value"].value==-1){
			alert("请选择班级!");
			return;
		}
		if(n==1){
			window.parent.document.rightFrame.toquery(1);
		}
		frm.submit();
	}
	
	function returnForManage(){
    	var frm =document.forms[0];
    	//window.parent.document.spaceFrame.toCenter();
    	frm.action = frm.elements["returnaction"].value;
    	frm.submit();
    }
	
</script>