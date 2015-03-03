<%@include file="/internet/common.jsp"%>


<body>
<form name="addUPdateForm" method="post">
<html:hidden property="isAdd"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;查看教学计划框架</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="TeachingPlan/PlanID"/> 
      <html:hidden property="TeachingPlan/State"/> 
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">教学计划名称：</td>
            <td width="88%" class="td1">
            <bean:write property="TeachingPlan/PlanName"/>
           </td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td class="td1">
            <logic:iterate id="clsssResult" property="list[@type='Class']">
             <logic:equal value="Class/ClassID" valueType="variable" valueId="clsssResult" property="TeachingPlan/ClassID">
               <bean:write id="clsssResult" property="Class/ClassName"/>
                </logic:equal>
            </logic:iterate>         
       </td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
            <td class="td1">从<bean:write property="TeachingPlan/StartTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
         至  <bean:write property="TeachingPlan/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          </td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学计划类型：　</td>
            <td class="td1">
            <dict:write businTypeId="BNDICT_teachPlanType" property="TeachingPlan/PlanType"/>
          </td>
          </tr>
          <tr>
            <td align="right" class="td2">教学目的：</td>
            <td class="td1">
             <bean:write property="TeachingPlan/Purpose"/>
         </td>   
          </tr>
         
          <tr>
            <td align="right" class="td2">教学方法：</td>
            <td class="td1">
             <bean:write property="TeachingPlan/Arrange"/>
          </td>   
          </tr>
         
          <tr>
            <td align="right" class="td2">学习内容及安排：</td>
            <td class="td1">
              <bean:write property="TeachingPlan/Method"/>
         </td>   
          </tr>
        
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">实施要求（教学组织管理）：</td>
            <td class="td1">
            <bean:write property="TeachingPlan/Implement"/>
              &nbsp;</td>   
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">学习考核：</td>
            <td class="td1">
            <bean:write property="TeachingPlan/ck"/>
              &nbsp;</td>   
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备注：</td>
            <td class="td1">
            <bean:write property="TeachingPlan/reamrk"/>
              &nbsp;</td>   
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp; 
                <input name="Submit2" type="button" class="button_02" value="返 回" onclick="window.history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script language="javascript">
var frm=document.addUPdateForm;

function save(){
if(frm.elements["TeachingPlan/ClassID"].value=="-1"){
  alert("请选择班级！");
  return;
}else{
  frm.action="teachWorkManage.prMakeTeachPlan.saveTeachPlan.do";
  frm.submit();
  }
}

function checkContentLen(objName,obj){
  if(obj.value.length>1000){
      alert(objName+"字数不能超过1000个！");
      obj.focus();
      return;
  }
}

function goBak(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond=";
 frm.target="_self";
 frm.submit();
}

function selectClass(){
     var refresMark=new Date().getTime();
  var loc="teachWorkManage.prMakeTeachPlan.selectClass.do?Class/isHistoryClass=0&refrSSSeshMark="+refresMark;
  var acceptValue="";
  try{
     acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
   }catch(e){}
}
</script>