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
	
	 //����Ŀ¼
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
	   
	   //�����ļ�
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
	   
	   //����Ŀ¼����
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
	      	   File fileArray[]=file.listFiles();//ȡ��Ŀ¼�б�
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
	   
	   //��records.txt׷�Ӽ�¼
	   public static void apendRecord(HttpServletRequest request,String targetFile,String record){
	   	String realPath=request.getRealPath("/");
	   
	   	try{
	   	RandomAccessFile rf=new RandomAccessFile(realPath +"/"+ targetFile,"rw");
         //	  ����һ����RandomAccessFile�Ķ��󣬲�ʵ���� 
	   
	   	rf.seek(rf.length());//��ָ���ƶ����ļ�ĩβ
	   	rf.write(record.getBytes());
	    //rf.wr.writeChars(record);
	   	}catch(Exception e){
	   	  System.out.println("=apendRecord=====errors:"+e);	
	   	}
	   }
	 
	 //ȡ�������������
	/*   public static ArrayList getSendArchiveData(PageContext pageContext,String dom,String list){
		ArrayList wflist = new ArrayList();//�������л�������
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
	   
	 //����������
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
	      			//	System.out.println("===handleMainContent=============path:"+realPath+"gd\\send\\"+floderName+"\\"+"��������"+fileType);	
		      	if(!fileType.equals("")){
	      				DBstep.iMsgServer2000 MsgObj =new DBstep.iMsgServer2000();
	      			    MsgObj.MsgFileBody(mFileBody);			//���ļ���Ϣ���
	      				mFileBody=MsgObj.ToDocument(MsgObj.MsgFileBody());    //ͨ��iMsgServer200 ��pgf�ļ���ת��Ϊ��ͨOffice�ļ���
	      				MsgObj.MsgFileBody(mFileBody);			//�����ļ�������
	      				MsgObj.MsgFileSave(realPath+"gd\\send\\"+floderName+"\\"+"��������"+fileType);		//����doc�ļ�
	      			 }//end if
	      			}//end while
	      			if(rs!=null)rs.close();
	      		}
	      		closeCon();
	      	}catch(Exception e){
	      	  System.out.println("===handleMainContent=============errors:"+e);	
	      	}
	      	 
	      	
	   }
	   
	 //ȡ�������������
	   public static ArrayList getReceiveArchiveData(PageContext pageContext,String dom,String list){
	   	ArrayList wflist = new ArrayList();//�������л�������
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
	   
	//����pdf�ļ�
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
			createReceiveArchiveContent(request,document,list);//����������������
			}else if(fileType.equals("h")){//����������������
				createSendArchiveContent(request,document,list);
			}
						
			document.close();
		}catch(Exception e) {
			System.out.println("createPdfFile======errors:"+e);

		}
		   }
	 //��װ������������
	 public static void createSendArchiveContent(HttpServletRequest request,Document document,ArrayList wfList){
	 	try{
	 		 BaseFont   bfChinese   =   BaseFont.createFont("STSong-Light",   "UniGB-UCS2-H",   false);   
	         Font   FontChinese   =   new   Font(bfChinese,   12,   Font.NORMAL);   
	         Font   cellFont   =   new   Font(bfChinese,   8,   Font.NORMAL); 
	   
	 	
	 	Paragraph Title = new Paragraph("");
	    // ����ҳ���ʽ
	    Title.setSpacingBefore(8);
	    Title.setSpacingAfter(2);
	    Title.setAlignment(1);	   
	 	Title.add(new Chunk("�� �� �� �� У �� �� �� �� ��", new com.lowagie.text.Font(bfChinese, 14,
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
	 	 
	 	    aTable.addCell(new PDFCell("��嵥λ:",1,1)); 
            String draftDept=(String)hm.get("draftDept");
            aTable.addCell(new PDFCell(draftDept,1,1));       
	        
	        aTable.addCell(new PDFCell("��ӡ����:",1,1)); 
	        String sendNum=(String)hm.get("sendNum");
	        aTable.addCell(new PDFCell(sendNum,1,1)); 
	        
	        aTable.addCell(new PDFCell("�ܼ�:",1,1)); 
	        String secretLevel=(String)hm.get("secretLevel");
	        aTable.addCell(new PDFCell(secretLevel,1,1));  
	        
	        aTable.addCell(new PDFCell("�����̶�:",1,1)); 
	        String timeLevel=(String)hm.get("timeLevel");
	        aTable.addCell(new PDFCell(timeLevel,1,1));  
	     //------------------------------------------------   
	        aTable.addCell(new PDFCell("��������:",1,1)); 
	        String sendDate=(String)hm.get("sendDate");
	        aTable.addCell(new PDFCell(sendDate,1,1)); 
	        
	        aTable.addCell(new PDFCell("�ĺ�:",1,1)); 
	        String archiveCode=(String)hm.get("archiveCode");
	        aTable.addCell(new PDFCell(archiveCode,1,2)); 
	        
	        aTable.addCell(new PDFCell("�����:",1,1)); 
	        String drafter=(String)hm.get("drafter");
	        aTable.addCell(new PDFCell(drafter,1,2)); 
	      
	    //---------------------------------------------------   
	        aTable.addCell(new PDFCell("����:",1,1)); 
	        String archiveUnit=(String)hm.get("archiveTitle");
	        aTable.addCell(new PDFCell(archiveUnit,1,7));  
	       
	    
		 

	        String nodes[][]={{"DX3","[�����쵼ǩ��]\n"},{"DX5","[�ֹ��쵼ǩ��]\n"},{"DX61","[У��Ҫ�쵼ǩ��]\n"},{"DX62","[���������]\n"}};
	      
	    
	        nodes[0][0]="DX3";
	        nodes[0][1]="[�����쵼ǩ��]\n";
	        
	        nodes[1][0]="DX5";
	        nodes[1][1]="[�ֹ��쵼ǩ��]\n";
	        
	        nodes[2][0]="DX61";
	        nodes[2][1]="[У��Ҫ�쵼ǩ��]\n";
	        
	        nodes[3][0]="DX62";
	        nodes[3][1]="[���������]\n";
	        
	        
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
	        			workInfo=flowData.getElementValue()+"  ["+flowData.getUserName()+"��"+flowData.getUserDate()+"����]";
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
	 //��װ������������
	 public static void createReceiveArchiveContent(HttpServletRequest request,Document document,ArrayList wfList){
	 	try{
	 		 BaseFont   bfChinese   =   BaseFont.createFont("STSong-Light",   "UniGB-UCS2-H",   false);   
	         Font   FontChinese   =   new   Font(bfChinese,   12,   Font.NORMAL);   
	         Font   cellFont   =   new   Font(bfChinese,   8,   Font.NORMAL); 
	   
	 	
	 	Paragraph Title = new Paragraph("");
	    // ����ҳ���ʽ
	    Title.setSpacingBefore(8);
	    Title.setSpacingAfter(2);
	    Title.setAlignment(1);	   
	 	 Title.add(new Chunk("�� �� �� �� У �� �� �� �� ��", new com.lowagie.text.Font(bfChinese, 14,
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
	 		 		 
	 		
	        aTable.addCell(new PDFCell("���ĵ�λ:",1,1)); 
	        String archiveUnit=(String)hm.get("archiveUnit");
	        aTable.addCell(new PDFCell(archiveUnit,1,1));   
	      
	        aTable.addCell(new PDFCell("����:",1,1)); 
	        String archiveNum=(String)hm.get("archiveNum");
	        aTable.addCell(new PDFCell(archiveNum,1,1));  
	      
	        aTable.addCell(new PDFCell("�ܼ�:",1,1)); 
	        String secretLevel=(String)hm.get("secretLevel");
	        aTable.addCell(new PDFCell(secretLevel,1,1)); 
	       
	        aTable.addCell(new PDFCell("�����̶�:",1,1)); 
	        String timeLevel=(String)hm.get("timeLevel");
	        aTable.addCell(new PDFCell(timeLevel,1,1)); 
	        
	        aTable.addCell(new PDFCell("�ռ�����:",1,1)); 
	        String archiveDate=(String)hm.get("archiveDate");	 
	        if(archiveDate!=null&&archiveDate.length()>9)
	        	archiveDate=archiveDate.substring(0,10);
	        aTable.addCell(new PDFCell(archiveDate,1,1));   
	      
	        aTable.addCell(new PDFCell("���ı��:",1,1)); 
	        String archiveCode=(String)hm.get("archiveCode");	 		 
	        aTable.addCell(new PDFCell(archiveCode,1,2)); 
	        
	        aTable.addCell(new PDFCell("������:",1,1)); 
	        String chenPiMan=(String)hm.get("chenPiMan");	 		 
	        aTable.addCell(new PDFCell(chenPiMan,1,2)); 
	        
	        aTable.addCell(new PDFCell("�ļ�����:",1,1)); 
	        String title=(String)hm.get("title");	 		 
	        aTable.addCell(new PDFCell(title,1,7)); 
	        
	       
	        String nodes[][]={{"DX2","[�칫���쵼������]\n"},{"DX4","[У�쵼�������]\n"},{"DX6","[�ֹ��쵼��ʾ���]\n"},{"DX7","[�칫���쵼�������]\n"},{"DX8","[�����Ա�������]\n"}};
	      
	    
	        nodes[0][0]="DX2";
	        nodes[0][1]="[�칫���쵼������]\n";
	        
	        nodes[1][0]="DX4";
	        nodes[1][1]="[У�쵼�������]\n";
	        
	        nodes[2][0]="DX6";
	        nodes[2][1]="[�ֹ��쵼��ʾ���]\n";
	        
	        nodes[3][0]="DX7";
	        nodes[3][1]="[�칫���쵼�������]\n";
	        
	        nodes[4][0]="DX8";
	        nodes[4][1]="[�����Ա�������]\n";
	        
	        
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
	        			workInfo=flowData.getElementValue()+"  ["+flowData.getUserName()+"��"+flowData.getUserDate()+"����]";
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
	 
	
	 
	 
	 
	//�����ļ�
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
   //�����ļ�
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
	 
	 //��ѯ��������
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
		 		  	secretLevel="����";
		 		  }else if(secretLevel.equals("1")){
		 		  	secretLevel="����";
		 		  }else if(secretLevel.equals("2")){
		 		  	secretLevel="����";
		 		  }if(secretLevel.equals("3")){
		 		  	secretLevel="����";
		 		  }			 		  
		 		 
		 		  
		 		  if(timeLevel.equals("0")){
		 		  	timeLevel="����";
		 		  }else if(timeLevel.equals("1")){
		 		  	timeLevel="�Լ�";
		 		  }else if(timeLevel.equals("2")){
		 		  	timeLevel="����";
		 		  }else if(timeLevel.equals("3")){
		 		  	timeLevel="�ؼ�";
		 		  }
		 		  
		 		  sb.append(archiveTitle+" ");//��records.txt��ʹ��
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
		 		  
		 		 hm.put("draftDept",draftDept);//������pdf�ļ�ʱʹ��
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
	 
	 
	 
	 //��ѯ���Ļ�������
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
	 		  	secretLevel="����";
	 		  }else if(secretLevel.equals("1")){
	 		  	secretLevel="����";
	 		  }else if(secretLevel.equals("2")){
	 		  	secretLevel="����";
	 		  }if(secretLevel.equals("3")){
	 		  	secretLevel="����";
	 		  }
	 		  
	 		 
	 		  
	 		  if(timeLevel.equals("0")){
	 		  	timeLevel="����";
	 		  }else if(timeLevel.equals("1")){
	 		  	timeLevel="�Լ�";
	 		  }else if(timeLevel.equals("2")){
	 		  	timeLevel="����";
	 		  }else if(timeLevel.equals("3")){
	 		  	timeLevel="�ؼ�";
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
	 
   //��ѯ���ĵĸ���
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
	 
	 //���¼�¼����Ϊ�ѹ鵵״̬
	 public static void updateRecord(String tab,String idTag,String archiveId){
	 	 String sql="update "+tab+" set isEnd=1 where "+idTag+"="+archiveId;
	 	 try{
	 	 	init();
	 	 	CreatePdfFile.st.executeUpdate(sql);
	 	 	closeCon();
	 	 }catch(Exception e){
	 	 	
	 	 }
	 }
	 
	 //���ļ������������ļ���
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
		// System.out.println("**********firstDir:"+instalDir+"�����ļ���\\�ڲ��ļ��鵵����");	
	 	 File firstDir=new File(instalDir+"�����ļ���\\�ڲ��ļ��鵵����");
	 	
	 	 if(!firstDir.exists()){
	 	 	boolean result=firstDir.mkdirs();
	 	 //	System.out.println("*********�����ļ���:"+result);
	 	 	}
	 	 
	 	try{
	 	//	System.out.println("*********floder path:"+realPath+sourceFolder);
	 		File floder=new File(realPath+sourceFolder);//ָ��Ҫ������Ŀ¼
	 		String fileName="";//�����ļ������֣����ݿ��¼ʹ�ã�	 		
	 		  if(filePrix.endsWith("���ĳ�����")){
	 		  	
	 		  	fileName="��"+(String)baseData.get("title")+"��"+"�鵵�ļ�";
	 		  }else{
	 		  	fileName="��"+(String)baseData.get("archiveTitle")+"��"+"�鵵�ļ�";
	 		  }
	 		String fileType="�ļ���";
	 		String fileSize="0";
	 		String filePath="";
	 		String ParentFileID="4";
	 	    String fileId="";
	 	    
	 		
	 	  //  System.out.println("**************sql:"+sql);
	 	   
	 	  
	 	        
	 	  init();
	 	  fileId=getMyId();
	 	           
	 	    String sql="";
	 	  
	 	    if(floder.isDirectory()){//ȡ��Ŀ¼�µ��ļ�
	 	     
	 		  File files[]=floder.listFiles();	
	 		  int countFiles=0;
	 		  int dotPosition=0;
	 		  if(files!=null)countFiles=files.length;
	 	  
	 	 filePath="/primeton/�����ļ���/�ڲ��ļ��鵵����/"+floderName;	  
	 	 sql="insert into ShareFolder(fileId,FileName,FileType,FileSize,FilePath,ParentFileID,UpdateTime,"+
	           "CreaterIDs,EmpowerIDs,miji)values";
         sql+="("+fileId+",'"+fileName+"','"+fileType+"','"+fileSize+"','"+filePath+"',"+ParentFileID+
		   ",'"+today+"','"+userId+"','"+EmpowerIDs+"',"+secretLevel+")";
	 		 
         CreatePdfFile.st.execute(sql); //�ļ���·����¼
         ParentFileID=fileId;//�ļ���id���ļ�����id
         
	 		  for(int i=0;i<countFiles;i++){
	 		  	if(files[i].isFile()){
	 		  	   fileName=files[i].getName();	
	 		  	   fileSize=String.valueOf(files[i].length());
	 		  	   dotPosition=fileName.indexOf(".");
	 		  	   if(fileName!=null&&dotPosition>-1){
	 		  	   	
	 		  	          fileType=fileName.substring(dotPosition,fileName.length());	
	 		  	//       System.out.println("********fileType:"+fileType);
	 		  	   }
	 		 // 	filePath="/primeton/�����ļ���/�ڲ��ļ��鵵����/"+floderName;
	 		 
	 		  String newFileName=fileName;
	 		  if(i==0&&fileType.equals(".pdf")){
	 		  	newFileName=filePrix+".pdf";
	 		  }
	 		  	
	 		  		 		  
	 		   String sourcePath="";
	 		  
	 		   
	 		   if(filePrix.endsWith("���ĳ�����")){
	 		        sourcePath=realPath+"gd\\receive\\"+floderName+"\\"+fileName;
	 		   }else{
	 		        sourcePath=realPath+"gd\\send\\"+floderName+"\\"+fileName;
	 		   }
	 		  System.out.println("=======sourcePath:"+sourcePath);	  	
	 		   File sourceFile=new File(sourcePath);
	 		   File targetFile=new File(instalDir+"�����ļ���\\�ڲ��ļ��鵵����\\"+floderName+"\\"+newFileName);
	 		   File currentDir=new File(instalDir+"�����ļ���\\�ڲ��ļ��鵵����\\"+floderName);
	 		   if(!currentDir.exists())currentDir.mkdir();
	 		 // FileOutputStream fos = new FileOutputStream(targetFile);
	 		//   System.out.println("***************sourceFile:"+realPath+"gd\\receive\\"+floderName+"\\"+fileName);
	 		//  System.out.println("***************targetFile:"+instalDir+"�����ļ���\\�ڲ��ļ��鵵����\\"+floderName+"\\"+fileName);
	 		   copyFile(sourceFile,targetFile);//�����ļ�
	 		   
	 		  fileId=getMyId();
	 		 
	 		   sql="insert into ShareFolder(fileId,FileName,FileType,FileSize,FilePath,ParentFileID,UpdateTime,"+
		           "CreaterIDs,EmpowerIDs,miji)values";
	           sql+="("+fileId+",'"+newFileName+"','"+fileType+"','"+fileSize+"','"+filePath+"',"+ParentFileID+
			   ",'"+today+"','"+userId+"','"+EmpowerIDs+"',"+secretLevel+")";
	       //    System.out.println("=======sql:"+sql);	
	           CreatePdfFile.st.execute(sql); //�ļ�·����¼
	 		  	}//end if
	 		  }//end for
	 	  
	 		  
	 		 closeCon();
	 		}//end if
	 	
	 	}catch(Exception e){
	 		System.out.println("========shareFile:"+e);
	 	}
	 }
	 
	 //���id
	 public static String  getMyId(){
	 	String fileId="";
	 	String queryMaxId="select max(fileId)+1 as myId from ShareFolder ";
	 try{
	 	CreatePdfFile.st.execute(queryMaxId);                        //�ļ��е�·����¼
	
         ResultSet rs=CreatePdfFile.st.executeQuery(queryMaxId);//��ѯ�ļ��е�id
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
	 
   //�������ݿ�
	   public  static void init(){	  
	   	try{	 
	     	DBconnection db = new DBconnection();
	    	CreatePdfFile.con=db.getEOSConnection();
	    	CreatePdfFile.st =CreatePdfFile.con.createStatement();
		 	
	   	}catch(Exception e){
	   	 System.out.println("=========CreatePdfFile============errors:"+e);	
	   	}
	   }
	//�ر����ݿ���ص�����   
	   public static void closeCon(){//�ر�����
	     try{
	     	if(CreatePdfFile.con!=null)CreatePdfFile.con.close();
	     	if(CreatePdfFile.st!=null)CreatePdfFile.st.close();
	     }catch(Exception e){
	     	System.out.println("=========closeCon============errors:"+e);	
	     }	
	   }
	 
}