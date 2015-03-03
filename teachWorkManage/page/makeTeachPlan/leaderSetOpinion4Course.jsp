
<%@include file="/internet/common.jsp"%>
<title>领导针对课程审批</title>
<body>
<form name="frm" mehod="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15">
            <html:hidden property="planStatus"/>
             </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制     
              -&gt;
               <logic:lessThan property="planStatus" value="4">
                  审核意见
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">                 
              审批意见              
            </logic:greaterThan> 
          </td>
          </tr>
      </table></td>
    </tr>
  </table>

    
  <table width=""  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" width=""><table width=""  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr >
            <td align="right" class="td2" nowrap>
             <logic:lessThan property="planStatus" value="4">
           审核意见：
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">     
            审批意见：             
            </logic:greaterThan> </td>
            <td class="td1">            
             <logic:lessThan property="planStatus" value="4">
          <html:textarea property="Course/Opinion" rows="6" onblur="checkLen()" cols="50"/>   
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">     
           <html:textarea property="Course/Approval" rows="6" onblur="checkLen()" cols="50"/>           
            </logic:greaterThan> 
          
            </td>
          </tr>
        </table>
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><html:hidden property="Course/CourseID"/>
              <input name="Submit" type="button" class="button_02" value="保 存" onclick="save()">&nbsp;  
                <input name="Submit2" type="button" class="button_02" value="取 消" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
  
  </table>
</form>
</body>
<script>
  var msg='<bean:write property="msg"/>';
  var teachers='<bean:write property="Course/Teachers"/>';
  var date='<bean:write property="Course/ClassDate"/>';
  var time='<bean:write property="Course/ClassTime"/>';
  var courseName='<bean:write property="Course/CourseTitle"/>';
  var initContent=date+" "+time;
  if(teachers!=""){
    initContent+="授课人为"+teachers;
  }
  
 
  
  initContent+="的课程:"+courseName;
  var theValue="";
  var state=document.frm.elements["planStatus"].value;
 
  if(state!="4"){  
     theValue=document.frm.elements["Course/Opinion"].value;
  }else{
      theValue=document.frm.elements["Course/Approval"].value;
  }

  if(theValue==""){
  if(state!="4")
    document.frm.elements["Course/Opinion"].value=initContent;
    else document.frm.elements["Course/Approval"].value=initContent;
    }
  if(msg!=""){
     alert(msg);
     window.close();
  }
</script>
<script language="javascript">
var frm=document.frm;
function checkLen(){
 var checkValue="";
 var status=frm.elements["planStatus"].value
 if(status=="4"){
    checkValue=frm.elements["Course/Approval"].value;
 }else{
    checkValue=frm.elements["Course/Opinion"].value;
 }
    if(checkValue.length>250){
     alert("输入的意见不能超过250个汉字！");
     return false;
   }else return true;
  
}

 function save(){
  var flag=checkLen();
  var objValue="";
   try{
    objValue=document.forms[0].elements["Course/Approval"].value;
   }catch(e){}
   try{
    objValue=document.forms[0].elements["Course/Opinion"].value;
    }catch(e){}
   
  if(objValue==""){
    alert("请输入批注意见！");
    return;
  }
  if(flag==true){
  frm.action="teachWorkManage.prMakeTeachPlan.leadSetOpinion4Course.do";
  frm.target="_self";
  frm.submit();
  }
 }
</script>