
<%@include file="/internet/common.jsp"%>
<%base.util.RightParse RP = new base.util.RightParse();
	boolean issue = RP.parse("DX_teachWork_sc.DX_teachWork_sc_add",session) ;
	boolean canUpdate = RP.parse("DX_teachWork_sc.DX_teachWork_sc_u",session) ;
	boolean canDel = RP.parse("DX_teachWork_sc.DX_teachWork_sc_d",session) ;
	 %>

<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—>教务管理—>教学计划编制—>教学计划定稿（专题班教学计划）</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
   
       </td>
    </tr>
    
    
    <tr>
      <td class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text"> 
          
          </td>
        </tr>       
      </table>   
      <table  width="100%" id="listdetail"><tr><td>
      <%int count=0; %>
      <logic:iterate id="resultSet" property="list[@type='SpecialSubject']">   
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr> 
                  <td width="71%" align="left" class="td_title">
                  <%++count;%>
                  专题<%=count%>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="SpecialSubject/Title"/>&nbsp;&nbsp; </td>
                  <td  align="center" nowrap class="td_title">
              
               </td>
                </tr>
                
                  <tr> 
                  <td width="71%" align="left" colspan="2" class="td_title">培训对象：<bean:write id="courseResult" property="SpecialSubject/Partner"/>
                 </td>
                 
                </tr>
              </table></td>
          </tr>
          <tr class="td2"> 
            <td width="10%" align="center">日期</td>

            <td width="5%" align="center">时间</td>
            <td width="5%" align="center">午别</td>
            <td width="5%" align="center">星期</td>
            <td width="15%" align="center">学习内容</td>
            <td width="7%" align="center">地　点</td>
            <td width="5%" align="center">考勤</td>
            <td width="8%" align="center">教学形式</td>
            <td width="11%" align="center">课堂模式</td>
            <td width="7%" align="center">授课人</td>
            <td width="6%" align="center">主持人</td>
            <td width="8%" align="center">到会教师</td>
           
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <logic:equal valueType="variable" valueId="resultSet" value="SpecialSubject/SpecialID" propertyId="courseResult" property="Course/SpecialID">
         <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/CourseTitle"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/classRoom"/></td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">否</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">是</logic:equal>
            </td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/TeahchingModelID"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/ClassModelID"/></td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/teachIngMan"/></td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/dj"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/daoHui"/></td>
           
          </tr>
         
            </logic:equal>        
        </logic:iterate>  
        </table>        
        </logic:iterate>
        </td></tr></table>
      </td>
    </tr>
    <tr>
      <td class="text" align="center"><input type="button" value="关 闭"class="button_02" onclick="window.close()"/></td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
</script>