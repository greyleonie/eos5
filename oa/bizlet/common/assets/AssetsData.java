package common.assets;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import talent.core.TalentDigest;
import talent.core.TalentFunctions;
import talent.core.Webpriary;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.trs.idm.api.remote.ServicesFactory;
import com.trs.idm.api.remote.SimpleResponse;
import com.trs.idm.api.remote.bo.UserEntry;
import com.trs.idm.api.remote.user.UserService;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-10
 * @class_displayName StudentData
 */

public class AssetsData {

	private final static int HSSF_int = 0;
	private final static int HSSF_String = 1;
	private final static int HSSF_Date = 2;
	private static HashMap depMap=new HashMap();

	/**
	 * ��excel���������ʲ���Ϣ
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_importStudent
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�׳������쳣"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ļ�·��"
	 */
	public static int BL_importAssets(Document doc, BizContext param) throws Exception{
		Node exc = (Node)param.getParaObjectAt(0);
		String absolutePath = (String)param.getParaObjectAt(1);
		
		String errStr=""; //��¼������Ϣ
		int row=3;//��λ����
		int flag=0;//�����ʶ��λ
		File file = null;
		InputStream in = null;
		ByteArrayOutputStream byteOut = null;
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		Statement st = null;
		ResultSet rs=null;
		AssetsData.initDepartmentMap();
		
		try{
			cn = db.getConnection();
			cn.setAutoCommit(false);
			st = cn.createStatement();
			int captID = Webpriary.getPriaryTemp(cn,"CAPT_CAPITALINFO","CAPTID");//��ȡ����
//			HashMap dicMap=getDictionaryMap("('dx_folk','dx_education','dx_dutylevel','BNDICT_gender')",cn);  //��ѯ�����ֵ��ȡMap;
			flag=1;
			
			file = new File(absolutePath);
			in = new FileInputStream(file);
			POIFSFileSystem fs = new POIFSFileSystem(in);
		 	HSSFWorkbook wb = new HSSFWorkbook(fs);
		    HSSFSheet sheet = wb.getSheetAt(0);
		    int tempcells = sheet.getRow(1).getPhysicalNumberOfCells();
		    System.out.println("-------tempcells" + tempcells);
		    int temprows = sheet.getPhysicalNumberOfRows();
		    System.out.println("-------temprows" + temprows);
		    
		    Object[] params = null;
		    
		    for(int i = 2; i < temprows; i++) {
		    	System.out.println("------------------>"+row);
		    	try{
			    	HSSFRow hssfRow = sheet.getRow(i);
			    	if(hssfRow!=null && !isNull(hssfRow)) {
				    	params = new Object[tempcells];
				    	for(int j = 0; j < tempcells; j++) { //��Excel�ж���ֵ
				    		HSSFCell hssfCell = hssfRow.getCell((short)j);
			    			params[j]=getHssfCellValue(hssfCell,HSSF_String);
				    		if(params[j]!=null){
				    			params[j] = params[j].toString().trim();
				    		}else{
				    			params[j]=" ";
				    		}
				    	}
				    	if(params[12].toString().equals("δʹ��")){
				    		params[5]="2";
				    	}else{
				    		params[5]="1";
				    	}
				    	
//				    	System.out.println(params[1].toString());
//				    	System.out.println(params[2].toString());
//				    	System.out.println(AssetsData.getTypeCode(params[4].toString()));
//				    	System.out.println(params[7].toString());
//				    	System.out.println(params[6].toString());
//				    	System.out.println(AssetsData.getDepartmentID(params[10].toString()));
//				    	System.out.println(params[15].toString());
//				    	System.out.println(params[16].toString());
//				    	System.out.println(params[14].toString());
//				    	System.out.println(params[5].toString());
//				    	System.out.println(params[12].toString());
				    	
				    	String sql="INSERT INTO CAPT_CAPITALINFO(CAPTID,CAPTCODE,CAPTNAME,TYPECODE,UNITCODE,HQDATE,QLDATE,PRICE,OWNER,REMARK,STATE,NUM) VALUES ("
				    				+captID+",'"+params[1].toString()+"','"+params[2].toString()+"','"+AssetsData.getTypeCode(params[4].toString())+"',13,'"+params[7].toString()+"','6','"+params[6].toString()+"','"+AssetsData.getDepartmentID(params[10].toString())+"','��ע1:"+params[15].toString()+";��ע2:"+params[16].toString()+";��ע3:"+params[14].toString()+"','"+params[5].toString()+"',"+params[12].toString()+")";
				    	
				    	st.executeUpdate(sql);
				    	captID=captID+1;
				    	
			    	}
			    	
		    	}
		    	catch (Exception e){
		    		e.printStackTrace();
		    		errStr=errStr+"��"+row+"����������";
		    		break;
		    	}
		    	row=row+1;
		    }
		    cn.commit();
		}
		
		catch(Exception e){
			e.printStackTrace();
			if(flag==0)
				errStr=errStr+"��������ʧ�ܻ����ݿ�������������ϵ����Ա��";
			else
				errStr=errStr+"�����ļ�����";
		}
		finally{
		    cn.setAutoCommit(true);
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				if(byteOut!=null) byteOut.close();
				if(in!=null) in.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		if(!errStr.equals("")){
			XmlUtil.setNodeValue(exc,errStr);
			return 0;
		}
		return 1;
	}
	
	private static void initDepartmentMap(){
		depMap.put("002-����ѧ","17");
		depMap.put("003-����","3");
		depMap.put("005-����ѧ","9");
		depMap.put("004-����ѧ","21");
		depMap.put("026-�����ֿ�","15");
		depMap.put("025-�ͷ���","15");
		depMap.put("024-У�칫��","2");
		depMap.put("023-Уί","1");
		depMap.put("022-���д�","10");
		depMap.put("021-�ϸɴ�","11");
		depMap.put("020-Э����","6");
		depMap.put("019-ѧԱ��","18");
		depMap.put("018-����","16");
		depMap.put("017-������","15");
		depMap.put("016-����","8");
		depMap.put("015-���ص�ί","7");
		depMap.put("014-��֯��","22");
		depMap.put("013-��������","14");
		depMap.put("011-ͼ���","13");
		depMap.put("010-������","12");
		depMap.put("009-��ѧ","21");
		depMap.put("008-����ѧ","17");
		depMap.put("007-����","20");
		depMap.put("006-��ѧ","20");
	}
	
	public static String getDepartmentID(String department){
		String departmentID="";
		departmentID=depMap.get(department).toString();
		return departmentID;
	}
	
	public static String getTypeCode(String type){
		String typeCode="0017";
		if(type.indexOf("�����豸")>0){
			typeCode="0024";
		}
		if(type.indexOf("ͼ��")>0){
			typeCode="0002";
		}
		if(type.indexOf("��ͨ����")>0){
			typeCode="0003";
		}
		if(type.indexOf("һ���豸")>0){
			typeCode="0004";
		}
		if(type.indexOf("�Ҿ�")>0){
			typeCode="0005";
		}
		if(type.indexOf("�����豸")>0){
			typeCode="0006";
		}
		if(type.indexOf("ҽ���豸")>0){
			typeCode="0007";
		}
		if(type.indexOf("�����豸")>0){
			typeCode="0008";
		}
		if(type.indexOf("�����")>0){
			typeCode="0009";
		}
		if(type.indexOf("����")>0){
			typeCode="0010";
		}
		if(type.indexOf("�����豸")>0){
			typeCode="0011";
		}
		if(type.indexOf("ӡˢ�豸")>0){
			typeCode="0012";
		}
		if(type.indexOf("ͨѶ�豸")>0){
			typeCode="0013";
		}
		if(type.indexOf("ͶӰ��")>0){
			typeCode="0014";
		}
		if(type.indexOf("�յ��豸")>0){
			typeCode="0015";
		}
		if(type.indexOf("ר���豸")>0){
			typeCode="0016";
		}
		if(type.indexOf("����")>0){
			typeCode="0017";
		}
		if(type.indexOf("����ͼ��")>0){
			typeCode="0018";
		}
		if(type.indexOf("����ѧ")>0){
			typeCode="0019";
		}
		if(type.indexOf("��Ȼ��ѧ")>0){
			typeCode="0020";
		}
		if(type.indexOf("�ۺ���ͼ��")>0){
			typeCode="0021";
		}
		if(type.indexOf("����ͼ��")>0){
			typeCode="0022";
		}
		if(type.indexOf("����ͼ��")>0){
			typeCode="0023";
		}
		if(type.indexOf("���ݽ����Ｐ�����豸")>0){
			typeCode="0025";
		}
		return typeCode;
	}
	
	public static boolean isNull(HSSFRow hssfRow) {
	    boolean hasNull = true;
	    if(hssfRow == null) return true;
	    for(int i = 0; i < hssfRow.getPhysicalNumberOfCells(); i++) {
	      HSSFCell hssfCell = hssfRow.getCell((short)i);
	      Object object = null;
	      if(hssfCell!=null) {
	        int tempType = hssfCell.getCellType();
	        if (tempType == HSSFCell.CELL_TYPE_STRING) {
	          object = hssfCell.getStringCellValue();
	        }
	        else if (tempType == HSSFCell.CELL_TYPE_NUMERIC) {

	          if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
	            
	            object = hssfCell.getDateCellValue();
	          }
	          else {
	            object = new Integer( (int) hssfCell.getNumericCellValue());
	          }

	        }
	        else {
	          object = hssfCell.getStringCellValue();
	        }

	      }
	      if(object!=null && !object.equals("")) return false;
	    }
	    return hasNull;
	  
	  }
	public static Object getHssfCellValue(HSSFCell hssfCell , int tempType){
		Object obj=null;
		if(hssfCell!=null) {
			try{
				if(tempType == HSSF_String) {
					obj = hssfCell.getStringCellValue();
				}else if(tempType == HSSF_Date) {
					try{
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						obj = sdf.format(hssfCell.getDateCellValue());
					}
					catch(Exception e){
						String aa = hssfCell.getStringCellValue();
						if(aa!=null && aa.indexOf("-")>0 && aa.length()>=6&&aa.length()<=7)
							obj =aa+"-01";
					}
				}else if(tempType == HSSF_int) {
						obj = new Integer((int)hssfCell.getNumericCellValue());
					
				}else{
					obj = hssfCell.getStringCellValue();
				}
			}
			catch (Exception e){
				tempType = hssfCell.getCellType();
				if(tempType == HSSFCell.CELL_TYPE_STRING) {
					obj = hssfCell.getStringCellValue();
				}else if(tempType == HSSFCell.CELL_TYPE_NUMERIC) {
					
					if(HSSFDateUtil.isCellDateFormatted(hssfCell)) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						obj = sdf.format(hssfCell.getDateCellValue());
					}else{
						obj = new Long((long)hssfCell.getNumericCellValue());
						
						
					}
					
				}else{
					obj = hssfCell.getStringCellValue();
				}
			}
		}
		return obj;
	}
	
}

