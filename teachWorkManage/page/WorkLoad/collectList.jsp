<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>

<body >
<form method="post" action="teachWorkManage.prWorkLoad.collectList.do" name="opeForm" >
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教师工作量统计—&gt;<span id="printTable">工作量列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prWorkLoad.collectList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prWorkLoad.collectAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prWorkLoad.collectModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prWorkLoad.collectDelete.do">
		<html:hidden property="WorkLoadCollect/_order/col1/field"/>
		<html:hidden property="WorkLoadCollect/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<!--INPUT value="like" type="hidden" name="QueryStudent/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudent/operatorname/criteria/likeRule"-->
	  </td>
    </tr>
  </table>

<%String year = base.util.TalentContext.getValue(pageContext,null,"WorkLoadCollect/Yearth/criteria/value"); 
  String period=base.util.TalentContext.getValue(pageContext,null,"WorkLoadCollect/Period/criteria/value");
  String TeachingGroupID=base.util.TalentContext.getValue(pageContext,null,"WorkLoadCollect/TeachingGroupID/criteria/value");%>

<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				年份：
            <html:select property="WorkLoadCollect/Yearth/criteria/value"  attributesText='ValidateType="notempty" Msg="年度不能为空" ' value="<%=year %>">
            <html:option value="">--请选择--</html:option>
			<%
			GregorianCalendar today=new GregorianCalendar();
          int thisYear=today.get(GregorianCalendar.YEAR);
			for(int i=thisYear+1;i>=thisYear-4;i--){%>
            <html:option value="<%=i+""%>"><%=i%></html:option>
           <%}%>
			</html:select>
			<html:hidden property="WorkLoadCollect/Yearth/criteria/operator" value="="/>
            学期： 
            <html:select property="WorkLoadCollect/Period/criteria/value" attributesText='ValidateType="notempty" Msg="时期不能为空" ' value="<%=period %>" >		
                <html:option value="">--请选择--</html:option>
                <html:option value="1">上半年</html:option>
                <html:option value="2">下半年</html:option>       
			    </html:select>
			  <html:hidden property="WorkLoadCollect/Period/criteria/operator" value="="/>  
         所属教研部：
         <select name="WorkLoadCollect/TeachingGroupID/criteria/value"   id="select1" bizAction="teachWorkManage.bizWorkLoad.selectTeachGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="请选择教研部" nullLableValue="" onchange="refreshChild_DS(this)"   ValidateType="notempty" Msg="所属教研部不能为空" ></select> 
           <html:hidden property="WorkLoadCollect/TeachingGroupID/criteria/operator" value="="/>
           教师：
         <select name="WorkLoadCollect/TeacherID/criteria/value"        id="select2" bizAction="teachWorkManage.bizWorkLoad.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="请选择老师" nullLableValue=""   ValidateType="notempty" Msg="教师不能为空"></select>
		 <script language="JavaScript" type="text/JavaScript">
		 	
			initSel_DS(document.getElementById("select1"));
		</script> <br/><br/>
			  <html:hidden property="WorkLoadCollect/TeacherID/criteria/operator" value="="/> 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()"> 
                 
                
                <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_WORKLOAD_COLLECT.DX_TEACH_MANAGE_WORKLOAD_COLLECT_ADD"/>
				
				<qx:talentButton property="add" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_WORKLOAD_COLLECT.DX_TEACH_MANAGE_WORKLOAD_COLLECT_MODIFY"/>
				
				<qx:talentButton property="add" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_WORKLOAD_COLLECT.DX_TEACH_MANAGE_WORKLOAD_COLLECT_DELETE"/>
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
                  <td width="3%" align="center" rowspan="2" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" > 
                  </td>
                  <td width="7%" align="center" rowspan="2" nowrap id="WorkLoadCollect.Yearth" onClick="talentsort()">年份</td>
                  <td width="5%" align="center" rowspan="2" nowrap id="WorkLoadCollect.Period" onClick="talentsort()">学期</td>
                  <td width="5%" align="center" rowspan="2" nowrap id="WorkLoadCollect.operatorName" onClick="talentsort()">教师<br/>姓名</td>
                  <td width="15%" align="center" rowspan="2" nowrap id="WorkLoadCollect.orgName" onClick="talentsort()">所属<br/>教研部</td>
                  <td width="15%" align="center" colspan="3" nowrap >上课</td>
                  <td width="5%" align="center" rowspan="2" nowrap id="WorkLoadCollect.Papers" onClick="talentsort()">评改文章<br/>份数</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Articles" onClick="talentsort()">试卷<br/>份数</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Directions" onClick="talentsort()">青干班毕业<br/>论文指导</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.ExamQuestions" onClick="talentsort()">试卷<br/>命题</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Designs" onClick="talentsort()">课程菜单<br/>设计</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Cases" onClick="talentsort()">教学案例<br/>整编</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Attentions" onClick="talentsort()">跟班听课<br>辅导</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.ClassSum" onClick="talentsort()">折算<br/>课次</td>
                  <td width="10%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.ClassSum" onClick="talentsort()">备注</td>
                </tr>
                  <tr class="td_title"> 

                  <td width="5%" align="center" nowrap >局级班</td>
                  <td width="5%" align="center" nowrap >处级班</td>
                  <td width="5%" align="center" nowrap >其他班</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='WorkLoadCollect']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center">
				  <logic:present  id="resultset" property="WorkLoadCollect/CollectID">
				  	<html:checkbox id="resultset" name="list[@name='update']/WorkLoadCollect/CollectID" property="WorkLoadCollect/CollectID" indexed="true"/>
				  </logic:present>
				  </td>
				  <td align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Yearth" /></td>
                  <td  align="center"  nowrap ><logic:equal id="resultset" property="WorkLoadCollect/Period" value="1">上半年</logic:equal>
                  <logic:equal id="resultset" property="WorkLoadCollect/Period" value="2">下半年</logic:equal>
                  <logic:equal id="resultset" property="WorkLoadCollect/Period" value="3">全年</logic:equal>
                  </td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/operatorName" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/orgName" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset" property="WorkLoadCollect/LessonsJB1" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset" property="WorkLoadCollect/LessonsJB2" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset" property="WorkLoadCollect/LessonsJB3" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Papers" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Articles" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Directions" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/ExamQuestions" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Designs" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Cases" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Attentions" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/ClassSum" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Remark" /></td>
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
	var year = frm.elements["WorkLoadCollect/Yearth/criteria/value"].value;
	var period = frm.elements["WorkLoadCollect/Period/criteria/value"].value;
	var teachGroup = frm.elements["WorkLoadCollect/TeachingGroupID/criteria/value"].value;
	var teacher = frm.elements["WorkLoadCollect/TeacherID/criteria/value"].value;
	var BeginDate = "";
	var EndDate = "";
	if(validater(frm)){
	if(period==1){
			BeginDate = year +"-"+"2-1";
			EndDate = year +"-"+"8-1";
		}else{
			BeginDate = year +"-"+"8-1";
			year = Number(year)+1
			EndDate = year +"-"+"2-1";
		}
	frm.action = frm.elements["addaction"].value + "?year="+year+"&period="+period+"&teachGroup="+teachGroup+"&teacher="+teacher+"&BeginDate="+BeginDate+"&EndDate="+EndDate;
   	frm.submit();
   }

}



</script>
<script>
	loadOrderImg(document.forms[0],'WorkLoadCollect');
</script>