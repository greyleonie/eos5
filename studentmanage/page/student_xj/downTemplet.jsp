<%
	String ClassName = talent.core.TalentFunctions.getParam(request,"ClassName");
	String fileName = ClassName+".xls";
	String fileNameTM = new String(fileName.getBytes("GBK"),"8859_1");
	response.setHeader("Content-disposition","attachment; filename="+fileNameTM);
	
	java.io.BufferedInputStream bis = null;
    java.io.BufferedOutputStream bos = null;
    try {
        bis = new java.io.BufferedInputStream(new java.io.FileInputStream(getServletContext().getRealPath("/internet/download/xjbiao.xls")));
        bos = new java.io.BufferedOutputStream(response.getOutputStream());
        byte[] buff = new byte[2048];
        int bytesRead;
        while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
            bos.write(buff,0,bytesRead);
        }

    } catch(final java.io.IOException e) {
        e.printStackTrace();
    } finally {
        if (bis != null)
            bis.close();
        if (bos != null)
            bos.close();
    }
%>