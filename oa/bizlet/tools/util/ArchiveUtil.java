package tools.util;

import com.primeton.tp.core.api.BizContext;
import com.lowagie.text.Document;
import java.io.File;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-9-25
 * @class_displayName ArchiveUtil
 */

public class ArchiveUtil {
  
   //创建目录
   public static void createDir(String dir){
    File f=new File(dir);
    System.out.println("=========dir:"+dir);
 	   if(!f.exists()){
 	    f.mkdir();	
 	  }
   }
   
   //产生目录名称
   public static int createDirName(String dir,String startStr){
      	int folders=0;
      	File file=new File(dir);
      	if(file.isDirectory()){
      	   int allFolders=0;
      	   String floderName="";
      	   File fileArray[]=file.listFiles();//取出目录列表
      	   if(fileArray!=null){
      	    allFolders=fileArray.length;
      	    for(int i=0;i<allFolders;i++){
      	    	floderName=fileArray[i].getName();
      	    	System.out.print("=====folderName:"+floderName);
      	    }
      	   }
      	}
      	return folders;
   }
   
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName createDirName
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int createDirName(Document doc, BizContext param) throws Exception{
		String targetFolder = (String)param.getParaObjectAt(0);//要搜索的目录
		String startStr = (String)param.getParaObjectAt(1);
		//Node = (Node)param.getParaObjectAt(2);
		createDirName(targetFolder,startStr);
		return 1;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName createDir
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 */
	public static int createDir(Document doc, BizContext param) throws Exception{		
		String dir = (String)param.getParaObjectAt(0);
		createDir(dir);
		return 1;
	}

	
	


}