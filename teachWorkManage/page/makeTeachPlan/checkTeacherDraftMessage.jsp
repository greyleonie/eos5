
<%@include file="/internet/common.jsp"%>

<body><title>检查教师课程是否冲突</title>
<form name="frm" mehod="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制     
              -&gt;检查教师课程是否冲突</td>
          </tr>
      </table></td>
    </tr>
  </table>
       <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">相关的冲突信息：</td>
            </tr>
      
   </table>  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" width="876">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr class="td2">
            <td width="" align="center">日期</td>
            <td width="" align="center">时间</td>
            <td width="" align="center">午别</td>  
            <td width="" align="center">班级</td>          
            <td width="" align="center">授课人</td>
          </tr><%
          int count=0;
            String style="";
           %>
          <logic:iterate id="resultSet" property="list[@type='Course']">
           <%
          if(count%2==0){
              style="td2";
             }else{
              style="td1";
             }
            %>
             <tr class="<%=style %>">
              <td width="" align="center">
               <bean:write id="resultSet" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
              </td>
               <td width="" align="center">
               <bean:write id="resultSet" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/>
               </td>
              <td width="" align="center">
               <dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="resultSet"/>
              </td>
                <td width="" align="center">
                <bean:write id="resultSet" property="Course/ClassID"/>
             </td>
             <td width="" align="center">
                <bean:write id="resultSet" property="Course/Teachers"/>
             </td>
             </tr><%count++; %>
          </logic:iterate>
          <%if(count==0){ %>
            <tr class="td1"><td colspan="5" align="center">没有冲突！ </tr>
          <%} %>
        </table>
     
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><html:hidden property="TeachingPlan/PlanID"/>
              &nbsp;  
                <input name="Submit2" type="button" class="button_02" value="关 闭" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
  
  </table>
</form>
</body>