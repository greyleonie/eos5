<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*,talent.core.*;"%>
<title>ѡ��༶</title>
<%
  talent.core.AllTeachPlan.init(); 
  ArrayList classList=AllTeachPlan.returnClassList(request);
  int countClass=0;
  if(classList!=null){
     countClass=classList.size();
  }
  talent.core.AllTeachPlan.closeCon();
%>
<body onload="initSelect()">
<form name="frm" method="post">
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
    <tr>
      <td>
          <table>          
            <td height="30" class="text">ѡ��༶�� 
             <input type="radio" name="radioName" value="0" onclick="changeStatus('0')">��ǰ�༶
             <input type="radio" name="radioName" value="1" onclick="changeStatus('1')" checked="checked">���а༶</td></tr>
             <tr><td algin="center">
             <select name="leftSelect" size="5" style="width: 530;height:100"  multiple onDBLClick="moveObj(this,document.frm.rightSelect)"></td></tr>
             <tr align="center"> 
               <td> <input name="selectAll" type="button" class="button_02" value="���"  onclick="selectObj(document.frm.leftSelect,document.frm.rightSelect)"/> 
               <input name="selectAll" type="button" class="button_02" value="ɾ����ѡ"  onclick="selectObj(document.frm.rightSelect,document.frm.leftSelect)"/> 
                              </td>
                            </tr>
             <tr><td class="text">��ѡ��༶��</td></tr>
             <tr><td algin="center"><select name="rightSelect" size="5" style="width: 530;height:100"  multiple onDBLClick="moveObj(this,document.frm.leftSelect)"></td></tr>
             </table>
      </td>
    </tr>
     <tr>
      <td>
       <table border="0" align="center" cellpadding="0" cellspacing="1">
       
        <tr>          
            <td height="30" class="text" algin="center">
            <html:hidden property="single"/>
            <input name="Button" type="button" class="button_02" value="ȷ ��" onClick="save()">            
			<input name="Button" type="button" class="button_02" value="�� ��" onClick="window.close()">
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
var single="";//�Ƿ�ѡ
function initSelect(){
  var i=-1;
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
   
    var state='<%=state%>';
   if(state=="6"){//��ʼ�г���ѧ�ƻ�״̬Ϊ6��
    var option=new Option('<%=className%>','<%=classId%>');
    document.frm.leftSelect.add(option);
    }
    var obj=new classObj('<%=classId%>','<%=className%>','<%=isHistory%>','<%=state%>');
    
    classArray[++i]=obj;
   
 <%
 }
 %> 
 
 var el=document.frm.elements["radioName"];
 el[0].checked=true;

  
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



function selectObj(left,right){//�㰴ť���ӻ���ɾ��
   while(left.selectedIndex>-1){   
	      var theValue=left.options[left.selectedIndex].value;
		  var theText=left.options[left.selectedIndex].text;
		  var newObj=new Option(theText,theValue);
		  right.add(newObj);	
		 left.remove(left.selectedIndex);	 
   }
 }

function save(){//������Ϣ
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
 
 if(contSelected>5){
    alert("���ֻ��ѡ��5���࣡");
    return;
 }
 
 array[0]=ids;
 array[1]=names;
 if(ids!=""){
 window.returnValue=array;
 }
 window.close();
  }


function changeStatus(remark){//ѡ��ǰ�༶�������е�
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

function clearAll(leftObj,rightObj){//���2����
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