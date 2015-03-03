<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
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
              教学计划编制 -&gt; 教学辅助汇总</td>   
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
          <table width="100%"   id="listdetail" ><tr><td> <%boolean haveCourse=false; %>
       <logic:iterate id="forDate" property="newList[@type='Course']">
         <% haveCourse=true; %>
        <table width="100%" border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td align="center">
            <bean:write id="forDate" property="Course/ClassDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            星期<bean:write id="forDate" property="Course/week"/></td>     
          </tr>
          <tr class="td2">
            <td align="left">
            <table width="100%"  border="1" align="center" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC"  cellspacing="0" bgcolor="#A2C4DC">
              <tr align="center" class="td2"  border="0"  cellpadding="0"   cellspacing="1">
                <td width="40">时间</td>
                <td width="67">地点</td>
                <td width="227">课程</td>
                <td width="153">课程/任务说明</td>
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
              
                            
                <td rowspan='<bean:write id="courseList" property="Course/rowSpan2"/>' width="67">
                 <bean:write id="courseList" property="Course/ClassRoomID"/>
                
                &nbsp;</td>
                <td rowspan='<bean:write id="courseList" property="Course/rowSpan2"/>' width="227"><bean:write id="courseList" property="Course/CourseTitle"/>&nbsp;</td>
                <td rowspan='<bean:write id="courseList" property="Course/rowSpan2"/>' width="153"><bean:write id="courseList" property="Course/Remarks"/>&nbsp;</td>
             
              
               
             
        <%int isPrinted=0; %>       
        <logic:equal id="courseList" property="Course/IsUseKQJ" value="1">
             <td width="207">考勤</td>
             <%isPrinted=1;%>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseCourseWare" value="1">
          <%if(isPrinted==0){ %>
           <td width="207">使用课件</td>
          <%
            isPrinted=2;
          }             
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseNotebookPC" value="1">
         <%if(isPrinted==0){ %>
            <td width="207">使用手提电脑</td>
         <%
          isPrinted=3;
         }            
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsTakeFeature" value="1">
          <%if(isPrinted==0){ %>
             <td width="207">拍花絮</td>
          <%
            isPrinted=4;
          }              
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseCamera" value="1">
         <%if(isPrinted==0){ %>
              <td width="207">使用数码相机</td>
          <%
           isPrinted=5;
          }             
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseVideo" value="1">
         <%if(isPrinted==0){ %>  
             <td width="207">全程摄像</td>
         <%
          isPrinted=6;
         }              
          %> 
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseMediaPlayer" value="1">
         <%if(isPrinted==0){ %>      
             <td width="207">使用媒体播放</td>
        <%
          isPrinted=7;
        }             
          %>  
         </logic:equal>
         <logic:equal id="courseList" property="Course/WiredPhones" value="1">
        <%if(isPrinted==0){ %>       
              <td width="207">提供话筒</td>
        <%
         isPrinted=8;
        }             
          %>
         </logic:equal>
                
              </tr>
            
             <logic:equal id="courseList" property="Course/IsUseKQJ" value="1">
             <%if(isPrinted!=1){ %>   
              <tr class="td1">
                <td width="207">考勤</td>
              </tr>
             <%} %>
            </logic:equal>
              <logic:equal id="courseList" property="Course/IsUseCourseWare" value="1">
             <%if(isPrinted!=2){ %>   
              <tr class="td1">
                <td width="207">使用课件</td>
              </tr>
             <%} %>
            </logic:equal>
            <logic:equal id="courseList" property="Course/IsUseNotebookPC" value="1">
            <%if(isPrinted!=3){ %>   
              <tr class="td1">
                <td width="207">使用手提电脑</td>
              </tr>
            <%} %>
            </logic:equal>
            <logic:equal id="courseList" property="Course/IsTakeFeature" value="1">
             <%if(isPrinted!=4){ %>    
              <tr class="td1">
                <td width="207">拍花絮</td>
              </tr>
              <%} %>
            </logic:equal>
             <logic:equal id="courseList" property="Course/IsUseCamera" value="1">
             <%if(isPrinted!=5){ %>    
              <tr class="td1">
                <td width="207">使用数码相机</td>
              </tr>
             <%} %>
            </logic:equal>
             <logic:equal id="courseList" property="Course/IsUseVideo" value="1">
            <%if(isPrinted!=6){ %>   
              <tr class="td1">
                <td width="207">全程摄像</td>
              </tr>
            <%} %>
            </logic:equal>
             <logic:equal id="courseList" property="Course/IsUseMediaPlayer" value="1">
            <%if(isPrinted!=7){ %>   
              <tr class="td1">
                <td width="207">使用媒体播放</td>
              </tr>
            <%} %> 
            </logic:equal>
             <logic:equal id="courseList" property="Course/WiredPhones" value="1">
            <%if(isPrinted!=8){ %>   
              <tr class="td1">
                <td width="207">提供话筒</td>
              </tr>
            <%} %>  
            </logic:equal>
            
            
            
              </logic:equal>
             </logic:iterate>
            </table></td>
          </tr> 
          
          </table>         
         </logic:iterate>
         <%
         System.out.println("****************haveCourse:"+haveCourse);
         if(haveCourse==false){ %>
           没有任务！
         <%} %>
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
   frm.action="teachWorkManage.prMakeTeachPlan.assintTeaching.do";
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
   frm.action="teachWorkManage.prMakeTeachPlan.assintTeaching.do";
   frm.target="_blank";
   frm.submit();
}
</script>