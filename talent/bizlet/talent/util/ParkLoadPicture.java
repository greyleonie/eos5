/*
 * 创建日期 2007-8-14
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ParkLoadPicture {
	protected HttpServletRequest m_request;
	protected HttpServletResponse m_response;
	protected ServletContext m_application;
	private String m_contentDisposition;
	  //创建文件目录 1成功，0 存在重名 －1 失败
	  public static int createDir(String dir){

	    File f = new File(dir);
	    if (f.exists()){
	      return 0;
	    }
	    if(f.mkdir())
	      return 1;
	    else
	       return -1;
	  }
	
	/**
	 * 上传文件,文件存在返回0 ,不存在可以上传文件返回1
	 * @param filePath
	 * @param fileName
	 * @param uploadPath
	 * @return
	 * @throws Exception
	 */
	private static int uploadFile(String filePath,String fileName,String uploadPath) throws Exception{
		
		createDirtory(uploadPath);               //判断是否存在文件夹
		
		String extFileName = "";
        if(fileName.indexOf(".")!=-1)
           extFileName=fileName.substring(fileName.indexOf("."),fileName.length());
        String sysFileName=uploadPath+"/"+fileName;

        sysFileName = sysFileName.replace('\\','/');
        System.out.println("sysFileName---------------"+sysFileName);
       
       File sysfile = new File(sysFileName);
       if(sysfile.exists()){
       	return 0;
       }
       
       File file = new File(filePath);
	   copyFile(file,sysfile);
		
	   return 1;
	}
	
	
    private static void createDirtory(String strDirName) {

        File strDir = new File(strDirName);
        if (!strDir.isDirectory()) { //如果还没有建立目录当前用户的文件夹
            strDir.mkdir();
        }
    }
    
	 private static void copyFile(File file,File sysfile) throws Exception{
        try {

        	FileInputStream stream=new FileInputStream(file);
            FileOutputStream fos = new FileOutputStream(sysfile);
            byte[] buffer = new byte[4096];
            int bytesRead = 0;
            long fileSize = file.length();
            if (fileSize > 25 * 1024000) {
              fos.close();
              stream.close();
              file.delete();
              throw new Exception("附件数据太大,不允许上传超过25M的文件!");
            }
            while ( (bytesRead = stream.read(buffer, 0, 4096)) != -1) {
              fos.write(buffer, 0, bytesRead);
            }
            fos.close();
            stream.close();
          }
          catch (FileNotFoundException ex) {
            ex.printStackTrace();

          }
          catch (IOException ex) {
            ex.printStackTrace();

          }
    }
	 
	 //删除文件夹
	 public static boolean deleteDir(String dir) {
	    if("".equals(dir) || dir == null)
	    return false;
	    File f = new File(dir);
	    if(f.isDirectory()){
	    System.out.println("-------------delete direcotry:"+dir);
	    return deleteChildDir(f);
	    }
	    else{
	    System.out.println("-------------delete file:"+dir);
	    return f.delete();
	     }
	  }
	
	
	 //删除文件夹下子文件和子目录
	 public static boolean deleteChildDir(File f) {
	   if(f == null)
	   return false;

	   String[] subfiles = f.list();
	   for(int i = 0; i<subfiles.length ; i++){
	    File subfile = new File(f.getPath() + "\\" + subfiles[i]);
	    if( subfile.isDirectory()){
	      deleteChildDir(subfile);

	    }

	       subfile.delete();
	   }
	  return f.delete();
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
	
	public static void main(String [] args){
		try{
			ParkLoadPicture.uploadFile("D:/park2/park.jpg","park1.jpg","D:/park/picture");
			System.out.println("_________________________");
		}catch(Exception ex){
			
		}
	}
	
	public static byte[] getFileContent(String filePath) {
		File file = null;
		FileInputStream in = null;
		BufferedInputStream bin = null;
		ByteArrayOutputStream byteOut = null;
		byte[] b = null;
		try{
			file = new File(filePath);
			in = new FileInputStream(file);
			bin = new BufferedInputStream(in);
			byte[] r = new byte[2048];
			int i = 0;
			byteOut = new ByteArrayOutputStream();
			while((i = bin.read(r))!=-1) {
				byteOut.write(r,0,i);
			}
			b = byteOut.toByteArray();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(byteOut!=null) byteOut.close();
				if(bin!=null) bin.close();
				if(in!=null) in.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return b;
	
	}
}
