
<%@include file="/internet/common.jsp"%>
<title>�쵼��Կγ�����</title>
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
            <td class="text_wirte">��ҳ -&gt; ������� -&gt;��ѧ�ƻ�����     
              -&gt;
               <logic:lessThan property="planStatus" value="4">
                  ������
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">                 
              �������              
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
           ��������
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">     
            ���������             
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
              <input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">&nbsp;  
                <input name="Submit2" type="button" class="button_02" value="ȡ ��" onclick="window.close()"></td>
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
    initContent+="�ڿ���Ϊ"+teachers;
  }
  
 
  
  initContent+="�Ŀγ�:"+courseName;
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
     alert("�����������ܳ���250�����֣�");
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
    alert("��������ע�����");
    return;
  }
  if(flag==true){
  frm.action="teachWorkManage.prMakeTeachPlan.leadSetOpinion4Course.do";
  frm.target="_self";
  frm.submit();
  }
 }
</script>