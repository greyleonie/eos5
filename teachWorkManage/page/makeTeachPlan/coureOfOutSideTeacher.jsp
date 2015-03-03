<%@include file="/internet/common.jsp"%>

<body>
<form name="frm" method="post">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="isFirst"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;外请课跟踪表</td>
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
          <td height="30" class="text"><html:select property="Course/ClassID" onchange="query()" > 
              <html:option value="-1">--请选择班级--</html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>
            开始时间：
            <input type="text" name="start[@pattern='yyyy-MM-dd']" value='<bean:write property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>' size="12">
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["start[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
                       结束时间：
               <input type="text" name="end[@pattern='yyyy-MM-dd']" value='<bean:write property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>' size="12">             
               <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["end[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
                
            </td>
        </tr>
      </table>      
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
              <td height="30">              
              <input name="B3" type="button" class="button_02" value="历史班级" onclick="selectClasses()">
              <input name="B3" type="button" class="button_02" value="查 询" onClick="query()">
              <input name="B3" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
              <input name="B3" type="button" class="button_02" value="打 印" onClick="iePrint()">
              <input type="hidden" name="queryaction">
       </td>
          </tr>
        </table>
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" class="text_title">外请课跟踪表</td>
          </tr>
          <tr>
            <td height="30" align="center" class="text_red">班次：<bean:write property="Class/ClassName"/>（<bean:write property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> ——<bean:write property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>）</td>
          </tr>
        </table>        
        <table width="98%" border="0" align="center" cellpadding="0"  id="listdetail" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td align="center">日期</td>
            <td> 周</td>
            <td> 午别</td>
            <td> 报告人</td>
            <td> 课题</td>
            <td> 班别</td>
            <td> 地点</td>
            <td>课类别</td>
            <td>备注</td>
          </tr>
          <logic:iterate id="courseResult" property="list[@type='Course']">
          <tr class="td1">
            <td width="10%"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td width="12%"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td width="8%"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td width="10%"><bean:write id="courseResult" property="Course/Outsider"/></td>
            <td width="11%"><bean:write id="courseResult" property="Course/CourseTitle"/></td>
            <td width="11%"><bean:write id="courseResult" property="Course/ClassID"/></td>
            <td width="11%"><bean:write id="courseResult" property="Course/ClassRoomID"/></td>
            <td width="13%"><bean:write id="courseResult" property="Course/TeahchingModelID"/></td>
            <td width="14%"><bean:write id="courseResult" property="Course/Remarks"/>&nbsp;</td>
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
</body>
<script language="javascript">
 var className="";
 
  function selectClasses(){
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.selectClasses.do?single=false&remark="+remark;
    var returnArray=new Array();    
    var classId="";                              
   
    try{
           returnArray=window.showModalDialog(loc,'','dialogWidth:570px;dialogHeight:420px');         
           if(returnArray!=undefined){          
             classId=returnArray[0];                              
             className=returnArray[1];
            var obj=new Option(className,classId,true,true);
            document.frm.elements["Course/ClassID"].add(obj);            
           }
   
       }catch(e){}      
   if(className.indexOf(",")>-1){ 
        alert("只能选择一个班级进行查询！");
        return false;
    }
   if(returnArray!=undefined){     
      frm.elements["isFirst"].value="0";
      frm.elements["PageCond/count"].value="";
      frm.action="teachWorkManage.prMakeTeachPlan.monitorOutSideTeacherCourse.do";
      frm.submit();
    }  
 }
 
  function query(){
    if(className.indexOf(",")>-1){
         alert("只能选择一个班级进行查询！");
        return false;
     }
     
    if(frm.elements["Course/ClassID"].value!="-1"){
      frm.elements["isFirst"].value="0";
      frm.elements["PageCond/count"].value="";
      frm.action="teachWorkManage.prMakeTeachPlan.monitorOutSideTeacherCourse.do";
      frm.submit();
    }
 }
 
 function checkSelectClass(){     
    
     if(className.indexOf(",")>-1){
         alert("只能选择一个班级进行查询！");
        return false;
     }
 }
</script>