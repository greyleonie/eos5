<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportCourseModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;课题立项申报</td>
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
      <div align="center" style="color:MediumBlue;font-weight:bold;font-size:medium;">立项课题填报表（加注 * 项为必填项）</div>
      <table width="80%"  border="0" align="center" cellpadding="3" cellspacing="3" border="2" bgcolor="#A2C4DC">
          <html:hidden name="ReportedCourse/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>请选择：
            <html:radio property="ReportedCourse/Class" value="国家级课题" checked="true"/>国家级课题&nbsp;
            <html:radio property="ReportedCourse/Class" value="省部级课题"/>省部级课题&nbsp;
            <html:radio property="ReportedCourse/Class" value="市级课题"/>市级课题&nbsp;
            <html:radio property="ReportedCourse/Class" value="校级课题"/>校级课题&nbsp;
            <html:radio property="ReportedCourse/Class" value="其他课题"/>其他课题&nbsp;
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>课题名称：
            <html:text property="ReportedCourse/ProjectName" maxlength="100" attributesText='class="input" size="50"' readonly="true"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">主题词：&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="ReportedCourse/MeSH" maxlength="100" attributesText='class="input" size="50"'/>
            (&lt;100字符)</td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>课题类型：
            <html:select property="ReportedCourse/CourseType" onchange="KTLX_Dropdownlist_onchange()" style="width:136px;" attributesText='ValidateType="notempty" Msg="课题类型不能为空"'>
			<html:option value="">请选择</html:option>
			<html:option value="重点课题">重点课题</html:option>
			<html:option value="一般课题">一般课题</html:option>
			<html:option value="青年课题">青年课题</html:option>
			<html:option value="自筹经费课题">自筹经费课题</html:option>
			<html:option value="委托课题">委托课题</html:option>
			<html:option value="合作课题">合作课题</html:option>
			<html:option value="院级课题">院级课题</html:option>
			<html:option value="院内部门课题">院内部门课题</html:option>
			<html:option value="国际合作">国际合作</html:option>
			<html:option value="招标课题">招标课题</html:option>
			<html:option value="其他">其他</html:option>
            </html:select>&nbsp;&nbsp;
            <span class="text_red">*</span>成果形式：
            <html:select property="ReportedCourse/ResultType" style="width:144px;" attributesText='ValidateType="notempty" Msg="成果形式不能为空"'>
			<html:option value="">请选择</html:option>
			<html:option value="论文">论文</html:option>
			<html:option value="专著">专著</html:option>
			<html:option value="编著">编著</html:option>
			<html:option value="译著">译著</html:option>
			<html:option value="论文集">论文集</html:option>
			<html:option value="研究报告（公开发表）">研究报告（公开发表）</html:option>
			<html:option value="电子出版物">电子出版物</html:option>
			<html:option value="教材">教材</html:option>
			<html:option value="工具书">工具书</html:option>
			<html:option value="电脑软件">电脑软件</html:option>
			<html:option value="会议论文">会议论文</html:option>
			<html:option value="非公开发表成果">非公开发表成果</html:option>
			<html:option value="其他">其他</html:option>
		    </html:select>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>学科分类：
            <html:select property="ReportedCourse/SubjectType" style="width:136px;" attributesText='ValidateType="notempty" Msg="学科分类不能为空"'>
			<html:option value="">请选择</html:option>
			<html:option value="公共管理学">公共管理学</html:option>
			<html:option value="经济学">经济学</html:option>
			<html:option value="法学">法学</html:option>
			<html:option value="政治学">政治学</html:option>
			<html:option value="社会学">社会学</html:option>
			<html:option value="马列&#183;科社">马列&#183;科社</html:option>
			<html:option value="党史&#183;党建">党史&#183;党建</html:option>
			<html:option value="哲学">哲学</html:option>
			<html:option value="社会学">社会学</html:option>
			<html:option value="统计学">统计学</html:option>
			<html:option value="人口学">人口学</html:option>
			<html:option value="民族问题研究">民族问题研究</html:option>
			<html:option value="国际问题研究">国际问题研究</html:option>
			<html:option value="中国历史">中国历史</html:option>
			<html:option value="世界历史">世界历史</html:option>
			<html:option value="考古学">考古学</html:option>
			<html:option value="宗教学">宗教学</html:option>
			<html:option value="中国文学">中国文学</html:option>
			<html:option value="外国文学">外国文学</html:option>
			<html:option value="语言学">语言学</html:option>
			<html:option value="新闻学">新闻学</html:option>
			<html:option value="图书馆">图书馆</html:option>
			<html:option value="体育学">体育学</html:option>
			<html:option value="其他学科">其他学科</html:option>
            </html:select>&nbsp;&nbsp;
            <span class="text_red">*</span>研究类型：
            <html:select property="ReportedCourse/ReseachType" style="width:144px;" attributesText='ValidateType="notempty" Msg="研究类型不能为空"'>
			<html:option value="">请选择</html:option>
			<html:option value="基础研究">基础研究</html:option>
			<html:option value="应用研究">应用研究</html:option>
			<html:option value="综合研究">综合研究</html:option>
			<html:option value="其他研究">其他研究</html:option>
		    </html:select>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>经费来源：
            <html:select property="ReportedCourse/FundingSource" style="width:136px;" attributesText='ValidateType="notempty" Msg="经费来源不能为空"'>
			<html:option value="国家拨款">国家拨款</html:option>
			<html:option value="本单位拨款">本单位拨款</html:option>
			<html:option value="自筹">自筹</html:option>
			<html:option value="资助">资助</html:option>
			<html:option value="基金会">基金会</html:option>
			<html:option value="合作基金">合作基金</html:option>
			<html:option value="有关单位拨款">有关单位拨款</html:option>
			<html:option value="其他">其他</html:option>
            </html:select>&nbsp;&nbsp;
            <span class="text_red">*</span>资助经费：
            <html:text property="ReportedCourse/Fund" maxlength="50" attributesText='class="input" size="20" ValidateType="notempty" Msg="资助经费不能为空"'/>万元
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>课题批准单位：&nbsp;
            <html:text property="ReportedCourse/Units" maxlength="100" attributesText='class="input" size="50" ValidateType="notempty" Msg="课题批准单位不能为空"'/>
            </td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td2"><span class="text_red">*</span>委托(合作)单位：&nbsp;
            <html:text property="ReportedCourse/AgentUnits" maxlength="100" attributesText='class="input" size="50"'/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>立项时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <html:text name="ReportedCourse/ReportTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/ReportTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="立项时间不能为空"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedCourse/ReportTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            &nbsp;&nbsp;<span class="text_red">*</span>(预计)完成时间：
            <html:text name="ReportedCourse/ExpectedTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/ExpectedTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="(预计)完成时间不能为空"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedCourse/ExpectedTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>课题成员：&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getLocalMember()">添加本单位成员</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getExtraMember()">添加外单位成员</a>
            </td>
          </tr>
          <tr>
            <td id="MemberList_Tr" align="center" class="td1">
            <table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" height="100%" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:100%;border-collapse:collapse;">
	        <tr>
		    <td align="Center" style="font-size:10pt;width:10%;">成员角色</td>
		    <td align="Center" style="font-size:10pt;width:10%;">成员姓名</td>
		    <td align="Center" style="font-size:10pt;width:70%;">承担课题的哪部分工作</td>
		    <td align="Center" style="font-size:10pt;width:10%;">操作</td>
	        </tr>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;">
            <logic:equal id="resultset" property="researchGroup/MemberType" value="0">主持人</logic:equal>
            <logic:notEqual id="resultset" property="researchGroup/MemberType" value="0">成员</logic:notEqual>
            </td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		    <td align="Center" style="color:Blue;font-size:10pt;">
		    <!--<a href="javascript:modifyMember('<bean:write id="resultset" property="researchGroup/MemberId"/>')" style="color:Blue;">修改</a>-->
		    <a href="javascript:delMember('<bean:write id="resultset" property="researchGroup/MemberId"/>')" style="color:Blue;">删除</a>
		    </td>
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
		  <td align="left" class="td1">内容提要：
		    <html:textarea property="ReportedCourse/Content" style="height:80px;width:328px;"/>(&lt;100字符)</td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td2">备  注：&nbsp;&nbsp;&nbsp;
		  <html:textarea property="ReportedCourse/Remark" style="height:80px;width:328px;"/>(&lt;100字符)</TD>
	      </TR>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">课题是否结项：
            <html:radio property="ReportedCourse/IsOver" value="0" checked="true" onclick="document.all('OverProject_Tr').style.display='none'"/>否&nbsp;&nbsp;&nbsp;&nbsp;
            <html:radio property="ReportedCourse/IsOver" value="1" onclick="document.all('OverProject_Tr').style.display=''"/>是
            </td>
          </tr>
          <tr id="OverProject_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td2"><span class="text_red">*</span>结项时间：
            <html:text name="ReportedCourse/OverTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/OverTime" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedCourse/OverTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            &nbsp;&nbsp;
            <span class="text_red">*</span>专家鉴定结果：
            <html:select property="ReportedCourse/Result" style="width:108px;">
			<html:option value="">请选择</html:option>
			<html:option value="1">优秀</html:option>
			<html:option value="2">良好</html:option>
			<html:option value="3">合格</html:option>
			<html:option value="4">不合格</html:option>
		    </html:select>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <logic:equal property="ReportedCourse/Status" value="0">
                <logic:equal property="isManager" value="1">
                <input name="Button" type="button" class="button_02" value="结 项" onClick="updateStatus()">
                </logic:equal>
                </logic:equal>
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:location.href='oa.prResearchManage.reportCourseList.do'">
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
 
  <script language="javascript">

  function save() {
  	var frm = document.forms[0];
  	var obj=document.all("ReportedCourse/CourseType");
  	
		if(obj.options[obj.selectedIndex].value=="委托课题" || obj.options[obj.selectedIndex].value=="合作课题")
		    if (frm.elements["ReportedCourse/AgentUnits"].value=="") {
			    alert("--委托(合作)单位不能为空");
			    return false;
		    }
		
		if (frm.elements["ReportedCourse/IsOver"][1].checked) {
		   if (frm.elements["ReportedCourse/OverTime[@pattern='yyyy-MM-dd']"].value=="") {
			    alert("--结项时间不能为空");
			    return false;
		   }
		   if (frm.elements["ReportedCourse/Result"].options[frm.elements["ReportedCourse/Result"].selectedIndex].value=="") {
			    alert("--专家鉴定结果不能为空");
			    return false;
		   }
		}
		   
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function updateStatus() {
     var frm = document.forms[0];
	 location.href = "oa.prResearchManage.reportCourseUpdate.do?fid=" + frm.elements["ReportedCourse/ProjectID"].value;
  }
  
  function KTLX_Dropdownlist_onchange()
  {
		var obj=document.all("ReportedCourse/CourseType");
		if(obj.options[obj.selectedIndex].value=="委托课题" || obj.options[obj.selectedIndex].value=="合作课题")
			document.all("WeiTuo_TR").style.display="";
		else
			document.all("WeiTuo_TR").style.display="none";
  }
  
  function getLocalMember() {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("courseMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     document.all("courseMbFrame").src = "oa.prResearchManage.courseMemberAdd.do?random="+random+"&isLocal=1&fid="+document.forms[0].elements["ReportedCourse/ProjectID"].value;
  }
  
  function getExtraMember() {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("courseMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     document.all("courseMbFrame").src = "oa.prResearchManage.courseMemberAdd.do?random="+random+"&isLocal=0&fid="+document.forms[0].elements["ReportedCourse/ProjectID"].value;
  }
  
  function delMember(mid) {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("courseMbFrame").height = "195px";
     document.all("MemberList_Tr").style.display = "none";
     document.all("courseMbFrame").src = "oa.prResearchManage.courseMemberDelDo.do?random="+random+"&researchGroup/MemberId=" + mid + "&researchGroup/ProjectID=" + document.forms[0].elements["ReportedCourse/ProjectID"].value;
  }
  </script>
 