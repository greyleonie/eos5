
<%@include file="/internet/common.jsp"%>
<title>���в���ע���</title>
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
              ���в���ע���         
          </td>
          </tr>
      </table></td>
    </tr>
  </table>

    
  <table width=""  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" align="left"><table width=""  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr >
            <td align="right" class="td2" width="">
           �����             
           </td>
            <td class="td1">            
          <html:textarea property="Course/orgView" rows="6" onblur="checkLen()" cols="63"/>   
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
 
   
     theValue=document.frm.elements["Course/orgView"].value; 

  if(theValue==""){  
    document.frm.elements["Course/orgView"].value=initContent;   
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
    checkValue=frm.elements["Course/orgView"].value;
 }else{
    checkValue=frm.elements["Course/orgView"].value;
 }
    if(checkValue.length>250){
     alert("�����������ܳ���250�����֣�");
     return false;
   }else return true;
  
}

 function save(){
  var flag=checkLen();

  if(flag==true){
  frm.action="teachWorkManage.prMakeTeachPlan.leadSetOpinion4Course.do";
  frm.target="_self";
  frm.submit();
  }
 }
</script>