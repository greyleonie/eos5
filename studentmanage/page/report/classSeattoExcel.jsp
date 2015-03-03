<%
	try{
	   // request.setAttribute("seatstyle","classSeat");

		talent.core.TalentToExcel talentToExcel = new talent.core.TalentToExcel();
		talentToExcel.exportSeat(pageContext);
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
%>
