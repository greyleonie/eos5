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
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;新增教学计划框架</td>
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
             <html:text maxlength="50" property="TeachingPlan/PlanName" attributesText='class="input" size="80" ValidateType="notempty" Msg="教学计划名称不能为空"'/>
            <font color="#FF0000">*</font></td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)" id="classTr">
            <td align="right" class="td2">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td class="td1">
            <html:select property="TeachingPlan/ClassID" attributesText='id="printTable"' onchange="setTime()"> 
              <html:option value="-1">--请选择班级--</html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>
             
        <font color="#FF0000">*</font>(自选短训班教学计划不用选择)</td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
            <td class="td1">从
         <html:text property="TeachingPlan/StartTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30" ValidateType="notempty" Msg="开始时间不能为空"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TeachingPlan/StartTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             至 
           <html:text property="TeachingPlan/EndTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30" ValidateType="notempty" Msg="结束时间不能为空"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TeachingPlan/EndTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             <font color="#FF0000">*</font></td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学计划类型：　</td>
            <td class="td1"><dict:select businTypeId="BNDICT_teachPlanType" onchange="setStyle()" property="TeachingPlan/PlanType"  /></td>
          </tr>
         
            <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap>课题上报截止日期：　</td>
            <td class="td1">
            <html:text property="TeachingPlan/DateLine[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30" ValidateType="notempty" Msg="上报截止日期不能为空"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TeachingPlan/DateLine[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             <font color="#FF0000">*</font></td>
          </tr>
          <tr>
            <td align="right" class="td2">教学目的：</td>
            <td class="td1"><html:textarea onblur="checkContentLen('教学目的',this)" property="TeachingPlan/Purpose" attributesText='cols="92" rows="6"'/></textarea>
              &nbsp;</td>   
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">　</td>
            <td class="td1">　</td>
          </tr>
          <tr>
            <td align="right" class="td2">教学方法：</td>
            <td class="td1"><html:textarea onblur="checkContentLen('教学方法',this)" property="TeachingPlan/Arrange" attributesText='cols="92" rows="6"'/></textarea>
              &nbsp;</td>   
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">　</td>
            <td class="td1">　</td>
          </tr>
          <tr>
            <td align="right" class="td2">学习内容及安排：</td>
            <td class="td1"><html:textarea onblur="checkContentLen('学习内容及安排',this)" property="TeachingPlan/Method" attributesText='cols="92" rows="6"'/></textarea>
              &nbsp;</td>   
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">　</td>
            <td class="td1">　</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right"  class="td2">实施要求<br>（教学组织管理）：</td>
            <td class="td1"><html:textarea  onblur="checkContentLen('实施要求',this)" property="TeachingPlan/Implement" attributesText='cols="92" rows="6"'/>
              &nbsp;</td>  
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right"  class="td2">学习考核：</td>
            <td class="td1"><html:textarea  onblur="checkContentLen('学习考核',this)" property="TeachingPlan/ck" attributesText='cols="92" rows="6"'/>
              &nbsp;</td>  
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right"  class="td2">备注：</td>
            <td class="td1"><html:textarea  onblur="checkContentLen('备注',this)" property="TeachingPlan/reamrk" attributesText='cols="92" rows="6"'/>
              &nbsp;</td>  
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" onclick="save()" class="button_02" value="保 存">&nbsp; 
                <input name="Submit2" type="button" class="button_02" value="返 回" onclick="history.go(-1)"></td>
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
var end=frm.elements["TeachingPlan/EndTime[@pattern='yyyy-MM-dd']"].value;
var dateLine=frm.elements["TeachingPlan/DateLine[@pattern='yyyy-MM-dd']"].value;

if(frm.elements["TeachingPlan/ClassID"]!="undefiend"&&frm.elements["TeachingPlan/ClassID"].value=="-1"&&frm.elements["TeachingPlan/PlanType"].value!="2"){
  alert("请选择班级！");
  return;
}else{
 if(validater(frm)){
  if(frm.elements["TeachingPlan/ClassID"].value=="-1"&&frm.elements["TeachingPlan/PlanType"].value=="2"){
     frm.elements["TeachingPlan/ClassID"].value="";
  }
  frm.action="teachWorkManage.prMakeTeachPlan.saveTeachPlan.do";
  frm.submit();
   }
  }
}



function selectClass(){
  var refresMark=new Date().getTime();
  var loc="teachWorkManage.prMakeTeachPlan.selectClass.do?Class/isHistoryClass=0&refrSSSeshMark="+refresMark;
  var acceptValue="";
  try{
     acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
   }catch(e){}
}

function setStyle(){
   if(frm.elements["TeachingPlan/PlanType"].value!="2"){
     classTr.style.display="";
   }else{
    classTr.style.display="none";
   }
}
function checkContentLen(objName,obj){
  if(obj.value.length>1000){
      alert(objName+"字数不能超过1000个！");
      obj.focus();
      return;
  }
}





if(frm.elements["TeachingPlan/PlanType"].value=="2"){
   classTr.style.display="none";
}


function setTime(){ 
  var clId=frm.elements["TeachingPlan/ClassID"].value;
  var beg="";
  var end="";
  
  if(clId!=-1){
 
  
 for(var cla=0;cla<array.length;cla++){
    var c=new Array();
    c=array[cla];
  if(c[0]==clId){    
    if(c[1].length>7)beg=c[1].substring(0,4)+"-"+c[1].substring(4,6)+"-"+c[1].substring(6,8);
    if(c[2].length>7)end=c[2].substring(0,4)+"-"+c[2].substring(4,6)+"-"+c[2].substring(6,8);

     frm.elements["TeachingPlan/StartTime[@pattern='yyyy-MM-dd']"].value=beg;
     frm.elements["TeachingPlan/EndTime[@pattern='yyyy-MM-dd']"].value=end;
    }//end if  
   }//end for
  
  }else{
   frm.elements["TeachingPlan/StartTime[@pattern='yyyy-MM-dd']"].value="";
     frm.elements["TeachingPlan/EndTime[@pattern='yyyy-MM-dd']"].value="";
 
  
  }
}
</script>
<script>

function cla(id,beg,end){
   this.id=id;
   this.beg=beg;
   this.end=end;
}
</script>
<script language="javascript">
var array=new Array();
var count=0;

    <logic:iterate id="forClass" property="list[@type='Class']">
        var id='<bean:write id="forClass" property="Class/ClassID"/>';
        var beg='<bean:write id="forClass" property="Class/BeginTime"/>';
        var end='<bean:write id="forClass" property="Class/EndTime"/>';
      //  var c=new cla(id,beg,end);
      var c=new Array();
      c[0]=id;
      c[1]=beg;
      c[2]=end;    
      array[count]=c;
       count++;
    </logic:iterate>
//alert(array.length);
</script>