<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.workArrangeList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;网络中心—&gt;中心工作日志—&gt;分派工作安排</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.workArrangeList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prNetCenter.workArrangeAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.workArrangeModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.workArrangeDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prNetCenter.workArrangeView.do">
		<input type="hidden" name="replayviewaction" value="teachWorkManage.prNetCenter.workArrangeReplayView.do">
		
		<html:hidden property="CenterWorkPlan/_order/col1/field"/>
		<html:hidden property="CenterWorkPlan/_order/col1/desc" />
		
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
	  	<td class="text">
	  	        <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
				<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="6%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="14%" align="center" nowrap id="CenterWorkPlan.WorkDate" onClick="talentsort()">安排日期</td>
                  <td width="25%" align="center" nowrap id="CenterWorkPlan.Director" onClick="talentsort()">安排人员</td>
                  <td width="35%" align="center" nowrap id="CenterWorkPlan.Summary" onClick="talentsort()">工作概要</td>
                  <td width="8%" align="center" nowrap id="CenterWorkPlan.Status" onClick="talentsort()">完成情况</td>
                  <td width="12%" align="center" >回复</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CenterWorkPlan']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CenterWorkPlan/WorkID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CenterWorkPlan/WorkID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CenterWorkPlan/WorkID" property="CenterWorkPlan/WorkID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="CenterWorkPlan/WorkDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<span title='<bean:write id="resultset" property="CenterWorkPlan/DirectorName"/>'><bean:write id="resultset" property="CenterWorkPlan/DirectorSubName"/></span></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="CenterWorkPlan/Summary"/></td>
                <td nowrap>&nbsp;
                <logic:equal id="resultset" property="CenterWorkPlan/Status" value="0">待修</logic:equal>
                <logic:equal id="resultset" property="CenterWorkPlan/Status" value="1">在修</logic:equal>
                <logic:equal id="resultset" property="CenterWorkPlan/Status" value="2">完成</logic:equal>
                </td>
                <td nowrap align="center">
                  <logic:present id="resultset" property="CenterWorkPlan/list[@type='CenterWorkReply']">
                  <a href='#' onClick="replayView('<bean:write id="resultset" property="CenterWorkPlan/WorkID"/>')">查看回复</a>
                  </logic:present>
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
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>	
	function replayView(id){
		var frm = document.forms[0];

		frm.action = frm.elements["replayviewaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
</script>