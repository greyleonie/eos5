<%@include file="/internet/common.jsp"%>

<script>
var pattern;//正则
var seperator = ',';//分隔符
var tempOption;//新的option
var patternStr;//正则表达式
var alphabet = "";

var from;
var to;

function setPattern(patternStr) {
	pattern = new RegExp(patternStr,"i");
}
function User(identify,id,name,dept,job,firstChar){
	this.identify = identify;
	this.id = id;
	this.name = name;
	this.dept = dept;
	this.job = job;
	this.firstChar = firstChar;
	this.isRight = false;//是否被选中
	this.index = 0;
	function compare_by_type(type,index){
		switch(type) {
			case 'id':
				return pattern.test(";" + this.id + ";");
			case 'id_left':
                        	if(pattern.test(";" + this.id + ";")) {
                                	this.isRight = true;
                        	}
							this.index=index;
				return ;
			case 'id_right':
                        	if(pattern.test(";" + this.id + ";")) {
                                	this.isRight = false;
                        	}
				return ;
			case 'name':
				return pattern.test(this.name);
			case 'dept':
				return pattern.test(seperator + this.dept + seperator);
			case 'dept_all':
				return this.dept.length > 0;
			case 'job':
				return pattern.test(seperator + this.job + seperator);
			case 'job_all':
				return this.job.length > 0;
			case 'all':
				return true;
			case 'letter':
				return pattern.test(seperator + this.firstChar + seperator);
			default:
				return pattern.test(this.name);
		}
	}
	this.isMatch = compare_by_type;

}
</script>


<script language="JavaScript">
	var userArray = new Array()
	 <logic:iterate id="resultset" property="list[@type='Teacher']">
	   userArray[userArray.length] = new User('<bean:write id="resultset" property="Teacher/userID" />','<bean:write id="resultset" property="Teacher/operatorID" />','<bean:write id="resultset" property="Teacher/operatorName" />','<bean:write id="resultset" property="Teacher/DepartmentID" />','-1','<bean:write id="resultset" property="Teacher/Firstchar" />');
	 </logic:iterate>

</script>

<body onLoad="initSelect();">
<form method="post" action="studentmanage.prThesis.thesisAssignDo.do">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr> 
		  <td height="24" background="/internet/image/lz_bg.gif"> 
		  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
			  <tr> 
				<td width="15"> </td>
				<td class="text_wirte">学员管理—&gt;学员文章管理—&gt;分配评卷人</td>
			  </tr>
			</table></td>
		</tr>
		<tr>
		  <td height="5">
			<input type="hidden" name="queryaction" value="talent.pr.rolelist.do">
			<input type="hidden" name="addaction" value="talent.pr.roleadd.do">
			<input type="hidden" name="modifyaction" value="talent.pr.rolemodify.do">
			<input type="hidden" name="deleteaction" value="talent.pr.roledelete.do">
			<input type="hidden" name="viewaction" value="talent.pr.roleview.do">
			<html:hidden property="EOSRole/_order/col1/field"/>
			<html:hidden property="EOSRole/_order/col1/asc" />
			
			<html:hidden property="PageCond/begin"/>
			<html:hidden property="PageCond/count"/>
			<html:hidden property="PageCond/length" />
			<html:hidden name="SysRoleUser/roleID" property="EOSOperatorRole/roleID" />
			<html:hidden property="SysRoleUser/operatorIDs" />
			
			
		  </td>
		</tr>
	  </table>
	
	
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
	  <tr>
		<td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
		  
		  
		  <tr>
		    <td valign="top" class="text">&nbsp;</td>
	      </tr>
		  <tr>
			  <td valign="top" class="text">
				<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
					
					
					<tr class="td2" >
					  <td align="right">部门：</td>
				      <td align="left">&nbsp;
                          <html:select property="bmSelectList" size="1" style="width:200;" onchange="initSelect('dept')"> 
							<html:option value="-1">---所有部门---</html:option> 
							<html:options property="list[@type='teacherorg']/EOSORG_T_Organization/orgID" labelProperty="list[@type='teacherorg']/EOSORG_T_Organization/orgName"/> 
						</html:select>		</td>
				  </tr>
					<tr class="td2" >
					  <td align="right">人员：</td>
				      <td align="left">&nbsp;
					  <select name="Thesis/TeacherID"></select></td>
				  </tr>
					
		   <tr class="td2" > 
					  <td height="25" colspan="2" align="center">
						<input name="Submit" type="Submit" class="button_02" value="提 交" >
						<input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()">				  </td>
		   </tr>
		  </table>		</td>
	   </tr>
		<tr>
			<td class="text">&nbsp;
			
			
			</td>
		</tr>
	  </table>    
	 </td>
	</tr>
	</table>
	<div >
	<logic:iterate id="resultset" property="list[@name='update']">
            	<html:hidden id="resultset" property="QueryThesis/ThesisID" name="list[@name='update']/Thesis/ThesisID" indexed="true" />
            	
         </logic:iterate> 
         </div>
</form>

</body>
<script language="JavaScript">

function initSelect(type) {
	from = document.all("Thesis/TeacherID");
	to=selArr[0];
    from.options.length = 0;
        //to.options.length = 0;
        	if(document.all.bmSelectList.value != -1) {
				patternStr = seperator + document.all.bmSelectList.value + seperator;
				setPattern(patternStr);
					//alert('pattern is ' + pattern);
				for(user in userArray) {
						if(userArray[user].isMatch('dept') && userArray[user].isRight==false) {
							//alert(userArray[user].name + ' dept is ' + userArray[user].dept);
							
							var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
				}
        	}else {
				for(user in userArray) {
						if(userArray[user].isMatch('dept_all') && userArray[user].isRight==false) {
							var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
				}
        	}
                
       
			
	
}
function initSelectDept() {
    for(var i = 0 ; i < document.all.bmSelectList.options.length ; i ++) {
        if(document.all.bmSelectList.options[i].value == -1) {
            document.all.bmSelectList.options[i].selected = true;
            document.all.bmSelectList.value = -1;
            break;
        }
    }
    initSelect('dept');
}

</script>

<script language="JavaScript">
var userIds = [];
var idArr=[];
var selArr=[];//左边select box对象数组
var tempArray = [];
<logic:iterate id="result" property="list[@type='distributed']">
	tempArray[tempArray.length] = '<bean:write id="result" property="EOSOperatorRole/operatorID" />'
</logic:iterate>
userIds[0] = tempArray.join();
userIds[1] = "receiver";


</script>

<script>
function choose() {
  	var frm = document.forms[0];
  	var sel = frm.elements["Thesis/TeacherID"];
	var TeacherName = sel.options[sel.options.selectedIndex].text;
	var TeacherID=sel.value;
  	opener.document.all("Thesis/TeacherID").value=TeacherID;
  	opener.document.all("Thesis/TeacherName").value=TeacherName;
  	window.close();
}
</script>
