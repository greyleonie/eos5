<%@include file="/internet/common.jsp"%>
<title>使用人ID选择</title>
<body>
	<form name="userIdFrom" method="post">
		<input type="hidden" name="SendMsg/msgFormat" value="">
		<input type="hidden" name="SendMsg/SendMsgID" value="">
		<input type="hidden" name="SendMsg/DestAddrIsdnNum" value="">
	 	<html:hidden property="path"/> 
		<input type="hidden" name="part" value="1">  
		<input type="hidden" name="SendMsg/AuthorID" value='<bean:write property="SessionEntity/operatorID"/>'>
	
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
		      <td height="8"> </td>
		    </tr>
		    <tr>
		    	<td class="text">
		    		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
			    		<%
				            String team=base.util.TalentContext.getValue(pageContext,null,"team");   
				            String title="部门名称：";       
			            %>  
						<logic:equal property="path" value="2"><%title="班级名称："; %></logic:equal>
						<logic:equal property="path" value="3"><%title="分组名称："; %></logic:equal>
						<tr id="sendTimeTr">
							<td width="8%" class="td2" nowrap align="right">
								<%=title %>
							</td>
							<td class="td1">
								<select style="width:150;" name="team" onchange="selectOrg()">
            					<option value="-1">请选择</option>
           						<logic:iterate id="orgList" property="list[@type='EOSORG_T_Organization']">
									<%try{%>
										<logic:equal id="orgList" property="EOSORG_T_Organization/orgID"  value="<%=team%>">
											<option selected="selected" value='<bean:write id="orgList" property="EOSORG_T_Organization/orgID"/>'><bean:write id="orgList" property="EOSORG_T_Organization/orgName"/></option>
										</logic:equal>
										<logic:notEqual id="orgList" property="EOSORG_T_Organization/orgID"  value="<%=team%>">
											<option  value='<bean:write id="orgList" property="EOSORG_T_Organization/orgID"/>'><bean:write id="orgList" property="EOSORG_T_Organization/orgName"/></option>
										</logic:notEqual>
									<%}catch(Exception e){
										System.out.println("==========errors:"+e);
									}%>
						       </logic:iterate>
								<logic:iterate id="classList" property="list[@type='Class']">
									<%try{%>
										<logic:equal id="classList" property="Class/classid"  value="<%=team%>">
											<option selected="selected" value='<bean:write id="classList" property="Class/classid"/>'><bean:write id="classList" property="Class/classname"/></option>
										</logic:equal>
										<logic:notEqual id="classList" property="Class/classid"  value="<%=team%>">
											<option  value='<bean:write id="classList" property="Class/classid"/>'><bean:write id="classList" property="Class/classname"/></option>
										</logic:notEqual>
									<%}catch(Exception e){
										System.out.println("==========errors:"+e);
									}%>
								</logic:iterate>
								
								<logic:iterate id="teamList" property="list[@type='myTeam']">
									<%try{%>
										<logic:equal id="teamList" property="entity/sort"  value="<%=team%>">
											<option selected="selected" value='<bean:write id="teamList" property="entity/sort"/>'><bean:write id="teamList" property="entity/sort"/></option>
										</logic:equal>
										<logic:notEqual id="teamList" property="entity/sort"  value="<%=team%>">
											<option  value='<bean:write id="teamList" property="entity/sort"/>'><bean:write id="teamList" property="entity/sort"/></option>
										</logic:notEqual>
									<%}catch(Exception e){
										System.out.println("==========errors:"+e);
									}%>
								</logic:iterate>
								</select>
							</td>
						</tr>
						<tr>
           					<td align="right" class="td2" nowrap>使用人列表： </td>
				            <td class="td1">
				            	<select size="10" style="width:150"   name="userid" onclick="Confirm()"></select>
				            	<font color="red">提示：单击选取使用人标识号</font>
				           		<!--<font color="#B51018">提示：按Ctrl键可多选,按住Shift可以全选</font> multiple="multiple" -->
				            </td>
						</tr>
						<tr>
							<TD width="8%" class="td2" nowrap align="right">&nbsp;</TD>
				            <TD class="td1">		
								<!--<input name="B3" type="button" class="button_02" value="添加" onclick="Confirm()">-->
								<input name="B6" type="button" class="button_02" value="关闭" onclick="cancel()">
								<!--<input name="B6" type="button" class="button_02" value="全部" onclick="selectall()">-->
							</TD>
						</tr>
		    		</table>
		    		<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0"></table>
		    	</td>
		    </tr>
		    <tr>
		    	<td class="text">&nbsp;</td>
		    </tr>
		</table>
	</form>
</body>
<script language="JavaScript">
	var frm=document.forms[0];
	
	function selectOrg(){
		clearList();

		if(frm.elements["team"].value!=-1){
		if(frm.elements["path"].value=="1"){//部门的人员
		frm.action="OMM.prDevUsingLogs.userOfOrg.do";
		}else if(frm.elements["path"].value=="2"){
			frm.action="OMM.prDevUsingLogs.userOfClass.do";
		}
		//path=3
		//else{
		//	frm.action="ICCard.prMsg.myTelBook.do";
		//}
		frm.submit();
		}
	}
	
	function changeUserTeam(){
		clearList();
		if(frm.elements["path"].value=="1"){//部门的人员
			frm.action="ICCard.prMsg.userOfOrg.do?team=-1";
		}else if(frm.elements["path"].value=="2"){//学员
			frm.action="OMM.prDevUsingLogs.userOfClass.do?team=-1";
		}
		//else
		//path=3
		//{
		//	frm.action="ICCard.prMsg.myTelBook.do?team=-1";
		//}
		frm.submit();
	}
	
	function init(){//填充用户列表
		<logic:iterate id="userList" property="list[@type='userInfo']">
			var userName='<bean:write id="userList" property="entity/operatorname"/>';	   
			var val='<bean:write id="userList" property="entity/operatorID"/>';
			var textval=userName;
			addOption(textval,val);
		</logic:iterate>
	}
	
	function addOption(textval,val){
		var oOption = document.createElement("OPTION");
		oOption.text=textval;
		oOption.value=val;
		frm.userid.add(oOption);
	}
	
	function clearList(){			
		var len = frm.userid.options.length;				
		for(i=0;i<=len;i++){				
			frm.userid.remove(0);
		}
	}
	
	function clearAll(obj){
		var len = obj.length;				
		for(i=0;i<=len;i++){				
			obj.remove(0);
		}
	}
	
	function selectall(){
		userList=frm.userid;
		if(userList.options.length>0){			
			for(var i = 0; i < userList.options.length; i++){
			//  alert(userList.options[i].selected);
				userList.options[i].selected=true;
			}
		}
	 	else
	 	{
			alert("用户为空或是部门名称没有选择");
			return;
	 	}
	}
	
	function Confirm(){
		userList=frm.userid;
		var mobileName="";
		if(userList.selectedIndex == -1) {
			alert("请在使用人列表中选择!");
			userList.focus();
			return ;
		}	
		
		if(userList.options.length>0){			
			for(var i = 0; i < userList.options.length; i++){
				if(userList.options[i] != null && userList.options[i].selected == true){
				 if(userList.options[i].value.length==0){
				     mobileName=mobileName+userList.options[i].innerText;
			       
		         }else{
		         	//alert(userList.options[i].innerText+ "   "+userList.options[i].value);
					AddMobile(userList.options[i]);
					}
				}
			}
			if(mobileName!="")
			{
			    alert("用户:"+mobileName+" 没有设置手机号码，添加失败！");
			}
		}
		this.parent.window.close();
 	}
 	
 	function AddMobile(mobile){    
		//var obj=this.parent.window.opener.document.forms[0].elements["mobilenums"]; 
	//	mobilenumsObj=window.opener.messageForm.mobilenums;
		//if(obj.options.length>0){
		//	for(i=0;i<obj.options.length;i++){
		//		if(trim(obj.options[i].value)==trim(mobile.value)){
		//			alert("用户:"+mobile.innerText+" 已在号码列表中，添加失败！");
		//			return;
		//		}
		//	}
		//}
		//parent.frames["mainframe"].document.messageForm.addOption(mobile.innerText,mobile.value);	
		//alert(mobile.innerText);
		//alert(mobile.innerText+"   "+mobile.value);
		//return;
        this.parent.window.opener.addOption(mobile.innerText,mobile.value);
		
 	}
 	
	function cancel(){
		this.parent.window.close();
	}
	
	init();
</script>