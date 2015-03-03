<%@include file="/internet/common.jsp"%>
<style type="text/css">
	.selected1{
		background-color: #ECF5FF;
		border:1px blue;
	}
</style>
<script>
var pattern;//正则
var seperator = ',';//分隔符
var tempOption;//新的option
var patternStr;//正则表达式
var alphabet = "";
var allletter = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
var from;
var to;
function outputLetter() {
	var strValue = "";
	for(var l = 0; l < allletter.length; l++) {
		strValue += '<a href=javascript:setWithLetter("' + allletter[l] + '")>' + allletter[l] + '</a>&nbsp;'
	}
	if(strValue!="") document.write(strValue);

}

function setWithLetter(temp) {
	alphabet = temp;
	//alert(alphabet)
	initSelect('letter')
}

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
<form method="post" action="talent.pr.roleSelectUsersToSave.do">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr> 
		  <td height="24" background="/internet/image/lz_bg.gif"> 
		  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
			  <tr> 
				<td width="15"> </td>
				<td class="text_wirte">系统管理—&gt;角色管理—&gt;角色用户分配</td>
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
				<td height="30" align="center" class="text"> 当前分配用户的角色是：<bean:write property="roleName"/>
				  
				</td>
		  </tr>
		  
		  <tr>
			  <td valign="top" class="text">
				<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
					<tr class="td2" > 
					  <td height="25" align="center">部门： 
						<html:select property="bmSelectList" size="1" style="width:200;" onchange="initSelect('dept')"> 
							<html:option value="-1">---所有部门---</html:option> 
							<html:options property="list[@type='teacherorg']/EOSORG_T_Organization/orgID" labelProperty="list[@type='teacherorg']/EOSORG_T_Organization/orgName"/> 
						</html:select> 
						人名搜索：<input type="text" name="search" style="width:200;" class="input" onkeyup="javascript:query();" oldValue="">
						</td>
					</tr>
					<tr class="td2" > 
					  <td height="25" align="center">
					  按姓名首字母检索：
					  <script>
					  	outputLetter();
					  </script>
					  </td>
					</tr>
					<tr class="td1" >
					  <td align="center" valign="top">
					  <table width=50% class=tableframe  border="0" cellpadding="0" cellspacing="0">
                      <tr align=center > 
                        <td> <fieldset>
                          <legend align="center" class="text_red">可分配人员</legend>
                          <table align="center"  class="InputFrameMain" border="0">
                            <select name="leftSelect" size="17" style="width: 150;height:254"  multiple ondblclick="moveOneFrom('left')">
                            </select>
                          </table>
                          </fieldset ></td>
                        <td valign=center width=50> <table width="100%" border="0" cellpadding="0" cellspacing="2">
                            <tr align="center"> 
                              <td> <input name="selectAll" type="button" class="button_02" value=" >>" onclick="moveAllFrom('left')"/> 
                              </td>
                            </tr>
                            <tr align="center"> 
                              <td> <input name="selectAll" type="button" class="button_02" value=" > "  onclick="moveOneFrom('left')"/> 
                              </td>
                            </tr>
                            <tr align="center"> 
                              <td> <input name="selectAll" type="button" class="button_02" value=" < "  onclick="moveOneFrom('right')"/> 
                              </td>
                            </tr>
                            <tr align="center"> 
                              <td> <input name="delAll" type="button" class="button_02" value="<< "  onclick="moveAllFrom('right')"/> 
                              </td>
                            </tr>
                          </table></td>
                        <td> <fieldset>
                          <legend align="center" class="text">已分配人员</legend>
                          <div id="selContainer" > 
                            <select name="rightSelect" id="receiver" style="width: 150;height:254" size="10" multiple onFocus="setCurrent(this)" ondblclick="moveOneFrom('right')">
                            </select>
                          </div>
                          </fieldset></td>
                      </tr>
                    </table>
			</td>
		   </tr>
		   <tr class="td2" > 
					  <td height="25" align="center">
						<input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
						<input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()">
				  </td>
		   </tr>
		  </table>
		</td>
	   </tr>
		<tr>
			<td class="text">&nbsp;</td>
		</tr>
	  </table>    
	 </td>
	</tr>
	</table>
</form>

</body>
<script language="JavaScript">
function query() {
	var searchObj = document.all.search;
	var oldValue = searchObj.getAttribute("oldValue");
	if(document.all.search.value!=oldValue) {
		setPattern(document.all.search.value);
		initSelect('query');
		searchObj.setAttribute("oldValue",document.all.search.value)
	}
}
function initSelect(type) {
	from = document.all.leftSelect;
	to=selArr[0];
    from.options.length = 0;
        //to.options.length = 0;
	switch (type) {
	case 'query':
		searchInRight()
		searchInUserArray();
		break;
    case 'dept':
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
							//alert(userArray[user].name + ' dept is ' + userArray[user].dept);
							var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
				}
        	}
                break;
        case 'job':
        	if(document.all.zwSelectList.value != 0) {
				patternStr = seperator + document.all.zwSelectList.value + seperator;
				setPattern(patternStr);
				for(user in userArray) {
						if(userArray[user].isMatch('job') && userArray[user].isRight==false) {
							var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
				}
        	}else {
				for(user in userArray) {
						if(userArray[user].isMatch('job_all') && userArray[user].isRight==false) {
				var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
				}
        	}
                break;
        case 'address':
        	if(document.all.addressSelectList.value != 0) {
				  userIds = document.all.addressSelectList.value;
				  if(userIds.length > 0) {
						userId = userIds.split(seperator);
				  }
				  for(user in userArray) {
					 for(var i = 0 ; i < userId.length ; i++) {
					 	setPattern(";" + userId[i] + ";");
						if(userArray[user].isMatch('id') && userArray[user].isRight==false) {
					  		var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
					}
				  }
        	}
            break;
			
	case 'letter':
		if(alphabet!="") {
			patternStr = seperator + alphabet + seperator;
			setPattern(patternStr);
			for(user in userArray) {
				if(userArray[user].isMatch('letter') && userArray[user].isRight==false) {
					var option = new Option(userArray[user].name,userArray[user].id);
					if(document.all.bmSelectList.value=="-1") {
						from.add(option);
					}else{
						var bmtemp = document.all.bmSelectList.value;
						if(userArray[user].dept == bmtemp) {
							from.add(option);
						}
					}
					//from.add(option);
				}
			}
		}
		break;
			
	default:
		for(user in userArray) {
			var option = new Option(userArray[user].name,userArray[user].id);
			if(userArray[user].isRight) {
				selArr[userArray[user].index].add(option);
			} else {
				if(document.all.bmSelectList.value=="-1") {
					from.add(option);
				}else{
					var bmtemp = document.all.bmSelectList.value;
					if(userArray[user].dept == bmtemp) {
						from.add(option);
					}
				}
			    
			}
		}
		break;
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
function initSelectJob() {

    for(var i = 0 ; i < document.all.zwSelectList.options.length ; i ++) {
        if(document.all.zwSelectList.options[i].value == 0) {
            document.all.zwSelectList.options[i].selected = true;
            document.all.zwSelectList.value = 0;
            break;
        }
    }
    initSelect('job');
}
function initSelectAdd() {
    for(var i = 0 ; i < document.all.addressSelectList.options.length ; i ++) {
        if(document.all.addressSelectList.options[i].value == 0) {
            document.all.addressSelectList.options[i].selected = true;
            document.all.addressSelectList.value = 0;
            break;
        }
    }
    initSelect('address');
}


function moveOneFrom(type) {
	getFromTo(type)
	for(var i = 0 ; i < from.options.length ; i ++) {
		if(from.options[i].selected) {
			tempOption = new Option(from.options[i].text,from.options[i].value);
			setRight(type);
			to.add(tempOption);
			from.options[i] = null;
			i--
		}
	}
}

function moveAllFrom(type) {
	getFromTo(type);
	for(var i = 0 ; i < from.options.length ; i ++) {
		tempOption = new Option(from.options[i].text,from.options[i].value);
                setRight(type);
		to.add(tempOption);
		from.options[i] = null;
		i--;
	}

}
function setRight(type) {
   setPattern(";" + tempOption.value + ";");
   for(user in userArray) {
      userArray[user].isMatch('id_' + type);
   }
}

var currentRightSel = null;
function getFromTo(type) {
	if(currentRightSel==null){
		currentRightSel=selArr[0];
	}
	switch (type) {
		case 'left':
			from = document.all.leftSelect;
			to = currentRightSel;
			break;
		case 'right':
			from = currentRightSel;
			to = document.all.leftSelect;
			break;
		default:
			from = document.all.leftSelect;
			to = currentRightSel;
			break;
	}
}
function setCurrent(element){
	if(currentRightSel!=null){
		currentRightSel.className = "";
		currentRightSel.selectedIndex = -1;
	}
	
	currentRightSel = element;
	currentRightSel.className = "selected1";

}


function searchInRight() {
	for(var i = 0 ; i < to.options.length; i ++) {

		if(pattern.test(to.options[i].text)) {
			to.options[i].selected = true;
		}
	}
}
function searchInUserArray() {
	from.options.length = 0;
	for(user in userArray) {
            
		if(userArray[user].isMatch() && userArray[user].isRight == false) {
			var option = new Option(userArray[user].name,userArray[user].id);
			if(document.all.bmSelectList.value=="-1") {
					from.add(option);
			}else{
				var bmtemp = document.all.bmSelectList.value;
				if(userArray[user].dept == bmtemp) {
					from.add(option);
				}
			}
			//from.add(option);
		}
	}
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

var btnName = popArray(userIds);

setFocus(btnName);
var childrens = document.all.selContainer.children;
var selIndex=0;


var aryData = new Array();
for(var idx = 0; idx < userIds.length-1; idx++){
	aryData[idx] =userIds[idx]; 
}
userIds = aryData;

//-------------------
for(var i=0;i<childrens.length;i++){
	if(childrens[i].tagName=="SELECT"){
		selArr[selIndex++]=childrens[i];
		
	}
}
for(var i=0;i<userIds.length;i++){
	var sid=userIds[i];//以“,”号分割的字符串
	if(sid.length > 0) {
		idArr = sid.split(seperator);
	}
	for(user in userArray) {
		if(!userArray[user].isRight){
			for(var j = 0 ; j < idArr.length ; j++) {
				setPattern(";" + idArr[j] + ";");
				userArray[user].isMatch('id_left',i);
			}
		}
	}

}

function setFocus(idName) {
	var focusObj = document.getElementById(idName);
	setCurrent(focusObj);
}
function popArray(arr){
	if(arr==null){
		return "receiver";
	}
	
	return (arr[arr.length-1]);
	
}
</script>

<script>
function save() {
  	var frm = document.forms[0];
	var operatorIDs = "";
	
	if(validater(frm)) {
		selectEle = frm.elements["rightSelect"];
		for(var i = 0; i < selectEle.options.length; i++) {
			operatorIDs += selectEle.options[i].value + ",";
		}
		if(operatorIDs!="") {
			operatorIDs = operatorIDs.substring(0,operatorIDs.lastIndexOf(","));
		}
		frm.elements["SysRoleUser/operatorIDs"].value = operatorIDs;
	  
	  frm.submit();	
	} 
  
}
</script>
