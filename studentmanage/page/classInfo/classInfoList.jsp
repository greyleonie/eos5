<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>广州市委党校信息一体化平台</title>

</head>

<body>
<form name="resultForm" method="post" action="studentmanage.prClassInfo.classInfoList.do">
<html:hidden property="Class/_order/col1/field"/>
<html:hidden property="Class/_order/col1/asc"/>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="QueryStudent/ClassID/criteria/value"/>


  <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理 -&gt; 班级查询  
              </td> 
          </tr>
      </table></td>
    </tr>
  </table>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr id="beforefixtable2">
      <td height="8">
      <html:hidden property="Class/isHistoryClass/criteria/value"/>     
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable3">
        <tr>
          <td height="30" class="text">  
            <html:select  property="Class/ClassTypeID/criteria/value">
          			<html:option  value="-1">--请选择--</html:option>
                   <html:options property="list[@type='ClassType']/ClassType/ClassTypeID" labelProperty="list[@type='ClassType']/ClassType/ClassType"/>
             </html:select>
           
           <html:select size="1" property="Class/Commission">      
                  <html:option  value="-1" >--调训单位--</html:option>
                  <html:option value="市人事局">市人事局</html:option>
                  <html:option value="市委组织部">市委组织部</html:option>                
           </html:select>
           
            <input name="query" type="button" class="button_02" value="查 询" onClick="toQuery()">      
           <input name="add0" type="button" class="button_02" value="查 看" onClick="toView()">      
            <input name="modify" type="button" class="button_02" value="课 程" onClick="courseDetail()">      
            <input name="delete" type="button" class="button_02" value="学员名册" onClick="queryStudent()">      
            <input name="view" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">     
            <input name="view2" type="button" class="button_02" value="打 印" onClick="iePrint()">      
           <!-- 服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> -->
            <input type="hidden" name="isAdd" ><!--1:add 2:update 3:view-->    
            <input type="hidden" name="queryaction" value="studentmanage.prClassInfo.classInfoList.do">      
            <input type="hidden" name="addaction" value="">      
            <input type="hidden" name="modifyaction" value="teachWorkManage.prClassInfoManage.toUpateDetailPage.do">      
            <input type="hidden" name="deleteaction" value="teachWorkManage.prClassInfoManage.delClass.do">      
            <input type="hidden" name="viewaction">      
          </td>      
        </tr>
      </table>        
      <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable4">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" bgcolor="#A2C4DC">
            <td width="2%" class="td_title" >
              <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="firstChk">
            </td>
            <td width="6%" align="center" nowrap id="Class.ClassTypeID" onClick="" class="td_title" >班级<br>
            类型</td>
            <td width="17%" align="center" nowrap id="Class.ClassName" onClick="talentsort()" class="td_title" >班名</td>
            <td width="11%" align="center" nowrap id="Class.Commission" onClick="talentsort()" class="td_title" >调训<br>单位</td>
            <td width="6%" align="center" nowrap id="Class.RecruitNum" onClick="talentsort()" class="td_title" >计划招<br>
            生人数</td>
            <td width="6%" align="center" nowrap id="Class.factNum" onClick="talentsort()" class="td_title" >实际<br>人数</td>
            <td width="6%" align="center" nowrap id="Class.regTime" onClick="talentsort()" class="td_title" >注册时间</td>
            <td width="7%" align="center" nowrap id="ClassreachTime" onClick="talentsort()" class="td_title" >报到时间</td>
            <td width="6%" align="center" nowrap id="Class.BeginTime" onClick="talentsort()" class="td_title" >开班时间</td>
            <td width="9%" align="center" nowrap id="Class.EndTime" onClick="talentsort()" class="td_title" >毕（结）<br>
            业时间</td>
            <td width="9%" align="center" nowrap id="Class.ClassroomID" onClick="talentsort()" class="td_title" >上课地点</td>
            <td width="5%" align="center" nowrap id="Class.BuildingID" onClick="talentsort()" class="td_title" >住宿地点</td>
            <td width="6%" align="center" nowrap id="Class.RepastCard" onClick="talentsort()" class="td_title" >就餐卡</td>
            <td width="5%" align="center" nowrap id="Class.Deposit" onClick="talentsort()" class="td_title" >预存<br>
            金额</td>
            <td width="5%" align="center" nowrap id="Class.HeadTeacherID" onClick="talentsort()" class="td_title" >班主任
              <p>（副班主任）</p>
            </td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
         	<logic:iterate id="resultSet" property="list[@type='Class']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
          <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="detail('<bean:write id="resultSet" property="Class/ClassID"/>')">
            <td align="center">
           	<html:checkbox id="resultSet" name="list[@name='update']/Class/ClassID" property="Class/ClassID" indexed="true"/>
			<input type="hidden" name="isHistoryClass"  value="<bean:write id="resultSet" property="Class/isHistoryClass"/>">
            <input type="hidden" name="ClassName"  value="<bean:write id="resultSet" property="Class/ClassName"/>">
            <input type="hidden" name="factNum"  value="<bean:write id="resultSet" property="Class/factNum"/>">
            <input type="hidden" name="pageBegin"  value="<bean:write  property="PageCond/begin"/>">
         </td>
            <td align="center"><bean:write id="resultSet"  property="Class/classTypeName"/></td>
            <td><bean:write id="resultSet"  property="Class/ClassName"/></td><!--班名-->
            <td align="center"><bean:write id="resultSet"  property="Class/Commission"/></td><!--调训单位-->
            <td align="center"><bean:write id="resultSet" property="Class/RecruitNum"/></td>
            <td align="center"><bean:write id="resultSet" property="Class/factNum"/></td>
            <td align="center">
             <bean:write id="resultSet"  property="Class/regTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
            <td align="center"><bean:write id="resultSet"  property="Class/reachTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/classRoomName"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/buildingName"/></td><!--住宿地点-->
            <td align="center">
            <logic:equal id="resultSet" property="Class/RepastCard" value="0">不详</logic:equal>
            <logic:equal id="resultSet" property="Class/RepastCard" value="1">IC卡</logic:equal>
            <logic:equal id="resultSet" property="Class/RepastCard" value="2">纸卡</logic:equal>
            <logic:equal id="resultSet" property="Class/RepastCard" value="3">餐票</logic:equal>
           
            </td>
            <td align="center"><bean:write id="resultSet" property="Class/Deposit"/></td>
            <td align="center">
            <bean:write id="resultSet"  property="Class/headTeacher"/>
            <script>
               var headTeacher='<bean:write id="resultSet"  property="Class/teacherAssistant"/>';
               if(headTeacher!=""){
                 document.write("（");
                 document.write(headTeacher);
                 document.write("）");
               }
            </script>          
           </td>
          </tr>
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
<p><font color="#C0C0C0"><b>说明：</b></font></p>
<p><font color="#C0C0C0">点击“结束班级”按钮，将该班转入到历年班级中。</font></p>
</body>
</html>

<script language="javascript">
 function add(){
    document.all("isAdd").value="1";
    document.resultForm.action="teachWorkManage.prClassInfoManage.toAddUPdatePage.do";
    document.resultForm.submit();
 }
 
 function update(){ 
 var frm=document.resultForm;
  if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  
  var index=getChechedIndex(frm); 
  var isHistoryClass=frm.elements[++index].value;


  if(isHistoryClass=="1"){//如果是历史班级，修改实际人数

     var className=frm.elements[index+1].value; 
     var stuNum=frm.elements[index+2].value;    
     var pageBegin=frm.elements[index+3].value;     
     var  array=new  Array(4);
     array[0]=getChechedValue(frm);
     array[1]=className;  
     array[2]=stuNum;  
     array[3]=pageBegin;  
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prClassInfoManage.showUpdatePage.do?refreshMark="+refreshMark;
     window.showModalDialog(loc,array,"DialogWidth:500px,DialogHeight:150px;status:no;scrollbar:no");
  
  }else{
   frm.elements["isAdd"].value="2";
   talentmodify();
   }
   
 }
 
 function toQuery(){
    document.forms[0].target="";
    talentquery();
 }
 
 function toView(){
  var frm=document.resultForm;
  if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  var chkValue=getChechedValue(frm);  
  detail(chkValue);
 }
 //转入历史班级
function setClass2HistoryClass(){
  if(confirm("设置为历史班级，确认吗?")==true){
    document.resultForm.action="teachWorkManage.prClassInfoManage.setClass2HistoryClass.do";
    document.resultForm.submit();
    }
 }
 
 function detail(classid){

   document.resultForm.elements["isAdd"].value="3";
   document.resultForm.action="teachWorkManage.prClassInfoManage.toUpateDetailPage.do.do?fid="+classid;
   document.resultForm.target="";
   document.resultForm.submit();
 }
 
 

 
 //选中的是第几个checkbox
 function getChechedIndex(form) {
	
		var eles = form.elements;
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  return i;
			     }
			}
			i++
		}//while
}

function getChechedValue(form) {
	
		var eles = form.elements;
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  return obj.value;
			     }
			}
			i++
		}//while
}


function queryStudent(){
  var frm=document.resultForm;
  if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
frm.elements["PageCond/begin"].value="";
frm.elements["PageCond/count"].value="";
frm.elements["PageCond/length"].value="";

var index=getChechedIndex(frm);
var className=frm.elements[index+2].value; 
 
    var classId=getChechedValue(frm);
  
    var classId=getChechedValue(frm);
    frm.elements["QueryStudent/ClassID/criteria/value"].value=classId;
  //  document.resultForm.action="teachWorkManage.prClassInfoManage.queryStudents.do";
     document.resultForm.action="teachWorkManage.prClassInfoManage.queryStudents.do?PageCond=&theClassName="+className;
  document.resultForm.target="";
    document.resultForm.submit();
}

function courseDetail(){ 
  var classId=getChechedValue(frm);
   if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  
var index=getChechedIndex(frm);
var className=frm.elements[index+2].value; 
   frm.action="teachWorkManage.prClassInfoManage.courseDetail.do?isAdopted=1&TeachingPlan/ClassID="+classId+"&theClassName="+className;
 
  //frm.action="teachWorkManage.prClassInfoManage.courseDetail.do?TeachingPlan/ClassID="+classId;
  frm.target="_blank";
  frm.submit();
}

function init(){
   var isHistory='<bean:write property="Class/isHistoryClass/criteria/value"/>';
  
}

function return2CurrentClass(){
 if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
   if(confirm("设置为当前班级，确认吗?")==true){
   frm.action="teachWorkManage.prClassInfoManage.return2CurrentClass.do";
   frm.submit();
   }
}

init();
</script>