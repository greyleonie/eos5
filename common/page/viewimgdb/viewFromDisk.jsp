<%
try{
	talent.core.TalentLoaddowFromDB view=new talent.core.TalentLoaddowFromDB();
	view.loaddownFromDisk(pageContext);
}
catch(Exception e){
	e.printStackTrace();
}
%>