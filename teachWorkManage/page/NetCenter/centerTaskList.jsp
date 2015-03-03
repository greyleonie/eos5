<%@include file="/internet/common.jsp"%>
<body>
<form  method="post" name="frm" action="teachWorkManage.prNetCenter.centerTaskList.do"> 
<html:hidden property="input/degree"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td width="15"> </td>
            <td width="980" class="text_wirte">首页 -&gt; 教务管理 -&gt; 网络中心教学管理 -&gt; <span id="printTable">工作任务安排</span></td>   
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr><td height="8"> </td></tr>
    <tr>
      <td class="text">
      	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        	<tr>
          	<td height="30" class="text">
              开始日期：     
                 <html:text property="input/BeginDate" size="10"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/BeginDate"],"yyyy-MM-dd")>
			 结束日期：     
                 <html:text property="input/EndDate" size="10"/>             
               <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/EndDate"],"yyyy-MM-dd")> 
              <input name="B1" type="button"  class="button_02" value="查看任务" onclick="queryTask()">
              <logic:equal property="input/degree" value="0">
              <input name="B35" type="button" class="button_02" value="下周任务" onclick=" nextWeekTask()"> 
              </logic:equal>
               <logic:equal property="input/degree" value="1">
              <input name="B35" type="button" class="button_02" value="本周任务" onclick=" thisWeekTask()"> 
              </logic:equal>
              <br/>
               <qx:talentButton property="setinit" type="button" styleClass="button_eight" value="设置安排默认值" onclick="selectPeople()" operation="DX_TEACH_MANAGE_NETCENTER_ARRANGE.DX_TEACH_MANAGE_NETCENTER_ARRANGE_MODIFY_SETINIT"/>
              <qx:talentButton property="initadd" type="button" styleClass="button_02" value="默认安排" onclick="setPeopleInit()" operation="DX_TEACH_MANAGE_NETCENTER_ARRANGE.DX_TEACH_MANAGE_NETCENTER_ARRANGE_INITADD"/>
			  <qx:talentButton property="add" type="button" styleClass="button_02" value="特殊安排" onclick="setPeople()" operation="DX_TEACH_MANAGE_NETCENTER_ARRANGE.DX_TEACH_MANAGE_NETCENTER_ARRANGE_MODIFY_ADD"/>
      		  <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
      		  <input name="B35" type="button" class="button_eight" value="导出EXCEL	" onclick="doExportTask()">
             
          </td>   
        </tr>
      </table> </td></tr>     
       <tr><td class="td1" align="center">
       <logic:greaterThan property="rowNum" value="0"> 
          <table width="100%"  border="0" align="center" cellpadding="0"   cellspacing="1" bgcolor="#A2C4DC"   id="listdetail" >
          <%int i=0;
          	int j=0;
          	int k=0;
          	int l=0;
          
           %>
       <logic:iterate id="dateresult" property="list[@type='CenterTaskDate']">
       
  
          <tr align="center" class="td_title">
            <td align="center" colspan="10">
            <bean:write id="dateresult" property="CenterTaskDate/TaskDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            星期<bean:write id="dateresult" property="CenterTaskDate/week"/></td>     
          </tr>
          <tr align="center" class="td2" >
                <td width="10%">时间</td>
                <td width="10%">地点</td>
                <td width="15%">班级</td>
                <td width="15%">课程</td>
                <td width="10%">课程/任务说明</td>
                <td width="10%">任务</td>
                <td width="10%">负责人</td>
                <td width="10%">协助人</td>
                <td width="5%">备注</td>
                <td width="5%">选择</td>
              </tr><tr align="center" class="td1" >
            <%i=0; %>  
          <logic:iterate id="noonresult" property="list[@type='CenterTaskNoon']" >
           <logic:equal property="CenterTaskNoon/TaskDate" propertyId="noonresult" value="CenterTaskDate/TaskDate" valueType="variable" valueId="dateresult">          
   			<% j=0;i++;if(i!=1){ %>
   			<tr  align="center" class="td1" >
   			 <%} %>  
   			<td rowspan="<bean:write  property="CenterTaskNoon/RowSpan" id="noonresult"/>"><bean:write id="noonresult" property="CenterTaskNoon/TaskTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
   			<logic:iterate id="courseresult" property="list[@type='CenterTaskCourse']">
   			<logic:equal property="CenterTaskCourse/TaskDate" propertyId="courseresult" value="CenterTaskNoon/TaskDate" valueType="variable" valueId="noonresult">
   			<logic:equal property="CenterTaskCourse/TaskTime" propertyId="courseresult" value="CenterTaskNoon/TaskTime" valueType="variable" valueId="noonresult">
   			<% k=0;j++;if(j!=1){ %>
   			</tr><tr  align="center" class="td1" >
   			<%}%>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/ClassRoom" id="courseresult"/></td>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Class" id="courseresult" filter="false"/></td>
   			 <td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Course" id="courseresult"/></td>
   			<td rowspan="<bean:write  property="CenterTaskCourse/RowSpan" id="courseresult"/>">&nbsp;<bean:write  property="CenterTaskCourse/Explain" id="courseresult"/></td>
	   		<logic:iterate id="taskresult" property="list[@type='NewTaskTask']">
	   		<logic:equal property="NewTaskTask/TaskDate" propertyId="taskresult" value="CenterTaskCourse/TaskDate" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/TaskTime" propertyId="taskresult" value="CenterTaskCourse/TaskTime" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/PlanID" propertyId="taskresult" value="CenterTaskCourse/PlanID" valueType="variable" valueId="courseresult">
   			<logic:equal property="NewTaskTask/PlanType" propertyId="taskresult" value="CenterTaskCourse/PlanType" valueType="variable" valueId="courseresult">	
	   		<% k++;if(k!=1){ %>
   			</tr><tr  align="center" class="td1" >
   			<%}%>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Task" id="taskresult"/></td>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Director" id="taskresult"/>&nbsp;</td>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Assistant" id="taskresult"/>&nbsp;</td>
   			<td>&nbsp;<bean:write  property="NewTaskTask/Remarks" id="taskresult"/>&nbsp;</td>
   			<td><input type="checkbox" name="chk"/>
   			<html:hidden id="taskresult" property="NewTaskTask/PlanType"/>
   			<html:hidden id="taskresult" property="NewTaskTask/PlanID"/>
   			<html:hidden id="taskresult" property="NewTaskTask/TaskID"/>
   			<html:hidden id="taskresult" property="NewTaskTask/TaskDate"/>
   			<html:hidden id="taskresult" property="NewTaskTask/TaskNoon"/>
   			<html:hidden id="taskresult" property="NewTaskTask/TaskTime"/>
   			<html:hidden id="taskresult" property="NewTaskTask/ClassRoom"/>
   			<html:hidden id="taskresult" property="NewTaskTask/Course"/>
   			<html:hidden id="taskresult" property="NewTaskTask/Explain"/>
   			<html:hidden id="taskresult" property="NewTaskTask/Task"/>
   			<html:hidden id="taskresult" property="NewTaskTask/Director"/>
   			<html:hidden id="taskresult" property="NewTaskTask/Assistant"/>
   			<html:hidden id="taskresult" property="NewTaskTask/Remarks"/>	
   			</td>
	   		</logic:equal>
	   		</logic:equal>
	   		</logic:equal>
	   		</logic:equal>
	   		</logic:iterate>
	   		</logic:equal>
	   		</logic:equal>	
   			</logic:iterate>
   			</logic:equal>
   			</logic:iterate>
   			</logic:iterate> 			
       </table>  
        </logic:greaterThan> 
        
        <logic:equal property="rowNum" value="0">
        
        <font color="red" >此时间段没有任务</font>
        
        </logic:equal>
       
       </td></tr></table>  
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
<form name="frm2" method="post" >
<html:hidden property="input/degree"/>
<html:hidden property="input/BeginDate"/>
<html:hidden property="input/EndDate"/>
</form>

</body>
<script language="javascript">
var frm=document.frm;

function queryTask(){
   var BeginDate=frm.elements["input/BeginDate"].value;
   var EndDate=frm.elements["input/EndDate"].value;
  
   if(BeginDate==""||BeginDate==null||EndDate==""||EndDate==null){
     alert("查询时间不能为空");
   }
  //frm.elements["input/degree"].value="";
  frm.submit();

}

function nextWeekTask(){
  frm.elements["input/BeginDate"].value="";
  frm.elements["input/EndDate"].value="";
  frm.action = "teachWorkManage.prNetCenter.centerTaskList.do?input/degree=1"
   frm.submit();
}

function thisWeekTask(){
  frm.elements["input/BeginDate"].value="";
  frm.elements["input/EndDate"].value="";
  frm.action = "teachWorkManage.prNetCenter.centerTaskList.do?input/degree=0"
   frm.submit();
}

function export2Doc(){
   frm.elements["export"].value="1";
   frm.action="teachWorkManage.prMakeTeachPlan.assintTeaching.do";
   frm.target="_blank";
   frm.submit();
}
function selectPeople(){
	  var loc ="teachWorkManage.prNetCenter.selectPeople.do"
	  createWindow(loc,100,100,500,400);  
  }
  
  function setPeopleInit(){
   var frm1=document.frm;
   var frm2=document.frm2; 
   frm2["input/degree"].value = frm1["input/degree"].value;
   frm2["input/BeginDate"].value = frm1["input/BeginDate"].value;
   frm2["input/EndDate"].value = frm1["input/EndDate"].value;
   if(chechedCount(frm)<1){
       getAllValue(frm1,frm2);
   }else{
     getChechedValue(frm1,frm2);
   }
   frm2.action="teachWorkManage.prNetCenter.centerTaskArrangeInit.do";
   frm2.submit();

}
  function setPeople(){
   var frm1=document.frm;
   var frm2=document.frm2;  
   frm2["input/degree"].value = frm1["input/degree"].value;
   frm2["input/BeginDate"].value = frm1["input/BeginDate"].value;
   frm2["input/EndDate"].value = frm1["input/EndDate"].value;
   if(chechedCount(frm)<1){
       alert("至少必须选择一个！");
       return;
   }else{
     getChechedValue(frm1,frm2);
   }
   var loc="teachWorkManage.prNetCenter.selectPeople2.do";
   var acceptValue=window.showModalDialog(loc,"","dialogWidth:750px;DialogHeight=480px;status:no;scroll:yes");  
   addRecordToForm2(frm2,acceptValue);
   frm2.action="teachWorkManage.prNetCenter.centerTaskArrange.do";
   frm2.submit();
}
 
 
function getChechedValue(frm1,frm2) {
	    var nameArray = new Array();  //保存的字段
		var k = 0;
		nameArray[k++] = "PlanType"; 
		nameArray[k++] = "PlanID";
		nameArray[k++] = "TaskID";
		nameArray[k++] = "TaskDate";
		nameArray[k++] = "TaskNoon";
		nameArray[k++] = "TaskTime";
		nameArray[k++] = "ClassRoom";
		nameArray[k++] = "Course"; 
		nameArray[k++] = "Explain";
		nameArray[k++] = "Task";
		nameArray[k++] = "Director";
		nameArray[k++] = "Assistant";
		nameArray[k++] = "Remarks";
	var eles = frm1.elements;
		var i=0;	
	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  var valueArray=new Array(13);
				  for(var j=0;j<valueArray.length;j++){
				  	valueArray[j]=eles[i+j+1].value;
				   }
				addRecordToForm(frm2,nameArray,valueArray);
				}			   
			}
			i++;
		}//while		
}

function getAllValue(frm1,frm2) {
	    var nameArray = new Array();  //保存的字段
		var k = 0;
		nameArray[k++] = "PlanType"; 
		nameArray[k++] = "PlanID";
		nameArray[k++] = "TaskID";
		nameArray[k++] = "TaskDate";
		nameArray[k++] = "TaskNoon";
		nameArray[k++] = "TaskTime";
		nameArray[k++] = "ClassRoom";
		nameArray[k++] = "Course"; 
		nameArray[k++] = "Explain";
		nameArray[k++] = "Task";
		nameArray[k++] = "Director";
		nameArray[k++] = "Assistant";
		nameArray[k++] = "Remarks";
	var eles = frm1.elements;
		var i=0;	
	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				//if(eles[i+11].value==""||eles[i+11].value==null){
				  var valueArray=new Array(13);
				  for(var j=0;j<valueArray.length;j++){
				  	valueArray[j]=eles[i+j+1].value;
				   }
				addRecordToForm(frm2,nameArray,valueArray);
				//}			   
			}
			i++;
		}//while	
}		
var checkboxIndex = 0;
function addRecordToForm(frm,nameArray,valueArray){
  	var listName = "newlist/CenterTask[@hciTagIndex='"; 
	var formHTML = frm.innerHTML;
	for(var i=0;i<nameArray.length;i++){
		formHTML+="<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/"+nameArray[i]+"\"  value=\""+valueArray[i]+"\"  />";
	}
	frm.innerHTML = formHTML;
	checkboxIndex ++ ;
}
function addRecordToForm2(frm,array){
	var formHTML = frm.innerHTML;
	formHTML+="<input type=\"hidden\" name=\"Task/Director\"  value=\""+array[2]+"\"  />";
	formHTML+="<input type=\"hidden\" name=\"Task/Assistant\"  value=\""+array[1]+"\"  />";
	formHTML+="<input type=\"hidden\" name=\"Task/Remarks\"  value=\""+array[3]+"\"  />";
	frm.innerHTML = formHTML;
}


function domToDoc(){
    	var frm =document.forms[0];
    		frm.action = "teachWorkManage.prNetCenter.centerTaskList.do?docmarked=1";
			frm.target = "_blank";
			frm.submit();		 	
}

/*
function doExportTask(){
			if(document.forms[0].startD.value==""||document.forms[0].endD.value==null){
			alert("请选择开始时间和结束时间！");
			return;
			}
			if(window.confirm("只能导出已经安排了的任务，\n确定继续吗？")){

			var url = "/infocentertaskreport.do?action=makeReportByDateRange&startD=";
			url = url+document.forms[0].startD.value;
			url = url+"&endD="+document.forms[0].endD.value;
			location.href = url;
			//window.open(url,'工作任务安排列表',"toolbar=no,location=no,menubar=no,resizable=no,width=500,height=300,scrollbars=yes");
			}
			}
			
*/
			
function doExportTask() {
	var exportTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var etitle = "";
	var exml = "";
	var reportTitle = document.all.printTable;
	var reportTable = document.all.listdetail;

	if(reportTitle.tagName == "TABLE" || reportTitle.tagName == "table") {
		etitle = printTable.rows(0).innerText;
	}else if(reportTitle.tagName == "SELECT" || reportTitle.tagName == "select") {
		var tempValue = reportTitle.value;
		for(var i = 0; i < reportTitle.options.length; i++) {
			if(reportTitle.options[i].value == tempValue) {
				etitle = reportTitle.options[i].text;
				break;
			}
		}
	}else{
		etitle = reportTitle.innerText;
	}
	
	exml = tabletoxml(reportTable);
	

	var frm = document.forms[1];
	if(!frm) {
		alert("不能导出，没有导出form");
		return;
	}
	frm.elements["title"].value = etitle
	frm.elements["xmlfcc"].value = exml;
	//if(window.confirm("只能导出已经安排了的任务，\n确定继续吗？")){
	var url = "teachWorkManage.prNetCenter.centerTaskToExcel.do?exportTime=" + exportTime;
	frm.action = url;
	frm.submit();
	//}
	

}			
			
			
			
</script>