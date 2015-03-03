<%
try{
	kaoqin.KaoqinExport kaoqinExport=new kaoqin.KaoqinExport();
	kaoqinExport.export(pageContext);
}
catch(Exception e){
	e.printStackTrace();
}
%>