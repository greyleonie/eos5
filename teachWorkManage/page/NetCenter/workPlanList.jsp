<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.workPlanList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">中心工作计划</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.workPlanList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prNetCenter.workPlanAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.workPlanModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.workPlanDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prNetCenter.workPlanView.do">
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
            	<html:text property="CenterPlan/PlanDate/criteria/min" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CenterPlan/PlanDate/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="CenterPlan/PlanDate/criteria/max" attributesText='class="input" size="20"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CenterPlan/PlanDate/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="CenterPlan/PlanDate/criteria/operator" value="between"/>
			    <input type="hidden" name="CenterPlan/PlanDate/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">  
               <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_NETCENTER_PLAN.DX_TEACH_MANAGE_NETCENTER_PLAN_ADD"/>
				 <qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_NETCENTER_PLAN.DX_TEACH_MANAGE_NETCENTER_PLAN_MODIFY"/>
				  <qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_NETCENTER_PLAN.DX_TEACH_MANAGE_NETCENTER_PLAN_DELETE"/>
				<input name="delete" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center"  nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" ></td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.PlanDate" onClick="talentsort()">日期</td>
                  <td width="7%" align="center"  nowrap id="CenterPlan.PlanTime" onClick="talentsort()">时间</td>
                  <td width="5%" align="center"  nowrap id="CenterPlan.PlanNoon" onClick="talentsort()">午别</td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.ClassRoom" onClick="talentsort()">课室/地点</td>
                  <td width="10%" align="center"  nowrap id="CenterPlan.Task" onClick="talentsort()">工作任务</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Class" onClick="talentsort()">单位/班别</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Director" onClick="talentsort()">负责人</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Assistant" onClick="talentsort()">协助人</td>
                  <td width="5%"  align="center"  nowrap id="CenterPlan.WorkType " onClick="talentsort()">任务类型</td>
                  <td width="10%"  align="center"  nowrap id="CenterPlan.Equipments " onClick="talentsort()">使用设备</td>
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
                  <td align="center"><logic:present  id="resultset" property="CenterPlan/PlanID">
			                  <html:checkbox id="resultset" name="list[@name='update']/CenterPlan/PlanID" property="CenterPlan/PlanID" indexed="true"/>
			                  </logic:present></td>
				  <td align="center"   ><bean:write id="resultset" property="CenterPlan/PlanDate" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td  align="center"   ><bean:write id="resultset" property="CenterPlan/PlanTime" /></td>
                  <td  align="center"   ><logic:equal id="resultset" property="CenterPlan/PlanNoon" value="1">上午</logic:equal>
			                 					 <logic:equal id="resultset" property="CenterPlan/PlanNoon" value="2">中午</logic:equal>
			                  					<logic:equal id="resultset" property="CenterPlan/PlanNoon" value="3">晚上</logic:equal></td>
                  <td  align="center"  > <bean:write id="resultset" property="CenterPlan/ClassRoom" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="CenterPlan/Task" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="CenterPlan/Class" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="CenterPlan/DirectorName" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="CenterPlan/AssistantName" /></td>
                  <td  align="center"  ><dict:write id="resultset" businTypeId="dx_workType" property="CenterPlan/WorkType" /></td>
                  <td  align="center"  ><dict:write id="resultset" businTypeId="dx_equipment" property="CenterPlan/Equipments" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="CenterPlan/Remarks" /></td>
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
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>
<script>
	loadOrderImg(document.forms[0],'CenterPlan');
</script>