<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
request.setCharacterEncoding("GBK");
//错误信息
String errorMsg = "";

//图片设置信息
String id		="";
String imgTitle = "";
String imgWidth = "";
String imgHeight = "";
String imgBorder = "";

//文件最大值
long maxSize = 1000000;

//定义文件上传的类型
String[] types = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

//文件保存目录路径
String savePath = request.getSession().getServletContext().getRealPath("/")+"internet/ShareImage/";

//文件保存目录URL
String saveUrl  = request.getContextPath()+"/internet/ShareImage/";

//判断是否为单个文件
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if(isMultipart){
	
	FileItemFactory factory = new DiskFileItemFactory();
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	List items = upload.parseRequest(request);
	
	// Process the uploaded items
	Iterator iter = items.iterator();
	while (iter.hasNext()) {
	    FileItem item = (FileItem) iter.next();
	  	//原文件名
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
	    		
	    //文件大小
	    long  fileSize	= item.getSize();
	    	    
	    if (!item.isFormField()) {
	    	//检查文件名
	    	if(item.getName()==""||item.getString()==null){
		    	errorMsg = "请选择文件。";
		    	break;
		    }

	    	//检查目录
	    	File uploadDir = new File(savePath);
	    	if(!uploadDir.isDirectory()){
	    		errorMsg = "上传目录不存在。";
	    		break;
	    	}
	    	//检查目录写权限
	    	if(!uploadDir.canWrite()){
	    		errorMsg = "上传目录没有写权限。";
	    		break;
	    	}
	    	//检查文件大小
	    	if(item.getSize()>maxSize){
	    		errorMsg = "上传文件大小超过限制。";
	    	}
	    	
	    	//获得文件扩展名
		  	String fileExt = fileName.substring(fileName.indexOf(".")+1);
	    	if(!Arrays.asList(types).contains(fileExt.toLowerCase())){
	    		errorMsg = "上传文件扩展名是不允许的扩展名。";
	    	}	
	    	
	    	//服务器上临时文件名
		   	String tempName = new Date().getTime()+"."+fileExt;
	    	
	    	//检查是否已上传
	    	File file = new File(savePath+"\\"+tempName);
	    	if(file.exists()){
	    		errorMsg = "临时文件可能不是上传文件。";
	    	}
	    	
	    	//上传文件	
	    	try{
		    	File uploadedFile = new File(savePath,tempName);
		    		
		    	item.write(uploadedFile);
	    	}catch(Exception e){
	    		errorMsg = "上传文件失败。";
	    	}
	    	
	    	saveUrl = saveUrl + tempName;
	    }
	}
	
	if(errorMsg.equals("")){
		//插入图片，关闭层
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
