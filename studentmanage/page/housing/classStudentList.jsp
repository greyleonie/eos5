<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prHousing.classStudentList.do" >
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
		<input type="hidden" name="queryaction" value="studentmanage.prHousing.classStudentList.do">
		<input type="hidden" name="cancelaction" value="studentmanage.prHousing.cancelHousing.do">
		<input type="hidden" name="assignaction" value="studentmanage.prHousing.assignHouse.do">
		<input type="hidden" name="exchangeaction" value="studentmanage.prHousing.exchangeHouse.do">
		<input type="hidden" name="listaction" value="studentmanage.prHousing.studentHouseList.do">
		
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
&nbsp;		   班主任：<bean:write property="entity/headTeacher"/> </td>
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
        <td height="30" class="text"> 
       
        <qx:talentButton property="assign" type="button" styleClass="button_02" value="分 房" onclick="assignHouse()" operation="DX_STUDENT_MANAGE_ZS.DX_STUDENT_MANAGE_ZS_ASSIGN" />
        <qx:talentButton property="cancel" type="button" styleClass="button_02" value="退 房" onclick="cancelHousing()" operation="DX_STUDENT_MANAGE_ZS.DX_STUDENT_MANAGE_ZS_CANCEL" />
        <qx:talentButton property="exchange" type="button" styleClass="button_02" value="对 调" onclick="exchangeHouse()"operation="DX_STUDENT_MANAGE_ZS.DX_STUDENT_MANAGE_ZS_CHANGE" />
        <input name="lookList" type="button" class="button_02" value="列表查看" onclick="lookForList()">        </td>
        <td align="right" class="text"> 全选:
        <input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">&nbsp;</td>
	    </tr>
      <tr>
        <td height="8" colspan="2"> </td>
      </tr>
      <logic:notEqual value="-1" property="QueryStudentRoom/ClassID/criteria/value">
      <tr>
        <td colspan="2" valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <% int tempInt=0; %>
                <tr > 
                  <logic:iterate id="resultset" property="list[@type='QueryStudentRoom']">
                  <td align="center" class="td1">
				  
				  <table width="100%" border="0" cellspacing="0" cellpadding="0"  >
				  <%
				  String trClass = "td1";
				  String Sex= base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentRoom/Sex");
				  String RoomID= base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentRoom/RoomID");
				  if(Sex==null) Sex="";
				  java.util.Hashtable h = new java.util.Hashtable();
				  	h.put("Sex",Sex);
				  if(RoomID!=null&&(!RoomID.equals("")))
				  	h.put("RoomID",RoomID);
				   %>
				   <logic:present id="resultset" property="QueryStudentRoom/RoomID">
				   <%trClass="room4"; %>
				   </logic:present>
                    <tr>
                      <td class="<%=trClass%>">
                      <logic:present  id="resultset" property="QueryStudentRoom/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryStudentRoom/StudentID" property="QueryStudentRoom/StudentID" indexed="true" attributes="<%=h %>"/>
				  </logic:present>	
						<img src='/internet/image/sex<bean:write id="resultset" property="QueryStudentRoom/Sex" />.gif' >
                      
                      <bean:write id="resultset" property="QueryStudentRoom/operatorname" />                      </td>
                    </tr>
                    <tr>
                      <td class="<%=trClass%>" >
                      &nbsp;
                      <bean:write id="resultset" property="QueryStudentRoom/BuildingName" /><bean:write id="resultset" property="QueryStudentRoom/RoomName" />  </td>
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
                   <td class="td1">&nbsp;</td>
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
	
	function assignHouse(){
    	var frm =document.forms[0];
		var rightForm=window.parent.document.rightFrame.document.forms[0];
   		var studentCount=chechedCount(frm);
   		if(studentCount<1){
    		alert("至少必须选择一个学生！");
    		return ;
    	} 
    	if(chechedCount(rightForm)<1){
    		alert("至少必须选择一间房间！");
    		return ;
    	} 
    	var cwCount=chechedAttributeCount(rightForm,"VacancyNum");
    	if(studentCount>cwCount){
    		alert("选择的房间空床位不足！");
    		return;
    	}
    	getStudentsSex(frm);
    	getRoomInfo(frm,rightForm);
    	frm.action = frm.elements["assignaction"].value;
    	frm.submit();
    	
	}
	
	function exchangeHouse(){
    	var frm =document.forms[0];
   		var studentCount=chechedCount(frm);
   		if(studentCount!=2){
    		alert("必须选择两个学生！");
    		return ;
    	} 
    	
	    var i=0;
	    var j=0;
	    var Sex1="";
	    var Sex2="";
		eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var roomID = obj.getAttribute("RoomID");
				    if(roomID==null||roomID==""){
				    	alert("您选择的学生必须已分配了房间!");
				    	return ;
				    }
				    if(j==0)
				    	Sex1=obj.getAttribute("Sex");
				    if(j==1)
				    	Sex2=obj.getAttribute("Sex");
				    j++;
			     }
			}
			i++;
		}
    	if(Sex1!=Sex2){
    		alert("您选择的学生性别不一致!");
			return ;
    	}
    	getStudentsSex(frm);
    	frm.action = frm.elements["exchangeaction"].value;
    	frm.submit();
    	
	}
	
    function lookForList(){
    	var frm =document.forms[0];
    	//window.parent.document.spaceFrame.toLeft();
    	frm.action = frm.elements["listaction"].value;
    	frm.submit();
    }
    
    function cancelHousing(){
    	var frm =document.forms[0];
		var studentCount=chechedCount(frm);
   		if(studentCount<1){
    		alert("至少必须选择一个学生！");
    		return ;
    	} 
    	getStudentsSex(frm);
    	frm.action = frm.elements["cancelaction"].value;
    	frm.submit();
    }
	
	function getRoomInfo(frm,rightForm){  //从右边框架表单中取出选中房间的信息
	
		var length =0;
	    var i=0;
	    var j=0;
		eles = rightForm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
					var preStr="list[@type=&#39;Room&#39;]/Room[@rowNum=&#39;"+j+"&#39;]/";
				    
				    var RoomID=obj.value;
				    var newElemnt1 = document.createElement("<input type='hidden' name='"+preStr+"RoomID' value='" + RoomID + "'>");
					frm.appendChild(newElemnt1);
					
					var VacancyNum=obj.getAttribute("VacancyNum");
				    var newElemnt2 = document.createElement("<input type='hidden' name='"+preStr+"VacancyNum' value='" + VacancyNum + "'>");
					frm.appendChild(newElemnt2);
					
					var Sex=obj.getAttribute("Sex");
				    var newElemnt3 = document.createElement("<input type='hidden' name='"+preStr+"Sex' value='" + Sex + "'>");
					frm.appendChild(newElemnt3);
				    j++;
			     }
			}
			i++;
		}
		var beginTime=rightForm.elements("QueryRoom/BeginTime[@pattern='yyyy-MM-dd']");
		var beginTimeElemnt = document.createElement("<input type='hidden' name='HousingLogs/BeginTime[@pattern=&#39;yyyy-MM-dd&#39;]' value='" + beginTime.value + "'>");
		frm.appendChild(beginTimeElemnt);
		
		var endTime=rightForm.elements("QueryRoom/EndTime[@pattern='yyyy-MM-dd']");
		var endTimeElemnt = document.createElement("<input type='hidden' name='HousingLogs/EndTime[@pattern=&#39;yyyy-MM-dd&#39;]' value='" + endTime.value + "'>");
		frm.appendChild(endTimeElemnt);
	}
	
	function getStudentsSex(frm) { //获取选中学生的信息
		var i=0;
		var j=0;
		eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var preStr="list[@type=&#39;Student&#39;]/Student[@rowNum=&#39;"+j+"&#39;]/";
				    
				    var StudentID=obj.value;
				    var newElemnt1 = document.createElement("<input type='hidden' name='"+preStr+"StudentID' value='" + StudentID + "'>");
					frm.appendChild(newElemnt1);
					
					var Sex=obj.getAttribute("Sex");
				    var newElemnt2 = document.createElement("<input type='hidden' name='"+preStr+"Sex' value='" + Sex + "'>");
					frm.appendChild(newElemnt2);
				    
				    var RoomID=obj.getAttribute("RoomID");
				    if(RoomID!=null&&RoomID!=""){
					    var newElemnt3 = document.createElement("<input type='hidden' name='"+preStr+"RoomID' value='" + RoomID + "'>");
						frm.appendChild(newElemnt3);
					}
					
				    j++;
			     }
			}
			i++;
		}
	
	}
	
	
	
</script>