/*
 * �������� 2007-8-14
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class ParkLoadPicture {
	protected HttpServletRequest m_request;
	protected HttpServletResponse m_response;
	protected ServletContext m_application;
	private String m_contentDisposition;
	  //�����ļ�Ŀ¼ 1�ɹ���0 �������� ��1 ʧ��
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
	 * �ϴ��ļ�,�ļ����ڷ���0 ,�����ڿ����ϴ��ļ�����1
	 * @param filePath
	 * @param fileName
	 * @param uploadPath
	 * @return
	 * @throws Exception
	 */
	private static int uploadFile(String filePath,String fileName,String uploadPath) throws Exception{
		
		createDirtory(uploadPath);               //�ж��Ƿ�����ļ���
		
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
        if (!strDir.isDirectory()) { //�����û�н���Ŀ¼��ǰ�û����ļ���
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
              throw new Exception("��������̫��,�������ϴ�����25M���ļ�!");
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
	 
	 //ɾ���ļ���
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
	
	
	 //ɾ���ļ��������ļ�����Ŀ¼
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
	* �����ļ����ͻ���
	* @param strFileName �ļ���
	* @param strContentType ��������
	* @param s2 ��������
	* @param btLen byte����󳤶�
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
	
	   // ������������
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
	* �ж��ļ��Ƿ���ڷ�������
	* @param strFileName ���·�����ļ���
	* @return �����
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
	* �õ��ļ���
	* @param strFileName ������·���ļ���
	* @return ��ǰ�ļ�������
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
