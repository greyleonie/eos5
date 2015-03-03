<%@include file="/internet/common.jsp"%>
<script language="JavaScript" src="/internet/scripts/fccoptionother.js"></script>
<style type="text/css">
	.selected{
		background-color: #ECF5FF;
		border:1px blue;
	}
</style>

<script language="JavaScript">

	var bmOptionstest = new OptionTree('testopion','noselect');
	
	bmOptionstest.add('99999','-2','所有部门');
	<logic:iterate id="resultsetfcc" property="list[@type='teacherorg']">
		
		bmOptionstest.add('<bean:write id="resultsetfcc" property="EOSORG_T_Organization/orgID" />','<bean:write id="resultsetfcc" property="EOSORG_T_Organization/parentOrgID" />','<bean:write id="resultsetfcc" property="EOSORG_T_Organization/orgName" />');
		
	</logic:iterate>
	
	
	
</script>

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
		strValue += '<a href="#" onClick=setWithLetter("' + allletter[l] + '")>' + allletter[l] + '</a>&nbsp;'
	}
	if(strValue!="") document.write(strValue);

}

function setWithLetter(temp) {
	alphabet = temp;
	//alert(alphabet)
	document.all.bmSelectList.value = "99999"
	document.all.orgTypeTemp.value = "-1"
	initSelect('letter');
}

function setPattern(patternStr) {
	pattern = new RegExp(patternStr,"i");
}

//标识，帐号，姓名，部门，岗位，首字母，教工类型，部部门类型，性别
function User(identify,id,name,dept,job,firstChar,workType,orgType,sex,mobile){
    if(mobile=="null")mobile="";
	this.identify = identify;
	this.id = id;
	this.name = name+"["+mobile+"]";
	this.dept = dept;
	this.job = job;
	this.firstChar = firstChar;
	this.workType = workType;
	this.orgType = orgType;
	this.sex = sex;
	this.isRight = false;//是否被选中
	this.index = 0;
	this.mobile=mobile;
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
			case 'sex':
				return pattern.test(seperator + this.sex + seperator);
			case 'orgType':
				return pattern.test(seperator + this.orgType + seperator);
			case 'orgType_all':
				return this.orgType > 0;
			default:
				return pattern.test(this.name);
		}
	}
	this.isMatch = compare_by_type;

}
</script>

<script language="JavaScript">

function window_onload() {
	 window.returnValue = 'cancel=?';
}

var returnObj=function(){
	this.value="";
	this.text="";
}

function unload() {
     if(window.returnValue != null) {
     } else {
         	var obj = new Object();
	 obj.id = '-1';
	 obj.name = ''
 	window.returnValue = obj;
     }
 }
 function doCancel(){
	 var obj = new Object();
	 obj.id = '-1';
	 obj.name = '';
 	window.close();
 }
</script>

<script language="JavaScript">
function doOK(){
	var retObj = null;;
	var strRetValue = "";
	var strRetText = "";
	var retArr=[];
	var index=0;
	for(var i=0;i<selArr.length;i++){
		retObj=new returnObj();
		//if(obj.children[i].tagName=="SELECT"){
		var opts=selArr[i].options;
		for(var j=0;j<opts.length;j++){
			retObj.value+=opts[j].value+",";
			retObj.text+=opts[j].text+",";
		}
		if(retObj.value!="") retObj.value=retObj.value.substring(0,retObj.value.length-1);
		if(retObj.text!="") retObj.text=retObj.text.substring(0,retObj.text.length-1);
		retArr[index++]=retObj;
	}
	window.returnValue = retArr;
	//alert('window.returnValue is ' + window.returnValue)
	window.close();
}
</script>


<script language="JavaScript">
//标识，帐号，姓名，部门，岗位，首字母，教工类型，部部门类型，性别
	var userArray = new Array()
	 <logic:iterate id="resultset" property="list[@type='allusers']">
	   userArray[userArray.length] = new User('<bean:write id="resultset" property="UserEntity/operatorID" />','<bean:write id="resultset" property="UserEntity/operatorID" />','<bean:write id="resultset" property="UserEntity/operatorName" />','<bean:write id="resultset" property="UserEntity/orgId" />','<bean:write id="resultset" property="UserEntity/position" />','<bean:write id="resultset" property="UserEntity/firstChar" />','<bean:write id="resultset" property="UserEntity/workType" />','<bean:write id="resultset" property="UserEntity/orgType" />','<bean:write id="resultset" property="UserEntity/sex"/>','<bean:write id="resultset" property="UserEntity/MobileTel"/>');
	 </logic:iterate>

</script>

<body onLoad="initSelect();">
<form method="post" action="talent.pr.deptSelectUsersToSave.do">
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
	  <tr>
		<td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
		  
		  
		  <tr>
				<td height="30" align="center" class="text">多个人员选择
				  
				</td>
		  </tr>
		  
		  <tr>
			  <td valign="top" class="text">
				<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
					<tr class="td2" > 
					  
                  <td height="25" align="center"> 部门： <html:select property="bmSelectList" size="1" style="width:200;" onchange="initSelect('dept')"> 
                    <script>
						document.write(bmOptionstest);
					</script> 
                    </html:select> &nbsp; 性别： 
                    <input name="sex" type="radio" value="1" onClick="initSex(this)">男&nbsp;<input name="sex" type="radio" value="0" onClick="initSex(this)">女
						</td>
					</tr>
					<tr class="td1" > 
					  <td height="25" align="center">
					  	部门类型：
						<select name="orgTypeTemp" id="orgTypeTemp" onchange="initSelect('orgType')">
							<option value="-1">全部类型</option>
							<option value="1">教研部门</option>
							<option value="2">行政部门</option>
							<option value="3">其他</option>
						</select>
						&nbsp;
						人名搜索：<input type="text" name="search" style="width:150;" class="input" onkeyup="javascript:query();" oldValue="">
						</td>
					</tr>
					<tr class="td2" > 
					  <td height="25" align="center">
					  按姓字母检索：
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
                              <td><input name="selectAll" type="button" class="button_02" value=" >>" onclick="moveAllFrom('left')"/></td>
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
                              <td><input name="delAll" type="button" class="button_02" value="<< "  onclick="moveAllFrom('right')"/></td>
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
						<input name="Button" type="button" class="button_02" value="保 存" onClick="doOK()">
						<input name="Submit2" type="button" class="button_02" value="返 回" onClick="doCancel()">
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
	document.all.bmSelectList.value = "99999"
	document.all.orgTypeTemp.value = "-1"
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
			document.all.orgTypeTemp.value = "-1";
        	if(document.all.bmSelectList.value != 99999) {
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
					
						from.add(option);
					
					//from.add(option);
				}
			}
		}
		break;
	case 'sex':
		setPattern(patternStr);
		for(user in userArray) {
				if(userArray[user].isMatch('sex') && userArray[user].isRight==false) {
					var option = new Option(userArray[user].name,userArray[user].id);
					
						from.add(option);
					
					//from.add(option);
				}
		}
	
		break;
		
	case 'orgType':
		document.all.bmSelectList.value = "99999";
		if(document.all.orgTypeTemp.value != -1) {
				patternStr = seperator + document.all.orgTypeTemp.value + seperator;
				setPattern(patternStr);

				
				for(user in userArray) {
						if(userArray[user].isMatch('orgType') && userArray[user].isRight==false) {
							
							
							var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
						}
				}
        	}else {
				for(user in userArray) {
						if(userArray[user].isMatch('orgType_all') && userArray[user].isRight==false) {
							
							var option = new Option(userArray[user].name,userArray[user].id);
							from.add(option);
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
				
					from.add(option);
				
			    
			}
		}
		break;
	}
}
function initSelectDept() {
    for(var i = 0 ; i < document.all.bmSelectList.options.length ; i ++) {
        if(document.all.bmSelectList.options[i].value == 99999) {
            document.all.bmSelectList.options[i].selected = true;
            document.all.bmSelectList.value = 99999;
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

function initSex(obj) {
	document.all.bmSelectList.value = "99999"
	document.all.orgTypeTemp.value = "-1"
	
	patternStr = seperator + obj.value + seperator;
	initSelect('sex');
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

function fccMoveAllFromRight() {
	var tempfrom = document.getElementById("receiver");
	var tempto = document.all.leftSelect;
	var type = "right";
	for(var i = 0 ; i < tempfrom.options.length ; i ++) {
		tempOption = new Option(tempfrom.options[i].text,tempfrom.options[i].value);
                setRight(type);
		tempto.add(tempOption);
		tempfrom.options[i] = null;
		i--;
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
	currentRightSel.className = "selected";

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
			
			from.add(option);
			
			//from.add(option);
		}
	}
}
</script>
<script language="JavaScript">
var userIds;
var idArr=[];
var selArr=[];//左边select box对象数组
document.title = "部门负责人选择";
userIds = window.dialogArguments;
var btnName = popArray(userIds);
setFocus(btnName);
var childrens=document.all.selContainer.children;
var selIndex=0;


var aryData = new Array();
for(var idx=0; idx< userIds.length-1; idx++){
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
	return "receiver";
	
	
}
</script>

