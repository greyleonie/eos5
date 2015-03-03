<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*,talent.core.*;"%>
<%
   String ids=request.getParameter("condition");
   String orgNames=request.getParameter("orgNames");
   talent.core.AllTeachPlan.init(); 
   ArrayList list=new ArrayList();
   if(ids!=null&&!ids.equals(""))
    list=talent.core.AllTeachPlan.queryTeacherByOrgIds(ids);
   talent.core.AllTeachPlan.closeCon();
   int countTeacher=0;
   if(list!=null)countTeacher=list.size();
%>

<body onload="initSelect()">
<form name="frm" method="post">
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
    <tr>
      <td>
          <table>          
            <td nowrap colspan="3" class="text">已选教研部： 
            <%=orgNames %>
            </td></tr>
            <tr>
             <td align="left">
                  <select name="leftSelect" size="5" style="width: 150;height:220"  multiple onDBLClick="moveObj(this,document.frm.rightSelect)">
             </td>
              <td align="center">
               <input name="selectAll" type="button" class="button_02" value="添加"  onclick="selectObj(document.frm.leftSelect,document.frm.rightSelect)"/> 
               <input name="selectAll" type="button" class="button_02" value="删除已选"  onclick="selectObj(document.frm.rightSelect,document.frm.leftSelect)"/> 
              </td>
			  <td align="left">
			   <select name="rightSelect" size="5" style="width: 150;height:220"  multiple onDBLClick="moveObj(this,document.frm.leftSelect)">
			  </td>
              </tr>
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
 <%
   TeacherVo teacher=new TeacherVo();
   String teacherName="";
   String teacherId="";
   String orgName="";
  
 for(int i=0;i<countTeacher;i++){
   teacher=(TeacherVo)list.get(i);
   orgName=teacher.getFirstChar();
   teacherId=teacher.getUserId();
   teacherName=teacher.getUserName();
   //teacherName+="--"+orgName;
   //System.out.println("=============:"+classId+"==========className:"+className);
 %>
 var option=new Option('<%=teacherName%>','<%=teacherId%>');
 document.frm.leftSelect.add(option);
   
 <%
 }
 %> 


  
  }

function moveObj(resource,target){     

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