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
	String msg = "��ǰ��ѧԱ ��" + houseUserList + "�� ס��û���˷�����Ҫ�˷������ɾ����";
%>

<info:alert information="<%=msg %>" />