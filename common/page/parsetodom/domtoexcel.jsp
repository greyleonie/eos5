<%
	try{
		talent.core.TalentToExcel talentToExcel = new talent.core.TalentToExcel();
		talentToExcel.export(pageContext);
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
%>