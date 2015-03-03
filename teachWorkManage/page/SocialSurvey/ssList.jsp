<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSocialSurvey.ssList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;社会调查资料管理—&gt;<span id="printTable">社会调查资料列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prSocialSurvey.ssList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prSocialSurvey.ssAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prSocialSurvey.ssModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prSocialSurvey.ssDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prSocialSurvey.ssView.do">
		<html:hidden property="QuerySocialSurvey/_order/col1/field"/>
		<html:hidden property="QuerySocialSurvey/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length"/>
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
				<a title='关键字可以是班级名称、调查主题、负责的教研部、带队老师、地点' id="keytitle">关键字查询：</a> 
                <html:text property="fcc/search" attributesText='class="input" size="30"'/>
                调查时间：从
            	<html:text property="QuerySocialSurvey/SurveyTime/criteria/min" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QuerySocialSurvey/SurveyTime/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="QuerySocialSurvey/SurveyTime/criteria/max" attributesText='class="input" size="12"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QuerySocialSurvey/SurveyTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="QuerySocialSurvey/SurveyTime/criteria/operator" value="between"/>  
                 <br/>
                 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">  
              
                <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_SOCIALSSURVEY.DX_TEACH_MANAGE_SOCIALSSURVEY_ADD"/>
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_SOCIALSSURVEY.DX_TEACH_MANAGE_SOCIALSSURVEY_MODIFY"/>
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_SOCIALSSURVEY.DX_TEACH_MANAGE_SOCIALSSURVEY_DELETE"/>
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				<qx:talentButton property="report" type="button" styleClass="button_02" value="调查报告" onclick="viewReport()" operation="DX_TEACH_MANAGE_SOCIALSSURVEY.DX_TEACH_MANAGE_SOCIALSSURVEY_REPORT"/>
				<qx:talentButton property="leadteacher" type="button" styleClass="button_02" value="带队老师" onclick="queryLeadTeacher()" operation="DX_TEACH_MANAGE_SOCIALSSURVEY.DX_TEACH_MANAGE_SOCIALSSURVEY_LEADER"/>
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" ></td>
                  <td width="18%" align="center" nowrap id="QuerySocialSurvey.classname" onClick="talentsort()">班级名称</td>
                  <td width="20%" align="center" nowrap id="QuerySocialSurvey.Theme" onClick="talentsort()">调查主题</td>
                  <td width="21%" align="center" nowrap id="QuerySocialSurvey.Detail" onClick="talentsort()">调查内容</td>
                  <td width="8%" align="center" nowrap id="QuerySocialSurvey.SurveyTime" onClick="talentsort()">调查时间</td>
                  <td width="12%" align="center" nowrap id="QuerySocialSurvey.TeachingGroup" onClick="talentsort()">负责教研部</td>
                  <td width="5%" align="center" nowrap id="QuerySocialSurvey.LeadTeacher" onClick="talentsort()">带队领导</td>
                  <td width="8%" align="center" nowrap id="QuerySocialSurvey.LeadTeacher" onClick="talentsort()">跟班老师及班主任</td>
                  <td width="5%" align="center" nowrap id="QuerySocialSurvey.IsPublish" onClick="talentsort()">发表情况</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='socialsurvey']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QuerySocialSurvey/SurveyID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QuerySocialSurvey/SurveyID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QuerySocialSurvey/SurveyID" property="QuerySocialSurvey/SurveyID" indexed="true"/>
				 <input  type="hidden" value="<bean:write id="resultset" property="QuerySocialSurvey/ReportAttachType" />"/>
				  </logic:present>
				  </td>
                  <td >&nbsp;<bean:write id="resultset" property="QuerySocialSurvey/classname"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="QuerySocialSurvey/Theme"/></td>
                  <td >&nbsp;<bean:write id="resultset"  property="QuerySocialSurvey/Detail"/></td>
                  <td >&nbsp;<bean:write id="resultset"  property="QuerySocialSurvey/SurveyTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td >&nbsp;<bean:write id="resultset"  property="QuerySocialSurvey/orgName"/></td>
                  <td >&nbsp;<bean:write id="resultset"  property="QuerySocialSurvey/LeadTeacherName"/></td>
                  <td >&nbsp;<bean:write id="resultset"  property="QuerySocialSurvey/AttendantsName"/></td>
                  <td >&nbsp;<bean:write id="resultset"  property="QuerySocialSurvey/Publish"/></td>
                  
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
function queryLeadTeacher(){
	var frm = document.forms[0];
	var BeginTime = frm["QuerySocialSurvey/SurveyTime/criteria/min"].value;
	var EndTime = frm["QuerySocialSurvey/SurveyTime/criteria/max"].value;
	if(BeginTime ==""||EndTime==""){
		alert("请先选择调查时间");
	}else{
	frm.action = "teachWorkManage.prSocialSurvey.getLeadTeacher.do?SocialSurvey/SurveyTime/criteria/min="+BeginTime+"&SocialSurvey/SurveyTime/criteria/max="+EndTime+"&SocialSurvey/SurveyTime/criteria/operator=between&SocialSurvey/SurveyTime/criteria/criteriaPattern=yyyy-MM-dd" ;
   	frm.submit();
   	}
}

function viewReport(){
	var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
    	}
		if(chechedCount(frm)==1){
			var id = getChechedValue(frm);
			var AttachType =getAttachTypeValue(frm);
			if(AttachType==""){
			 alert("所选社会调查没有报告！");
    		 return ;
			}
			var url='/common/page/viewimgdb/viewFromDB.jsp?table=SocialSurvey&pkn=SurveyID&field=Report&pkv='+id+'&type='+AttachType;
			createWindow(url,100,100,800,500);
    	}
}


function getAttachTypeValue(form) {
	    var eles = form.elements;
		var i=0;
		var name="";	
	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled){
				if(obj.checked){
				   name=eles[i+1].value;
			     }			   
			}
			i++;
		}//while		
	return name

}
</script>
<script>
	loadOrderImg(document.forms[0],'QuerySocialSurvey');
</script>