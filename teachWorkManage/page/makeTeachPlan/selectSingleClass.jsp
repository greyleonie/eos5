<%@include file="/internet/common.jsp"%>
<title>选择班级</title>
<body onload="initSelect()">
<form name="frm" method="post">
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
    <tr>
      <td>
          <table>          
            <td height="30" class="text">选择班级： 
             <input type="radio" name="radioName" value="0" onclick="changeStatus('0')">当前班级
             <input type="radio" name="radioName" value="1" onclick="changeStatus('1')">所有班级</td></tr>
             <tr><td algin="center">
             <select name="leftSelect" size="5" style="width: 530;height:100"   onDBLClick="moveObj(this,document.frm.rightSelect)"></td></tr>
             <tr align="center"> 
               <td> <input name="selectAll" type="button" class="button_02" value="添加"  onclick="selectObj(document.frm.leftSelect,document.frm.rightSelect)"/> 
               <input name="selectAll" type="button" class="button_02" value="删除已选"  onclick="selectObj(document.frm.rightSelect,document.frm.leftSelect)"/> 
                              </td>
                            </tr>
             <tr><td class="text">已选择班级：</td></tr>
             <tr><td algin="center"><select name="rightSelect" size="5" style="width: 530;height:100"   onDBLClick="moveObj(this,document.frm.leftSelect)"></td></tr>
             </table>
      </td>
    </tr>
     <tr>
      <td>
       <table border="0" align="center" cellpadding="0" cellspacing="1">
       
        <tr>          
            <td height="30" class="text" algin="center">
            <html:hidden property="single"/>
            <input name="Button" type="button" class="button_02" value="确 定" onClick="save()">            
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
  single='<bean:write property="single"/>';
 
  <logic:iterate id="arrayId" property="list[@type='Class']">
    var state='<bean:write id="arrayId" property="Class/state"/>';
   if(state=="6"){//初始列出教学计划状态为6的
    var option=new Option('<bean:write id="arrayId" property="Class/ClassName"/>','<bean:write id="arrayId" property="Class/ClassID"/>');
    document.frm.leftSelect.add(option);
    }
    var obj=new classObj('<bean:write id="arrayId" property="Class/ClassID"/>','<bean:write id="arrayId" property="Class/ClassName"/>','<bean:write id="arrayId" property="Class/isHistoryClass"/>','<bean:write id="arrayId" property="Class/state"/>');
    
    classArray[++i]=obj;
   // alert(classArray[classArray.length-1].name);
  </logic:iterate>
  
 
 var el=document.frm.elements["radioName"];
 el[0].checked=true;

  
  }

function moveObj(resource,target){ //双击时移动    

  while(resource.selectedIndex>-1){           
	    var itemValue=resource.options[resource.selectedIndex].value;
		var itemText=resource.options[resource.selectedIndex].text;	
	
		var newObj=new Option(itemText,itemValue);
		if(single=="true"&&target.name=="rightSelect")clearTarget(resource,target);
		target.add(newObj);
		resource.remove(resource.selectedIndex);
 }
}

function clearTarget(source,target){//先清空目标框

  for(var i=target.length-1;i>=0;i--){
          var theValue=target.options[i].value;
		  var theText=target.options[i].text;
		  var newObj=new Option(theText,theValue);
    source.add(newObj);
    target.remove(i); 
  }//end for

}

function selectObj(left,right){//点按钮增加还是删除
   while(left.selectedIndex>-1){   
	      var theValue=left.options[left.selectedIndex].value;
		  var theText=left.options[left.selectedIndex].text;
		  var newObj=new Option(theText,theValue);
		  if(single=="true"&&right.name=="rightSelect")clearTarget(left,right);
		  right.add(newObj);	
		 left.remove(left.selectedIndex);	 
   }
 }

function save(){//返回信息
 var rightSel=document.frm.rightSelect;
 var ids="";
 var names="";
 var array=new Array();
 
 if(rightSel.length>0){
    for(var i=0;i<rightSel.length;i++){
       var id=rightSel[i].value;
       var name=rightSel[i].text;      
       if(ids==""){
          ids=id;
          names=name;
       }else{
          ids=ids+","+id;
          names=names+","+name;
       }
    }//end for
 } //end if
 array[0]=ids;
 array[1]=names;
 if(ids!=""){
 window.returnValue=array;
 }
 window.close();
  }


function changeStatus(remark){//选择当前班级还是所有的
  clearAll(document.frm.leftSelect,document.frm.rightSelect);
  var len=classArray.length;
  
  for(var i=0;i<len;i++){
     var obj=classArray[i];
     var state=obj.state;    
     if(remark=="0"){
       if(state=="6"){
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
   rightObj.remove(i);
  }
 
 }catch(e){}
 
}
</script>