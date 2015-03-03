<%@include file="/internet/common.jsp"%>



<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;<logic:equal property="isAdd" value="1">新增</logic:equal><logic:notEqual property="isAdd" value="1">修改</logic:notEqual>教学单元</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="TeachingPlanUnit/UnitID"/>
      <html:hidden property="TeachingPlanUnit/PlanID"/>
      <html:hidden property="TeachingPlanUnit/ClassID"/>
      <html:hidden property="isAdd"/>  
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="TeachingPlan/EndTime"/>
      <input name="latestUnitEndTime" type="hidden" value="<bean:write property="list[@type='TeachingPlanUnit']/TeachingPlanUnit/latestEndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>">
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          </td>
        </tr>
      </table>      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">班级名称：</td>
            <td width="88%" class="td1">
           <bean:write property="className"/>  
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学单元名称：</td>
            <td class="td1">
             <html:text maxlength="10" property="TeachingPlanUnit/UnitName" attributesText='class="input" size="80"'/>
           
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学单元主题：</td>
            <td class="td1">
              <html:text maxlength="100" property="TeachingPlanUnit/UnitTitle" attributesText='class="input" size="80"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">单元记分方式：</td>
            <td class="td1">
            <dict:select businTypeId="BNDICT_unitScoreType" property="TeachingPlanUnit/ScoringMethod" nullOption="true" nullLabel="---请选择---" />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">负责教研部：</td>
            <td class="td1">
            <html:hidden property="TeachingPlanUnit/Department"/>
            <input name="dep" type="text" value='<bean:write property="TeachingPlanUnit/dep"/>' readonly="true" class="input" size="50"> 
             <input name="Button" type="button" class="button_02" value="选 择" elname="TeachingPlanUnit/Department,dep" onClick="selectSysOrg()">              
              <font color="#C0C0C0">（可多选）</font>
              <input name="button1" type="button" class="button_02" onClick="clearValue('1')"  value="清空" style="width: 54; height: 18"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">负&nbsp;责&nbsp;人：</td>
            <td class="td1"> 
            <html:hidden property="TeachingPlanUnit/Principal"/>
            <input name="head" type="text" readonly="true" value='<bean:write property="TeachingPlanUnit/head"/>' class="input" size="50">            
              <input name="Button" type="button" class="button_02" value="选 择" elname="TeachingPlanUnit/Principal,head" onClick="selectHead()">
            &nbsp; 
              <font color="#C0C0C0">（可多选）</font>
              <input name="button2" type="button" class="button_02" onClick="clearValue(
              '2')" value="清空" style="width: 54; height: 18"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">开始时间：</td>
            <td class="td1">
        <html:text property="TeachingPlanUnit/BeginTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30" ValidateType="notempty" Msg="开始时间不能为空"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TeachingPlanUnit/BeginTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <font color="#FF0000">*</font>
            
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">结束时间：</td>
            <td class="td1">
               <html:text property="TeachingPlanUnit/EndTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30" ValidateType="notempty" Msg="结束时间不能为空"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TeachingPlanUnit/EndTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <font color="#FF0000">*</font>
             
              </td>
          </tr>
          
              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">学&nbsp;&nbsp;&nbsp;&nbsp;时：</td>
            <td class="td1">
               <html:text  maxlength="5"  onblur="check(this,'学时')" property="TeachingPlanUnit/ClassHour" attributesText='class="input" size="30"' />  
             
              </td>
          </tr>
               <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">学&nbsp;&nbsp;&nbsp;&nbsp;分：</td>
            <td class="td1">
               <html:text  maxlength="6"  onblur="check(this,'学分')" property="TeachingPlanUnit/Credit" attributesText='class="input" size="30"' />  
             
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学要求：</td>
            <td class="td1">
            <html:textarea onblur="checkContentLen('教学要求',this)" property="TeachingPlanUnit/Demand" attributesText='cols="92" rows="6"'/></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Submit" type="button" class="button_02" value="保 存" onclick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onclick="goBack()"></td>
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
var frm=document.unitForm;

 function clearValue(flag){
    if(flag=="1"){
   
       frm.elements["dep"].value="";
       frm.elements["TeachingPlanUnit/Department"].value="";
    }else{
       frm.elements["head"].value="";
       frm.elements["TeachingPlanUnit/Principal"].value="";
    }
 }
 
 function checkContentLen(objName,obj){
  if(obj.value.length>250){
      alert(objName+"字数不能超过250个！");
      obj.focus();
      return;
  }
}

function save(){

    var end=frm.elements["TeachingPlanUnit/EndTime[@pattern='yyyy-MM-dd']"].value;
    var start=frm.elements["TeachingPlanUnit/BeginTime[@pattern='yyyy-MM-dd']"].value;
    var latestUnitEndTime=frm.elements["latestUnitEndTime"].value.trim();
    var planEndTime=frm.elements["TeachingPlan/EndTime"].value;
     
     
    
    
  if(start==""||end==""){
     alert("开始时间和结束时间都不能为空！");
     return;
  }else{
 
  if(start>end){
     alert("开始时间必须小于结束时间！");
       return;
  }
 
   frm.action="teachWorkManage.prMakeTeachPlan.saveUnit.do";
   
   <logic:present property="isFinalUnit" >
     frm.action="teachWorkManage.prMakeTeachPlan.saveFinalPlanUnit.do";
   </logic:present>
   frm.submit();
  }
}

function goBack(){
javascript:history.go(-1);
    // frm.elements["TeachingPlanUnit/UnitID"].value="";
    // frm.elements["TeachingPlanUnit/PlanID"].value="";
    // frm.elements["TeachingPlanUnit/ClassID"].value="";
   //  frm.elements["TeachingPlan/EndTime"].value="";
//frm.action="teachWorkManage.prMakeTeachPlan.editUnit.do";
//frm.submit();
}

function selectDep(){
   var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prMakeTeachPlan.selectOrgs.do?refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{ 
      acceptValue= window.showModalDialog(loc,"","dialogWidth:560px;DialogHeight=450px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
      if(ids!=""&&ids!="undefind"){
         frm.elements["TeachingPlanUnit/Department"].value=ids;
         frm.elements["dep"].value=names;
      }
}

function selectHead(){
   var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prClassInfoManage.selectTeacher.do?flag=1&refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
      acceptValue= window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=550px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
      if(ids!=""&&ids!="undefind"){
        frm.elements["TeachingPlanUnit/Principal"].value=ids;
        frm.elements["head"].value=names;
        }
  
}

function checkValue(){
  if(frm.elements["TeachingPlanUnit/EndTime[@pattern='yyyy-MM-dd']"].value==""||frm.elements["TeachingPlanUnit/BeginTime[@pattern='yyyy-MM-dd']"].value==""){
     alert("开始时间和结束时间都不能为空！");
     return;
  }
}

 function check(obj,theName){ 
     if(obj.value!=""&&!isInteger(obj.value)){
        alert(theName+"必须是整数！");
        return;
     }
  }
 function isInteger( str ){  
	var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(str);
}


 function   date2str(d){   
  var   ret=d.getFullYear()+"-"   
  ret+=("00"+(d.getMonth()+1)).slice(-2)+"-"   
  ret+=("00"+d.getDate()).slice(-2)+"   "   
  ret+=("00"+d.getHours()).slice(-2)+":"   
  ret+=("00"+d.getMinutes()).slice(-2)+":"   
  ret+=("00"+d.getSeconds()).slice(-2)+"."   
  return   ret+d.getMilliseconds()   
  }
  
 function   str2date(str){   
  var   d=null;   
  var   reg=/^(\d{4})-(\d{2})-(\d{2})   (\d{2}):(\d{2}):(\d{2})\.(\d+)$/   
  if(arr=str.match(reg))d=new   Date(Number(arr[1]),Number(arr[2])-1,Number(arr[3]),Number(arr[4]),Number(arr[5]),Number(arr[6]),Number(arr[7]))   
  return   d;   
  }
  
  function selectHead(){
  var orgId=frm.elements["TeachingPlanUnit/Department"].value;
  var orgName=frm.elements["dep"].value;  
  var array=new Array();
  var condition="";
  if(orgId!=""){
    array=orgId.split(",");
  }
  for(var i=0;i<array.length;i++){  
      if(condition==""){
        condition=" o.orgId="+array[i];
      }else{
       condition+=" or o.orgId="+array[i];
      }
  }//end for
  
  if(condition!=""){
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.queryTeacherByOrgIds.do?remark="+remark+"&condition="+condition+"&orgNames="+orgName;
    var info=window.showModalDialog(loc,"","DialogWidth:400px;DiaglogHeight:100px;status:yes");
    frm.elements["TeachingPlanUnit/Principal"].value=info[0];
    frm.elements["head"].value=info[1];
  }else{
     selectSysUser();
     }
   }
</script>