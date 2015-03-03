<%@include file="/internet/common.jsp"%>


<form method="post" action="teachWorkManage.prSubjectDeclare.subjectDeclareAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;课题申报</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	     <html:hidden name="SubjectOfDeclared/DeclareID" property="fid"/>
	     <html:hidden name="SubjectOfDeclared/DeptID" property="SessionEntity/orgID" />
	     <html:hidden name="SubjectOfDeclared/TeacherID" property="SessionEntity/operatorID"/>
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="21%" align="right" nowrap class="td2">课题名称： </td>
            <td width="79%" class="td1" height="30">&nbsp;
            <html:text property="SubjectOfDeclared/SubjectName" maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="课题名称不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>

		  <tr> 
            <td width="21%" align="right" nowrap class="td2">对应板块： </td>
            <td width="79%" class="td1"><html:hidden  property="SubjectOfDeclared/PlateIDs"/> 
            <table  border="0" cellpadding="0" cellspacing="0">
                <%int i=0; %>
                   <tr>
                    <logic:iterate id="resultset" property="list[@type='SubjectPlate']">   
                   <td class="td1" height="30">&nbsp;         
                  <input type="checkbox" name="chk" value='<bean:write id="resultset" property="SubjectPlate/PlateID"/>'>
                  <bean:write id="resultset" property="SubjectPlate/PlateName"/>&nbsp;&nbsp;        
                  <% i++;                
                 if(i%5==0){ %>
                  <tr>         
                   <%}%>  
                  </logic:iterate>
                  <%  i =i%5;if(i!=0){ 
                 for(int j=0;j<5-i;j++){ %>
                 <td class="td1">&nbsp;</td>
                <%}}%>
              </table>
            </td>
          </tr>
		  <tr> 
            <td width="21%" align="right" nowrap class="td2">适用班次： </td>
            <td width="79%" class="td1" height="30">&nbsp;             
            <html:text property="SubjectOfDeclared/Classes" attributesText='class="input" size="60"'/> <img src="/internet/image/house.gif" width="18" height="15" onClick="javascript:selectClass()" align="absmiddle"></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">设计意图： </td>
            <td class="td1" height="70">&nbsp;
            <html:textarea property="SubjectOfDeclared/Purpose" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">主任意见： </td>
            <td class="td1" height="70">&nbsp;
            <html:textarea property="SubjectOfDeclared/Advice" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <!--<tr> 
            <td align="right" nowrap class="td2">内容提要： </td>
            <td class="td1" height="70">&nbsp;
            <html:textarea property="SubjectOfDeclared/Content" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">教学思路： </td>
            <td class="td1" height="70">&nbsp;
            <html:textarea property="SubjectOfDeclared/Thought" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
		  <tr> 
            <td align="right" nowrap class="td2">方式方法： </td>
            <td class="td1" height="70">&nbsp;
            <html:textarea property="SubjectOfDeclared/Method" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>-->
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
  <script>

  function save() {
  	var frm = document.forms[0];
  	
    if(chechedCount(frm)<1){
       alert("对应板快至少必须选择一个！");
       return;
   }else{
     getChechedValue();
   }
	if(validater(frm)) frm.submit();
  
  }
  
  function selectClass(){
 	 var frm = document.forms[0];
     var loc="teachWorkManage.prNetCenter.selectClass.do";

     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}

    frm.elements["SubjectOfDeclared/Classes"].value=names;

  }
  

 
 
function getChechedValue() {
    var frm = document.forms[0];
	var eles = frm.elements;
		var i=0;
		var ids="";
		var names="";	

	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				   ids+=obj.value+",";
			     }			   
			}
			i++;
		}//while		
	
	frm.elements["SubjectOfDeclared/PlateIDs"].value=ids;
}
  </script>