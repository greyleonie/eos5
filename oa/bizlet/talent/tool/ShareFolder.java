package talent.tool;
import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;

import java.io.File;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.struts.upload.*;


/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-5
 * @class_displayName ShareFolder
 */

public class ShareFolder {


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
	 * �����ļ�Ŀ¼
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName CreateDir
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ�·��"
	 */
	public static int CreateDir(Document doc, BizContext param) throws Exception{
		String path = (String)param.getParaObjectAt(0);
		int value = createDir(path);
		return value;
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
	 
     private static void createDirtory(String strDirName) {

     	File strDir = new File(strDirName);
        if (!strDir.isDirectory()) { //�����û�н���Ŀ¼��ǰ�û����ļ���
            strDir.mkdirs();
        }
    }
	/**
	 * �ϴ��ļ���ָ���ļ���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName UploadFileDir
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�ļ�·��"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�ļ�����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="ָ���ļ���·��"
	 */
	public static int UploadFileDir(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		
		String filePath = param0.getFirstChild().getNodeValue();
		String fileName = param1.getFirstChild().getNodeValue();
		String folderPath = param2;
		int value = -1 ;
		value = uploadFile(filePath,fileName,folderPath);
		
		return value;
	}
	/**
	 * ���ļ��д�С����λת��
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_SetFileSize
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="ת������ļ���С"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="ת��ǰ���ļ���С"
	 */
	public static int BL_SetFileSize(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		
		String strsize = "";
		long filesize = Long.parseLong(param1);

		if(filesize/1024.0<1.0){
			strsize = String.valueOf(filesize) + " �ֽ�";
		}else if(filesize/1024.0>=1.0 && filesize/1024.0/1024.0<1.0){
			strsize = String.valueOf(round((float)(filesize/1024.0),2)) + " KB";
		}else{
			strsize = String.valueOf(round((float)(filesize/1024.0/1024.0),2)) + " MB";
		}
		
		XmlUtil.setNodeValue(param0,strsize);
		
		return 1;
	}
	
	/**
	 * ����������������
	 * @param f ����Դ������
	 * @param digits ������С�����λ��
	 * @return
	 */
    private static float round( float f, int digits){
        float offset = 1.0f;
        if (digits == 0) {
            offset = 1.0f;
        } else if (digits > 0) {
            offset = digits * 10f;
        } else if(digits < 0){
            return f;
        }
        
        f = java.lang.Math.round(f * offset) / offset;
        return  f;
    }
    
	/**
	 * ����ȷ���ļ�������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_SetFileType
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�����ļ�������"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ�������"
	 */
	public static int BL_SetFileType(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		
		String filetype = "";
		String fileName = param1;
		String extFileName ="";
		if(fileName.indexOf(".")!=-1){
	           extFileName=fileName.substring(fileName.indexOf(".")+1,fileName.length()).toUpperCase();
	           if(extFileName.equals("DOC")) filetype = "Word �ĵ�";
	           else if(extFileName.equals("TXT")) filetype = "�ı��ĵ�";
	           else if(extFileName.equals("HTML")||extFileName.equals("HTM")) filetype = "HTML �ĵ�";
	           else if(extFileName.equals("XLS")) filetype = "Excel ������";
	           else if(extFileName.equals("GIF")||extFileName.equals("JPG")) filetype = extFileName + " ͼ��";
	           else filetype = extFileName + " �ĵ�";
		}else{
			filetype = "δ֪�ĵ�";
		}
		XmlUtil.setNodeValue(param0,filetype);
		
		return 1;
	}

	private static String geFileAllSize(PersistenceBroker db,String strtable,String id,String pidfield,String fileSizefield) throws Exception{
		String sql = "select "+ fileSizefield +" from "+ strtable +" where " + pidfield + " = " + id;
		int fileSize = 0;
		Connection cn = db.getConnection();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()){
		  String strfileSize = rs.getString(1);
		  fileSize += Integer.parseInt(strfileSize);
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		if(cn!=null) cn.close();  
		  	
		return String.valueOf(fileSize);
	}
		
	private static long geFileAllSize(PersistenceBroker db,int id) throws Exception{
		long fileSize = 0;
		//String sql = "select FileID,FileType,FileSize from shareFolder where ParentFileID = " + id;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;

		fileSize = geFileAllSize(db,cn,st,rs,id);

		if(rs!=null) rs.close();
		if(st!=null) st.close();
		if(cn!=null) cn.close();  
		
		return fileSize;
	}
	
	private static long geFileAllSize(PersistenceBroker db,Connection cn,Statement st,ResultSet rs,int id) throws Exception{
		long fileSize = 0;
		String sql = "select FileID,FileType,FileSize from shareFolder where ParentFileID = " + id;
		cn = db.getConnection();
		st = cn.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()){
			int fileID = rs.getInt("FileID");
			String fileType = rs.getString("FileType");
			String strfileSize = rs.getString("FileSize");
			if(fileType.equals("�ļ���")){
				fileSize += geFileAllSize(db,cn,st,rs,fileID);
			}
			fileSize += Long.parseLong(strfileSize);
		}
		return fileSize;
	}
	
	/**
	 * ȡ���ļ��д�С
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_GetFolderSize
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�ļ��д�С"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ��ĸ�ID���ֶ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��Ҫ�õ���С�ı��ֶ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��Ҫ�õ��ļ���ID"
	 */
	public static int BL_GetFolderSize(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String tabName = (String)param.getParaObjectAt(1);
		String parIDField = (String)param.getParaObjectAt(2);
		String fileSizeField = (String)param.getParaObjectAt(3);
		String fileID = (String)param.getParaObjectAt(4);
		PersistenceBroker db = param.getDBBroker();
		String folderSize = geFileAllSize(db,tabName,fileID,parIDField,fileSizeField);
		
		XmlUtil.setNodeValue(node,folderSize);
		
		return 1;
	}
	/**
	 * �ж��Ƿ���������˵��ļ�
0���ļ� 1������ 2 ����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_IsOthersFile
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="����״̬ 0���ļ��� 1�����������ļ� 2���������ļ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ���ID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="������ID"
	 */
	public static int BL_IsOthersFile(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String fileID = (String)param.getParaObjectAt(1);
		String userID = (String)param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		int state = getFolderState(db,fileID,userID);
		
		XmlUtil.setNodeValue(node,String.valueOf(state));
		
		return 1;
	}
	
	/**
	 * 
	 * @param db
	 * @param fileID
	 * @param userID
	 * @return
	 */
	private static int getFolderState(PersistenceBroker db,String fileID,String userID ) {
		int result = 0;
		String sql = "select CreaterIDs from sharefolder where parentfileid =" + fileID;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
			  result = 1;
			  String createID = rs.getString(1);
			  if(!createID.equals(userID)){
			  	result = 2;
			  	break;
			  }
	
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		
		return result;
	}
	/**
	 * ɾ���ļ���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_DeleteFolder
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ���·��"
	 */
	public static int BL_DeleteFolder(Document doc, BizContext param) throws Exception{
		String path = (String)param.getParaObjectAt(0);
		
		deleteDir(path);
		
		return 1;
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
	 
      //	�������ļ����ļ���
	  public static boolean renameDir(String olddir,String newdir) {
	    File f = new File(olddir);
	    return f.renameTo(new File(newdir));
	  }
	/**
	 * �������ļ��л��ļ�
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_Rename
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ��л��ļ�ԭ·����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ��л��ļ���·����"
	 */
	public static int BL_Rename(Document doc, BizContext param) throws Exception{
		String param0 = (String)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		
		renameDir(param0,param1);
		
		return 1;
	}
	private static void updateSubFilePath(PersistenceBroker db,String FileID,String FilePath) throws Exception{
		
		Connection con = null;
		PreparedStatement pst = null;
		String sql = "update ShareFolder set FilePath = ? where ParentFileID = "+ FileID;
		
		try{
			con = db.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1,FilePath);
			pst.executeUpdate();
			

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pst!=null) pst.close();
				if(con!=null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

	}
	/**
	 * �ļ����µ������ļ����ļ��д�С
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_AllFolderSize
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�ļ��д�С"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ���ID"
	 */
	public static int BL_AllFolderSize(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String fileID = (String)param.getParaObjectAt(1);

		PersistenceBroker db = param.getDBBroker();
		
		long folderSize = geFileAllSize(db,Integer.parseInt(fileID));
		String strfolderSize = String.valueOf(folderSize);
		
		XmlUtil.setNodeValue(node,strfolderSize);
		return 1;
	}
	/**
	 * �����ļ����ļ���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName CreateRootDir
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ�·��"
	 */
	public static int CreateRootDir(Document doc, BizContext param) throws Exception{
		String path1 = (String)param.getParaObjectAt(0);
		path1 = path1.substring(1);
		int value = 0;
		String p[] = path1.split("/");
		String path = "";
		for(int i=0;i<p.length;i++){
			path += "/"+p[i];
			value = createDir(path);
		}
		return 1;
	}
	/**
	 * ��Ȩ�Ĵ����û���Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_OfficeUser
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�����û�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ǰ�û�"
	 */
	public static int BL_OfficeUser(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		String officeUser = getOfficeUser(db,userID);

		XmlUtil.setNodeValue(node,officeUser);
		
		return 1;
	}
	
	private static String getOfficeUser(PersistenceBroker db,String userID) throws Exception{
		String sql = "select operatorID from EOSORG_T_EmpOrgRef where orgID = (SELECT orgID FROM EOSORG_T_EmpOrgRef where operatorID = "+ userID +")";
		String ruesult = "";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				ruesult += "," + rs.getString("operatorID") ;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return ruesult.substring(1);
	}
	/**
	 * ���ҹ���Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_OfficeOperator
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="���ҹ���Ա"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�"
	 */
	public static int BL_OfficeOperator(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		String officeOperator = getOfficeOperator(db,userID);

		XmlUtil.setNodeValue(node,officeOperator);
		
		return 1;
	}
	
	private static String getOfficeOperator(PersistenceBroker db,String userID) throws Exception{
		String sql = "SELECT er.operatorID FROM EOSOperatorRole er join EOSORG_T_EmpOrgRef eo on  er.operatorID = eo.operatorID "+
					" where roleID in (select ROLEID from TALENTROLEMENU where MENUID = 'DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE') and orgID in (SELECT orgID FROM EOSORG_T_EmpOrgRef where operatorID = "+ userID + ")";
		String ruesult = "";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				ruesult += rs.getString("operatorID") + ",";
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return ruesult;
	}
	
	private static String getSchOfficeOperator(PersistenceBroker db,String userID) throws Exception{
		String sql = "SELECT er.operatorID FROM EOSOperatorRole er join EOSORG_T_EmpOrgRef eo on  er.operatorID = eo.operatorID "+
					" where roleID in (select ROLEID from TALENTROLEMENU where MENUID = 'DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL')  and eo.orgID in  (SELECT orgID FROM EOSORG_T_EmpOrgRef where operatorID = "+ userID + ")";
		String ruesult = "";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				ruesult += rs.getString("operatorID") + ",";
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return ruesult;
	}
	/**
	 * �ж��û��Ƿ��ҹ���Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_IsOfficeOperator
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="����ֵ��1�ǣ�0����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�"
	 */
	public static int BL_IsOfficeOperator(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		String result = String.valueOf(IsOfficeOperator(db,userID));

		XmlUtil.setNodeValue(node,result);
		
		return 1;
	}
	
	private static int IsOfficeOperator(PersistenceBroker db,String userID) throws Exception{
		String sql = "SELECT er.operatorID FROM EOSOperatorRole er join EOSORG_T_EmpOrgRef eo on  er.operatorID = eo.operatorID "+
					" where roleID in (select ROLEID from TALENTROLEMENU where MENUID = 'DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE')' and orgID in (SELECT orgID FROM EOSORG_T_EmpOrgRef where operatorID = "+ userID + ")";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				if(rs.getString("operatorID").equals(userID)){
					return 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return 0;
	}
	/**
	 * �Ƿ�����Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_IsOfficeUser
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�Ƿ�����Ա 1�� 0����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�"
	 */
	public static int BL_IsOfficeUser(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		String result = String.valueOf(IsOfficeUser(db,userID));

		XmlUtil.setNodeValue(node,result);
		
		return 1;
	}
	
	private static int IsOfficeUser(PersistenceBroker db,String userID) throws Exception{
		String [] user = getOfficeUser(db,userID).split(",");
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			
		    for(int i=0;i<user.length;i++){
				String sql = "select * from ShareFolder where FilePath like '/�����ļ���/�������Ϲ���%' and CreaterIDs = '"+ user[i] +"'";
				
		    	cn = db.getConnection();
				st = cn.createStatement();
				rs = st.executeQuery(sql);
				if(rs.next()){
					return 1;
				}
		   }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return 0;
	}
		
		
	/**
	 * ͨ���û�ȡ�ô��ҹ���Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_OfficeOperByUser
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="����Ա"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�"
	 */
	public static int BL_OfficeOperByUser(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		
		PersistenceBroker db = param.getDBBroker();
		String result = getOfficeOperByUser(db,userID);

		XmlUtil.setNodeValue(node,result);
		return 1;
	}
	
	private static String getOfficeOperByUser(PersistenceBroker db,String userID) throws Exception{
		String [] user = getOfficeUser(db,userID).split(",");
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		String result = "";
		try{
			
		    for(int i=0;i<user.length;i++){
				String sql = "select CreaterIDs from ShareFolder where FilePath like '%/�����ļ���/�������Ϲ���%' and CreaterIDs = '"+ user[i] +"'";
				
		    	cn = db.getConnection();
				st = cn.createStatement();
				rs = st.executeQuery(sql);
				while(rs.next()){
					result += "," + rs.getString("CreaterIDs");
				}
		   }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return result.substring(1);
	}
	
	private static String getSchOfficeOperByUser(PersistenceBroker db,String userID) throws Exception{
		String [] user = getOfficeUser(db,userID).split(",");
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		String result = "";
		try{
			
		    for(int i=0;i<user.length;i++){
				String sql = "select CreaterIDs from ShareFolder where FilePath like '%/�����ļ���/У�ڹ������Ϲ���%' and CreaterIDs = '"+ user[i] +"'";
				
		    	cn = db.getConnection();
				st = cn.createStatement();
				rs = st.executeQuery(sql);
				while(rs.next()){
					result += "," + rs.getString("CreaterIDs");
				}
		   }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return result.substring(1);
	}
	/**
	 * У�ڰ칫�ҹ���Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_SchOfficeOperator
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�Ƿ����Ա"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�"
	 */
	public static int BL_SchOfficeOperator(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		
		PersistenceBroker db = param.getDBBroker();
		String result = String.valueOf(IsSchOfficeOperator(db,userID));

		XmlUtil.setNodeValue(node,result);
		return 1;
	}
	
	private static int IsSchOfficeOperator(PersistenceBroker db,String userID) throws Exception{
		String sql = "SELECT er.operatorID FROM EOSOperatorRole er join EOSORG_T_EmpOrgRef eo on  er.operatorID = eo.operatorID "+
					" where roleID in (select ROLEID from TALENTROLEMENU where MENUID = 'DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL')  and eo.orgID in (SELECT orgID FROM EOSORG_T_EmpOrgRef where operatorID = "+ userID + ")";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				if(rs.getString("operatorID").equals(userID)){
					return 1;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return 0;
	}
	/**
	 * ����û���Ա
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_InsertEmpower
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="����ֵ"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="pid"
	 */
	public static int BL_InsertEmpower(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		String Pid = (String)param.getParaObjectAt(2);
		String  type= (String)param.getParaObjectAt(3);
		
		PersistenceBroker db = param.getDBBroker();
		int result = insertEmpower(db,userID,Pid,type);
		XmlUtil.setNodeValue(node,String.valueOf(result));
		return 1;
	}
	
	private static int insertEmpower(PersistenceBroker db,String userID,String Pid,String type) throws Exception{
		String [] operator = null;
		int result = 0;
		String user = "";
		Connection con = null;
		PreparedStatement pst = null;
		if(type.equals("1")){
			//if(!Pid.equals("1")){
				String selsql = "select EmpowerIDs from ShareFolder where FileID = " + Pid;
				Statement st = null;
				ResultSet rs = null;
				try{
					con = db.getConnection();
					st = con.createStatement();
					rs = st.executeQuery(selsql);
					
					if(rs.next()){
						user = rs.getString("EmpowerIDs");
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						if(rs!=null) rs.close();
						if(st!=null) st.close();
						if(con!=null) con.close();
					}catch(Exception ep){
						ep.printStackTrace();
						
					}
				}
				String sql = "update ShareFolder set EmpowerIDs = ? where FileType!='�ļ���' and ParentFileID = "+ Pid ;
				try{
					con = db.getConnection();
					pst = con.prepareStatement(sql);
					pst.setString(1,user);
					result = pst.executeUpdate();
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						if(pst!=null) pst.close();
						if(con!=null) con.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			//}
		}else{
			
		if(type.equals("2")){
			user = getOfficeUser(db,userID);
			operator = getOfficeOperator(db,userID).split(",");
		}else if(type.equals("3")){
			user = "all";
			operator = getSchOfficeOperator(db,userID).split(",");
		}

			try{
				for(int i=0;i<operator.length;i++){
					String sql = "update ShareFolder set EmpowerIDs = ? where ParentFileID = "+ Pid + " and CreaterIDs = '" + operator[i]  + "'";
				
					con = db.getConnection();
					pst = con.prepareStatement(sql);
					pst.setString(1,user);
					result = pst.executeUpdate();
				
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(pst!=null) pst.close();
					if(con!=null) con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
		
	/**
	 * �����ļ����ڻ����ļ����µ�����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_SetBaseFolderType
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�����ļ�������"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ�ID"
	 */
	public static int BL_SetBaseFolderType(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String FileID = (String)param.getParaObjectAt(1);
		
		PersistenceBroker db = param.getDBBroker();
		String result = getFolderBaseType(db,FileID);
		XmlUtil.setNodeValue(node,result);
		return 1;
	}
	
	private static String getFolderBaseType(PersistenceBroker db,String FileID) throws Exception{
		String sql = "select FilePath from ShareFolder where FileID = " + FileID;
		String path = "";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			if(rs.next()){
				path = rs.getString("FilePath");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		if(path==null) return "";
		path = path.substring(1);
		String [] paths = path.split("/");
		if(paths.length < 3) return ""; 
		return paths[2];
	}
	/**
	 * �����û�����ܼ�
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_GetMimiByUser
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�ܼ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�û�ID"
	 */
	public static int BL_GetMimiByUser(Document doc, BizContext param) throws Exception{
		Node node = (Node)param.getParaObjectAt(0);
		String userID = (String)param.getParaObjectAt(1);
		
		PersistenceBroker db = param.getDBBroker();
		String result = getMijiByUser(db,userID);
		XmlUtil.setNodeValue(node,result);
		return 1;
	}
	
	private static String getMijiByUser(PersistenceBroker db,String userID) throws Exception{
		String sql = "select resopcode from TALENTROLEMENU tr join EOSOperatorRole er on tr.roleID = er.roleID where MenuID = 'DX_OASYS_AFFAIR_SHAREFOLDER_INFILE' and operatorID = '"+ userID +"'";
		String resopcode = "";
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				resopcode += rs.getString("resopcode") + ",";
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		
		String where = "";
		String temp = "";
		if(resopcode!=null&&!resopcode.equals("")&&!resopcode.equals("#,")){
			if(resopcode.indexOf("DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_JUEMI")!=-1) temp += " Miji=3 or";
			if(resopcode.indexOf("DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_JIMI")!=-1) temp += " Miji=2 or";
			if(resopcode.indexOf("DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_MIMI")!=-1) temp += " Miji=1 or";
			if(resopcode.indexOf("DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_GONGKAI")!=-1) temp += " Miji=0 or";
		}
		if(temp.equals("")){
			where = " 1!=1";
		}else{
			where = temp.substring(0,temp.length()-2);
		}
		
		return where;
	}
		
}