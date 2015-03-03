<%@include file="/internet/common.jsp"%>

<body>
<form name="frm" method="post">
<html:hidden property="isFirst"/>     
<html:hidden property="start"/>    
<html:hidden property="end"/>    
<html:hidden property="path"/>  
<html:hidden property="export"/>  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td width="980" class="text_wirte">首页 -&gt; 教务管理 -&gt; 
              教学计划编制 -&gt; 后勤服务汇总</td>   
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
              开始日期：     
                 <html:text property="start[@pattern='yyyy-MM-dd']" size="12"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["start[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
               &nbsp; 结束日期：     
                 <html:text property="end[@pattern='yyyy-MM-dd']" size="12"/>             
               <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["end[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
               &nbsp; 
              <input name="B1" type="button" class="button_02" value="任务汇总" onclick="queryTask()">
              <input name="B35" type="button" class="button_02" value="下周汇总" onclick="nextWeekTask()"> 
              <input name="B36" type="button" class="button_02" onClick="iePrint()" value="打印" >&nbsp; 
              <input name="B32" type="button" class="button_02" onClick="export2Doc()" value="导出">    
    
          </td>   
        </tr>
      </table>      
        <table width="100%" height="8"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td> </td>
          </tr>
        </table>
          <table width="100%"   id="listdetail" ><tr><td> 
       <logic:iterate id="forDate" property="newList[@type='Course']">
        <table width="100%" border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td align="center">
            <bean:write id="forDate" property="Course/ClassDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            星期<bean:write id="forDate" property="Course/week"/></td>     
          </tr>
          <tr class="td2">
            <td align="left">
            <table width="100%"  border="1" align="center" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC"  cellspacing="0" bgcolor="#A2C4DC">
              <tr align="center" class="td2"  border="0"  cellpadding="0">
                <td width="40">时间</td>
                <td width="67">地点</td>
                <td width="227">课程</td>              
                <td width="207">任务</td>
              </tr>
             
           <%int count=0; %>
            <logic:iterate id="courseList" property="list[@type='Course']">
            <logic:equal property="Course/ClassDate" propertyId="forDate" value="Course/ClassDate" valueType="variable" valueId="courseList">
              <tr class="td1">
               <%if(count==0){ %>  
                <td rowspan='<bean:write id="courseList" property="Course/rowSpan"/>' align="center" width="40">
                  <bean:write id="courseList" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/>
                </td>
            <%
             String noon=base.util.TalentContext.getValue(pageContext,"courseList","Course/ClassNoon");
             session.setAttribute("noon",noon);
             count++;
          }else{
             String lastNoon="";
             
             if(session.getAttribute("noon")!=null){lastNoon=(String)session.getAttribute("noon");}
             String currentNoon=base.util.TalentContext.getValue(pageContext,"courseList","Course/ClassNoon");
          //  System.out.println("======lastNoon:"+lastNoon+"======currentNoon:"+currentNoon);
             if(currentNoon==null){currentNoon="";}
             if(!currentNoon.equals(lastNoon)){
             %>
             <td rowspan='<bean:write id="courseList" property="Course/rowSpan"/>' align="center" width="40">
                  <bean:write id="courseList" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/>
             </td>             
             <%
                session.setAttribute("noon",currentNoon);
             }//if
          }//else
       
           %>
              
                <td rowspan='2' width="67">
                 <bean:write id="courseList" property="Course/ClassRoomID"/>                
                &nbsp;</td>
                <td width="227" rowspan='2'><bean:write id="courseList" property="Course/CourseTitle"/>&nbsp;</td>
                <td width="207">
                <logic:greaterThan id="courseList" property="Course/PlatformSeats" value="0">
                主席台座位<bean:write id="courseList" property="Course/PlatformSeats"/>&nbsp;张
                </logic:greaterThan>
                <logic:greaterThan id="courseList" property="Course/StudentSeats" value="0">
                 学员座位<bean:write id="courseList" property="Course/StudentSeats"/>&nbsp;张</td>
                </logic:greaterThan>
            &nbsp;</td>
              
              </tr>
            
             
          
              <tr class="td1">
                <td width="207"><logic:equal  id="courseList" property="Course/IsUseFlower" value="1">摆花&nbsp;</logic:equal>
                <logic:greaterThan id="courseList" property="Course/Cups" value="0">
                茶杯<bean:write id="courseList" property="Course/Cups"/>&nbsp;个
                </logic:greaterThan>&nbsp;</td>
              </tr>
           
          
         
          
            
             
             
              </logic:equal>
             </logic:iterate>
            </table></td>
          </tr> 
          
          </table>         
         </logic:iterate>
         
        </td></tr></table> 
        </td>
    </tr>
   
  </table>
</form>

</body>
<script language="javascript">
var frm=document.frm;

function queryTask(){
   frm.elements["start"].value=frm.elements["start[@pattern='yyyy-MM-dd']"].value;
   frm.elements["end"].value=frm.elements["end[@pattern='yyyy-MM-dd']"].value;
   frm.action="teachWorkManage.prMakeTeachPlan.service4Teaching.do";
   frm.elements["isFirst"].value="0";
  
   if(frm.elements["start"].value==""&&frm.elements["end"].value==""){
     frm.elements["isFirst"].value="1";
   }
   
   frm.submit();
}

function nextWeekTask(){
   frm.elements["isFirst"].value="2";
   frm.action="teachWorkManage.prMakeTeachPlan.assintTeaching.do";
   frm.submit();
}

function export2Doc(){
   frm.elements["export"].value="1";
   frm.action="teachWorkManage.prMakeTeachPlan.service4Teaching.do";
   frm.target="_blank";
   frm.submit();
}
</script>