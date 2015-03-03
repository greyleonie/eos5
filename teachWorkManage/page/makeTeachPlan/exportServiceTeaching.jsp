<%@include file="/internet/common.jsp"%>
<%response.setContentType("application/msword;charset=gb2312"); %> 
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    
    <tr>
      <td >      
       
          <table width="100%"  ><tr><td> 
       <logic:iterate id="forDate" property="newList[@type='Course']">
        <table width="100%" border="1" align="center" cellpadding="0"   cellspacing="0" >
          <tr align="center" >
            <td align="center">
            <bean:write id="forDate" property="Course/ClassDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            星期<bean:write id="forDate" property="Course/week"/></td>     
          </tr>
          <tr >
            <td align="left">
            <table width="100%"  border="1" align="center" cellpadding="0"   cellspacing="0" >
              <tr align="center" border="0"  cellpadding="0">
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