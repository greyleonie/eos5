<%@include file="/internet/common.jsp"%>

<table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:98%;border-collapse:collapse;">
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.courseMemberDelDo.do">
	<tr>
		<td align="Center" style="font-size:10pt;width:10%;">成员角色</td>
		<td align="Center" style="font-size:10pt;width:10%;">成员姓名</td>
		<td align="Center" style="font-size:10pt;width:70%;">承担课题的哪部分工作</td>
		<td align="Center" style="font-size:10pt;width:10%;">操作</td>
	</tr>
	<% int count = 1; %>
    <logic:iterate id="resultset" property="list[@type='MemberList']">
    <% count++; %>
	<tr>
		<td style="font-size:10pt;">
        <logic:equal id="resultset" property="researchGroup/MemberType" value="0">主持人</logic:equal>
        <logic:notEqual id="resultset" property="researchGroup/MemberType" value="0">成员</logic:notEqual>
        </td>
		<td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		<td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		<td align="Center" style="color:Blue;font-size:10pt;">
		<!--<a href="javascript:modifyMember('<bean:write id="resultset" property="researchGroup/MemberId"/>','<bean:write id="resultset" property="researchGroup/ProjectID"/>')" style="color:Blue;">修改</a>-->
		<a href="javascript:delMember('<bean:write id="resultset" property="researchGroup/MemberId"/>','<bean:write id="resultset" property="researchGroup/ProjectID"/>')" style="color:Blue;">删除</a>
		</td>
	</tr>
	</logic:iterate>
</form>
</table>

<script language="javascript">
window.parent.document.all("Members_Tr").style.display="";
window.parent.document.all("LocalMembers_Tr").style.display="";
window.parent.document.all("courseMbFrame").height = "<%=24.5 * count%>px";
window.parent.document.all("MemberList_Tr").style.display = "none";


function delMember(mid,pid) {
        var frm = document.forms[0];
		if(confirm("是否确定删除当前成员？")==false){
			return ;
		}
		window.location.href = "oa.prResearchManage.courseMemberDelDo.do?researchGroup/MemberId=" + mid + "&researchGroup/ProjectID=" + pid;
}

function modifyMember(mid) {
        var frm = document.forms[0];
        
		frm.action = "oa.prResearchManage.courseMemberFix.do?fid=" + mid;
   		frm.submit();
}
</script>