package tools.util;
import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.w3c.dom.*;
import org.w3c.dom.Element;

import talent.tool.ShareFolder;
import DBstep.*;



import base.util.DBconnection;

import com.lowagie.text.*;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;
import com.primeton.tp.core.prservice.context.RequestContext;

import fcc.oa.workflow.FlowData;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-9-26
 * @class_displayName CreatePdfFile
 */

public class CreatePdfFile {
	private static Connection con=null;
	private static Statement st=null;
	private  DBstep.iMsgServer2000 MsgObj;
	
	 //创建目录
	   public static void createDir(HttpServletRequest request,String dir){
	   	try{
	   	String realPath=request.getRealPath("/");
	    File f=new File(realPath+"\\"+dir);
	   //System.out.println("*****dir:"+realPath+"\\"+dir);
	 	   if(!f.exists()){
	 	    f.mkdir();	
	 	  }
	   	}catch(Exception e){
	   	  System.out.println("====createDir===errors:"+e);	
	   	}
	   }
	   
	   //产生文件
	   public static void createFile(HttpServletRequest request,String fileName){
	   	try{
	   		String realPath=request.getRealPath("/");
	   		//System.out.println("====path:"+realPath+"\\"+fileName);
	   	    File file=new File(realPath+"/"+fileName);
	   	    if(!file.exists()){
	   	      FileOutputStream fos=new FileOutputStream(realPath+"/"+fileName);
	   	    }
	   	}catch(Exception e){
	   		System.out.println("====createFile===errors:"+e);	
	   	}
	   }
	   
	   //产生目录名称
	   public static HashMap createDirName(HttpServletRequest request,String dir,String prix,String year){
	      	int folders=0;
	      	String[] dirName=new String[2];
	      	String realPath=request.getRealPath("/");
	      	String currentDir=realPath+"\\"+dir;
	      	File file=new File(currentDir);
	      	HashMap hm=new HashMap();
	      if(file.isDirectory()){
	      	   int allFolders=0;
	      	   String floderName="";
	      	   File fileArray[]=file.listFiles();//取出目录列表
	      	   if(fileArray!=null){
	      	    allFolders=fileArray.length;
	      	    for(int i=0;i<allFolders;i++){
	      	    	floderName=fileArray[i].getName();
	      	    	if(floderName.startsWith(prix+year)){
	      	    		folders++;
	      	    	}
	      	    	
	      	    }//end for
	      	   }//end if
	      	}//end if
	      folders++;
	      if(folders<10){
	      	 year+="000";
	      }else if(folders<100){
	      	 year+="00";
	      }else if(folders<1000){
	      	 year+="0";
	      }
	      hm.put("floderName",prix+year+String.valueOf(folders));
	      hm.put("fileName",String.valueOf(folders));
	     dirName[0]=prix+year+String.valueOf(folders);
	     dirName[1]=String.valueOf(folders);
	    
	      	return hm;
	   }
	   
	   //在records.txt追加记录
	   public static void apendRecord(HttpServletRequest request,String targetFile,String record){
	   	String realPath=request.getRealPath("/");
	   
	   	try{
	   	RandomAccessFile rf=new RandomAccessFile(realPath +"/"+ targetFile,"rw");
         //	  定义一个类RandomAccessFile的对象，并实例化 
	   
	   	rf.seek(rf.length());//将指针移动到文件末尾
	   	rf.write(record.getBytes());
	    //rf.wr.writeChars(record);
	   	}catch(Exception e){
	   	  System.out.println("=apendRecord=====errors:"+e);	
	   	}
	   }
	 
	 //取出发文相关数据
	/*   public static ArrayList getSendArchiveData(PageContext pageContext,String dom,String list){
		ArrayList wflist = new ArrayList();//流程所有环节数据
	      if(dom == null || "".equals(dom)) dom = "reqContext";
			RequestContext context = (RequestContext) pageContext.getAttribute(dom);
			if(context == null)
	            context = (RequestContext)pageContext.getRequest().getAttribute(dom);
			if(context == null)
	            context = (RequestContext)pageContext.getSession().getAttribute(dom);
			 try{
				Node wfdataNode = context.getEntity(list);
				int length = wfdataNode.getChildNodes().getLength();
				
				NodeList nodeList = wfdataNode.getChildNodes();
				
				for(int i = 0; i < length; i++) {
					Element ele = (Element) nodeList.item(i);
				}
			 }catch(Exception e){
			   System.out.println("getSendArchiveData================errors:"+e);	
			 }
			
			
			
			
			return wflist;
	   }
	 */  
	   
	 //处理发文正文
	   public static void handleMainContent(HttpServletRequest request,String floderName,String archiveId){
	      	String sql="select * from Document_File where recordId='"+archiveId+"'";
	      //	System.out.println("handleMainContent================sql:"+sql);	
	      	try{
	      		ResultSet rs=null;	      	
	      		String realPath=request.getRealPath("/");
	      		init();
	      		CreatePdfFile.st=CreatePdfFile.con.createStatement();
	      		rs=CreatePdfFile.st.executeQuery(sql);
	      		if(rs!=null){	      			
	      			while(rs.next()){	      				
	      				String fileType=rs.getString("FileType");	
	      				
	      				if(fileType==null){
	      					fileType="";
	      				}
	      				byte[] mFileBody;
	      				mFileBody=rs.getBytes("FileBody");
	      			//	System.out.println("===handleMainContent=============path:"+realPath+"gd\\send\\"+floderName+"\\"+"正文内容"+fileType);	
		      	if(!fileType.equals("")){
	      				DBstep.iMsgServer2000 MsgObj =new DBstep.iMsgServer2000();
	      			    MsgObj.MsgFileBody(mFileBody);			//将文件信息打包
	      				mFileBody=MsgObj.ToDocument(MsgObj.MsgFileBody());    //通过iMsgServer200 将pgf文件流转化为普通Office文件流
	      				MsgObj.MsgFileBody(mFileBody);			//设置文件内容流
	      				MsgObj.MsgFileSave(realPath+"gd\\send\\"+floderName+"\\"+"正文内容"+fileType);		//保存doc文件
	      			 }//end if
	      			}//end while
	      			if(rs!=null)rs.close();
	      		}
	      		closeCon();
	      	}catch(Exception e){
	      	  System.out.println("===handleMainContent=============errors:"+e);	
	      	}
	      	 
	      	
	   }
	   
	 //取出收文相关数据
	   public static ArrayList getReceiveArchiveData(PageContext pageContext,String dom,String list){
	   	ArrayList wflist = new ArrayList();//流程所有环节数据
	      if(dom == null || "".equals(dom)) dom = "reqContext";
			RequestContext context = (RequestContext) pageContext.getAttribute(dom);
			if(context == null)
	            context = (RequestContext)pageContext.getRequest().getAttribute(dom);
			if(context == null)
	            context = (RequestContext)pageContext.getSession().getAttribute(dom);
			
	      try{
			Node wfdataNode = context.getEntity(list);
			int length = wfdataNode.getChildNodes().getLength();
			
			NodeList nodeList = wfdataNode.getChildNodes();
			
			
			
			for(int i = 0; i < length; i++) {
				Element ele = (Element) nodeList.item(i);
				
				String dataID = "";
				String elementKey = "";
				//System.out.println("items:"+ele.getElementsByTagName("elementValue")+"======item:"+ele.getElementsByTagName("elementValue").item(0)+"=====child:"+ele.getElementsByTagName("elementValue").item(0).getFirstChild());	
				String elementValue = "";
				String processInstID = "";
				String archiveID = "";
				String activityDefID = "";
				String userID = "";
				String userName = "";
				String userDate = "";
				
				Node dataIDNode=ele.getElementsByTagName("dataID").item(0).getFirstChild();
				Node elementKeyNode=ele.getElementsByTagName("elementKey").item(0).getFirstChild();
				Node elementValueNode=ele.getElementsByTagName("elementValue").item(0).getFirstChild();
				Node processInstIDNode=ele.getElementsByTagName("processInstID").item(0).getFirstChild();
				Node archiveIDNode=ele.getElementsByTagName("archiveID").item(0).getFirstChild();
				Node activityDefIDNode=ele.getElementsByTagName("activityDefID").item(0).getFirstChild();
				Node userIDNode=ele.getElementsByTagName("userID").item(0).getFirstChild();
				Node userNameNode=ele.getElementsByTagName("userName").item(0).getFirstChild();
				Node userDateNode=ele.getElementsByTagName("userDate").item(0).getFirstChild();
				
				if(dataIDNode!=null)dataID=dataIDNode.getNodeValue();
				if(elementKeyNode!=null)elementKey=elementKeyNode.getNodeValue();
				if(elementValueNode!=null)elementValue=elementValueNode.getNodeValue();
				if(processInstIDNode!=null)processInstID=processInstIDNode.getNodeValue();
				if(archiveIDNode!=null)archiveID=archiveIDNode.getNodeValue();
				if(activityDefIDNode!=null)activityDefID=activityDefIDNode.getNodeValue();
				if(userNameNode!=null)userName=userNameNode.getNodeValue();
				if(dataIDNode!=null)dataID=dataIDNode.getNodeValue();
				if(userDateNode!=null)userDate=userDateNode.getNodeValue();
				
			
				FlowData flowData = new FlowData(dataID,elementKey,elementValue,processInstID,archiveID,activityDefID,userID,userName,userDate,"");
				wflist.add(flowData);
			}//for
	      }catch(Exception e){
	        System.out.println("getReceiveArchiveData==========errors:"+e);	
	      }
	      return wflist;
	   }
	   
	//生成pdf文件
	 public static void createPdfFile(HttpServletRequest request,String dir,String pdfName,ArrayList list,String fileType){
		try{
			
			Document document = new Document(PageSize.A4, 50, 50, 50, 50);
			String realPath=request.getRealPath("/");
			String currentDir=realPath+"\\"+dir;
			File f=new File(currentDir);
			if(!f.exists())f.mkdir(); 
			PdfWriter writer = PdfWriter.getInstance(document,new FileOutputStream(currentDir+"\\"+pdfName));
			document.open();
			if(fileType.equals("s")){
			createReceiveArchiveContent(request,document,list);//创建收文正文内容
			}else if(fileType.equals("h")){//创建发文正文内容
				createSendArchiveContent(request,document,list);
			}
						
			document.close();
		}catch(Exception e) {
			System.out.println("createPdfFile======errors:"+e);

		}
		   }
	 //组装发文正文内容
	 public static void createSendArchiveContent(HttpServletRequest request,Document document,ArrayList wfList){
	 	try{
	 		 BaseFont   bfChinese   =   BaseFont.createFont("STSong-Light",   "UniGB-UCS2-H",   false);   
	         Font   FontChinese   =   new   Font(bfChinese,   12,   Font.NORMAL);   
	         Font   cellFont   =   new   Font(bfChinese,   8,   Font.NORMAL); 
	   
	 	
	 	Paragraph Title = new Paragraph("");
	    // 设置页面格式
	    Title.setSpacingBefore(8);
	    Title.setSpacingAfter(2);
	    Title.setAlignment(1);	   
	 	Title.add(new Chunk("广 州 市 党 校 发 文 呈 批 表", new com.lowagie.text.Font(bfChinese, 14,
		        com.lowagie.text.Font.BOLD)));
	 	 Table   tab   =   new   Table(6);  
		 tab.setWidth(100);	 	
		 tab.setBorder(1);	  
		 tab.setDefaultHorizontalAlignment(1);

		 document.add(Title);		 
		 document.add(tab); 
		 Phrase   ph=null;
		 HashMap hm=(HashMap)request.getAttribute("baseData");
		 if(hm!=null){
	 		Table   aTable  =new Table(8); 
		 float[] widths ={ 0.10f, 0.38f, 0.11f, 0.06f, 0.08f, 0.09f, 0.12f, 0.06f };
	 	 aTable.setWidths(widths);
	 	 
	 	    aTable.addCell(new PDFCell("拟稿单位:",1,1)); 
            String draftDept=(String)hm.get("draftDept");
            aTable.addCell(new PDFCell(draftDept,1,1));       
	        
	        aTable.addCell(new PDFCell("共印份数:",1,1)); 
	        String sendNum=(String)hm.get("sendNum");
	        aTable.addCell(new PDFCell(sendNum,1,1)); 
	        
	        aTable.addCell(new PDFCell("密级:",1,1)); 
	        String secretLevel=(String)hm.get("secretLevel");
	        aTable.addCell(new PDFCell(secretLevel,1,1));  
	        
	        aTable.addCell(new PDFCell("缓急程度:",1,1)); 
	        String timeLevel=(String)hm.get("timeLevel");
	        aTable.addCell(new PDFCell(timeLevel,1,1));  
	     //------------------------------------------------   
	        aTable.addCell(new PDFCell("发文日期:",1,1)); 
	        String sendDate=(String)hm.get("sendDate");
	        aTable.addCell(new PDFCell(sendDate,1,1)); 
	        
	        aTable.addCell(new PDFCell("文号:",1,1)); 
	        String archiveCode=(String)hm.get("archiveCode");
	        aTable.addCell(new PDFCell(archiveCode,1,2)); 
	        
	        aTable.addCell(new PDFCell("拟稿人:",1,1)); 
	        String drafter=(String)hm.get("drafter");
	        aTable.addCell(new PDFCell(drafter,1,2)); 
	      
	    //---------------------------------------------------   
	        aTable.addCell(new PDFCell("标题:",1,1)); 
	        String archiveUnit=(String)hm.get("archiveTitle");
	        aTable.addCell(new PDFCell(archiveUnit,1,7));  
	       
	    
		 

	        String nodes[][]={{"DX3","[部门领导签发]\n"},{"DX5","[分管领导签发]\n"},{"DX61","[校主要领导签发]\n"},{"DX62","[其它人意见]\n"}};
	      
	    
	        nodes[0][0]="DX3";
	        nodes[0][1]="[部门领导签发]\n";
	        
	        nodes[1][0]="DX5";
	        nodes[1][1]="[分管领导签发]\n";
	        
	        nodes[2][0]="DX61";
	        nodes[2][1]="[校主要领导签发]\n";
	        
	        nodes[3][0]="DX62";
	        nodes[3][1]="[其它人意见]\n";
	        
	        
	        int countWfList=0;
	        int countNode=nodes.length;
	        if(wfList!=null)countWfList=wfList.size();
	      
	        for(int i=0;i<countNode;i++){
	        	String[] oneNode=(String[])nodes[i];	
	        	
	        	if(countWfList>0){
	        		for(int k=0;k<wfList.size();k++){
	        		FlowData flowData =(FlowData)wfList.get(k);
	        		String activityDefID=flowData.getActivityDefID();
	        		String workInfo="";
	        		if(activityDefID.equals(oneNode[0])){
	        			workInfo=flowData.getElementValue()+"  ["+flowData.getUserName()+"于"+flowData.getUserDate()+"办理]";
	        		//System.out.println("=============workInfo:"+workInfo);	
	        			oneNode[1]+=workInfo+"\n";
	        		}//if
	        		}//for
	        	}//if
	        	oneNode[1]+="\n\n\n\n";
	        	 aTable.addCell(new PDFCell(oneNode[1],1,8));
	        }//for
	       
            document.add(aTable);   
		 }		  
	 	}catch(Exception e){
	 	  System.out.println("createSendArchiveContent============errors:"+e);	
	 	}
	 }
	 //组装收文正文内容
	 public static void createReceiveArchiveContent(HttpServletRequest request,Document document,ArrayList wfList){
	 	try{
	 		 BaseFont   bfChinese   =   BaseFont.createFont("STSong-Light",   "UniGB-UCS2-H",   false);   
	         Font   FontChinese   =   new   Font(bfChinese,   12,   Font.NORMAL);   
	         Font   cellFont   =   new   Font(bfChinese,   8,   Font.NORMAL); 
	   
	 	
	 	Paragraph Title = new Paragraph("");
	    // 设置页面格式
	    Title.setSpacingBefore(8);
	    Title.setSpacingAfter(2);
	    Title.setAlignment(1);	   
	 	 Title.add(new Chunk("广 州 市 党 校 办 文 呈 批 表", new com.lowagie.text.Font(bfChinese, 14,
		        com.lowagie.text.Font.BOLD)));
	 	 
	    Table   tab   =   new   Table(8);  
	 	tab.setWidth(100);	 	
	    tab.setBorder(1);	  
	    tab.setDefaultHorizontalAlignment(1);

		document.add(Title);		 
		document.add(tab);
	
		
		Phrase   ph=null;
	 	HashMap hm=(HashMap)request.getAttribute("baseData");
	 	if(hm!=null){	 	
	 		Table   aTable  =new Table(8,10); 
	 		 float[] widths = { 0.10f, 0.38f, 0.11f, 0.06f, 0.08f, 0.09f, 0.12f, 0.06f };
	 		aTable.setWidths(widths);
	 		 		 
	 		
	        aTable.addCell(new PDFCell("来文单位:",1,1)); 
	        String archiveUnit=(String)hm.get("archiveUnit");
	        aTable.addCell(new PDFCell(archiveUnit,1,1));   
	      
	        aTable.addCell(new PDFCell("份数:",1,1)); 
	        String archiveNum=(String)hm.get("archiveNum");
	        aTable.addCell(new PDFCell(archiveNum,1,1));  
	      
	        aTable.addCell(new PDFCell("密级:",1,1)); 
	        String secretLevel=(String)hm.get("secretLevel");
	        aTable.addCell(new PDFCell(secretLevel,1,1)); 
	       
	        aTable.addCell(new PDFCell("缓急程度:",1,1)); 
	        String timeLevel=(String)hm.get("timeLevel");
	        aTable.addCell(new PDFCell(timeLevel,1,1)); 
	        
	        aTable.addCell(new PDFCell("收件日期:",1,1)); 
	        String archiveDate=(String)hm.get("archiveDate");	 
	        if(archiveDate!=null&&archiveDate.length()>9)
	        	archiveDate=archiveDate.substring(0,10);
	        aTable.addCell(new PDFCell(archiveDate,1,1));   
	      
	        aTable.addCell(new PDFCell("办文编号:",1,1)); 
	        String archiveCode=(String)hm.get("archiveCode");	 		 
	        aTable.addCell(new PDFCell(archiveCode,1,2)); 
	        
	        aTable.addCell(new PDFCell("呈批人:",1,1)); 
	        String chenPiMan=(String)hm.get("chenPiMan");	 		 
	        aTable.addCell(new PDFCell(chenPiMan,1,2)); 
	        
	        aTable.addCell(new PDFCell("文件标题:",1,1)); 
	        String title=(String)hm.get("title");	 		 
	        aTable.addCell(new PDFCell(title,1,7)); 
	        
	       
	        String nodes[][]={{"DX2","[办公室领导拟办意见]\n"},{"DX4","[校领导传阅意见]\n"},{"DX6","[分管领导阅示意见]\n"},{"DX7","[办公室领导交办意见]\n"},{"DX8","[相关人员办理意见]\n"}};
	      
	    
	        nodes[0][0]="DX2";
	        nodes[0][1]="[办公室领导拟办意见]\n";
	        
	        nodes[1][0]="DX4";
	        nodes[1][1]="[校领导传阅意见]\n";
	        
	        nodes[2][0]="DX6";
	        nodes[2][1]="[分管领导阅示意见]\n";
	        
	        nodes[3][0]="DX7";
	        nodes[3][1]="[办公室领导交办意见]\n";
	        
	        nodes[4][0]="DX8";
	        nodes[4][1]="[相关人员办理意见]\n";
	        
	        
	        int countWfList=0;
	        int countNode=nodes.length;
	        if(wfList!=null)countWfList=wfList.size();
	      
	        for(int i=0;i<countNode;i++){
	        	String[] oneNode=(String[])nodes[i];	
	        	
	        	if(countWfList>0){
	        		for(int k=0;k<wfList.size();k++){
	        		FlowData flowData =(FlowData)wfList.get(k);
	        		String activityDefID=flowData.getActivityDefID();
	        		String workInfo="";
	        		if(activityDefID.equals(oneNode[0])){
	        			workInfo=flowData.getElementValue()+"  ["+flowData.getUserName()+"于"+flowData.getUserDate()+"办理]";
	        			oneNode[1]+=workInfo+"\n";
	        		}//if
	        		}//for
	        	}//if
	        	oneNode[1]+="\n\n\n\n";
	        	 aTable.addCell(new PDFCell(oneNode[1],1,8));
	        }//for
	             
	        document.add(aTable);
	 	}
	 
	 	}catch(Exception e){
	 		System.out.println("==createContent====errors:"+e);
	 	}
	 }
	 
	
	 
	 
	 
	//拷贝文件
	 public static void copyFile(HttpServletRequest request,String targetDir,ArrayList attachment){
	 	int count=0;
	 	int byteSum=0;
	 	int byteRead=0; 
	 	int position=0;
	 	String fileName="";
	 	
	 	try{
	 	String realPath=request.getRealPath("/");
	 	//System.out.println("**********************realPath:"+realPath);
	 	int jobssPosition=realPath.indexOf("jboss-3.2.5");
	 	String instalDir="";
	 	if(jobssPosition>-1){
	 		instalDir=realPath.substring(0,jobssPosition);
	 	}
	 	//System.out.println("*************index:"+realPath.indexOf("jboss-3.2.5"));
	 	//System.out.println("***********suString:"+instalDir);
	 
	 	if(attachment!=null){
	 		count=attachment.size();
	 		for(int i=0;i<count;i++){
	 			String path=(String)attachment.get(i);
	 			if(path==null)path="";
	 			if(!path.equals("")){
	 				position=path.lastIndexOf("/");
	 				fileName=path.substring(position,path.length());
	 			//	System.out.println("*********instalDir:"+instalDir+"*******path:"+path+"*********fileName:"+realPath+targetDir+fileName);
	 				File sourceFile=new File(realPath+"\\internet\\"+path);
	 				File targetFile=new File(realPath+"/"+targetDir+fileName);
	 				CreatePdfFile.copyFile(sourceFile,targetFile);
	 			}
	 		}//end for
	 	}//end if
	 	}catch(Exception e){
	 	 System.out.println("===copyFile==errors:"+e);	
	 	}
	 }
   //拷贝文件
	 private static void copyFile(File file,File targetFile) throws Exception{
        try {

        	FileInputStream stream=new FileInputStream(file);
            FileOutputStream fos = new FileOutputStream(targetFile);
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
	 
	 //查询发文数据
	 public static String querySendArchive(HttpServletRequest request,String prix,String archiveId){
	 	StringBuffer sb=new StringBuffer();
	 	HashMap hm=new HashMap();
	 	
	 	
	 	sb.append("\n"+prix+" ");
	 	String sql="select * from SendArchive where sendId="+archiveId;
	 	init();
	 	
	 	String sendID="";
	 	String archiveCode="";
	 	String archiveTitle="";
	 	String draftDept="";
	 	String sendDate="";
	 	String timeLevel="";
	 	String secretLevel="";
	 	String drafter="";
	 	String sendNum="";
	 	String sendOrgan="";
	 	String corrector="";
	 	String printer="";
	 	
	 	try{
	 		ResultSet rs=null;
	 		rs=CreatePdfFile.st.executeQuery(sql);
	 		
	 		if(rs!=null){
		 		  while(rs.next()){
		 		  	sendID=rs.getString("sendID");
		 		  	archiveCode=rs.getString("archiveCode");
		 		  	archiveTitle=rs.getString("archiveTitle");
		 		  	draftDept=rs.getString("draftDept");
		 		  	sendDate=rs.getString("sendDate");
		 		  	timeLevel=rs.getString("timeLevel");
		 		  	secretLevel=rs.getString("secretLevel");
		 		  	drafter=rs.getString("drafter");
		 		  	sendNum=rs.getString("sendNum");
		 		  	sendOrgan=rs.getString("sendOrgan");
		 		  	corrector=rs.getString("corrector");
		 		  	printer=rs.getString("printer");
		 		  }

	 		      if(archiveCode==null)archiveCode="";
		 		  if(archiveTitle==null)archiveTitle="";
		 		  if(draftDept==null)draftDept="";
		 		  if(sendDate==null)sendDate="";
		 		  if(timeLevel==null)timeLevel="";
		 		  if(secretLevel==null)secretLevel="";
		 		  if(drafter==null)drafter="";
		 		  if(sendNum==null)sendNum="";
		 		  if(sendOrgan==null)sendOrgan="";
		 		  if(corrector==null)corrector="";
		 		  if(printer==null)printer="";
		 		  
		 		  request.setAttribute("secretLevel",secretLevel);
		 		  
		 		  if(secretLevel.equals("0")){
		 		  	secretLevel="公开";
		 		  }else if(secretLevel.equals("1")){
		 		  	secretLevel="秘密";
		 		  }else if(secretLevel.equals("2")){
		 		  	secretLevel="机密";
		 		  }if(secretLevel.equals("3")){
		 		  	secretLevel="绝密";
		 		  }			 		  
		 		 
		 		  
		 		  if(timeLevel.equals("0")){
		 		  	timeLevel="正常";
		 		  }else if(timeLevel.equals("1")){
		 		  	timeLevel="稍急";
		 		  }else if(timeLevel.equals("2")){
		 		  	timeLevel="紧急";
		 		  }else if(timeLevel.equals("3")){
		 		  	timeLevel="特急";
		 		  }
		 		  
		 		  sb.append(archiveTitle+" ");//在records.txt中使用
		 		  sb.append(secretLevel+" ");
		 		  sb.append(timeLevel+" ");
		 		  sb.append(sendOrgan+" ");
		 		  sb.append(draftDept+" ");
		 		  sb.append(drafter+" ");
		 		  sb.append(archiveCode+" ");
		 		  sb.append(sendDate+" ");
		 		  sb.append(printer+" ");
		 		  sb.append(corrector+" ");
		 		  sb.append(sendNum+" ");
		 		  
		 		 hm.put("draftDept",draftDept);//在生成pdf文件时使用
		 		 hm.put("sendNum",sendNum);
		 		 hm.put("secretLevel",secretLevel);
		 		 hm.put("timeLevel",timeLevel);
		 		 hm.put("sendDate",sendDate);
		 		 hm.put("archiveCode",archiveCode);
		 		 hm.put("drafter",drafter);
		 		 hm.put("archiveTitle",archiveTitle);
		 		 hm.put("sendOrgan",sendOrgan);
		 		 hm.put("corrector",corrector);
		 		 hm.put("printer",printer);
		 		 
		 		 request.setAttribute("baseData",hm);
		 		  }
	 		if(rs!=null)rs.close();
	 	}catch(Exception e){
	 	 System.out.println("=querySendArchive===========errors:"+e);	
	 	}
	 	
	 	closeCon();
	 	sb.append(prix);
	 	return sb.toString();
	 }
	 
	 
	 
	 //查询收文基础数据
	 public static String queryReceiveArchive(HttpServletRequest request,String prix,String archiveId){
	 	StringBuffer sb=new StringBuffer();
	 	HashMap hm=new HashMap();
	 	
	 	sb.append("\n"+prix+" ");
	 	String sql="select * from ReceiveArchive where receiveID="+archiveId;
	 	init();
	 	
	 	String archiveUnit="";
	 	String archiveNum="";
	 	String secretLevel="";
	 	String timeLevel="";
	 	String archiveDate="";
	 	String archiveCode="";
	 	String chenPiMan="";
	 	String title="";
	 	
	 	try{
	 		ResultSet rs=null;
	 		rs=CreatePdfFile.st.executeQuery(sql);
	 		if(rs!=null){
	 		  while(rs.next()){
	 		  	archiveUnit=rs.getString("archiveUnit");
	 		  	archiveNum=rs.getString("archiveNum");
	 		  	secretLevel=rs.getString("secretLevel");
	 		  	timeLevel=rs.getString("timeLevel");
	 		  	archiveDate=rs.getString("archiveDate");
	 		  	archiveCode=rs.getString("archiveCode");
	 		  	chenPiMan=rs.getString("chenPiMan");
	 		  	title=rs.getString("archiveTitle");
	 		  }	
	 		  if(archiveUnit==null)archiveUnit="";
	 		  if(archiveNum==null)archiveNum="";
	 		  if(secretLevel==null)secretLevel="";
	 		  if(timeLevel==null)timeLevel="";
	 		  if(archiveDate==null)archiveDate="";
	 		  if(archiveCode==null)archiveCode="";
	 		  if(chenPiMan==null)chenPiMan="";
	 		  if(title==null)title="";
	 		  
	 		  request.setAttribute("secretLevel",secretLevel);
	 		  
	 		  if(secretLevel.equals("0")){
	 		  	secretLevel="公开";
	 		  }else if(secretLevel.equals("1")){
	 		  	secretLevel="秘密";
	 		  }else if(secretLevel.equals("2")){
	 		  	secretLevel="机密";
	 		  }if(secretLevel.equals("3")){
	 		  	secretLevel="绝密";
	 		  }
	 		  
	 		 
	 		  
	 		  if(timeLevel.equals("0")){
	 		  	timeLevel="正常";
	 		  }else if(timeLevel.equals("1")){
	 		  	timeLevel="稍急";
	 		  }else if(timeLevel.equals("2")){
	 		  	timeLevel="紧急";
	 		  }else if(timeLevel.equals("3")){
	 		  	timeLevel="特急";
	 		  }
	 		  
	 		  sb.append(archiveUnit+" ");
	 		  sb.append(archiveNum+" ");
	 		  sb.append(secretLevel+" ");
	 		  sb.append(timeLevel+" ");
	 		  sb.append(archiveDate+" ");
	 		  sb.append(archiveCode+" ");
	 		  sb.append(chenPiMan+" ");
	 		  sb.append(title+" ");
	 		  
	 		 hm.put("archiveUnit",archiveUnit);
	 		 hm.put("archiveNum",archiveNum);
	 		 hm.put("secretLevel",secretLevel);
	 		 hm.put("timeLevel",timeLevel);
	 		 hm.put("archiveDate",archiveDate);
	 		 hm.put("archiveCode",archiveCode);
	 		 hm.put("chenPiMan",chenPiMan);
	 		 hm.put("title",title);
	 		 
	 		 request.setAttribute("baseData",hm);
	 		 
	 		}
	 		if(rs!=null)rs.close();
	 	}catch(Exception e){
	 	  System.out.println("=queryReceiveArchive=====errors:"+e);	
	 	}
	 	closeCon();
	 	sb.append(prix);
	 	
	 	return sb.toString();
	 }
	 
   //查询收文的附件
	 public static ArrayList queryReceiveArchiveAttachment(String archiveId){
	   	ArrayList list=new ArrayList();
	   	String sql="select * from FlowAttachment where archiveID="+archiveId;
	   
	    System.out.println("queryReceiveArchiveAttachment**********************sql:"+sql);
	   	ResultSet rs=null;	   	
	   	init();
	   	try{
	   		rs=CreatePdfFile.st.executeQuery(sql);
	   	if(rs!=null){
	   			while(rs.next()){
	   				list.add(rs.getString("filePath"));
	   			}
	   		}//end if
	   	}catch(Exception e){
	   	 System.out.println("===queryReceiveArchiveAttachment============errors:"+e);
	   	}
	   	closeCon();
	   	return list;
	 }
	 
	 //更新记录设置为已归档状态
	 public static void updateRecord(String tab,String idTag,String archiveId){
	 	 String sql="update "+tab+" set isEnd=1 where "+idTag+"="+archiveId;
	 	 try{
	 	 	init();
	 	 	CreatePdfFile.st.executeUpdate(sql);
	 	 	closeCon();
	 	 }catch(Exception e){
	 	 	
	 	 }
	 }
	 
	 //把文件拷贝到共享文件夹
	 public static void shareFile(HttpServletRequest request,String sourceFolder,String floderName,
	 		                        String userId,String EmpowerIDs,String filePrix){
	 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	 	Date d=new Date();
	 	String today=sdf.format(d);
	 	HashMap baseData=(HashMap)request.getAttribute("baseData");
	 	String secretLevel=(String)request.getAttribute("secretLevel");
	
	 	String realPath=request.getRealPath("/");
	    
	 	int jobssPosition=realPath.indexOf("jboss-3.2.5");
	 	String instalDir="";
	 	if(jobssPosition>-1){
	 		instalDir=realPath.substring(0,jobssPosition);
	 	}
		// System.out.println("**********firstDir:"+instalDir+"共享文件夹\\内部文件归档管理");	
	 	 File firstDir=new File(instalDir+"共享文件夹\\内部文件归档管理");
	 	
	 	 if(!firstDir.exists()){
	 	 	boolean result=firstDir.mkdirs();
	 	 //	System.out.println("*********生成文件夹:"+result);
	 	 	}
	 	 
	 	try{
	 	//	System.out.println("*********floder path:"+realPath+sourceFolder);
	 		File floder=new File(realPath+sourceFolder);//指向要拷贝的目录
	 		String fileName="";//创建文件夹名字（数据库记录使用）	 		
	 		  if(filePrix.endsWith("收文呈批表")){
	 		  	
	 		  	fileName="《"+(String)baseData.get("title")+"》"+"归档文件";
	 		  }else{
	 		  	fileName="《"+(String)baseData.get("archiveTitle")+"》"+"归档文件";
	 		  }
	 		String fileType="文件夹";
	 		String fileSize="0";
	 		String filePath="";
	 		String ParentFileID="4";
	 	    String fileId="";
	 	    
	 		
	 	  //  System.out.println("**************sql:"+sql);
	 	   
	 	  
	 	        
	 	  init();
	 	  fileId=getMyId();
	 	           
	 	    String sql="";
	 	  
	 	    if(floder.isDirectory()){//取出目录下的文件
	 	     
	 		  File files[]=floder.listFiles();	
	 		  int countFiles=0;
	 		  int dotPosition=0;
	 		  if(files!=null)countFiles=files.length;
	 	  
	 	 filePath="/primeton/共享文件夹/内部文件归档管理/"+floderName;	  
	 	 sql="insert into ShareFolder(fileId,FileName,FileType,FileSize,FilePath,ParentFileID,UpdateTime,"+
	           "CreaterIDs,EmpowerIDs,miji)values";
         sql+="("+fileId+",'"+fileName+"','"+fileType+"','"+fileSize+"','"+filePath+"',"+ParentFileID+
		   ",'"+today+"','"+userId+"','"+EmpowerIDs+"',"+secretLevel+")";
	 		 
         CreatePdfFile.st.execute(sql); //文件夹路径记录
         ParentFileID=fileId;//文件夹id给文件作父id
         
	 		  for(int i=0;i<countFiles;i++){
	 		  	if(files[i].isFile()){
	 		  	   fileName=files[i].getName();	
	 		  	   fileSize=String.valueOf(files[i].length());
	 		  	   dotPosition=fileName.indexOf(".");
	 		  	   if(fileName!=null&&dotPosition>-1){
	 		  	   	
	 		  	          fileType=fileName.substring(dotPosition,fileName.length());	
	 		  	//       System.out.println("********fileType:"+fileType);
	 		  	   }
	 		 // 	filePath="/primeton/共享文件夹/内部文件归档管理/"+floderName;
	 		 
	 		  String newFileName=fileName;
	 		  if(i==0&&fileType.equals(".pdf")){
	 		  	newFileName=filePrix+".pdf";
	 		  }
	 		  	
	 		  		 		  
	 		   String sourcePath="";
	 		  
	 		   
	 		   if(filePrix.endsWith("收文呈批表")){
	 		        sourcePath=realPath+"gd\\receive\\"+floderName+"\\"+fileName;
	 		   }else{
	 		        sourcePath=realPath+"gd\\send\\"+floderName+"\\"+fileName;
	 		   }
	 		  System.out.println("=======sourcePath:"+sourcePath);	  	
	 		   File sourceFile=new File(sourcePath);
	 		   File targetFile=new File(instalDir+"共享文件夹\\内部文件归档管理\\"+floderName+"\\"+newFileName);
	 		   File currentDir=new File(instalDir+"共享文件夹\\内部文件归档管理\\"+floderName);
	 		   if(!currentDir.exists())currentDir.mkdir();
	 		 // FileOutputStream fos = new FileOutputStream(targetFile);
	 		//   System.out.println("***************sourceFile:"+realPath+"gd\\receive\\"+floderName+"\\"+fileName);
	 		//  System.out.println("***************targetFile:"+instalDir+"共享文件夹\\内部文件归档管理\\"+floderName+"\\"+fileName);
	 		   copyFile(sourceFile,targetFile);//拷贝文件
	 		   
	 		  fileId=getMyId();
	 		 
	 		   sql="insert into ShareFolder(fileId,FileName,FileType,FileSize,FilePath,ParentFileID,UpdateTime,"+
		           "CreaterIDs,EmpowerIDs,miji)values";
	           sql+="("+fileId+",'"+newFileName+"','"+fileType+"','"+fileSize+"','"+filePath+"',"+ParentFileID+
			   ",'"+today+"','"+userId+"','"+EmpowerIDs+"',"+secretLevel+")";
	       //    System.out.println("=======sql:"+sql);	
	           CreatePdfFile.st.execute(sql); //文件路径记录
	 		  	}//end if
	 		  }//end for
	 	  
	 		  
	 		 closeCon();
	 		}//end if
	 	
	 	}catch(Exception e){
	 		System.out.println("========shareFile:"+e);
	 	}
	 }
	 
	 //获得id
	 public static String  getMyId(){
	 	String fileId="";
	 	String queryMaxId="select max(fileId)+1 as myId from ShareFolder ";
	 try{
	 	CreatePdfFile.st.execute(queryMaxId);                        //文件夹的路径记录
	
         ResultSet rs=CreatePdfFile.st.executeQuery(queryMaxId);//查询文件夹的id
         if(rs!=null){
           while(rs.next()){
           	fileId=rs.getString("myId");
           }	
         }//
	 }catch(Exception e){
	 	 System.out.println("=====getMyId=======errors:"+e);
	 } 
         return fileId;
	 }
	 
   //连接数据库
	   public  static void init(){	  
	   	try{	 
	     	DBconnection db = new DBconnection();
	    	CreatePdfFile.con=db.getEOSConnection();
	    	CreatePdfFile.st =CreatePdfFile.con.createStatement();
		 	
	   	}catch(Exception e){
	   	 System.out.println("=========CreatePdfFile============errors:"+e);	
	   	}
	   }
	//关闭数据库相关的连接   
	   public static void closeCon(){//关闭连接
	     try{
	     	if(CreatePdfFile.con!=null)CreatePdfFile.con.close();
	     	if(CreatePdfFile.st!=null)CreatePdfFile.st.close();
	     }catch(Exception e){
	     	System.out.println("=========closeCon============errors:"+e);	
	     }	
	   }
	 
}