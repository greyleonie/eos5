<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.statisOvertimeDetail.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;加班情况明细</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.statisOvertimeDetail.do">
		
		<html:hidden property="CenterPlan/_order/col1/field"/>
		<html:hidden property="CenterPlan/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				负责人：
			<html:select  property="CenterPlan/Director/criteria/value">
          			<html:option  value="">--请选择--</html:option>
                   <html:options property="list[@type='Teacher']/Teacher/TeacherID" labelProperty="list[@type='Teacher']/Teacher/TeacherName"/>
             </html:select>
			<html:hidden property="CenterPlan/Director/criteria/operator" value="="/>
            日期： 从
            	<html:text property="input/BeginTime" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/BeginTime"],"yyyy-MM-dd")> 
           		到
           		<html:text property="input/EndTime" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/EndTime"],"yyyy-MM-dd")>
			    

                <input name="query" type="button" class="button_02" value="明 细" onClick="talentquery()"> 
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> 
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="add" type="button" class="button_02" value="汇 总" onClick="statistotal()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
   
        <tr>
        <td class="td1" align="center"><span id="printTable"><b>网络中心加班情况明细表</b></span> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center"  nowrap>序号</td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.PlanDate" onClick="talentsort()">日期</td>
                  <td width="7%" align="center"  nowrap id="CenterPlan.PlanTime" onClick="talentsort()">星期</td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.PlanNoon" onClick="talentsort()">午别</td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.ClassRoom" onClick="talentsort()">地点</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Class" onClick="talentsort()">班别</td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.Task" onClick="talentsort()">工作任务</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Director" onClick="talentsort()">负责人</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Assistant" onClick="talentsort()">协助人</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.WorkType " onClick="talentsort()">加班时间(小时)</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Remarks" onClick="talentsort()">备注</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='CenterPlan']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center"><%=count %></td>
				  <td align="center"  ><bean:write id="resultset" property="CenterPlan/PlanDate" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td align="center"  ><bean:write id="resultset" property="CenterPlan/week"/></td>
                  <td align="center"  ><logic:equal id="resultset" property="CenterPlan/PlanNoon" value="1">上午</logic:equal>
			                 				  <logic:equal id="resultset" property="CenterPlan/PlanNoon" value="2">中午</logic:equal>
			                  				  <logic:equal id="resultset" property="CenterPlan/PlanNoon" value="3">晚上</logic:equal></td>
                  <td align="center" > <bean:write id="resultset" property="CenterPlan/ClassRoom"/></td>
                  <td align="center" ><bean:write id="resultset" property="CenterPlan/Class"/></td>
                  <td align="center" ><bean:write id="resultset" property="CenterPlan/Task"/></td>
                  <td align="center" ><bean:write id="resultset" property="CenterPlan/DirectorName"/></td>
                  <td align="center" ><bean:write id="resultset" property="CenterPlan/AssistantName"/></td>
                  <td align="center" ><bean:write id="resultset" property="CenterPlan/LongOvertime"/></td>
                  <td align="center" ><bean:write id="resultset" property="CenterPlan/Remarks"/></td>
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
			 
          </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
	loadOrderImg(document.forms[0],'CenterPlan');
</script>
<script>

function statistotal(){

 	var frm = document.forms[0];
	var BeginTime = frm["input/BeginTime"].value;
	var EndTime = frm["input/EndTime"].value;
	if(BeginTime==""||EndTime ==""){
		alert("时间不能为空");
		return ;
	}
	window.location.href="teachWorkManage.prNetCenter.statisOvertimeTotal.do?input/BeginTime="+BeginTime+"&input/EndTime="+EndTime;

}


</script>