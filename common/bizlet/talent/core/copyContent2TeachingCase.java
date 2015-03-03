package talent.core;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;

import DBstep.iDBManager2000;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-10-18
 * @class_displayName copyContent2TeachingCase
 */

public class copyContent2TeachingCase {
   
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName copyContent2TeachingCase
	 * @bizlet_param passing="in_out" type="field" value="RecordID" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="thesisID" name="" desc=""
	 */
	public static int copyContent2TeachingCase(Document doc, BizContext param)
		throws Exception {
		Node recordId = (Node) param.getParaObjectAt(0);
		String thesisId = (String) param.getParaObjectAt(1);
        
		String documentRecord=addDocumentFile(thesisId);
		 XmlUtil.setNodeValue(recordId,documentRecord);
		return 1;
	}
	
	public static void addDocument(String recordId,String date){
		try{
			DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
			 String    docSql="insert into document(RecordID,FileDate,FileType,Status)values (?,?,?,?)";   
			 	
		  if (DbaObj.OpenConnection()) {
		  	    PreparedStatement ps=DbaObj.Conn.prepareStatement(docSql);
	          	ps.setString(1,recordId);	
	          	ps.setString(2,date);
	        	ps.setString(3,".doc");
	          	ps.setString(4,"READ");
	          	
	            
		          DbaObj.Conn.setAutoCommit(true) ;		        
		          ps.execute();
		          DbaObj.Conn.commit();		        
		          ps.close();
		  }
		}catch(Exception e){
			System.out.println("addDocument========errors:"+e);
		}
		  
	}
	
	public static String addDocumentFile(String id){//批改论文时把优秀的转到案例库，先在Document_file插入论文内容
		talent.core.TalentLoaddowFromDB view=new talent.core.TalentLoaddowFromDB();
		byte [] content=view.getFileContent("Thesis","ThesisID","ThesisContent",id);
		PreparedStatement prestmt=null;
		
	 	String    sql="insert into Document_File (RecordID,FileName,FileType,FileSize,FileDate,FileBody,FilePath,UserName,Descript) values (?,?,?,?,?,?,?,?,? )";
	   Date dt=new Date();
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String today=sdf.format(dt);//当天时间
        long lg=dt.getTime();
        Long ld=new Long(lg);
        String mRecordID=ld.toString();//当天时间作为recordId
        int fileSize=0;
	 	
		try{
			DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
		  if (DbaObj.OpenConnection()) {
		    
	     if(content!=null)
	     	  fileSize=content.length;
		  	  prestmt =DbaObj.Conn.prepareStatement(sql);
	          prestmt.setString(1, mRecordID);
	          prestmt.setString(2, mRecordID+".doc");
	          prestmt.setString(3, ".doc");
	          prestmt.setInt(4, fileSize);
	          prestmt.setString (5 ,today);
	          prestmt.setBytes(6, content);
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.setString(9, "");        
	          
	          
	           
	          
	          DbaObj.Conn.setAutoCommit(true) ;
	          prestmt.execute();
	        
	          DbaObj.Conn.commit();
	          prestmt.close();
	         
	        
	          if(content!=null){
	          	addDocument(mRecordID,today);
			  }
	          
		   }	
		  
		
		  
		  
		}catch(Exception e){
			System.out.println("addDocumentFile========errors:"+e);
		}finally{
		 
		}
		
		return mRecordID;
	}

}