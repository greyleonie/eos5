<%@include file="/internet/common.jsp"%>


<body>
<form name="frm" method="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;新增专题</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="isAdd"/>
      <html:hidden property="SpecialSubject/ClassTime"/>
      <html:hidden property="SpecialSubject/SpecialID"/>     
      <html:hidden property="SpecialSubject/PlanID"/>
      <html:hidden property="TeachingPlan/PlanID"/>
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" height="184">
          <tr  >
            <td width="12%" align="right" class="td2">专题题目：</td>
            <td width="88%" class="td1">
                <html:text  property="SpecialSubject/Title" attributesText='class="input" size="78" maxLength="100" ValidateType="notempty" Msg="专题题目不能为空"' />
        
              <font color="#FF0000">*&nbsp;</font></td>
          </tr>
              <tr  >
                 <td width="12%" align="right" class="td2">教研部：</td>
            <td  class="td1" nowrap  height="27">
            <html:select property="SpecialSubject/TeachingGroupID" > 
              <html:option value="-1">--选择教研部--</html:option>
               <html:options property="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgid" labelProperty="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgname"/> 
              </html:select>
 </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">培训目的：</td>
            <td class="td1"><html:textarea cols="66" property="SpecialSubject/Purpose" rows="5"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">培训对象：</td>
            <td class="td1">
            <html:text  property="SpecialSubject/Partner" attributesText='class="input" size="78" maxLength="25"'/>
             
            &nbsp;</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">培训方式：</td>
            <td class="td1">             
             <html:textarea cols="66" property="SpecialSubject/Method" rows="5"/>
                    </td>
          </tr>
          <tr>
            <td align="right" class="td2">开班时间：</td>
            <td class="td1">
              <table border="0"  cellspacing="0" cellpadding="0">
                <tr>
                <td width="8%"><font size="2">春  季:</font> 
                 <input type="checkbox" name="chkBox" value="2"><font size="2">2月</font>
                 <input type="checkbox" name="chkBox" value="3"><font size="2">3月</font>
                 <input type="checkbox" name="chkBox" value="4"><font size="2">4月</font>
              <font size="2">夏  季：
                 <input type="checkbox" name="chkBox" value="5"><font size="2">5月</font>
                 <input type="checkbox" name="chkBox" value="6"><font size="2">6月</font>
                 <input type="checkbox" name="chkBox" value="7"><font size="2">7月</font>
                <br>
                <font size="2"><font size="2">秋  季：
                  <input type="checkbox" name="chkBox" value="8"><font size="2">8月</font>
                  <input type="checkbox" name="chkBox" value="9"><font size="2">9月</font>
                  <input type="checkbox" name="chkBox" value="10"><font size="2">10月</font>
                <font size="2">冬  季：
                  <input type="checkbox" name="chkBox" value="11"><font size="2">11月</font>
                  <input type="checkbox" name="chkBox" value="12"><font size="2">12月</font>
                  <input type="checkbox" name="chkBox" value="1"><font size="2">1月</font></td> 
                </tr>
              </table> 
                </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"><font size="2">学&nbsp;&nbsp;&nbsp;&nbsp;时：</font></td>
            <td class="td1"><html:text onblur="judgeValue(this)" property="SpecialSubject/ClassHour" attributesText='class="input" size="6" ValidateType="notempty" Msg="学时不能为空" maxLength="3"'/>
            天 
            <font color="#FF0000">*</font></td>
          </tr>
             <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"><font size="2">学&nbsp;&nbsp;&nbsp;&nbsp;分：</font></td>
            <td class="td1"><html:text onblur="judgeValue(this)" property="SpecialSubject/Credit" attributesText='class="input" size="6" ValidateType="notempty" Msg="学分不能为空" maxLength="5"'/>
            
            <font color="#FF0000">*</font></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="button" type="button" onclick="save()" class="button_02" value="保 存">&nbsp; 
                <input name="Submit2" type="button" class="button_02" onclick="history.go(-1)" value="返 回"></td>
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
var frm=document.frm;
var msg="";


function countClassTime(){
   var checkIds="";
   var array=frm.elements["chkBox"];
   var len=array.length;
   
   for(var i=0;i<len;i++){
       var obj=array[i];
       if(obj.type=="checkbox"){
        if(obj.checked){
           if(checkIds==""){
              checkIds=obj.value;
           }else{
              checkIds+=","+obj.value; 
           }//end else
        }        
       }// end if(obj.type=="checkbox")
   }//end for

  frm.elements["SpecialSubject/ClassTime"].value=checkIds;
}

function intCheckbox(){
  var month='<bean:write property="SpecialSubject/ClassTime"/>';
  var array=new Array();
  if(month!=""){
    array=month.split(",");
  }//if
 
  var ele=frm.elements["chkBox"];
  
  for(var i=0;i<array.length;i++){
    var ckValue=array[i];
    for(var j=0;j<ele.length;j++){
       var objValue=ele[j].value;
      // alert("objValue:"+objValue+" ckValue:"+ckValue);
       if(objValue==ckValue){
          ele[j].checked=true;
       }//if
    }//for
  }//for
}

function save(){
if(frm.elements["SpecialSubject/Purpose"].value.length>250){
   msg="培训目的的文字不能超过250个！"+"\n";  
   alert(msg);
   return;
}
if(frm.elements["SpecialSubject/Method"].value.length>250){
   msg="培训方式的文字不能超过250个！";  
    alert(msg);
   return;
}

if(validater(frm)){
   countClassTime();
   frm.action="teachWorkManage.prMakeTeachPlan.saveSubject.do";
   frm.submit();
}
}

function judgeValue(obj){
  if(obj.value!=""){
  var remark=isInteger(obj.value);
  if(!remark)alert("输入错误，只能是整数！");
   }
}

function isUnsignedNumeric(obj)
{
 var newPar=/^\d+(\.\d+)?$/
 var flag=newPar.test(obj.value);
 if(!flag){
   alert("输入错误,只能是整数！");
   obj.focus();
   
 }
}

function isInteger( str ){  
	var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(str);
}



intCheckbox();
</script>