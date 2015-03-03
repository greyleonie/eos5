<%@include file="/internet/common.jsp"%>
<%String houseUserList = ""; %>
<logic:iterate id="resultset" property="list[@name='update']">
<% String HouseUser = talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryStudent/HouseUserName"));
if(HouseUser!=null&&!HouseUser.equals("")){
	houseUserList += HouseUser + ",";
}
%>
</logic:iterate>
<% houseUserList = houseUserList.substring(0,houseUserList.length()-1);
	String msg = "当前有学员 “" + houseUserList + "” 住房没有退房，需要退房后才能删除！";
%>

<info:alert information="<%=msg %>" />