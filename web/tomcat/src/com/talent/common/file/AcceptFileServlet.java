package com.talent.common.file;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.logging.*;

public class AcceptFileServlet
    extends HttpServlet {
  private final static Log log = LogFactory.getLog(AcceptFileServlet.class);
  public void destroy() {
    super.destroy();
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    PrintWriter outResult = null;
    try {
      outResult = response.getWriter();
    }
    catch (IOException ioE) {
      System.out.println("================errors:" + ioE);
    }
    request.setCharacterEncoding("GB2312"); 
    String uploadReult = "ERROR";
    int reqStreamLen = request.getContentLength();
    String fileName="";
    File fileHome=null;
    String dir="";
    

    try {
      InputStream is = request.getInputStream();
      ByteArrayOutputStream bout = new ByteArrayOutputStream();

      int bytesRead = 0;
      byte[] buffer = new byte[8192];
      while ( (bytesRead = is.read(buffer, 0, 8192)) != -1) {
        bout.write(buffer, 0, bytesRead);
      }

      
      fileName = new String(request.getParameter("fileName"));
  
      dir=(String)request.getParameter("dir");
      String   serverPath=request.getRealPath("/");
      if(fileName.equals(".htm")){
            response.setContentType("text/html");
      }else{
      response.setContentType("text/xml");
      }
      System.out.println("**************serverPath/dir:"+serverPath+dir);
      fileHome=new File(serverPath+dir);
             if(!fileHome.exists()){
               fileHome.mkdir();
             }
     System.out.println("**************fileHome/fileName:"+fileHome+"\\" + fileName);
      OutputStream os = new FileOutputStream(fileHome+"\\" + fileName);
      bout.writeTo(os);
      bout.flush();
      os.flush();
      os.close();
      bout.close();
      is.close();
    }

    catch (UnsupportedEncodingException e) {
      uploadReult = "UnsupportedEncodingException";
      log.info(e.getMessage());
      e.printStackTrace();
    }
    catch (FileNotFoundException e) {
      uploadReult = "FileNotFoundException";
      log.info(e.getMessage());
      e.printStackTrace();
    }
    catch (IOException e) {
      uploadReult = "IOException";
      log.info(e.getMessage());
      e.printStackTrace();
    }

    File file = new File(fileHome+"/" + fileName);
    log.info(String.valueOf(file.length()));
    log.info(String.valueOf(reqStreamLen));
    if (file.exists() && (file.length() == reqStreamLen)) {
      uploadReult = "SUCCESS";
       log.info(request.getRemoteAddr()  +   "�ϴ��ļ�:" + fileName +   "   �ɹ�");
    }
    else {
      uploadReult = "ERROR";
         log.info(request.getRemoteAddr()  +   "�ϴ��ļ�:" + fileName +  "   ʧ��");
    }

    outResult.println(uploadReult);
    outResult.flush();
    outResult.close();

  }

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    this.doPost(request, response);
  }

  public void init() throws ServletException {

  }

}
