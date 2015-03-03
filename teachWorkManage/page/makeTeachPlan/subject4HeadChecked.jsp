<%@include file="/internet/common.jsp"%>


<title>教学计划编制-&gt;提交领导审核</title>
<body>
<form name="postForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制   
              -&gt;
            <logic:equal property="TeachingPlan/State" value="1">提交领导审核</logic:equal>
            <logic:equal property="TeachingPlan/State" value="-1">提交领导审核</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3">提交领导审批</logic:in>
              </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">     
       <html:hidden property="TeachingPlan/PlanID"/>
       <logic:equal property="TeachingPlan/State" value="1">        
          <html:hidden property="TeachingPlan/State" value="2"/>
          <html:hidden property="TeachingPlan/LeaderID"/>  
      </logic:equal><!--提交给审核-->
     <logic:equal property="TeachingPlan/State" value="-1">        
          <html:hidden property="TeachingPlan/State" value="2"/>
          <html:hidden property="TeachingPlan/LeaderID"/>  
      </logic:equal><!--提交给审核-->
      <logic:in property="TeachingPlan/State" value="-4,3">
        <html:hidden property="TeachingPlan/State" value="4"/>
        <html:hidden property="TeachingPlan/LeaderID2"/>       
      </logic:in>
  
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">计划名称：</td>
            <td class="td1"><bean:write property="TeachingPlan/PlanName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">
             <logic:equal property="TeachingPlan/State" value="-1"> 审核内容：</logic:equal>
             <logic:equal property="TeachingPlan/State" value="1"> 审核内容：</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3"> 审批内容：</logic:in>
           </td>
            <td class="td1">
            <logic:equal property="TeachingPlan/State" value="-1">教学计划框架</logic:equal>
            <logic:equal property="TeachingPlan/State" value="1">教学计划框架</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3">教学计划课程</logic:in>
           
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
               <td align="right" class="td2">
            <logic:equal property="TeachingPlan/State" value="-1">审核领导：</logic:equal>
            <logic:equal property="TeachingPlan/State" value="1">审核领导：</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3">审批领导：</logic:in>           
            </td>
            <td class="td1"><input name="leader" readonly="true" class="input" type="text">
             <logic:equal property="TeachingPlan/State" value="1">
             <input name="Button" type="button" class="button_02" value="选 择" elname="TeachingPlan/LeaderID,leader" onClick="selectSysUser('yes')"> 
           </logic:equal>
             <logic:equal property="TeachingPlan/State" value="-1">
             <input name="Button" type="button" class="button_02" value="选 择" elname="TeachingPlan/LeaderID,leader" onClick="selectSysUser('yes')"> 
           </logic:equal>
               <logic:in property="TeachingPlan/State" value="-4,3">
             <input name="Button" type="button" class="button_02" value="选 择" elname="TeachingPlan/LeaderID2,leader" onClick="selectSysUser('yes')"> 
           </logic:in>
            <font color="#FF0000">*</font> </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="提 交" onclick="save()">&nbsp;   
                <input name="Submit2" type="button" class="button_02" value="取 消" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
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
var frm=document.postForm;

function save(){
var state=frm.elements["TeachingPlan/State"].value;

if(state=="2"){
 if(frm.elements["TeachingPlan/LeaderID"].value==""){
   alert("请选择领导！");
   return;
 }
}

if(state=="4"){
 if(frm.elements["TeachingPlan/LeaderID2"].value==""){
   alert("请选择领导！");
   return;
 }
}
 frm.action="teachWorkManage.prMakeTeachPlan.sendFrame2Leader.do";
 frm.submit();
}
</script>