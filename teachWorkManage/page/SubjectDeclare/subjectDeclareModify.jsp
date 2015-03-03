<%@include file="/internet/common.jsp"%>


<form method="post" action="teachWorkManage.prSubjectDeclare.subjectDeclareModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;课题申报修改</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	     <html:hidden property="SubjectOfDeclared/SubjectID"/>
	     <html:hidden property="Status"/>
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
            <html:text property="SubjectOfDeclared/SubjectName" maxlength="30" attributesText='class="input" size="30" ValidateType="notempty" Msg="课题名称不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>

		  <tr> 
            <td width="21%" align="right" nowrap class="td2">对应板块： </td>
            <td width="79%" class="td1" height="30">&nbsp;
            <html:text property="SubjectOfDeclared/PlateNames" attributesText='class="input" size="60" readOnly="fcc" ValidateType="notempty" Msg="对应板块不能为空"'/>
            <html:hidden property="SubjectOfDeclared/PlateIDs"/><img src="/internet/image/cdgl2_02.gif" width="18" height="15" onClick="javascript:selectPlate('<bean:write property="SubjectOfDeclared/DeclareID"/>')" align="absmiddle">
            <span class="text_red">*</span>
            </td>
          </tr>
		  <tr> 
            <td width="21%" align="right" nowrap class="td2">适用班次： </td>
            <td width="79%" class="td1" height="30">&nbsp;             
            <html:text property="SubjectOfDeclared/Classes" attributesText='class="input" size="60"'/> 
            <img src="/internet/image/house.gif" width="18" height="15" onClick="javascript:selectClass()" align="absmiddle"></td>
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
  

function selectPlate(id){
	var frm = document.forms[0];
     var loc="teachWorkManage.prSubjectDeclare.selectSubjectPlate.do";
         loc +="?fid="+id;
     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
       //alert(ids);
       //alert(names);
     }catch(e){}
	
	frm.elements["SubjectOfDeclared/PlateIDs"].value=ids;
    frm.elements["SubjectOfDeclared/PlateNames"].value=names;
}
  </script>