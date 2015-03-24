<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
request.setCharacterEncoding("GBK");
//������Ϣ
String errorMsg = "";

//ͼƬ������Ϣ
String id		="";
String imgTitle = "";
String imgWidth = "";
String imgHeight = "";
String imgBorder = "";

//�ļ����ֵ
long maxSize = 1000000;

//�����ļ��ϴ�������
String[] types = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

//�ļ�����Ŀ¼·��
String savePath = request.getSession().getServletContext().getRealPath("/")+"internet/ShareImage/";

//�ļ�����Ŀ¼URL
String saveUrl  = request.getContextPath()+"/internet/ShareImage/";

//�ж��Ƿ�Ϊ�����ļ�
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if(isMultipart){
	
	FileItemFactory factory = new DiskFileItemFactory();
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	List items = upload.parseRequest(request);
	
	// Process the uploaded items
	Iterator iter = items.iterator();
	while (iter.hasNext()) {
	    FileItem item = (FileItem) iter.next();
	  	//ԭ�ļ���
	    String fileName = item.getName();
	  	
	    if(item.getFieldName().equals("id")){
	    	id = item.getString();
	    }
	    if(item.getFieldName().equals("imgTitle")){
	    	imgTitle = item.getString();
	    }
	    if(item.getFieldName().equals("imgWidth")){
	    	imgWidth = item.getString();
	    }
	    if(item.getFieldName().equals("imgHeight")){
	    	imgHeight = item.getString();
	    }
	    if(item.getFieldName().equals("imgBorder")){
	    	imgBorder = item.getString();
	    }
	    		
	    //�ļ���С
	    long  fileSize	= item.getSize();
	    	    
	    if (!item.isFormField()) {
	    	//����ļ���
	    	if(item.getName()==""||item.getString()==null){
		    	errorMsg = "��ѡ���ļ���";
		    	break;
		    }

	    	//���Ŀ¼
	    	File uploadDir = new File(savePath);
	    	if(!uploadDir.isDirectory()){
	    		errorMsg = "�ϴ�Ŀ¼�����ڡ�";
	    		break;
	    	}
	    	//���Ŀ¼дȨ��
	    	if(!uploadDir.canWrite()){
	    		errorMsg = "�ϴ�Ŀ¼û��дȨ�ޡ�";
	    		break;
	    	}
	    	//����ļ���С
	    	if(item.getSize()>maxSize){
	    		errorMsg = "�ϴ��ļ���С�������ơ�";
	    	}
	    	
	    	//����ļ���չ��
		  	String fileExt = fileName.substring(fileName.indexOf(".")+1);
	    	if(!Arrays.asList(types).contains(fileExt.toLowerCase())){
	    		errorMsg = "�ϴ��ļ���չ���ǲ��������չ����";
	    	}	
	    	
	    	//����������ʱ�ļ���
		   	String tempName = new Date().getTime()+"."+fileExt;
	    	
	    	//����Ƿ����ϴ�
	    	File file = new File(savePath+"\\"+tempName);
	    	if(file.exists()){
	    		errorMsg = "��ʱ�ļ����ܲ����ϴ��ļ���";
	    	}
	    	
	    	//�ϴ��ļ�	
	    	try{
		    	File uploadedFile = new File(savePath,tempName);
		    		
		    	item.write(uploadedFile);
	    	}catch(Exception e){
	    		errorMsg = "�ϴ��ļ�ʧ�ܡ�";
	    	}
	    	
	    	saveUrl = saveUrl + tempName;
	    }
	}
	
	if(errorMsg.equals("")){
		//����ͼƬ���رղ�
	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Insert Image</title>");
	    out.println("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<script type=\"text/javascript\">parent.KE.plugin[\"image\"].insert(\""+id+"\",\""+saveUrl+"\",\""+imgTitle+"\",\""+imgWidth+"\",\""+imgHeight+"\",\""+imgBorder+"\");</script>");
	    System.out.println("<script type=\"text/javascript\">parent.KE.plugin[\"image\"].insert(\""+id+"\",\""+saveUrl+"\",\""+imgTitle+"\",\""+imgWidth+"\",\""+imgHeight+"\",\""+imgBorder+"\");</script>");
	    out.println("</body>");
	    out.println("</html>");
	}else{
		out.println("<html>");
	    out.println("<head>");
	    out.println("<title>error</title>");
	    out.println("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<script type=\"text/javascript\">alert(\""+errorMsg+"\");history.back();</script>");
	    out.println("</body>");
	    out.println("</html>");
	}
	
}
%>
