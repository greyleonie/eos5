/*
 * 创建日期 2007-3-21
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.Document;
import org.w3c.dom.Node;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;



/**
 * @author Administrator
 *
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class SendPage2NetWork {  
	
	
	
	
	 
	public static boolean uploadFile(String dir,String fileName,String fileSource,String prefix){
		
		File tofile = new File("D:\\Tomcat 6.0\\webapps\\ROOT\\teachPlan\\"+fileName+prefix);

		FileWriter fw;
		try {
			fw = new FileWriter(tofile);

			BufferedWriter buffw = new BufferedWriter(fw);
			PrintWriter pw = new PrintWriter(buffw);

			String str = fileSource;
			pw.println(str);

			pw.close();
			buffw.close();
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("========uploadFile========error:"+e);  
			return false;
		}
		
		return true;
//		boolean result=true;
//	 
//		    try{   
//		    	 String webSiteConfig="";
//		    	 Properties pro=new Properties();
//		         InputStream in =SendPage2NetWork.class.getResourceAsStream("/properties/webSiteConfing.properties"); 
//		         pro.load(in); 		   
//		         webSiteConfig=pro.getProperty("domainName");      
//		         webSiteConfig+="/acceptFile";
//		            System.out.println("*********url:"+webSiteConfig+"?dir="+dir+"&fileName="+fileName+prefix); 
//		        //   fileName="test";
//		             String link=webSiteConfig+"?dir="+dir+"&fileName="+fileName+prefix;
//		           //  link=java.net.URLEncoder.encode(link);
//		             System.out.println("*********link:"+link);
//		             URL url =new URL(link);   
//		                          HttpURLConnection   conn =(HttpURLConnection)url.openConnection();   
//		                          conn.setDoOutput(true);   
//		                          conn.setDoInput(true);   
//		                          conn.setUseCaches(false);   	
//		                       //   conn.setRequestProperty("contentType", "charset=GBK");
//		                          conn.setRequestMethod("POST");   
//		                       
//		                        
//		                          OutputStream   out   =   conn.getOutputStream();   
//		                          int   bytesOut   =   0;   
//		                          byte[]   bufferOut   =   new   byte[8192];  
//		                          bufferOut=fileSource.getBytes();
//		                          if(bufferOut!=null){
//		                          	bytesOut=bufferOut.length;
//		                          }
//		                      
//		                          out.write(bufferOut,   0,   bytesOut);  
//		                          
//		                          out.flush();   
//		                          out.close();   
//		    
//		                          //获得上传的结果   
//		                          InputStream   isResult   =   conn.getInputStream();   
//		                          byte[]   buffer   =   new   byte[isResult.available()];   
//		                          isResult.read(buffer);  		                  
//		                          isResult.close();   
//		                        
//		                         
//		    
//		                  }catch(Exception e){   
//		                          result=false;   
//		                          System.out.println("========uploadFile========error:"+e);   
//		                  } 
//		                  
//		                  return   result;   

	}
	
	public static String appendCSSContent(){
	  	String content="";
	  	StringBuffer sb=new StringBuffer();
	  	sb.append("<style type=\"text/css\">");
	  	sb.append(".td {font-size: 12px;color: #000000;	background-color: #F0F0F0;	line-height: 22px;}");
	  	sb.append(".td1 {background-color: #FFFFFF;	font-size: 12px;line-height: 22px;color: #000000;}");
	  	sb.append(".td2 {background-color: #E8F5FF;font-size: 12px;line-height: 22px;color: #000000;}");
		sb.append(".td3 {background-color: #F0E68C;font-size: 12px;line-height: 22px;color: #000000;}");
	  	sb.append(".text {	font-size: 12px;color: #000000;	line-height: 20px;}");
	  	sb.append(".td_title {	background-color: #4A82D1;font-size: 12px;line-height: 26px;color: #FFFFFF;}");
	  	sb.append(".button_02 {font-size: 12px;color: #FFFFFF;	background-attachment: fixed;");
	  	sb.append("background-repeat: no-repeat;background-position: center center;height: 18px;width: 54px;border: none;cursor: hand;");
	  	sb.append("line-height: 20px;}</style>");
	  	content =sb.toString();
	  	return content;
	}
	
	public static String appendTable(){
	    String content="";
		StringBuffer sb=new StringBuffer();
		sb.append("<table width=\"100%\" height=\"30\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"left\">");		
		sb.append("<input name=\"btnSave\" type=\"button\"  style=\"border:0;bgcolor:#787878;\" value=\"关 闭\" onclick='window.close()'>");
		sb.append("</td></tr></table>");
	  return content=sb.toString();
	}
	
		

	
	public   String readWebSiteInfo(){
		String confin="http://";
		
		return confin;
	}
	
	
	 
	public static void main(String args[]) throws Exception{
		   String filePath="2007专题测试班";
		   String source="dddddddd";
		  // createHtml(source);
		   SendPage2NetWork sp=new SendPage2NetWork();
		 //  uploadFile(filePath);
		  
	}
	

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_sendPage2WebSite
	 * @bizlet_param passing="in_out" type="variable" value="fileSource" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="fileName" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="msg" name="" desc=""
	 */
	public static int BL_sendPage2WebSite(Document doc, BizContext param) throws Exception{
		String fileSource = (String)param.getParaObjectAt(0);
		String fileName = (String)param.getParaObjectAt(1);
		Node msg = (Node)param.getParaObjectAt(2);
		String dir = (String)param.getParaObjectAt(3);
		String cssContent=appendCSSContent();	
		fileSource=cssContent+fileSource;
		
		boolean sendResult=false;
		String info="";	   
		 System.out.println("========================fileSource:"+fileSource);	
		  System.out.println("========================fileName:"+fileName);	
	    sendResult=uploadFile(dir,fileName,fileSource,".htm");	
	  
	    if(sendResult){
	    	info="成功发送到外网！";
	    }else{
	    	info="网络故障,发送失败！";
	    }
	
	    XmlUtil.setNodeValue(msg,info);
		return 1;
	}
	
	public static String createLedInfoFile(PersistenceBroker db){//组装数据以xml文件发送到外网
	   String content="<?xml version=\"1.0\" encoding=\"GBK\"?>\n<all>";
	   Connection cn = null;
	   Statement st = null;
	   ResultSet rs = null;
	   System.out.println("================$createLedInfoFile$============");	
	   try{
	   	   String classId="";
	   	   String className="";
	   	   String adjustTime="";
	   	   String adjustContent="";
	   	   String noticeTime="";
	   	   cn=db.getConnection();
	   	   st=cn.createStatement();
	   	   	
	   	   String sql="select top 50 cl.classid,cl.classname,co.AdjustTime,co.AdjustContent,co.NoticeTime "+
                      " from class cl join CourseAdjust co on cl.classid=co.classid order by co.NoticeTime ";
	   	   rs=st.executeQuery(sql);
	   	  
	   	   while(rs.next()){
	   	   	
	   	      classId=(new Integer(rs.getInt("classid"))).toString();
	   	      className=rs.getString("classname");
	   	      adjustTime=rs.getString("AdjustTime");
	   	      adjustContent=rs.getString("adjustContent");
	   	      noticeTime=rs.getString("NoticeTime");
	   	      
	   	      if(adjustTime!=null&&adjustTime.length()>9){
	   	        adjustTime=adjustTime.substring(0,10);
	   	      }
	   	      if(noticeTime!=null&&noticeTime.length()>9){
	   	     noticeTime=noticeTime.substring(0,10);
   	          }
	   	     content+="\n"+"<notice id=\""+classId+"\""+
	   	      		  " className=\""+className+"\""+
	   	      		  " adjustTime=\""+adjustTime+"\""+
					  " adjustContent=\""+adjustContent+"\""+
					  " noticeTime=\""+noticeTime+"\""+
					  "/>";
				
	   	     
	   	   }
	   	content+="\n</all>";
	   	  
	   }catch(Exception e){
	     System.out.println("================createLedInfoFile============error:"+e);	
	   }
	   return content;
	}
	/**
	 * 发送课程调整信息到外网
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_sendLedInfo
	 */
	public static int BL_sendLedInfo(Document doc, BizContext param) throws Exception{
		PersistenceBroker db = param.getDBBroker();
		
		String fileContent=createLedInfoFile(db);
		uploadFile("courseAdjust","courseAdjust",fileContent,".xml");
		return 1;
	}

}
