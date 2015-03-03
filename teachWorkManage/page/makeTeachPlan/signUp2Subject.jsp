<%@include file="/internet/common.jsp"%>
<body>
<form name="form1" method="post">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="isAdd"/>
<html:hidden property="checkIds"/>
<html:hidden property="fileName"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;专题班报名情况</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <html:select property="TeachingPlan/PlanID" onchange="selectPlan()" > 
              <html:option value="-1">--请选择教学计划--</html:option> 
              <html:options property="list[@type='TeachingPlan']/TeachingPlan/PlanID" labelProperty="list[@type='TeachingPlan']/TeachingPlan/PlanName"/> 
              </html:select>
               <input name="view" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">     
               <input name="view2" type="button" class="button_02" value="打 印" onClick="iePrint()">                   
                          </td>
        </tr>
      </table>      
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" class="td_title">
            <td width="8%">项目序号</td>
            <td width="15%">专题项目及<br>
            负责教研部</td>
            <td width="14%">开班时间及学时</td>
            <td width="13%">局级领导干部<br>
            （人数）<br></td>
            <td width="11%">处级领导干部<br>
            （人数）</td>
            <td width="11%">其他（人数）</td>
            <td width="12%">合计（人数）</td>
            <td width="8%">报名详细</td>
            <td width="8%">是否开班</td>
          </tr>
          <%int count=1; %>
          <logic:iterate id="resultSet" property="list[@type='SpecialSubject']">
          <tr class="td2">
            <td width="8%" align="center"><%=count%></td>
            <td width="15%"><bean:write id="resultSet" property="SpecialSubject/Title"/>
            （<bean:write id="resultSet" property="SpecialSubject/teachIngGroup"/>）</td>
            <td width="14%"><bean:write id="resultSet" property="SpecialSubject/ClassTime"/> 学时：<bean:write id="resultSet" property="SpecialSubject/ClassHour"/>天</td>
            <td width="13%" align="center"><bean:write id="resultSet" property="SpecialSubject/ju"/></td>
            <td width="11%" align="center"><bean:write id="resultSet" property="SpecialSubject/chu"/></td>
            <td width="11%" align="center"><bean:write id="resultSet" property="SpecialSubject/other"/></td>
            <td width="12%" align="center"><bean:write id="resultSet" property="SpecialSubject/all"/></td>
            <td width="8%" align="center"><a href="javascript:signDetail('<bean:write id="resultSet" property="SpecialSubject/SpecialID"/>')">报名详细</a></td>
            <td width="8%" align="center">
              <%
               String status=""; 
               String isDisable="";
              %>
              <logic:greaterThan id="resultSet" property="SpecialSubject/ClassID" value="0">
                   <%
                   status="checked disabled"; 
                   isDisable="true";
                   %>
              </logic:greaterThan>
            <input type="checkbox" onclick="createClass()"  <%=status %> name="chkBox" value='<bean:write id="resultSet" property="SpecialSubject/SpecialID"/>'>开班
            <html:hidden id="resultSet" property="SpecialSubject/ClassID"/>
            </td>
         
          </tr>
           <%count++; %>
          </logic:iterate>
      
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text">
              <script>
				PageCond(document.forms[0]);
		     </script>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
 function signDetail(specialId){
    document.forms[0].action="teachWorkManage.prMakeTeachPlan.signDetail.do?SpecialSubject/SpecialID="+specialId;
    document.forms[0].target="_blank";
    document.forms[0].submit();
 }
 
 function selectPlan(){
  var planId=document.form1.elements["TeachingPlan/PlanID"].value;
  if(planId!="-1"){
      frm.elements["PageCond/count"].value="";
      frm.elements["PageCond/begin"].value="";
      frm.elements["PageCond/length"].value="";
      document.form1.action="teachWorkManage.prMakeTeachPlan.signUp2Subject.do";
      document.form1.submit();
  }
 }
 
 function createClass(){
    document.all("isAdd").value="1";
    document.forms[0].action="teachWorkManage.prMakeTeachPlan.addClass.do?Class=";
    document.forms[0].target="_blank";
   
    var countChecked="";
 
    
 
   var planId=frm.elements["TeachingPlan/PlanID"];
   frm.elements["fileName"].value=planId.options[planId.selectedIndex].text;   
    document.forms[0].submit();
 }
 

function targetCourse(){
  var array=frm.elements;
  var len=array.length;
  
  
  for(var i=0;i<len;i++){
     var obj=array[i];
    
    if(obj.type=="checkbox"&&obj.checked){
     alert(array[i+1].value);
     }
  }
}
 
function groupCourseId(){
   var checkIds="";   
   var array=frm.elements["chkBox"];
   var classIdArray=frm.elements["SpecialSubject/ClassID"];
   var len=array.length;
   var countChecked=0;
   for(var i=0;i<len;i++){
       var obj=array[i];      
       if(obj.type=="checkbox"&&classIdArray[i].value==""||classIdArray[i].value=="0"){
        if(obj.checked){
           if(checkIds==""){
              checkIds=obj.value;
              countChecked++;
           }else{
              checkIds+=","+obj.value; 
              countChecked++;
           }//end else
        }        
       }// end if(obj.type=="checkbox")
   }//end for   

 document.forms[0].elements["checkIds"].value=checkIds;
 return countChecked;
}
 
</script>