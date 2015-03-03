<%@include file="/internet/common.jsp"%>
<body>
<form method="post"  action="teachWorkManage.prNetCenter.workPlanModifyDo.do" name="opeForm">
<html:hidden property="CenterPlan/PlanID"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;中心工作计划修改</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" />
		<input type="hidden" name="addaction" />
		<input type="hidden" name="modifyaction" />
		<input type="hidden" name="deleteaction" />
		<input type="hidden" name="viewaction"/>
		<html:hidden property="CenterPlan/_order/col1/field"/>
		<html:hidden property="CenterPlan/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    
    
    <tr>
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
            <td width="88%" class="td1"><html:text property="CenterPlan/PlanDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CenterPlan/PlanDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>              
              <html:text onblur="doCheckClock();getNoon()"   property="CenterPlan/PlanTime" attributesText='size="10" class="input"'  value="8:30:00"/>

<html:radio onclick="document.opeForm['CenterPlan/PlanTime'].value='8:30:00'"   property="CenterPlan/PlanNoon" value="1"/>
上午
<html:radio onclick="document.opeForm['CenterPlan/PlanTime'].value='14:30:00'"  property="CenterPlan/PlanNoon" value="2"/>
下午
<html:radio onclick="document.opeForm['CenterPlan/PlanTime'].value='19:00:00'"  property="CenterPlan/PlanNoon" value="3"/>
晚上
</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">任务类别：</td>
            <td class="td1">
                <dict:select businTypeId="dx_workType" property="CenterPlan/WorkType" nullOption="true" nullLabel="请选择..." />
               <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">任务/课程：</td>
            <td class="td1"><html:text  property="CenterPlan/Task" maxlength="50"  attributesText='class="input" size="60"  ValidateType="notempty" Msg="课程标题不能为空"'/> <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">课&nbsp;&nbsp;&nbsp;&nbsp;室：</td>
            <td class="td1"><html:text readonly="true" property="CenterPlan/ClassRoom"  attributesText='class="input" size="60" '/>
              <img src="/internet/image/house.gif" width="18" height="15"  onClick="javascript:selectRoom()" align="absmiddle">&nbsp;&nbsp;
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">地&nbsp;&nbsp;&nbsp;&nbsp;点：</td>
            <td class="td1"><html:text  property="CenterPlan/Place"   attributesText='class="input" size="60"  ' /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">单位/班别：</td>
            <td class="td1"><html:text  property="CenterPlan/Class"   attributesText='class="input" size="60"  ' /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">负 责 人：</td>
            <td class="td1"><html:select  property="CenterPlan/Director">
          			<html:option  value="">--请选择--</html:option>
                   <html:options property="list[@type='Teacher']/Teacher/TeacherID" labelProperty="list[@type='Teacher']/Teacher/TeacherName"/>
             </html:select></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">协 助 人：</td>
            <td class="td1"><html:hidden  property="CenterPlan/Assistant"/> 
            <table cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <%int i=0; %>
          
         		  <logic:iterate id="result" property="list[@type='Teacher']">
					<%if(i%5==0) {%>
				<tr class="td1">  <%} %>    
         		 <td class="td1"> <input type="checkbox" name="chk" value='<bean:write id="result" property="Teacher/TeacherID"/>'>
             	<bean:write id="result" property="Teacher/TeacherName"/></td>       
   <% i++;                
         if(i%5==0){ %>
           </tr>         
          <%}%> 
           
       </logic:iterate>
       <% i=5-i%5; 
       if(i!=0){
       	for(int j=0;j<i;j++){%>
       	  <td class="td1">&nbsp;</td>
       	<%}%>
       	</tr>
       <%}%>
       
       </table></td>
          </tr>
                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">加班时长：</td>
            <td class="td1"><html:text  property="CenterPlan/LongOvertime"   attributesText='class="input" size="10"  ' />小时</td>
          </tr>

                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">出租金额：</td>
            <td class="td1"><html:text  property="CenterPlan/Rent"   attributesText='class="input" size="10"  ' />元 </td>
          </tr>
                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">联 系 人：</td>
            <td class="td1"><html:text  property="CenterPlan/Linker"   attributesText='class="input" size="20"  ' /></td>
          </tr>
                              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
            <td class="td1"><html:text  property="CenterPlan/LinkTel"   attributesText='class="input" size="20"  ' /></td>
          </tr>
                                        <tr  onClick="changeTRBgColor(this)">
                      <td align="right" class="td2">使用设备：</td>
              <td class="td1">    <dict:multicheckbox property="CenterPlan/Equipments"  businTypeId="dx_equipment" modifiable="true" formName="opeForm"/></td> </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="td1"><html:textarea   property="CenterPlan/Remarks"  cols="80" rows="4"/></td>

          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                 <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
    <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
 
  //得到协助人ID
  function getAssistant() {
   var frm = document.forms[0];
	var eles = frm.elements;
		var i=0;
		var ids=",";
	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null&&obj.name=="chk"){
				if(obj.checked){
				   ids+=obj.value+",";
			     }			   
			}
			i++;
		}//while
		if(ids==","){
			ids="";
		}
		frm["CenterPlan/Assistant"].value =ids;
		
}
 
  function save() {
  	var frm = document.forms[0];
  	getAssistant();
	if(validater(frm)) frm.submit();
  
  }
  function getCurDatetime(){
  		var curTime = new Date();
		var curDateStr = "";
		var curTimeStr = "";

	    //设置为当前时间
		var month = curTime.getMonth()+1;
		if (month<10){
				month = "0"+month;
				}
		var curDateOfMonth = curTime.getDate();
		if (curDateOfMonth<10){
				curDateOfMonth = "0"+curDateOfMonth;
				}
		curDateStr = curTime.getFullYear()+"-"+month+"-"+curDateOfMonth;
		var hours = curTime.getHours();
		if (hours<10){
				hours = "0"+hours;
				}
		var minutes = curTime.getMinutes();
		if(minutes<10){
				minutes = "0"+minutes;
				}
		var second = curTime.getSeconds();
		if(second<10){
				second ="0"+second;
				}
		curTimeStr = hours+":"+minutes+":"+second;
		document.opeForm["CenterPlan/PlanDate[@pattern='yyyy-MM-dd']"].value = curDateStr;
	//	document.opeForm['CenterPlan/PlanTime'].value = curTimeStr;
	}
						
function doCheckClock(){							
				var clock = document.opeForm['CenterPlan/PlanTime'].value;
				if (clock!=""){
					var array = clock.split(":");
					if (array.length==2||array.length==3){
						for(i=0;i<array.length;i++){
							if (isNaN(parseInt(array[i]))){
							alert("请输入正确的时间！");
							return false;
							}
					}
					if (parseInt(array[0])>24){
						alert("输入的小时不正确，请重新输入！");
						return false;
					}
					if (parseInt(array[1])>60){
						alert("输入的分钟不正确，请重新输入！");
						return false;
					}
					if (array.length==3){
						if (parseInt(array[2])>60){
						alert("输入的秒不正确，请重新输入！");
						return false;
					}
				}
					return true;
				}else{
			alert("请输入完整的上课时间！");
			return false;
			}
				}else{
					alert("请输入上课时间！");
					return false;
				}
				
				
			}
			
function getNoon(){
	var clock = document.opeForm['CenterPlan/PlanTime'].value;
	if (clock!=""){
	var array = clock.split(":");
	if (parseInt(array[0])>12&&parseInt(array[0])<=19){
						document.opeForm['CenterPlan/PlanNoon'][1].checked=true;
					}else if(parseInt(array[0])>19&&parseInt(array[0])<=23){
						document.opeForm['CenterPlan/PlanNoon'][2].checked=true;
					}else{
						document.opeForm['CenterPlan/PlanNoon'][0].checked=true;
					}
	}
}

function doClearSelect(){
			document.opeForm["CenterPlan/ClassRooms"].value = "";
			document.opeForm.ClassRoomName.value = "";
			}
			
function selectClass(){
 	 var frm = document.opeForm;
     var loc="teachWorkManage.prNetCenter.selectClass.do";

     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}

    document.opeForm["CenterPlan/Class"].value=names;

  }
  
  function selectRoom(){
 	 var frm = document.opeForm;
     var loc="teachWorkManage.prNetCenter.selectRoom.do";

     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:750px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}

    document.opeForm["CenterPlan/ClassRoom"].value=names; 

  }
 
  </script>