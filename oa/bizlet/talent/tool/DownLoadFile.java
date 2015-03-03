	/*
	 * 创建日期 2007-6-6
	 *
	 * TODO 要更改此生成的文件的模板，请转至
	 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
	 */
	package talent.tool;
	
	import javax.servlet.http.*;
	import javax.servlet.*;
	import javax.servlet.jsp.*;
	import java.io.*;
	
	/**
	 * @author Administrator
	 *
	 * TODO 要更改此生成的类型注释的模板，请转至
	 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
	 */
	public class DownLoadFile {
		protected HttpServletRequest m_request;
		protected HttpServletResponse m_response;
		protected ServletContext m_application;
		private String m_contentDisposition;
		
		public final void initialize(PageContext pagecontext) throws ServletException {
		    m_application = pagecontext.getServletContext();
		    m_request = (HttpServletRequest)pagecontext.getRequest();
		    m_response = (HttpServletResponse)pagecontext.getResponse();
		}
		
		 public void downloadFile(String strFilePath,String strName)
	     throws ServletException, IOException{
	 downloadFile(strFilePath, strName, null, null);
	}
	
	public void downloadFile(String strFilePath, String strName,String strContentType)
	     throws ServletException, IOException {
	 downloadFile(strFilePath,strName, strContentType, null);
	}
	
	/**
	*
	* @param strFilePath
	* @param strFileName
	* @param strContentType
	* @param strDisp
	* @throws ServletException
	* @throws IOException
	*/
	
	public void downloadFile(String strFilePath, String strFileName,
	                        String strContentType, String strDisp)
	       throws ServletException, IOException {
	   downloadFile(strFilePath,strFileName, strContentType, strDisp, 8192);
	}
	
	/**
	* 判断文件是否存在服务器端
	* @param strFileName 相对路径的文件名
	* @return 真与假
	*/
	private boolean isVirtual(String strFileName){
	   if(m_application.getRealPath(strFileName) != null) {
	       File file = new File(m_application.getRealPath(strFileName));
	       return file.exists();
	   } else {
	       return false;
	   }
	}
	
	/**
	* 下载文件到客户端
	* @param strFileName 文件名
	* @param strContentType 下载类型
	* @param s2 附件类型
	* @param btLen byte的最大长度
	* @throws ServletException
	* @throws IOException
	*/
	public void downloadFile(String strFilePath, String strFileName,
	                        String strContentType, String strDisp, int btLen)
	       throws ServletException, IOException {
	
	   if(strFilePath == null)
	       throw new IllegalArgumentException("File '" + strFilePath + "' not found (1040).");
	   if(strFilePath.equals(""))
	       throw new IllegalArgumentException("File '" + strFilePath + "' not found (1040).");
	   if(isVirtual(strFilePath))
	       strFilePath = m_request.getRealPath("\\") +strFilePath;
	   //System.out.println("----filepath----------***-----" + strFilePath);
	  // System.out.println("----strFileName-------****----" + strFileName);
	   File file = new File(strFilePath);
	   FileInputStream fileinputstream = new FileInputStream(file);
	   long lngSize = file.length();
	   boolean flag = false;
	   int idx = 0;
	   byte abyte0[] = new byte[btLen];
	
	   // 设置下载类型
	   if(strContentType == null)
	       m_response.setContentType("application/x-msdownload");
	   else
	       if(strContentType.length() == 0)
	           m_response.setContentType("application/x-msdownload");
	   else
	       m_response.setContentType(strContentType);
	
	   m_response.setContentLength((int)lngSize);
	
	   m_contentDisposition = m_contentDisposition != null ? m_contentDisposition : "attachment;";
	   String strFile2 = new String();
	   if (strDisp == null){
	       if (strFileName == null )
	           strFileName = "";
	
	       if (strFileName.equals("")){
	           strFileName = this.getFileName(strFilePath);
	       } else {
	           strFileName =  this.getFileName(strFileName);
	       }
	       strFile2 = new String(strFileName.getBytes("GBK"),"iso-8859-1");
	       //strFile2 = new String(strFileName.getBytes(), "gb2312");
	       m_response.setHeader("Content-Disposition", m_contentDisposition + " filename=" +strFile2);
	   } else if (strDisp.length() == 0) {
	       m_response.setHeader("Content-Disposition", m_contentDisposition);
	   } else {
	       m_response.setHeader("Content-Disposition", m_contentDisposition + " filename=" + strDisp);
	   }
	   int j;
	   m_response.setBufferSize((int)file.length());
	   OutputStream out = m_response.getOutputStream();
	   try {
		   while ( (j = fileinputstream.read(abyte0, 0, btLen)) != -1) {
		       out.write(abyte0, 0, j);
		   }
		   fileinputstream.close();
		   out.flush();
		   fileinputstream.close();
		   out.close();
	   } catch (Exception e) {
	   	e.printStackTrace();
	   }
	}
	
	/**
	* 得到文件名
	* @param strFileName 完整的路径文件名
	* @return 当前文件的名字
	*/
	private String getFileName(String strFileName){
	   int iPos = 0;
	   iPos = strFileName.lastIndexOf('/');
	   if(iPos != -1)
	       return strFileName.substring(iPos + 1, strFileName.length());
	   iPos = strFileName.lastIndexOf('\\');
	   if(iPos != -1)
	       return strFileName.substring(iPos + 1, strFileName.length());
	   else
	       return strFileName;
	}
	
	}
