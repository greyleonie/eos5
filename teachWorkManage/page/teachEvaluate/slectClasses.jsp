<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*,talent.core.*;"%>
<title>选择班级</title>
<%
  talent.core.AllTeachPlan.init(); 
  ArrayList classList=AllTeachPlan.returnClassList(request);
  int countClass=0;
  if(classList!=null){
     countClass=classList.size();
  }
  talent.core.AllTeachPlan.closeCon();
%>
<body onload="initSelect();">
<form name="frm" action="teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do" method="post">
<html:hidden property="Evaluation/EvaluationID"/>
<html:hidden property="Evaluation/Class"/>
<html:hidden property="Evaluation/ClassName"/>
<html:hidden property="Evaluation/unClassID"/>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
    <tr>
      <td>
          <table>          
             <tr><td height="30" class="text">选择班级： <INPUT type="radio" name="current" onclick="changeStatus('0')" checked="checked">当前班级  <INPUT type="radio" name="current" onclick="changeStatus('1')" checked="checked">所有班级</td></tr>
             <tr><td algin="center">
             <select name="leftSelect" size="5" style="width: 530;height:100"  multiple onDBLClick="moveObj(this,document.frm.rightSelect)"></td></tr>
             <tr align="center">
               <td> <input name="selectAll" type="button" class="button_02" value="添加"  onclick="selectObj(document.frm.leftSelect,document.frm.rightSelect)"/> 
               <input name="selectAll" type="button" class="button_02" value="删除已选"  onclick="selectObj(document.frm.rightSelect,document.frm.leftSelect)"/> 
                              </td>
                            </tr>
             <tr><td class="text">已选择班级：</td></tr>
             <tr><td algin="center">
             <select name="rightSelect" size="5" style="width: 530;height:100"  multiple onDBLClick="moveObj(this,document.frm.leftSelect)">
             </td></tr>
             </table>
      </td>
    </tr>
     <tr>
      <td>
       <table border="0" align="center" cellpadding="0" cellspacing="1">
       
        <tr>          
            <td height="30" class="text" algin="center">
            <html:hidden property="single"/>
            <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">            
			<input name="Button" type="button" class="button_02" value="返 回" onClick="window.close()">
			</td>
		</tr>
       </table>
      </td>
    </tr>
  </table>
</form>
<script>

</script>
<script language="javascript">
function classObj(id,name,remark,state){
this.id=id;
this.name=name;
this.remark=remark;
this.state=state;
}

var classArray=new Array();
var single="";//是否单选
function initSelect(){
  var i=-1;
  var frm = document.forms[0];
  var classId=frm.elements["Evaluation/Class"].value;
  var classIds="";
  var className=frm.elements["Evaluation/ClassName"].value;
  var unClassIds="";
  var unClassId=frm.elements["Evaluation/unClassID"].value;
  
  single='<bean:write property="single"/>';
 <%
   ClassEnt clazz=new ClassEnt();
   String className="";
   int classId=0;
   String state="";
   int isHistory=0;
 for(int i=0;i<countClass;i++){
   clazz=(ClassEnt)classList.get(i);
   classId=clazz.getClassId();
   className=clazz.getClassName();
   state=clazz.getState();
   isHistory=clazz.getIsHistoryClass();
   //System.out.println("=============:"+classId+"==========className:"+className);
 %>
    var flag=0;
    var state='<%=state%>';
    var classid = '<%=classId%>';
    
    if (unClassId.indexOf(",")>=0) {
       unClassIds = unClassId.split(",");
    
       for (var j=0;j<unClassIds.length;j++) {
           if (classid == unClassIds[j]) {
              flag = 1;
              break;
           }
       }
    } else {
       if (unClassId.indexOf(classid)>=0) flag=1;
    }
    if (state=="6" && flag==0) {  //初始列出教学计划状态为6的
       var option=new Option('<%=className%>','<%=classId%>');
       document.frm.leftSelect.add(option);
    }
    var obj=new classObj('<%=classId%>','<%=className%>','<%=isHistory%>','<%=state%>');
    
    classArray[++i]=obj;
   
 <%
 }
 %>
 
 if (classId.indexOf(",")>=0) {
    classIds = classId.split(",");
    classNames = className.split(",");
    
    for (var i=0;i<classIds.length;i++) {
        var option=new Option(classNames[i],classIds[i]);
        document.frm.rightSelect.add(option);
        if (unClassId.indexOf(classIds[i])>=0) option.disable=true;
    }
 } else {
    if (classId != "") {
       var option=new Option(className,classId);
       document.frm.rightSelect.add(option);
       if (unClassId.indexOf(classIds[i])>=0) option.disable=true;
    }
 }
}

function moveObj(resource,target){
  var frm = document.forms[0];
  var unClassId=frm.elements["Evaluation/unClassID"].value;
  
  if (target.name == "leftSelect") {
     var itemValue=resource.options[resource.selectedIndex].value;
     
     if (unClassId.indexOf(itemValue)>=0) {
        alert("该班级已经有评估记录，不能删除！");
        return false;
     }
  }
  
  while(resource.selectedIndex>-1){           
	    var itemValue=resource.options[resource.selectedIndex].value;
		var itemText=resource.options[resource.selectedIndex].text;
	
		var newObj=new Option(itemText,itemValue);
		target.add(newObj);
		resource.remove(resource.selectedIndex);
 }
}



function selectObj(left,right){//点按钮增加还是删除
   while(left.selectedIndex>-1){   
	      var theValue=left.options[left.selectedIndex].value;
		  var theText=left.options[left.selectedIndex].text;
		  var newObj=new Option(theText,theValue);
		  right.add(newObj);	
		  left.remove(left.selectedIndex);
   }
}

function save(){//返回信息
 var rightSel=document.frm.rightSelect;
 var ids="";
 var names="";
 var array=new Array();
 var contSelected=0;
 
 if(rightSel.length>0){
    for(var i=0;i<rightSel.length;i++){
       var id=rightSel[i].value;
       var name=rightSel[i].text;      
       if(ids==""){
          ids=id;
          names=name;
          contSelected++;
       }else{
          ids=ids+","+id;
          names=names+","+name;
          contSelected++;
       }
    }//end for
 } //end if
 
 //if(contSelected>5){
    //alert("最多只能选择5个班！");
    //return;
 //}
 
 array[0]=ids;
 array[1]=names;
 //if(ids!=""){
 document.forms[0].elements["Evaluation/Class"].value=ids;
 //alert(document.forms[0].elements["Evaluation/Class"].value);
 document.forms[0].submit();
 //}
 window.close();
}


function changeStatus(remark){//选择当前班级还是所有的
  clearAll(document.frm.leftSelect,document.frm.rightSelect);
  var len=classArray.length;
  
  for(var i=0;i<len;i++){
     var obj=classArray[i];
     var state=obj.state;
     var rm = obj.remark;
     
     if(remark=="0"){
       if(rm=="0" && state=="6"){
          var classId=obj.id;
          var className=obj.name;
          var option=new Option(className,classId);
          document.frm.leftSelect.add(option);
       }
     }else{
          var classId=obj.id;
          var className=obj.name;
          var option=new Option(className,classId);
          document.frm.leftSelect.add(option);
     }
  }
  
}

function clearAll(leftObj,rightObj){//清空2个框
 var leftLen=leftObj.length;
 var rightLen=rightObj.length;
 
 try{
 for(var i=leftLen-1;i>=0;i--){
   leftObj.remove(i);
  }
  for(var i=rightLen-1;i>=0;i--){
   //rightObj.remove(i);
  }
 
 }catch(e){}
 
}
</script>