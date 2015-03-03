<%@include file="/internet/common.jsp"%>
<style>
<!--
.Standard-ListDoubleTRStyle{
  Background-color:#CEE7FF;
  cursor:hand;
  FONT-SIZE:12px;
  line-height:15px;
}
--></style>
<title>手机号码选择</title>
<body>
<form name="usersForm" method="post">
  <input type="hidden" name="firstChar" value="">  
  <input type="hidden" name="part" value="2">  
  <html:hidden property="path"/> 
  <html:hidden property="sql"/> 
  <html:hidden property="SessionEntity/operatorID"/>
  <input type="hidden" name="SendMsg/AuthorID" value='<bean:write property="SessionEntity/operatorID"/>'>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
           <%
            String team=base.util.TalentContext.getValue(pageContext,null,"team");   
           %>     
					
          
		  <TR >
					<TD width="8%" class="td2" nowrap align="right">
						姓氏选择：
					</TD>
					
            <TD class="td1">
            <table border="0" cellspacing="1" cellpadding="0" align="center" width="100%" bgcolor="#6699CC" style="border-collapse:collapse"><tr height="16" class="Standard-ListDoubleTRStyle">
            <td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>A</div></td>
            <td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>B</div></td>
            <td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>C</div></td>
            <td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>D</div></td>
            <td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>E</div></td>
            <td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>F</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>G</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>H</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>I</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>J</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>K</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>L</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>M</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>N</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>O</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>P</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>Q</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>R</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>S</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>T</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>U</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>V</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>W</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>X</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>Y</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);"><div>Z</div></td>
<td align="center" value="unselected" onmouseover="mouseoverCol(this)" onmouseout="mouseoutCol(this)" onclick="selectCol(this);selectFirstChar(this);" width="5%"><div>其他</div></td>
</tr></table>

			</TD>
				</TR>
          
          <tr  >
            <td align="right" class="td2">用户列表： </td>
            <td class="td1">
            <select size="10" style="width:150"  multiple="multiple" name="userid" ondblclick="Confirm()"></select>
             <font color="#B51018">提示：按Ctrl键可多选</font>
            </td>
          </tr>
          <TR >
					<TD width="8%" class="td2" nowrap align="right">&nbsp;
					
					</TD>
					
            <TD class="td1">		
			<input name="B3" type="button" class="button_02" value="添加" onclick="Confirm()">
			<input name="B6" type="button" class="button_02" value="关闭" onclick="cancel()">
			</TD>
				</TR>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script language="JavaScript">
var frm=document.forms[0];
var selectedCol = null; 
function selectOrg(){
clearList();

 if(frm.elements["team"].value!=-1){
  if(frm.elements["path"].value=="1"){//部门的人员
     frm.action="ICCard.prMsg.userOfOrg.do";
   }else if(frm.elements["path"].value=="2"){
      frm.action="ICCard.prMsg.userOfClass.do";
   }else{
   frm.action="ICCard.prMsg.myTelBook.do";
   }
   frm.submit();
 }
}

function changeUserTeam(){
clearList();
  if(frm.elements["path"].value=="1"){//部门的人员
     frm.action="ICCard.prMsg.userOfOrg.do?team=-1";
   }else if(frm.elements["path"].value=="2"){//学员
      frm.action="ICCard.prMsg.userOfClass.do?team=-1";
   }else{
     frm.action="ICCard.prMsg.myTelBook.do?team=-1";
   }
   frm.submit();

}


function init(){//填充用户列表
	     <logic:iterate id="userList" property="list[@type='userInfo']">
	         var userName='<bean:write id="userList" property="entity/operatorname"/>';	   
	         var val='<bean:write id="userList" property="entity/mobileTel"/>';
	         var textval=userName+"["+val+"]";
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
		
function Confirm(){    	
		userList=frm.userid;
				
		if(userList.selectedIndex == -1) {
			alert("请在用户列表中选择!");
			userList.focus();
			return ;
		}	
		
		if(userList.options.length>0){			
			for(var i = 0; i < userList.options.length; i++){
				if(userList.options[i] != null && userList.options[i].selected == true){
					AddMobile(userList.options[i]);
				}
			}
		}
 	}
 	
 	function AddMobile(mobile){    
 		if(mobile.value.length==0){
			alert("用户:"+mobile.innerText+" 没有设置手机号码，添加失败！");
			return;
		}
		var obj=this.parent.window.opener.document.forms[0].elements["mobilenums"]; 
	//	mobilenumsObj=window.opener.messageForm.mobilenums;
		if(obj.options.length>0){
			for(i=0;i<obj.options.length;i++){
				if(trim(obj.options[i].value)==trim(mobile.value)){
					alert("用户:"+mobile.innerText+" 已在号码列表中，添加失败！");
					return;
				}
			}
		}
		//parent.frames["mainframe"].document.messageForm.addOption(mobile.innerText,mobile.value);	
        this.parent.window.opener.addOption(mobile.innerText,mobile.value);
		
 	}
 	
 function cancel(){
   this.parent.window.close();
 }	
 
 function selectRow(thisObject){
    if(selectedRow != null){
        selectedRow.value = "unselected";
        selectedRow.style.backgroundColor = "";
    }
    thisObject.value = "selected";
    //thisObject.style.backgroundColor = "#A5C7DE";
    thisObject.style.backgroundColor = "FFCF00";
    selectedRow = thisObject;
    ///
    try{
	   selectedRow.children[0].children[1].checked="true";
	}
	catch(Exception){}
}

function mouseoverRow(thisRow){

}

function mouseoutRow(thisRow){
  
}

function selectCol(thisObject){
    if(selectedCol != null){
        selectedCol.value = "unselected";
        selectedCol.style.backgroundColor = "";
    }
    thisObject.value = "selected";
    thisObject.style.backgroundColor = "#3969E7";
    selectedCol = thisObject;
    try{
	   selectedCol.children[0].children[1].checked="true";
	}
	catch(Exception){}
}

function mouseoverCol(thisCol){
    thisCol.style.backgroundColor = "#3969E7";
    thisCol.style.color = "";
}

function mouseoutCol(thisCol){
    if(thisCol.value == "unselected"){
        thisCol.style.backgroundColor = "";
        thisCol.style.color = "";
    }
    if(thisCol.value == "selected"){
        thisCol.style.backgroundColor = "#3969E7";
        thisCol.style.color = "";
        }
}
function selectFirstChar(thisObject){
		usersForm.firstChar.value=thisObject.childNodes.item(0).innerText;
		redirect();
	}
	
function redirect(){
    queryByFirstChar();
	document.forms[0].action="ICCard.prMsg.mobileWithChar.do";
	document.forms[0].submit();
	}
	
function queryByFirstChar(){
var selectName=this.parent.document.forms[0].elements["userField"].value;

var firstChar=frm.elements["firstChar"].value;

    if(selectName=="1"){//老师
     frm.elements["sql"].value="select e.operatorName as operatorname,s.MobileTel as mobileTel "+
                               "from EOSOperator e join student s on e.operatorID=s.studentid and e.operatorType=1 and Firstchar='"+firstChar+"'";
    }else if(selectName=="2"){//学员
    frm.elements["sql"].value="select e.operatorName as operatorname,s.MobileTel as mobileTel "+
                              "from EOSOperator e join teacher s on e.operatorID=s.TeacherID and s.MobileTel is not null and e.operatorType=2 and Firstchar='"+firstChar+"'";
    }else{//私人联系人
    frm.elements["sql"].value="select UserName as operatorname,MobileTel as  mobileTel from TelBook where HolderID='"+frm.elements["SessionEntity/operatorID"].value+"' and Firstchar='"+firstChar+"'";
    }
}
		
	init();
</script>