<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportResultModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;成果立项申报</td>
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
      <div align="center" style="color:MediumBlue;font-weight:bold;font-size:medium;">科研成果申报表（加注 * 项为必填项）</div>
      <table width="80%"  border="0" align="center" cellpadding="3" cellspacing="3" border="2" bgcolor="#A2C4DC">
          <html:hidden name="ReportedResult/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>成果形式：
            <html:select property="ReportedResult/ResultType" style="width:144px;" onchange="KTLX_Dropdownlist_onchange()" attributesText='ValidateType="notempty" Msg="成果形式不能为空"'>
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
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>成果名称：
            <html:text property="ReportedResult/ProjectName" maxlength="100" attributesText='class="input" size="50"' readonly="true"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">主题词：&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="ReportedResult/MeSH" maxlength="100" attributesText='class="input" size="50"'/>
            (&lt;100字符)</td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">成果总字数：<html:text property="ReportedResult/WordNum" maxlength="100" attributesText='class="input" size="20" ValidateType="numeric" Msg="成果总字数必须为数字"'/>千字  (请输入数字)
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>学科分类：
            <html:select property="ReportedResult/SubjectType" style="width:128px;" attributesText='ValidateType="notempty" Msg="学科分类不能为空"'>
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
            研究类型：
            <html:select property="ReportedResult/ReseachType" style="width:85px;">
			<html:option value="">请选择</html:option>
			<html:option value="基础研究">基础研究</html:option>
			<html:option value="应用研究">应用研究</html:option>
			<html:option value="综合研究">综合研究</html:option>
			<html:option value="其他研究">其他研究</html:option>
		    </html:select>
		    成果文种：
            <html:select property="ReportedResult/Languages" style="width:85px;">
			<html:option value="">请选择</html:option>
			<html:option value="中文">中文</html:option>
			<html:option value="英文">英文</html:option>
			<html:option value="日文">日文</html:option>
			<html:option value="法文">法文</html:option>
			<html:option value="德文">德文</html:option>
			<html:option value="其它">其它</html:option>
		    </html:select>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>独著或合著：&nbsp;&nbsp;
            <html:radio property="ReportedResult/CourseType" value="独著" checked="true"/>独著&nbsp;
            <html:radio property="ReportedResult/CourseType" value="合著"/>合著&nbsp;
            </td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td1"><span class="text_red">*</span>成果委托单位：&nbsp;
            <html:text property="ReportedResult/AgentUnit" maxlength="100" attributesText='class="input" size="50"'/>
            </td>
          </tr>
          <tr id="ShangBao_TR" onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>成果上报单位：&nbsp;
            <html:text property="ReportedResult/ReleasedUnit" maxlength="100" attributesText='class="input" size="50"'/>
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span><span id="publisher_span">出版社名称：</span>&nbsp;&nbsp;&nbsp;
            <html:text property="ReportedResult/Publisher" maxlength="100" attributesText='class="input" size="50"' attributesText='ValidateType="notempty" Msg="出版社名称不能为空"'/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>发表时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <html:text name="ReportedResult/ReleasedTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/ReportTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="发表时间不能为空"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedResult/ReleasedTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            &nbsp;&nbsp;第<html:text property="ReportedResult/QiShu" maxlength="10" attributesText='class="input" size="10"'/>期
            </td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>成果作者：&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getLocalMember()">添加本单位作者</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getExtraMember()">添加外单位作者</a>
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
		    <td align="Center" style="font-size:10pt;width:10%;">操作</td>
	        </tr>
	        <%int i=1; %>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;"><%=i++%></td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WordNum"/></td>
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
            <td align="center" class="td1">
            <IFRAME id="resultMbFrame" scrolling="no" src="" width="100%" height="195px" frameborder="0"></IFRAME>
            </td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">是否立项成果：
            <html:radio property="ReportedResult/IsProjectResult" value="0" checked="true" onclick="document.all('ResultProject_Tr').style.display='none'"/>否&nbsp;&nbsp;&nbsp;&nbsp;
            <html:radio property="ReportedResult/IsProjectResult" value="1" onclick="document.all('ResultProject_Tr').style.display=''"/>是
            </td>
          </tr>
          <tr id="ResultProject_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td1">阶段或最终成果：
            <html:radio property="ReportedResult/ResultTime" value="阶段成果" checked="true"/>阶段成果&nbsp;
            <html:radio property="ReportedResult/ResultTime" value="最终成果"/>最终成果&nbsp;
            &nbsp;&nbsp;
            立项课题：
            <html:select property="ReportedResult/ReportCourseID" style="width:108px;">
			<html:option value="">请选择</html:option>
			<html:options property="list[@type='ReportedCourses']/ReportedCourse/ProjectID" labelProperty="list[@type='ReportedCourses']/ReportedCourse/ProjectName"></html:options>
		    </html:select>
            </td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">成果是否获奖：
            <html:radio property="ReportedResult/IsWinning" value="0" checked="true" onclick="document.all('ResultWinner_Tr').style.display='none'"/>否&nbsp;&nbsp;&nbsp;&nbsp;
            <html:radio property="ReportedResult/IsWinning" value="1" onclick="document.all('ResultWinner_Tr').style.display=''"/>是
            </td>
          </tr>
          <tr id="ResultWinner_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td1"><span class="text_red">*</span>获奖名称：
            <html:text property="ReportedResult/WinnerName" maxlength="100" attributesText='class="input" size="50"'/>
            <br><span class="text_red">*</span>授奖机构：
            <html:text property="ReportedResult/GiveDep" maxlength="100" attributesText='class="input" size="50"'/>
            <br><span class="text_red">*</span>获奖等级：
            <html:select property="ReportedResult/WinClass" style="width:85px;">
			<html:option value="">请选择</html:option>
			<html:option value="A">国家级奖</html:option>
			<html:option value="B">省部级奖</html:option>
			<html:option value="C">地市级奖</html:option>
			<html:option value="E">国外</html:option>
			<html:option value="F">其他</html:option>
		    </html:select>
		    <br><span class="text_red">*</span>获奖时间：
		    <html:text name="ReportedResult/WinTime[@pattern='yyyy-MM-dd']" property="ReportedResult/WinTime" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedResult/WinTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
		  <td align="left" class="td2">内容提要：
		    <html:textarea property="ReportedCourse/Content" style="height:80px;width:328px;"/>(&lt;100字符)</td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td1">备  注：&nbsp;&nbsp;&nbsp;
		  <html:textarea property="ReportedCourse/Remark" style="height:80px;width:328px;"/>(&lt;100字符)</TD>
	      </TR>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <logic:equal property="ReportedResult/Status" value="0">
                <logic:equal property="isManager" value="1">
                <input name="Button" type="button" class="button_02" value="通 过" onClick="updateStatus()">
                </logic:equal>
                </logic:equal>
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:location.href='oa.prResearchManage.reportResultList.do'">
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
  	var obj=frm.elements["ReportedResult/ResultType"];
  	
		if(obj.options[obj.selectedIndex].value=="研究报告（公开发表）") {
		    if (frm.elements["ReportedResult/AgentUnit"].value=="") {
			    alert("--成果委托单位不能为空");
			    return false;
		    }
		    if (frm.elements["ReportedResult/ReleasedUnit"].value=="") {
			    alert("--成果上报单位不能为空");
			    return false;
		    }
		}
		
		if (frm.elements["ReportedResult/IsWinning"][1].checked) {
		   if (frm.elements["ReportedResult/WinnerName"].value=="") {
			    alert("--获奖名称不能为空");
			    return false;
		   }
		   if (frm.elements["ReportedResult/GiveDep"].value=="") {
			    alert("--授奖机构不能为空");
			    return false;
		   }
		   if (frm.elements["ReportedResult/WinClass"].value=="") {
			    alert("--获奖等级不能为空");
			    return false;
		   }
		   if (frm.elements["ReportedResult/WinTime[@pattern='yyyy-MM-dd']"].value=="") {
			    alert("--获奖时间不能为空");
			    return false;
		   }
		}
		   
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function updateStatus() {
     var frm = document.forms[0];
	 location.href = "oa.prResearchManage.reportResultUpdate.do?fid=" + frm.elements["ReportedResult/ProjectID"].value;
  }
  
  function KTLX_Dropdownlist_onchange()
  {
        var frm = document.forms[0];
		var obj=frm.elements["ReportedResult/ResultType"];
		switch(obj.options[obj.selectedIndex].value)
		{
			case "论文"://论文或文章
				document.all("WeiTuo_TR").style.display="none";
				document.all("ShangBao_TR").style.display="none";
				document.all("publisher_span").innerText="出版刊物及转载情况：";
				frm.elements["ReportedResult/Publisher"].Msg="出版刊物及转载情况不能为空";
				break;
			case "研究报告（公开发表）"://研究报告
				document.all("WeiTuo_TR").style.display="";
				document.all("ShangBao_TR").style.display="";
				document.all("publisher_span").innerText="出版社或刊物：";
				frm.elements["ReportedResult/Publisher"].Msg="出版社或刊物不能为空";
				break;
			case "会议论文"://国际大会
				document.all("WeiTuo_TR").style.display="none";
				document.all("ShangBao_TR").style.display="none";
				document.all("publisher_span").innerText="国际会议名称：";
				frm.elements["ReportedResult/Publisher"].Msg="国际会议名称不能为空";
				break;
			default:
				document.all("WeiTuo_TR").style.display="none";
				document.all("ShangBao_TR").style.display="none";
				document.all("publisher_span").innerText="出版社名称：";
				frm.elements["ReportedResult/Publisher"].Msg="出版社名称不能为空";
				break;
 		}
  }
  
  function getLocalMember() {
     var frm = document.forms[0];
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("resultMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     if (frm.elements["ReportedResult/CourseType"][0].checked)
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=1&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=0";
     else
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=1&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=1";
  }
  
  function getExtraMember() {
     var frm = document.forms[0];
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("resultMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     if (frm.elements["ReportedResult/CourseType"][0].checked)
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=0&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=0";
     else
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=0&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=1";
  }
  
  function delMember(mid) {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("resultMbFrame").height = "195px";
     document.all("MemberList_Tr").style.display = "none";
     document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberDelDo.do?random="+random+"&researchGroup/MemberId=" + mid + "&researchGroup/ProjectID=" + document.forms[0].elements["ReportedResult/ProjectID"].value;
  }
  </script>
 