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
  
   //����Ŀ¼
   public static void createDir(String dir){
    File f=new File(dir);
    System.out.println("=========dir:"+dir);
 	   if(!f.exists()){
 	    f.mkdir();	
 	  }
   }
   
   //����Ŀ¼����
   public static int createDirName(String dir,String startStr){
      	int folders=0;
      	File file=new File(dir);
      	if(file.isDirectory()){
      	   int allFolders=0;
      	   String floderName="";
      	   File fileArray[]=file.listFiles();//ȡ��Ŀ¼�б�
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
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName createDirName
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int createDirName(Document doc, BizContext param) throws Exception{
		String targetFolder = (String)param.getParaObjectAt(0);//Ҫ������Ŀ¼
		String startStr = (String)param.getParaObjectAt(1);
		//Node = (Node)param.getParaObjectAt(2);
		createDirName(targetFolder,startStr);
		return 1;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName createDir
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 */
	public static int createDir(Document doc, BizContext param) throws Exception{		
		String dir = (String)param.getParaObjectAt(0);
		createDir(dir);
		return 1;
	}

	
	


}