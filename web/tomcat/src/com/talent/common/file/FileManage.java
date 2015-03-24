/**
 *
 */
package com.talent.common.file;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.File;
import sun.net.ftp.FtpClient;
import java.net.URL;
import java.net.URLConnection;


/**
 * @title �ļ��������
 * @description
 * @author ���ܶ�
 * @addtime 2007-3-5
 */

public class FileManage {

	/** �����ļ�
	 * @param request
	 * @param response
	 * @param content �ļ�����
	 * @param fileName �ļ����
	 * @param fileType �ļ�����
	 */
	public static void downloadFile(HttpServletRequest request,HttpServletResponse response,Blob content,String fileName,String fileType) throws Exception{
		if(fileName == null) fileName = "talent.temp";
		if(fileType == null) fileType = "image/*";
		response.setContentType(fileType);
		response.setHeader("Content-Disposition", "inline;filename=" + new String(fileName.getBytes("gb2312"),"8859_1") + ";");
		InputStream in = content.getBinaryStream();
        OutputStream out = response.getOutputStream();
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) != -1){
            out.write(buf, 0, len);
            out.flush();
        }
        in.close();
        out.close();
	}
//��html�ļ����ļ���ķ�ʽ��ȡ��ʾ
        public static void handleHtmlFile(String fileName,boolean needWrite,HttpServletRequest request,HttpServletResponse response){
          try {
            FileInputStream fis=null;
            String realPath=request.getRealPath("/subjectCourse");
            File fileDir=new File(realPath);
            File fileArray[]=null;
           // int fileIndex;
            File file=null;
            int len;
            OutputStream out = response.getOutputStream();
           // if(needWrite)writeTableHead(request,out);//��Ҫд��ͷ
            fileName=new String(fileName.getBytes("8859_1"));
            if(fileDir!=null&&fileDir.exists()&&fileDir.isDirectory()){
                fileArray= fileDir.listFiles();
            }
           
            if(fileArray!=null){
            	int fileNum=fileArray.length;
            	String tempFileName="";            	
            	for(int k=0;k<fileNum;k++){       //ȡ�������ļ�     		
            		tempFileName=fileArray[k].getName();
            		 System.out.println("--------fileName:"+fileName+"------tempFileName:"+tempFileName);	
            		if(tempFileName.equals(fileName)){
            				file=fileArray[k];   				
            			}
            		
            	}//end for
            	}
            
         
           if(file!=null&&file.isFile()){
              fis=new FileInputStream(file);
              byte b[]=new byte[1024];
             while((len=fis.read(b))!=-1){
                 out.write(b,0,len);
                 out.flush();
               }//end while
               
               }//end if
           else{
        	   String msg="�Ҳ����ļ�";
        	  byte by[]=msg.getBytes();
        	   out.write(by,0,by.length);
        	   }
           fis.close();
           out.close();
          }
          catch (Exception e) {
         System.out.println("=====handleHtmlFile============error:"+e);
          }
        }

        //��дר��˵�ʱ��Ҫд��ͷ
        public static void writeTableHead(HttpServletRequest request,OutputStream out){
        try{
         String contextPath=request.getContextPath();
         StringBuffer sb=new StringBuffer();
         String head="";
         sb.append("<link href=\""+contextPath+"/css/css.css\" rel=\"stylesheet\" type=\"text/css\">");
         sb.append("<table width=\"100%\">");
         sb.append("<tr><td class=\"td\" align=\"center\">");
         sb.append("<table><tr><td class=\"td\" align=\"center\"><font size=\"3\"><strong>");
         sb.append("֪ͨ������ר���Ѿ����ܱ����ר���Լ��γ����£���ѡ����Ҫ��ר����б���");
         sb.append("</strong></font></td></tr></table></td></tr></table>");
         head=sb.toString();
         byte bHead[]=new byte[head.length()];
         bHead=head.getBytes();
         out.write(bHead);
         out.flush();
        }catch(Exception e){
          System.out.println("==========writeTableHead====errors:"+e);
        }
        }

        public static int getLastestFile(String fileName,File files[]){
          int index=-1;
          int len=0;
          if(files!=null){
            len=files.length;
          }
          for(int i=0;i<len;i++){
            String tempFileName=files[i].getName();
            String suffix="";
            int lastPointIndex=fileName.lastIndexOf(".");
            if(fileName!=null&&lastPointIndex>-1&&files[i].isFile()){
              suffix=fileName.substring(lastPointIndex,fileName.length());
            }
            if(fileName.equals(tempFileName)&&suffix.equals(".html")||suffix.equals(".htm")){
              index=i;
            }
          }//end for
          return index;
        }



}
