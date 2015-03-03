<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportCourseModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;课题立项查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="10"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="80%"  border="0" align="center" cellpadding="3" cellspacing="3" border="2" bgcolor="#A2C4DC">
          <html:hidden name="ReportedCourse/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">
            <bean:write property="ReportedCourse/Class"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">课题名称：&nbsp;&nbsp;
            <bean:write property="ReportedCourse/ProjectName"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">主题词：&nbsp;&nbsp;<bean:write property="ReportedCourse/MeSH"/></td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">课题类型：
            <bean:write property="ReportedCourse/CourseType"/>&nbsp;&nbsp;
            成果形式：
            <bean:write property="ReportedCourse/ResultType"/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">学科分类：
            <bean:write property="ReportedCourse/SubjectType"/>&nbsp;&nbsp;
            研究类型：
            <bean:write property="ReportedCourse/ReseachType"/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">经费来源：
            <bean:write property="ReportedCourse/FundingSource"/>&nbsp;&nbsp;
            资助经费：
            <bean:write property="ReportedCourse/Fund"/>万元
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">课题批准单位：&nbsp;&nbsp;<bean:write property="ReportedCourse/Units"/></td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td2">委托(合作)单位：&nbsp;&nbsp;<bean:write property="ReportedCourse/AgentUnits"/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">立项时间：&nbsp;&nbsp;<bean:write property="ReportedCourse/ReportTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            &nbsp;&nbsp;(预计)完成时间：&nbsp;&nbsp;<bean:write property="ReportedCourse/ExpectedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td2">课题成员：&nbsp;&nbsp;</td>
          </tr>
          <tr>
            <td id="MemberList_Tr" align="center" class="td1">
            <table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" height="100%" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:100%;border-collapse:collapse;">
	        <tr>
		    <td align="Center" style="font-size:10pt;width:10%;">成员角色</td>
		    <td align="Center" style="font-size:10pt;width:10%;">成员姓名</td>
		    <td align="Center" style="font-size:10pt;width:70%;">承担课题的哪部分工作</td>
	        </tr>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;">
            <logic:equal id="resultset" property="researchGroup/MemberType" value="0">主持人</logic:equal>
            <logic:notEqual id="resultset" property="researchGroup/MemberType" value="0">成员</logic:notEqual>
            </td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
	        </tr>
	        </logic:iterate>
            </table>
            </td>
          </tr>
          <tr id="LocalMembers_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="center" class="td2">
            <IFRAME id="courseMbFrame" scrolling="no" src="" width="100%" height="195px" frameborder="0"></IFRAME>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
		  <td align="left" class="td1">内容提要：&nbsp;&nbsp;<bean:write property="ReportedCourse/Content"/></td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td2">备  注：&nbsp;&nbsp;<bean:write property="ReportedCourse/Remark"/></TD>
	      </TR>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">课题是否结项：&nbsp;&nbsp;
            <logic:equal property="ReportedCourse/IsOver" value="0">
            否
            </logic:equal>
            <logic:equal property="ReportedCourse/IsOver" value="1">
            是
            </logic:equal>
            </td>
          </tr>
          <tr id="OverProject_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td2">结项时间：&nbsp;&nbsp;<bean:write property="ReportedCourse/OverTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>&nbsp;&nbsp;
            专家鉴定结果：&nbsp;&nbsp;
            <logic:equal property="ReportedCourse/Result" value="1">
            优秀
            </logic:equal>
            <logic:equal property="ReportedCourse/Result" value="2">
            良好
            </logic:equal>
            <logic:equal property="ReportedCourse/Result" value="3">
            合格
            </logic:equal>
            <logic:equal property="ReportedCourse/Result" value="4">
            不合格
            </logic:equal>
            </td>
          </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>