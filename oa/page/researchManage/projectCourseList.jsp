<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchManage.ketiSbList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;科研管理—&gt;立项课题申报</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchManage.reportCourseList.do">
		<input type="hidden" name="modifyaction" value="oa.prResearchManage.reportCourseModify.do">
		<input type="hidden" name="deleteaction" value="oa.prResearchManage.reportCourseDelDo.do">
		<input type="hidden" name="viewaction" value="oa.prResearchManage.reportCourseView.do">
		<html:hidden property="QueryReportCourse/_order/col1/field"/>
		<html:hidden property="QueryReportCourse/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
        <html:hidden property="type" />
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
	  	<td class="text">
	  	   <logic:equal property="type" value="sb">
	  	   <qx:talentButton value="申 报" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_ADD" onclick="talentadd()" property="add"></qx:talentButton>
           <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
           <qx:talentButton value="打 印" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="导 出" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           <qx:talentButton value="模板下载" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_DOWNMODEL" onclick="downModel()" property="downmodel"></qx:talentButton>
           </logic:equal>
			<!--	<input name="add" type="button" class="button_02" value="申 报" onClick="talentadd()">
                <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
                <input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
				<input name="downmodel" type="button" class="button_02" value="模板下载" onClick="downModel()">-->
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="20%" align="center" nowrap id="QueryReportCourse.ProjectName" onClick="talentsort()">立项课题名称</td>
                  <td width="14%" align="center" nowrap id="QueryReportCourse.SureTime" onClick="talentsort()">立项时间</td>
                  <td width="16%" align="center" nowrap id="QueryReportCourse.ExpectedTime" onClick="talentsort()">预计结项时间</td>
                  <td width="16%" align="center" nowrap id="QueryReportCourse.OverTime" onClick="talentsort()">实际结项时间</td>
                  <td width="12%" align="center" nowrap id="QueryReportCourse.IsOver" onClick="talentsort()">审批阶段</td>
                  <td width="16%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='ReportedCourse']">
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="view('<bean:write id="resultset" property="QueryReportCourse/ProjectID"/>')">  
                <td align="center"> 
					<logic:present  id="resultset" property="QueryReportCourse/ProjectID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/ReportedCourse/ProjectID" property="QueryReportCourse/ProjectID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="QueryReportCourse/ProjectName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryReportCourse/ReportTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryReportCourse/ExpectedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryReportCourse/OverTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center">
                   <logic:equal id="resultset" property="QueryReportCourse/Status" value="0">
                      <logic:equal id="resultset" property="QueryReportCourse/Fund" value="0">补充信息</logic:equal>
                      <logic:notEqual id="resultset" property="QueryReportCourse/Fund" value="0">已立项</logic:notEqual>
                   </logic:equal>
                   <logic:equal id="resultset" property="QueryReportCourse/Status" value="1">已结项</logic:equal>
                </td>
                <td nowrap align="center">
                  <logic:equal id="resultset" property="QueryReportCourse/Status" value="0">
                      <logic:equal id="resultset" property="QueryReportCourse/Fund" value="0">
                      <logic:equal property="isManager" value="0">
                      <a href='#' onclick="update('<bean:write id="resultset" property="QueryReportCourse/ProjectID"/>')">上传立项信息</a>
                      </logic:equal>
                      </logic:equal>
                      <logic:notEqual id="resultset" property="QueryReportCourse/Fund" value="0">
                      <logic:equal property="isManager" value="1">
                      <a href='#' onclick="updateStatus('<bean:write id="resultset" property="QueryReportCourse/ProjectID"/>')">结项</a>
                      <a href='#' onclick="update('<bean:write id="resultset" property="QueryReportCourse/ProjectID"/>')">修改</a>
                      <a href='#' onclick="delete('<bean:write id="resultset" property="QueryReportCourse/ProjectID"/>')">删除</a>
                      </logic:equal>
                      </logic:notEqual>
                  </logic:equal>
                  <logic:equal id="resultset" property="QueryReportCourse/Status" value="1">
                  <a href='#' onclick="update('<bean:write id="resultset" property="QueryReportCourse/ProjectID"/>')">修改</a>
                  </logic:equal>
                </td>
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
		  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" align="center">
              <IMG src="/internet/image/research/research3.jpg">
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
	function updateStatus(id){
		var frm = document.forms[0];
		frm.action = "oa.prResearchManage.reportCourseUpdate.do";
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function update(id){
		var frm = document.forms[0];
		frm.action = frm.elements["modifyaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function detele(id){
		var frm = document.forms[0];
		if(confirm("是否确定删除此立项课题？")==false){
			return ;
		} 
		frm.action = frm.elements["deleteaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function view(id){
		var frm = document.forms[0];
		frm.action = frm.elements["viewaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function downModel(type){
		var frm = document.forms[0];
		frm.action = frm.elements["downmodelaction"].value;
		//frm.elements["type"].value = type;
   		frm.submit();
	}
</script>