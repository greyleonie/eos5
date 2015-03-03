<%@include file="/internet/common.jsp"%>
<body>
<form action="teachWorkManage.prSearch.subjectInfoList.do" method="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0"   >
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;查询统计—&gt;<span id="printTable"> 课题统计表 </span></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
             时间：
			从<html:text property="input/BeginDate" attributesText='class="input" size="10"   ValidateType="notempty" Msg="开始时间不能为空" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/BeginDate"],"yyyy-MM-dd")>
             	到<html:text property="input/EndDate" attributesText='class="input" size="10"  ValidateType="notempty" Msg="结束时间不能为空"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/EndDate"],"yyyy-MM-dd")>  

             <input name="B1" type="button" class="button_02" value="统 计" onClick="search()"/> 
             
             <logic:notPresent property="input/isFirst" >
             <input name="B33" type="button" class="button_02" value="打 印" onClick="iePrint()">  
             <input name="B3" type="button" class="button_02" value="导 出" onClick="exporttoexcel()"> 
	           </logic:notPresent>
</td> 
        </tr>
      </table>    
      
  <logic:notPresent property="input/isFirst" >  
  
  <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td class="td1"  align="center">  <b> <bean:write property="input/TeacherName"/>课题统计表 </b>
          <br/>
          (<bean:write  property="input/BeginDate"/>至<bean:write  property="input/EndDate"/>)
          </td>
        </tr>
      </table>
  
  
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
	  <tr class="td1"  style="display: none"> <td  align="center"> 统计时间：<bean:write  property="input/BeginDate"/>至<bean:write  property="input/EndDate"/></td><tr>
	  <tr class="td_title"> 
                  <td width="5%" align="center" nowrap  >教研部</td>
                  <td width="45%" align="center" nowrap >课程标题</td>
                  <td width="20%" align="center" nowrap  >授课教师</td>
                  <td width="20%" align="center" nowrap >授课班别</td>
                  <td width="10%" align="center" nowrap  >合计</td>
                </tr>
                <%
		             int count=0;
		             int i=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="teachGroupSet" property="list[@type='TeachGroup']"> 
                
                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
              <logic:equal  id="teachGroupSet" property="TeachGroup/TotalSubjects" value="0">
               <td nowrap  align="center" style="Writing-mode:tb-rl;Text-align:center;font-weight: bold">&nbsp;<bean:write id="teachGroupSet" property="TeachGroup/orgName"/>
                </td> 
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
		     <td  valign="middle" align="center" rowspan="<bean:write id="teachGroupSet" property="TeachGroup/TotalSubjects"/>">
                  新课题：<font color="red"><bean:write id="teachGroupSet" property="TeachGroup/NewSubjects"/></font>个<br/>旧课题：<font color="red"><bean:write id="teachGroupSet" property="TeachGroup/OldSubjects"/></font>个<br/>总&nbsp;&nbsp;计：<font color="red"><bean:write id="teachGroupSet" property="TeachGroup/TotalSubjects"/></font>个</td>
              </tr>
              </logic:equal>
              
               <logic:notEqual  id="teachGroupSet" property="TeachGroup/TotalSubjects" value="0">
                <td nowrap align="center"  style="Writing-mode:tb-rl;Text-align:center;font-weight: bold" rowspan="<bean:write id="teachGroupSet" property="TeachGroup/TotalSubjects"/>">&nbsp;<bean:write id="teachGroupSet" property="TeachGroup/orgName"/>
                 </td> 
                <logic:iterate id="subjectsSet" property="list[@type='Subjects']"> 
                	<logic:equal id="subjectsSet" property="Subjects/TeachingGroupID" value="TeachGroup/orgID" valueType="variable" valueId="teachGroupSet">
		                              <%i++; if(i!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%> 
		                <td >&nbsp;<bean:write   id="subjectsSet" property="Subjects/CourseTitle" /></td>
		                <td >&nbsp;<bean:write  id="subjectsSet" property="Subjects/TeacherName" /></td>
		                <td >&nbsp;<bean:write  id="subjectsSet" property="Subjects/ClassName" /></td>
		                <%if(i==1){%>
		                  <td  valign="middle" align="center" rowspan="<bean:write id="teachGroupSet" property="TeachGroup/TotalSubjects"/>">
                  新课题：<font color="red"><bean:write id="teachGroupSet" property="TeachGroup/NewSubjects"/></font>个<br/>旧课题：<font color="red"><bean:write id="teachGroupSet" property="TeachGroup/OldSubjects"/></font>个<br/>总&nbsp;&nbsp;计：<font color="red"><bean:write id="teachGroupSet" property="TeachGroup/TotalSubjects"/></font>个</td>
				<%}%> 
		         </tr> 
	               </logic:equal>
                </logic:iterate>

                </logic:notEqual>
         </logic:iterate> 
                <tr >
                <td class="td2" align="right" style="Text-align:center;font-weight: bold" >总计：</td>
                <td colspan="4" class="td1" align="center">  新课题：<font color="red"><bean:write  property="StatisSubject/NewSubjects"/></font> 个，占<font color="red"><bean:write  property="StatisSubject/NewPercent"/>%</font>，
                 旧课题：<font color="red"><bean:write  property="StatisSubject/OldSubjects"/></font> 个 ，占<font color="red"><bean:write  property="StatisSubject/OldPercent"/>%</font>，
                 总计：<font color="red"><bean:write  property="StatisSubject/TotalSubjects"/></font>个 </td>
                
                </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
     </logic:notPresent>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
 function search() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
  

</script>