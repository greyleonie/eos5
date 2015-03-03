
<%@include file="/internet/common.jsp"%>

<body>
<form name="frm" mehod="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15">
             <html:hidden property="planStatus"/>
             </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制     
              -&gt;
               <logic:lessThan value="4" property="planStatus">
                  审核意见
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">                 
              审批意见              
            </logic:greaterThan>           
              </td>
          </tr>
      </table></td>
    </tr>
  </table>
    
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">意见汇总：</td>
            </tr>
          <%int i=0; %>
         <logic:iterate id="resultSet" property="list[@type='Course']">
         <%++i; %>
          <tr> 
            <td colspan="13" class="td1"><%=i %>：
            <logic:lessThan value="4" property="planStatus">
               <bean:write id="resultSet" property="Course/Opinion"/>
            </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">
               <bean:write id="resultSet" property="Course/Approval"/>
            </logic:greaterThan>
            </td>
            </tr>
         </logic:iterate>  
   </table>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">
             <logic:lessThan value="4" property="planStatus">
           审核意见：
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">     
            审批意见：             
            </logic:greaterThan> 
           </td>
            </tr>
     <tr  >
      
            <td class="td1" colspan="2">
            <logic:lessThan value="4" property="planStatus">
          <bean:write property="TeachingPlan/Opinion"/>&nbsp;
               </logic:lessThan>
            <logic:greaterThan value="3" property="planStatus">     
            <bean:write property="TeachingPlan/Approval"/>&nbsp;           
            </logic:greaterThan> 
           
           
            </td>
          </tr>   
   </table>  
  <table width=""  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td align="left"  width="776">
   
     
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><html:hidden property="TeachingPlan/PlanID"/>
             <input name="Submit2" type="button" class="button_02" value="关 闭" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
  
  </table>
</form>
</body>

