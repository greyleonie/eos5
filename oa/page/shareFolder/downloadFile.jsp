<%
try{
	talent.tool.DownLoadFile myDownload = new talent.tool.DownLoadFile();
	myDownload.initialize(pageContext);

	  String filePath = request.getParameter("filePath");
	  String fileName = request.getParameter("fileName");
	  
	  filePath = filePath + "/"+ fileName;
      //System.out.println("filePath=========="+filePath);
	   response.reset();

	   myDownload.downloadFile(filePath,fileName);
	   }
catch(Exception e){
	e.printStackTrace();
}
%>