<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSocialSurvey.getLeadTeacher.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;社会调查资料管理—&gt;<span id="printTable">带队老师汇总</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
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
                调查时间：从
            	<html:text property="SocialSurvey/SurveyTime/criteria/min" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SocialSurvey/SurveyTime/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="SocialSurvey/SurveyTime/criteria/max" attributesText='class="input" size="12"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SocialSurvey/SurveyTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="SocialSurvey/SurveyTime/criteria/operator" value="between"/>
			    <input type="hidden" name="SocialSurvey/SurveyTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
                <input name="query" type="button" class="button_02" value="查 询" onClick="queryLeadTeacher()">  
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td class="td1" align="center"><span id="printTable"><b>带队老师汇总表</b><br/><logic:notEqual property="SocialSurvey/SurveyTime/criteria/min" value="">（<bean:write property="SocialSurvey/SurveyTime/criteria/min"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>至<bean:write property="SocialSurvey/SurveyTime/criteria/max"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>）</logic:notEqual></span> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title">
                  <td width="20%" align="center" nowrap id="SocialSurvey.classname" onClick="talentsort()">时间</td>
                  <td width="20%" align="center" nowrap id="SocialSurvey.Theme" onClick="talentsort()">班级</td>
                  <td width="20%" align="center" nowrap id="SocialSurvey.Detail" onClick="talentsort()">负责教研部</td>
                  <td width="20%" align="center" nowrap id="SocialSurvey.SurveyTime" onClick="talentsort()">带队老师</td>
                  <td width="20%" align="center" nowrap id="SocialSurvey.SurveySpot" onClick="talentsort()">备注</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='SocialSurvey']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="SocialSurvey/SurveyID"/>','true')"> 
                 <td nowrap>&nbsp;<bean:write id="resultset"  property="SocialSurvey/SurveyTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="SocialSurvey/ClassName"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="SocialSurvey/orgName"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset"  property="SocialSurvey/LeadTeacherName"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset"  property="SocialSurvey/Remarks"/></td>
                </tr>
				</logic:iterate>
                
              </table>
           <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				<input name="export" type="button" class="button_02" value="返 回" onClick="goBack();"></td>
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
function goBack(){
	var frm = document.forms[0];
	frm.action="teachWorkManage.prSocialSurvey.ssList.do";
	frm.submit();
}
function queryLeadTeacher(){
	var frm = document.forms[0];
	var BeginTime = frm["SocialSurvey/SurveyTime/criteria/min"].value;
	var EndTime = frm["SocialSurvey/SurveyTime/criteria/max"].value;
	if(BeginTime ==""||EndTime==""){
		alert("请先选择调查时间");
	}else{
	frm.action = "teachWorkManage.prSocialSurvey.getLeadTeacher.do";
   	frm.submit();
   	}
}
</script>
<script>
	loadOrderImg(document.forms[0],'SocialSurvey');
</script>