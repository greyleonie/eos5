<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.pr.studenUserlist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;<span id="printTable">学员用户</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.pr.studenUserlist.do">
		<input type="hidden" name="addaction" value="studentmanage.student_xj.xjadd.do">
		<input type="hidden" name="modifyaction" value="studentmanage.student_xj.xjmodify.do">
		<input type="hidden" name="deleteaction" value="studentmanage.student_xj.xjdelete.do">
		<input type="hidden" name="viewaction" value="studentmanage.student_xj.xjview.do">
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<!--INPUT value="like" type="hidden" name="QueryStudent/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudent/operatorname/criteria/likeRule"-->
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
            <td class="text">班　　　级： <html:select property="QueryStudent/ClassID/criteria/value" onchange="talentquery()" > 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			 </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				<a title='关键字可以是"帐号、学员姓名、工作单位、工作单位职务"' id="keytitle">关键字查询</a>： 
			    <html:text property="QueryStudent/fccsearch" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
              <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
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
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="9%" align="center" nowrap id="QueryStudent.userID" onClick="talentsort()">帐号</td>
                  <td width="13%" align="center" nowrap id="QueryStudent.operatorname" onClick="talentsort()">姓名</td>
				  <td width="13%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">职务</td>
				  <td width="23%" align="center" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">工作单位</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.status" onClick="talentsort()">用户状态</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.cardID" onClick="talentsort()">用户CARD</td>
                  <td width="9%" align="center" nowrap >用户权限</td>
                  <td width="8%" align="center" nowrap >修改</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='student']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudent/StudentID"/>','true')"> 
                <td align="center"> <logic:present  id="resultset" property="QueryStudent/StudentID"> 
                  <html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/> 
                  </logic:present> </td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/userID"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/operatorname"/></td>
				<td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Duty"/></td>
				<td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan"/></td>
                <td nowrap>&nbsp;
					<logic:equal id="resultset" property="QueryStudent/status" value="0">
					  不可用
					</logic:equal>
					<logic:equal id="resultset" property="QueryStudent/status" value="1">
					  可用
					</logic:equal>
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/cardID" /></td>
                <td align="center" nowrap><a href='talent.pr.userRightNew.do?usermark=<bean:write id="resultset" property="QueryStudent/StudentID"/>&tempuserid=<bean:write id="resultset" property="QueryStudent/userID"/>&mode=0'><img src="/internet/image/QuanXian.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
                <td align="center" nowrap><a href='talent.pr.complexUserModify.do?sysTUser/operatorID=<bean:write id="resultset" property="QueryStudent/StudentID"/>&mode=0&operatorType=<bean:write property="QueryStudent/ClassID/criteria/value"/>'><img src="/internet/image/XiuGai.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
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
	if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
		alert("请选择班级");
		return
	}
	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value + "?Student/ClassName=" + className;
   	frm.submit();

}
</script>
<script>
	loadOrderImg(document.forms[0],'QueryStudent');
</script>