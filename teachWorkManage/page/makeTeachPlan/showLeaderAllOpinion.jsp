
<%@include file="/internet/common.jsp"%>

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
               <logic:lessThan value="4" property="planStatus">
                  审核意见
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">                 
              审批意见              
            </logic:greaterThan>           
              </td>
          </tr>
      </table></td>
    </tr>
  </table>
    
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">意见汇总：</td>
            </tr>
          <%int i=0; %>
         <logic:iterate id="resultSet" property="list[@type='Course']">
         <%++i; %>
          <tr> 
            <td colspan="13" class="td1"><%=i %>：
            <logic:lessThan value="4" property="planStatus">
               <bean:write id="resultSet" property="Course/Opinion"/>
            </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">
               <bean:write id="resultSet" property="Course/Approval"/>
            </logic:greaterThan>
            </td>
            </tr>
         </logic:iterate>  
   </table>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">
             <logic:lessThan value="4" property="planStatus">
           审核意见：
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">     
            审批意见：             
            </logic:greaterThan> 
           </td>
            </tr>
      
   </table>  
  <table width=""  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" width="776">
      <table width=""  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="104">
            <logic:lessThan value="4" property="planStatus">
           审核意见：
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">     
            审批意见：             
            </logic:greaterThan> </td>
            <td class="td1">
            <logic:lessThan value="4" property="planStatus">
          <html:textarea property="TeachingPlan/Opinion" rows="6" onblur="checkLen()" cols="63"/>   
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">     
           <html:textarea property="TeachingPlan/Approval" rows="6" onblur="checkLen()" cols="63"/>           
            </logic:greaterThan> 
           
           
            </td>
          </tr>
        </table>
     
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><html:hidden property="TeachingPlan/PlanID"/>
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
  if(msg!=""){
     alert(msg);
     window.close();
  }
</script>
<script language="javascript">
var frm=document.frm;

function checkLen(){
var  planStatus=frm.elements["planStatus"].value;
var  checkValue="";

if(planStatus=="4"){
  checkValue=frm.elements["TeachingPlan/Approval"].value;
}else{
  checkValue=frm.elements["TeachingPlan/Opinion"].value;
}
    if(checkValue.length>1000){
     alert("输入的意见不能超过1000个汉字！");
     return false;
   }else return true;
}

 function save(){
  var flag=checkLen();
  if(flag==true){
  frm.action="teachWorkManage.prMakeTeachPlan.leaderSetOpinion4Plan.do";
  frm.submit();
  }
 }
</script>