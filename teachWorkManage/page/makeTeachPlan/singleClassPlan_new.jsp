
<%@include file="/internet/common.jsp"%>
<%base.util.RightParse RP = new base.util.RightParse();
	boolean issue = RP.parse("DX_teachWork_sc.DX_teachWork_sc_add",session) ;
	boolean canUpdate = RP.parse("DX_teachWork_sc.DX_teachWork_sc_u",session) ;
	boolean canDel = RP.parse("DX_teachWork_sc.DX_teachWork_sc_d",session) ;
	 %>

<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—>教务管理—>教学计划编制—>教学计划定稿（单班教学计划）</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TeachingPlan/PlanID"/>         
       <input type="hidden" name="TeachingPlanUnit/ClassID" value="<bean:write property="TeachingPlan/ClassID"/>">     
       <html:hidden property="loc" value="6"/>    
       <html:hidden property="isAdd"/>   
       <html:hidden property="isAdopted"/> 
       <input type="hidden" name="Course/ClassID" value="<bean:write property="TeachingPlan/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlan/ClassID"/>">     
       <input type="hidden" name="fileName">
       </td>
    </tr>
    
    
    <tr>
      <td class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text" nowrap> 
           <html:select property="TeachingPlan/ClassID" onchange="selectClass()" attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>
            <input name="B3" type="button" class="button_02" value="导 出" onClick="export2Doc()">
            <input name="B3" type="button" class="button_02" value="打 印" onClick="iePrint()">  
          <qx:talentButton property="B3" type="button" styleClass="button_eight" value="发布到教学互动平台" onclick="send2NetWork()" operation="DX_teachWork_sc.DX_teachWork_sc_2net"/>
          <!-- <qx:talentButton property="B4" type="button" styleClass="button_02" value="新增单元" onclick="addUnit()" operation="DX_teachWork_sc.DX_teachWork_sc_addUnit"/> -->
          <!--<input name="B3" type="button" class="button_eight" value="查看历史版本" onClick="historyVersionView()"> -->
         
          </td>
        </tr>       
      </table>   
      <table  width="100%" id="listdetail"><tr><td>
		<table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">		
		<%
			int unitID=0;
			int i=0;
		 %>
		<logic:iterate id="result" property="list[@type='CourseNew']">
			<%
				com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.REQUEST_REQUEST_CONTEXT);
				String strUnitID=(String)reqContext.getEntityValue("list[@type='CourseNew']/entity[@rowNum='"+i+"']/unitID");
				//out.println(strUnitID);
				if(Integer.parseInt(strUnitID)!=unitID){
			%>
				<tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="result" property="entity/unitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  <bean:write id="result" property="entity/unitName"/>&nbsp;&nbsp; 
                    <bean:write id="result" property="entity/unitTitle"/>&nbsp;&nbsp; 开始日期:<bean:write id="result" property="entity/beginTime"/>
                     结束日期:<bean:write id="result" property="entity/endTime"/></td>
                  <td  align="center" nowrap class="td_title">
       <%if(issue){ %>        
<input name="Submit53" type="hidden" class="button_02_blue" value="新建课程" onClick="addSubject('<bean:write id="result" property="entity/unitID"/>')">
  <%}else{ %> 
  <input name="Submit53" disabled="true" type="hidden" class="button_02_blue" value="新建课程" onClick="addSubject('<bean:write id="result" property="entity/unitID"/>')">
 
  <%} %>           
               </td>
                </tr>
                
                  <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="result" property="entity/unitID"/>','3')"> 
                  <td width="71%" align="left" colspan="2" class="td_title">教学要求：<bean:write id="result" property="entity/demand"/>
                 </td>
                 
                </tr>
              </table></td>
          </tr>
          <tr class="td2"> 
            <td width="10%" align="center">日期</td>

            <td width="5%" align="center">时间</td>
            <td width="5%" align="center">午别</td>
            <td width="5%" align="center">星期</td>
            <td width="15%" align="center">学习内容</td>
            <td width="7%" align="center">地　点</td>
            <td width="5%" align="center">考勤</td>
            <td width="8%" align="center">教学形式</td>
            <td width="11%" align="center">课堂模式</td>
            <td width="7%" align="center">授课人</td>
            
            <td width="6%" align="center">主持人</td>
            <td width="8%" align="center">到会教师</td>
            
            <td align="center" width="8%">操 作</td>
          </tr>
			<%	
				}
			%>
			<tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="result" property="entity/courseID"/>','<bean:write id="result" property="entity/classID"/>')"> 
            <td align="center"><bean:write id="result" property="entity/classDate"/></td>
            <td align="center"><bean:write id="result" property="entity/classTime"/></td>
            <td align="center"><bean:write id="result" property="entity/businName"/></td>
            <td align="center">
	            <logic:equal id="result" value="1" property="entity/weekDay">一</logic:equal>
	            <logic:equal id="result" value="2" property="entity/weekDay">二</logic:equal>
	            <logic:equal id="result" value="3" property="entity/weekDay">三</logic:equal>
	            <logic:equal id="result" value="4" property="entity/weekDay">四</logic:equal>
	            <logic:equal id="result" value="5" property="entity/weekDay">五</logic:equal>
	            <logic:equal id="result" value="6" property="entity/weekDay">六</logic:equal>
	            <logic:equal id="result" value="7" property="entity/weekDay">日</logic:equal>
            </td>
                  <td align="middle"><bean:write id="result" property="entity/courseTitle"/></td>
                  <td align="middle"><bean:write id="result" property="entity/roomName"/></td>
            <td align="middle">
            <logic:equal id="result" value="0" property="entity/isUseKQJ">否</logic:equal>
            <logic:equal id="result" value="1" property="entity/isUseKQJ">是</logic:equal>
            </td>
                  <td align="middle"><bean:write id="result" property="entity/educatingMode"/></td>
                  <td align="middle"><bean:write id="result" property="entity/rangeMode"/></td>
                  <td align="middle">
                  <SCRIPT>
                  	var teacher1='<bean:write id="result" property="entity/teacher"/>';
                  	var teacher2='<bean:write id="result" property="entity/outSider"/>';
                  	if(teacher1!=''&&teacher2!=''){
                  		document.write(teacher1+'&nbsp;'+teacher2);
                  	}
                  	if(teacher1==''&&teacher2!=''){
                  		document.write(teacher2);
                  	}
                  	if(teacher1!=''&&teacher2==''){
                  		document.write(teacher1);
                  	}
                  	if(teacher1==''&&teacher2==''){
                  		document.write('&nbsp;');
                  	}
                  </SCRIPT>
                  </td>
                  
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/dj"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/daoHui"/></td>
                  <td align="center"><p>
                  <a href="javascript:updateSubject('<bean:write id="result" property="entity/courseID"/>','<bean:write id="result" property="entity/classID"/>')">修改</a>
                  </p></td>
                  
                  <!--
            <td align="center"><p>
            <%if(canDel){ %>
            <a href="javascript:delSubject('<bean:write id="result" property="entity/courseID"/>')">删除</a>
            <%}else{%>
            删除
            <%}
            if(canUpdate){
             %>
            <a href="javascript:updateSubject('<bean:write id="result" property="entity/courseID"/>','<bean:write id="result" property="entity/classID"/>')">修改</a>
           <%}else{ %> 
           修改
           <%} %>
            </p></td>-->
            
          </tr>
			<%	
				unitID=Integer.parseInt(strUnitID);
				i++;
			%>
		</logic:iterate>
		</TABLE>
		
        </td></tr></table>
      </td>
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
var frm=document.unitForm;
function goBak(){
 frm.elements["TeachingPlan/PlanID"].value="";
 frm.elements["TeachingPlan/ClassID"].value="";
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond="; 
 frm.submit();
}

function historyVersionView(){
  var re=(new Date()).getTime();
  var classId=frm.elements["TeachingPlan/ClassID"].value;
  var loc="teachWorkManage.prMakeTeachPlan.showHistoryVersion.do?TeachingPlan/ClassID="+classId+"&re="+re;
//  window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=550px;dialogHeight=350px;status=yes;scrro=yes');
  window.open(loc,'','top=200,left=200,,Width=550px,,Height=350px,status=yes,scrollbars=yes');
}



function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes");  
}

function delUnit(unitId){
 if(confirm("删除该单元会删除其相关的课程，是否确定？")==false){
			return ;
		}
 frm.action="teachWorkManage.prMakeTeachPlan.delUnit.do?unitId="+unitId;
 frm.submit();
}

function updateUnit(unitId,flag){
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=6&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}
function addSubject(unitId){
  frm.target="";
  frm.action="teachWorkManage.prMakeTeachPlan.toAddCourse.do?unitID="+unitId;
  frm.submit();
}



function updateSubject(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=6&Course/CourseID="+coruseId+"&Course/ClassID="+frm.elements["TeachingPlanUnit/ClassID"].value;
  frm.elements["isAdd"].value="2";
  frm.target="";
  frm.submit();
}

function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=6&Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
   frm.target="";
  frm.submit();
}

function selectClass(){

 if(frm.elements["TeachingPlan/ClassID"].value!="-1"){ 
  frm.elements["TeachingPlan/PlanID"].value="";
  frm.elements["Course/ClassID"].value="";
  frm.elements["TeachingPlanUnit/ClassID"].value=frm.elements["TeachingPlan/ClassID"].value;
  frm.elements["Class/ClassID"].value=frm.elements["TeachingPlan/ClassID"].value;
  frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan_new.do?TeachingPlan="; 
  frm.target="";
// alert(frm.target);
  frm.submit();    
 }
}

function showAdoptedCourse(remark){
 frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted="+remark;
 frm.submit();
}

function delSubject(coruseId){
 var time=(new Date()).getTime();
 var loc="teachWorkManage.prMakeTeachPlan.showMsg.do?rem="+time;
 var isBackUp="0";
 isBackUp=window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=320px;dialogHeight=180px;status=no');
 var dec="";
if(isBackUp=="-1"){
			return ;
} 

if(isBackUp=="1"){
 var path="teachWorkManage.prMakeTeachPlan.writeVersionDescription.do?rem="+time;
 dec=window.showModalDialog(path,'','top=200px;left=200px;dialogWidth=420px;dialogHeight=320px;status=no');

 if(dec=="undefined")dec="";
 
}

  frm.action="teachWorkManage.prMakeTeachPlan.delCourse.do?isBackUp="+isBackUp+"&Course/CourseID="+coruseId+"&dec="+dec;
 frm.submit();
}

function export2Doc(){
 frm.action="teachWorkManage.prMakeTeachPlan.printFinalPlan.do?isAdopted="+frm.elements["isAdopted"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
 frm.target = "_blank";
 frm.submit();
}

function send2NetWork(){
  var obj=frm.elements["TeachingPlan/ClassID"];
  
  frm.elements["fileName"].value=obj.options[obj.selectedIndex].text;
  frm.action="teachWorkManage.prMakeTeachPlan.sendTeachPlan2NetWork.do?isPecialSubject=0";
  frm.target="_blank"; 
  frm.submit();
}

function addUnit(){
  var obj=frm.elements["TeachingPlan/ClassID"];
  var theClassName=obj.options[obj.selectedIndex].text;
  frm.action="teachWorkManage.prMakeTeachPlan.finalPlanAddUnit.do?className="+theClassName;
  frm.submit();
}

function diaoKe(){
  var obj=frm.elements["TeachingPlan/ClassID"];
  var classId=obj.value;  
  var theClassName=obj.options[obj.selectedIndex].text;
  var remark=(new Date()).getTime();
  var url="teachWorkManage.prMakeTeachPlan.openDKwindow.do?classId="+classId+"&className="+theClassName+"&remark="+remark;
  window.open(url,"","width=600,height=400,top=100,left=100,status=yes");
}
</script>