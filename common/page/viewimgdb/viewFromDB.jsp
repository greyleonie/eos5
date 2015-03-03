<%
try{
	talent.core.TalentLoaddowFromDB view=new talent.core.TalentLoaddowFromDB();
	view.loaddown(pageContext);
}
catch(Exception e){
	e.printStackTrace();
}
%>