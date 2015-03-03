<%@include file="/internet/common.jsp"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<script type="text/javascript">
<logic:present property="message" >
alert('<bean:write property="message"/>');
</logic:present>
</script>

<form method="post"  action="teachWorkManage.prWorkLoad.collectModifyDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教师工作量录入—&gt;工作量修改</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="WorkLoadCollect/_order/col1/field"/>
		<html:hidden property="WorkLoadCollect/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="WorkLoadCollect/CollectID"/>
		<html:hidden property="WorkLoadCollect/Yearth"/>
		<html:hidden property="WorkLoadCollect/Period"/>
		<html:hidden property="WorkLoadCollect/TeachingGroupID"/>
		<html:hidden property="WorkLoadCollect/TeacherID"/>
		
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0"  class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">

      <tr> 
            <td  align="right"  class="td2" width="10%">年&nbsp;&nbsp;&nbsp;&nbsp;度：</td>
            <td class="td1" width="10%">&nbsp;<bean:write  property="WorkLoadCollect/Yearth"/> </td>
             <td  align="right"  class="td2" width="10%">时&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
            <td class="td1"  width="10%">&nbsp;<logic:equal property="WorkLoadCollect/Period" value="1">上半年</logic:equal>
                <logic:equal property="WorkLoadCollect/Period" value="2">下半年</logic:equal>       
			    </td>
          <td align="right"  class="td2" width="10%">所属教研部： </td>
          <td  class="td1" width="20%">&nbsp;<bean:write property="WorkLoadCollect/orgName"  /> </td>
           <td align="right"  class="td2" width="10%">教&nbsp;&nbsp;&nbsp;&nbsp;师： </td>
          <td class="td1"  width="20%">&nbsp;<bean:write property="WorkLoadCollect/operatorName"  /></td>
        </tr></table>
        
        
        
        
         <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="10%" align="center" bgcolor="#4A82D1" class="textb_wirte">统计信息</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="80%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <%
		             int count=0;
		             int i=0;
		             int j=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="typeresult" property="list[@type='WorkType']"> 
                
                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
              
                <td width="20%" nowrap rowspan="<bean:write id="typeresult" property="WorkType/TypeNum"/>"><bean:write id="typeresult" property="WorkType/WorkType"/> </td>
                
                <logic:iterate id="convertresult" property="list[@type='WorkLoadConvert']"> 
                	<logic:equal id="convertresult" property="WorkLoadConvert/WorkType" value="WorkType/WorkType" valueType="variable" valueId="typeresult">
		                              <%i++;j++; if(i!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%>
		                <td width="30%" nowrap><bean:write  id="convertresult" property="WorkLoadConvert/WorkItem"/></td>
		                <td width="20%" nowrap><input type="text" name="NumField/field<%=j%>"  onkeyup="changeNum(<%=j %>)" class="input" size="5"/>
		                ×<bean:write  id="convertresult" property="WorkLoadConvert/ClassNum"/>
		                <td width="20%" nowrap align="left"><bean:write  id="convertresult" property="WorkLoadConvert/Unit"/></td>
		                <input type="hidden" name="UnitField/field<%=j%>" value="<bean:write  id="convertresult" property="WorkLoadConvert/ClassNum"/>" />
		                
		                <td width="10%" nowrap>＝<input type="text" name="ClassField/field<%=j%>"   readonly   class="input" size="5"/>课次</td>
					 </tr>
	               </logic:equal>
                </logic:iterate>
             
                </logic:iterate> 
                <tr class="td1"><td  nowrap align="right">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td><td colspan="4" nowrap ><html:textarea  property="WorkLoadCollect/Remark"  style="width:100%;" attributesText='class="input" rows="5" cols="60" '/></td></tr>
                 <tr class="td1"><td colspan="5" nowrap align="right">局级班课次：<html:text  property="WorkLoadCollect/LessonsJB1" onkeyup="changeJB(1)"  attributesText='class="input" size="10"'/>课次&nbsp;&nbsp;&nbsp;&nbsp;处级班课次：<html:text  property="WorkLoadCollect/LessonsJB2"  onkeyup="changeJB(2)" attributesText='class="input" size="10"'/>课次&nbsp;&nbsp;&nbsp;&nbsp;其它班课次：<html:text  property="WorkLoadCollect/LessonsJB3"  onkeyup="changeJB(3)"  attributesText='class="input" size="10"'/>课次&nbsp;&nbsp;&nbsp;&nbsp;折算总课次：<html:text  property="WorkLoadCollect/ClassSum"  onkeyup="changeSum(0)" attributesText='class="input" size="10"'/>课次</td></tr>
       <html:hidden  property="WorkLoad/LessonsJB1" />
       <html:hidden  property="WorkLoad/LessonsJB2" />
       <html:hidden  property="WorkLoad/LessonsJB3" />
       
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
    <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
	frm.submit()};
  
  }
  	function changeTeacher() {
		var frm = document.opeForm;

		var Yearth_value = opeForm.elements["WorkLoadCollect/Yearth"].value;
		var Period_value =  opeForm.elements["WorkLoadCollect/Period"].value;
		var TeacherID_value = opeForm.elements["WorkLoadCollect/TeacherID"].value;
		var BeginDate = "";
		var EndDate = "";
		if(Yearth_value==""){
			alert("年度不能为空");
		}
		if(Period_value==""){
			alert("时期不能为空");
		}else if(Period_value=="1"){
			
			BeginDate = Yearth_value +"-"+"2-1";
			EndDate = Yearth_value +"-"+"8-1";
		}else if(Period_value=="2"){
			BeginDate = Yearth_value +"-"+"8-1";
			EndDate = Yearth_value +"-"+"2-1";
		}
		
		document.frames["verifyFrame"].location.href = "teachWorkManage.prWorkLoad.statisWorkLoad.do?input/TeacherID=" + TeacherID_value+"&input/BeginDate=" + BeginDate+"&input/EndDate=" + EndDate;
		
 		
	}
	
 function changeJB(index) {
		var JB_name = "WorkLoadCollect/LessonsJB"+index;
		var JB_source = "WorkLoad/LessonsJB"+index;
		var source = Number(opeForm.elements[JB_source].value);
		if(!isNumeric(opeForm.elements[JB_name].value)){
			alert("必须为数字");
			return;
		}
		opeForm.elements[JB_source].value = opeForm.elements[JB_name].value;
		var diff = opeForm.elements[JB_name].value -source;
		changeSum(diff);
	} 
  function changeNum(index) {
		var ClassField_name = "ClassField/field"+index;
		var UnitField_name = "UnitField/field"+index;
		var NumField_name = "NumField/field"+index;
		var UnitField_value = Number(opeForm.elements[UnitField_name].value);
		var k=event.keyCode;
		
		if( !(event.keyCode>=48&&event.keyCode<=57) && !(event.keyCode>=96&&event.keyCode<=105))
        {
           alert("必须为数字");
           opeForm.elements[NumField_name].value = 0;
           return false;
        }
		
		if(!isNumeric(opeForm.elements[NumField_name].value)){
			alert("必须为数字");
			return;
		}
		var NumField_value = parseInt(opeForm.elements[NumField_name].value);
		var source = Number(opeForm.elements[ClassField_name].value);
		opeForm.elements[ClassField_name].value = formatFloat(NumField_value * UnitField_value);
		var diff = opeForm.elements[ClassField_name].value -source;
		changeSum(diff);
	}
 function changeSum(diff) {
 	if(!isNumeric(opeForm.elements["WorkLoadCollect/ClassSum"].value)){
			alert("必须为数字");
			return;
		}
	  	var total = Number(opeForm.elements["WorkLoadCollect/ClassSum"].value);
	  	var diff = Number(diff);
		opeForm.elements["WorkLoadCollect/ClassSum"].value =formatFloat(total+diff) ;
	}
	
	
	function statisWorkLoad(){
	 var frm=document.forms["opeForm"];
	 	frm.elements["NumField/field1"].value = "<bean:write property="WorkLoadCollect/Lessons1"/>";
	 frm.elements["ClassField/field1"].value = "<bean:write property="WorkLoadCollect/ClassSum1"/>";
	 	 frm.elements["NumField/field2"].value = "<bean:write property="WorkLoadCollect/Lessons2"/>";
	 frm.elements["ClassField/field2"].value = "<bean:write property="WorkLoadCollect/ClassSum2"/>";
	 	 frm.elements["NumField/field3"].value = "<bean:write property="WorkLoadCollect/Lessons3"/>";
	 frm.elements["ClassField/field3"].value = "<bean:write property="WorkLoadCollect/ClassSum3"/>";
	 	 frm.elements["NumField/field4"].value = "<bean:write property="WorkLoadCollect/Lessons4"/>";
	 frm.elements["ClassField/field4"].value = "<bean:write property="WorkLoadCollect/ClassSum4"/>";
	 	 frm.elements["NumField/field5"].value = 0;
	 frm.elements["ClassField/field5"].value = 0;
	 	 frm.elements["NumField/field6"].value = 0;
	 frm.elements["ClassField/field6"].value = 0;
	 	 frm.elements["NumField/field7"].value = 0;
	 frm.elements["ClassField/field7"].value = 0;
	 	 frm.elements["NumField/field13"].value = "<bean:write property="WorkLoadCollect/model4"/>";
	 frm.elements["ClassField/field13"].value = "<bean:write property="WorkLoadCollect/model4Num"/>";
	 	 	 frm.elements["NumField/field14"].value = "<bean:write property="WorkLoadCollect/model5"/>";
	 frm.elements["ClassField/field14"].value = "<bean:write property="WorkLoadCollect/model5Num"/>";



	 frm.elements["WorkLoadCollect/LessonsJB1"].value = "<bean:write property="WorkLoadCollect/jb0Num"/>";
	 frm.elements["WorkLoadCollect/LessonsJB2"].value = "<bean:write property="WorkLoadCollect/jb1Num"/>";
	 frm.elements["WorkLoadCollect/LessonsJB3"].value = "<bean:write property="WorkLoadCollect/jb2Num"/>";
	 frm.elements["WorkLoad/LessonsJB1"].value = "<bean:write property="WorkLoadCollect/jb0Num"/>";
	 frm.elements["WorkLoad/LessonsJB2"].value = "<bean:write property="WorkLoadCollect/jb1Num"/>";
	 frm.elements["WorkLoad/LessonsJB3"].value = "<bean:write property="WorkLoadCollect/jb2Num"/>";
	 frm.elements["WorkLoadCollect/ClassSum"].value = "<bean:write property="WorkLoadCollect/total"/>";
	
	}
	
	
	function formatFloat(src){
    return Math.round(src*Math.pow(10, 3))/Math.pow(10, 3);
}
  </script>
  
  <script>
	statisWorkLoad();
</script>