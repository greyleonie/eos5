<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportResultModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;成果立项查看</td>
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
          <html:hidden name="ReportedResult/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">成果形式：&nbsp;&nbsp;<bean:write property="ReportedResult/ResultType"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">成果名称：&nbsp;&nbsp;<bean:write property="ReportedResult/ProjectName"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">主题词：&nbsp;&nbsp;<bean:write property="ReportedResult/MeSH"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">成果总字数：&nbsp;&nbsp;<bean:write property="ReportedResult/WordNum"/></td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">学科分类：&nbsp;&nbsp;<bean:write property="ReportedResult/SubjectType"/>&nbsp;&nbsp;
            研究类型：&nbsp;&nbsp;<bean:write property=ReportedResult/ReseachType/>
		    成果文种：&nbsp;&nbsp;<bean:write property=ReportedResult/Languages/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">独著或合著：&nbsp;&nbsp;<bean:write property="ReportedResult/CourseType"/></td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td1">成果委托单位：&nbsp;&nbsp;<bean:write property="ReportedResult/AgentUnit"/></td>
          </tr>
          <tr id="ShangBao_TR" onClick="changeTRBgColor(this)">
            <td align="left" class="td2">成果上报单位：&nbsp;&nbsp;<bean:write property="ReportedResult/ReleasedUnit"/></td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">出版社名称：&nbsp;&nbsp;<bean:write property="ReportedResult/Publisher"/></td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">发表时间：&nbsp;&nbsp;<bean:write property="ReportedResult/ReleasedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            &nbsp;&nbsp;第<bean:write property="ReportedResult/QiShu"/></td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td1">成果作者：
            </td>
          </tr>
          <tr>
            <td id="MemberList_Tr" align="center" class="td2">
            <table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" height="100%" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:100%;border-collapse:collapse;">
	        <tr>
		    <td align="Center" style="font-size:10pt;width:10%;">作者顺序</td>
		    <td align="Center" style="font-size:10pt;width:10%;">作者姓名</td>
		    <td align="Center" style="font-size:10pt;width:50%;">承担成果的哪部分工作</td>
		    <td align="Center" style="font-size:10pt;width:20%;">完成字数(千字)</td>
	        </tr>
	        <%int i=1; %>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;"><%=i++%></td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WordNum"/></td>
	        </tr>
	        </logic:iterate>
            </table>
            </td>
          </tr>
          <tr id="LocalMembers_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="center" class="td1">
            <IFRAME id="resultMbFrame" scrolling="no" src="" width="100%" height="195px" frameborder="0"></IFRAME>
            </td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">是否立项成果：&nbsp;&nbsp;
            <logic:equal property="ReportedResult/IsProjectResult" value="0">
            否
            </logic:equal>
            <logic:equal property="ReportedResult/IsProjectResult" value="1">
            是
            </logic:equal>
            </td>
          </tr>
          <tr id="ResultProject_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td1">阶段或最终成果：&nbsp;&nbsp;<bean:write property="ReportedResult/ResultTime"/></td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">成果是否获奖：&nbsp;&nbsp;
            <logic:equal property="ReportedResult/IsWinning" value="0">
            否
            </logic:equal>
            <logic:equal property="ReportedResult/IsWinning" value="1">
            是
            </logic:equal>
            </td>
          </tr>
          <tr id="ResultWinner_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td1">获奖名称：&nbsp;&nbsp;<bean:write property="ReportedResult/WinnerName"/>
            <br>授奖机构：&nbsp;&nbsp;<bean:write property="ReportedResult/GiveDep"/>
            <br>获奖等级：&nbsp;&nbsp;<bean:write property="ReportedResult/WinClass"/>
		    <br>获奖时间：&nbsp;&nbsp;<bean:write property="ReportedResult/WinTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
		    </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
		  <td align="left" class="td2">内容提要：&nbsp;&nbsp;<bean:write property="ReportedCourse/Content"/></td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td1">备  注：&nbsp;&nbsp;<bean:write property="ReportedCourse/Remark"/></TD>
	      </TR>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>