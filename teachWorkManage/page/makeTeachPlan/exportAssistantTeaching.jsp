<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<%
response.setContentType("application/msword;charset=gb2312");
%>

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
   
    <tr>
      <td class="text">      
       
          <table width="100%"    ><tr><td> 
       <logic:iterate id="forDate" property="newList[@type='Course']">
        <table width="100%" border="1" align="center" cellpadding="0"   cellspacing="0"   >
          <tr align="center" >
            <td align="center">
            <bean:write id="forDate" property="Course/ClassDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            ����<bean:write id="forDate" property="Course/week"/></td>     
          </tr>
          <tr>
            <td align="left">
            <table width="100%"  border="1" align="center" cellpadding="0"   cellspacing="0" >
              <tr align="center"   border="0"  cellpadding="0"   cellspacing="1">
                <td width="40">ʱ��</td>
                <td width="67">�ص�</td>
                <td width="227">�γ�</td>
                <td width="153">�γ�/����˵��</td>
                <td width="207">����</td>
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
             <td width="207">����</td>
             <%isPrinted=1;%>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseCourseWare" value="1">
          <%if(isPrinted==0){ %>
           <td width="207">ʹ�ÿμ�</td>
          <%
            isPrinted=2;
          }             
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseNotebookPC" value="1">
         <%if(isPrinted==0){ %>
            <td width="207">ʹ���������</td>
         <%
          isPrinted=3;
         }            
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsTakeFeature" value="1">
          <%if(isPrinted==0){ %>
             <td width="207">�Ļ���</td>
          <%
            isPrinted=4;
          }              
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseCamera" value="1">
         <%if(isPrinted==0){ %>
              <td width="207">ʹ���������</td>
          <%
           isPrinted=5;
          }             
          %>
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseVideo" value="1">
         <%if(isPrinted==0){ %>  
             <td width="207">ȫ������</td>
         <%
          isPrinted=6;
         }              
          %> 
         </logic:equal>
         <logic:equal id="courseList" property="Course/IsUseMediaPlayer" value="1">
         <%if(isPrinted==0){ %>      
             <td width="207">ʹ��ý�岥��</td>
        <%
          isPrinted=7;
        }             
          %>  
         </logic:equal>
         <logic:equal id="courseList" property="Course/WiredPhones" value="1">
        <%if(isPrinted==0){ %>       
              <td width="207">�ṩ��Ͳ</td>
        <%
         isPrinted=8;
        }             
          %>
         </logic:equal>
                
              </tr>
            
             <logic:equal id="courseList" property="Course/IsUseKQJ" value="1">
             <%if(isPrinted!=1){ %>   
              <tr class="td1">
                <td width="207">����</td>
              </tr>
             <%} %>
            </logic:equal>
              <logic:equal id="courseList" property="Course/IsUseCourseWare" value="1">
             <%if(isPrinted!=2){ %>   
              <tr class="td1">
                <td width="207">ʹ�ÿμ�</td>
              </tr>
             <%} %>
            </logic:equal>
            <logic:equal id="courseList" property="Course/IsUseNotebookPC" value="1">
            <%if(isPrinted!=3){ %>   
              <tr class="td1">
                <td width="207">ʹ���������</td>
              </tr>
            <%} %>
            </logic:equal>
            <logic:equal id="courseList" property="Course/IsTakeFeature" value="1">
             <%if(isPrinted!=4){ %>    
              <tr class="td1">
                <td width="207">�Ļ���</td>
              </tr>
              <%} %>
            </logic:equal>
             <logic:equal id="courseList" property="Course/IsUseCamera" value="1">
             <%if(isPrinted!=5){ %>    
              <tr class="td1">
                <td width="207">ʹ���������</td>
              </tr>
             <%} %>
            </logic:equal>
             <logic:equal id="courseList" property="Course/IsUseVideo" value="1">
            <%if(isPrinted!=6){ %>   
              <tr class="td1">
                <td width="207">ȫ������</td>
              </tr>
            <%} %>
            </logic:equal>
             <logic:equal id="courseList" property="Course/IsUseMediaPlayer" value="1">
            <%if(isPrinted!=7){ %>   
              <tr class="td1">
                <td width="207">ʹ��ý�岥��</td>
              </tr>
            <%} %> 
            </logic:equal>
             <logic:equal id="courseList" property="Course/WiredPhones" value="1">
            <%if(isPrinted!=8){ %>   
              <tr class="td1">
                <td width="207">�ṩ��Ͳ</td>
              </tr>
            <%} %>  
            </logic:equal>
            
            
            
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
