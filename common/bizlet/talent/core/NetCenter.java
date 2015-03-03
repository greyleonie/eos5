package talent.core;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-5-14
 * @class_displayName NetCenter
 */

public class NetCenter {
	private Log fccLog = null;//��־����
	private HSSFWorkbook wb = null;//������
	private int maxColNum = 0 ; //������������
	private int colLength[];
	public NetCenter() {
		fccLog = LogFactory.getLog(this.getClass());
		wb = new HSSFWorkbook();
	
	}
	
	
	
	
	
	/**
	 * ��excel��������Զ�̽�ѧ��Ϣ
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
	public static int BL_ImportDistanceTeaching(Document doc, BizContext param)
		throws Exception {

		Node exc = (Node)param.getParaObjectAt(0);
		String absolutePath = (String)param.getParaObjectAt(1);

		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		String errStr=""; //��¼������Ϣ
		int row=2;//��λ����
		int flag=0;//�����ʶ��λ
		File file = null;
		InputStream in = null;
		ByteArrayOutputStream byteOut = null;
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		Statement st = null;
		ResultSet rs=null;
		QueryRunner runner = new QueryRunner();
		try{
			cn = db.getConnection();
			cn.setAutoCommit(false);
			st = cn.createStatement();
			
			int recordID = Webpriary.getPriaryTemp(cn,"DistanceTeaching","RecordID");//��ȡ����
			
			flag=1;
			
			file = new File(absolutePath);
			in = new FileInputStream(file);
			POIFSFileSystem fs = new POIFSFileSystem(in);
		 	HSSFWorkbook wb = new HSSFWorkbook(fs);
		    HSSFSheet sheet = wb.getSheetAt(0);
		    int tempcells = sheet.getRow(0).getPhysicalNumberOfCells();
		    System.out.println("-------tempcells" + tempcells);
		    int temprows = sheet.getPhysicalNumberOfRows();
		    System.out.println("-------temprows" + temprows);
		    
		    Object[] params = null;
		    
		    for(int i = 1; i < temprows; i++) {
		    	System.out.println("------------------>"+row);
		    	try{
//			    	HSSFRow hssfRow = sheet.getRow(i);
//			    	if(hssfRow!=null && !isNull(hssfRow)) {
//				    	params = new Object[tempcells];
//				    	for(int j = 0; j < tempcells; j++) { //��Excel�ж���ֵ
//				    		HSSFCell hssfCell = hssfRow.getCell((short)j);
//				    		params[j]=getHssfCellValue(hssfCell);
//				    		if(params[j]!=null){
//				    			params[j] = params[j].toString().trim();
//				    		}
//				    	System.out.println(params[j]);	
//				    	}
				    	
//				    	//�����û���
//				    	String userName=TalentFunctions.getAvailStr(params[0]);
//				    	if(!checkUserName(userName,ClassID,cn)){
//				    		errStr="��"+row+"������Ϊ�ջ�ð༶�Ѵ��ڸ�ѧ����";
//				    		break;
//				    	}
				    	
		    		HSSFRow hssfRow1 = sheet.getRow(i);
		    		HSSFRow hssfRow2 = sheet.getRow(i+1);
		    		HSSFRow hssfRow3 = sheet.getRow(i+2);
			    	if(hssfRow1!=null && !isNull(hssfRow1)&&hssfRow2!=null && !isNull(hssfRow2)&&hssfRow3!=null && !isNull(hssfRow3)) {			    		
			    		Date classDate=df.parse(getHssfCellValue(hssfRow1.getCell((short)0)).toString().substring(0,11));
			    		String courseType=getHssfCellValue(hssfRow1.getCell((short)2)).toString();
			    		String courseTitle=getHssfCellValue(hssfRow2.getCell((short)2)).toString().substring(3);
			    		String channel="2";
			    		String tmp=getHssfCellValue(hssfRow3.getCell((short)2)).toString();
			    		String teacher="";
			    		String teacherOrg="";
			    		String teacherPost="";
			    		if(tmp!=null&&!tmp.equals("")){
			    			tmp=tmp.substring(3);
			    			teacherOrg=tmp.substring(1,tmp.indexOf(' '));
			    			tmp=tmp.substring(tmp.indexOf(' ')+1);
			    			teacherPost=tmp.substring(0,tmp.indexOf(' '));
			    			teacher=tmp.substring(tmp.indexOf(' ')+1);
			    		}

				    	String insertStudent = "insert into DistanceTeaching (RecordID,RecordDate,Channel,CourseType,CourseTitle,Teacher,TeacherOrg,TeacherPost)" +
		    			 " values(?,?,?,?,?,?,?,?)";
				    	PreparedStatement st2=cn.prepareStatement(insertStudent);
				    	st2.setInt(1,recordID);
				    	st2.setDate(2,new java.sql.Date(classDate.getTime()));
				    	st2.setString(3,channel);
				    	st2.setString(4,courseType);
				    	st2.setString(5,courseTitle);
				    	st2.setString(6,teacher);
				    	st2.setString(7,teacherOrg);
				    	st2.setString(8,teacherPost);				    	

				    	st2.executeUpdate();
				    	st2.close();
				    	
			    		//�����
			    		recordID++;
			    		i+=2;
				    	
				    	

				    	
//				    	java.util.List list = new ArrayList();
//				    	list.add(new Integer(recordID));
//				    
//				    	
//				    	for(int t = 0; t < params.length; t++) {
//				    		if(t == 0) continue;
//				    		Object temp=null;
//				    		if(params[t]!=null&&(!params[t].toString().equals(""))) 
//				    			temp= params[t];
//				    		list.add(temp);
//				    		System.out.println("temp"+t+"---->"+temp);
//				    	}
//				    	System.out.println("list.size()===>"+list.size());
//				    	
//				    	Object[] obj = new Object[list.size()];
//				    	obj = (Object[])list.toArray(obj);
//				    	
//
//				    	String insertStudent = "insert into DistanceTeaching (RecordID,RecordDate,RecordTime,RecordNoon,Channel,CourseType,CourseTitle,Teacher,TeacherOrg,TeacherPost)" +
//		    			 " values(?,?,?,?,?,?,?,?,?,?)";
//
//				    	PreparedStatement st2=cn.prepareStatement(insertStudent);
//				    	for(int k=0;k<obj.length;k++){
//				    		if(obj[k]==null){
//				    			st2.setString(k+1,null);
//				    		}
//				    		else{
//				    			String objstr = obj[k].toString().trim();
//				    			if(k==3){
//				    				if(objstr.equals("����")) objstr = "1";
//				    				else if(objstr.equals("����")) objstr = "2";
//				    				else if(objstr.equals("����")) objstr = "3";
//				    				else objstr = "0";
//				    			}
//				    			if(k==4){
//				    				if(objstr.equals("���뵳УһƵ��")) objstr = "1";
//				    				else if(objstr.equals("���뵳У��Ƶ��")) objstr = "2";
//				    				else if(objstr.equals("���뵳У��Ƶ��")) objstr = "3";
//				    				else if(objstr.equals("ʡ��Уֱ��Ƶ��")) objstr = "11";
//				    				else if(objstr.equals("ʡ��У����Ƶ��")) objstr = "12";
//				    				else if(objstr.equals("ʡ��У����Ƶ��")) objstr = "13";
//				    				else if(objstr.equals("ʡ��У�γ�Ƶ��")) objstr = "14";
//				    				else if(objstr.equals("ʡ��У����Ƶ��")) objstr = "15";
//				    				else if(objstr.equals("����Ƶ��")) objstr = "21";
//				    				else if(objstr.equals("�ֳ�ֱ��")) objstr = "22";
//				    				else if(objstr.equals("�Լ�¼��")) objstr = "31";
//				    				else if(objstr.equals("����")) objstr = "32";
//				    				else objstr = "32";
//				    			}
//				    			st2.setString(k+1,objstr);
//				    		}
//				    	}
//				    	st2.executeUpdate();
//				    	st2.close();
//				    	
//				    	recordID=recordID+1;
				    	
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
	
	
	
	
	
	
	//�����Ƿ��ظ�����
	public static boolean checkUserName(String userName,String ClassID,Connection con){
		boolean bl=true;
		if(userName==null&&userName.equals("")){
			bl=false;
		}
		else{
			String sql="select * from EOSOperator e ,Student s where e.operatorID=s.StudentID and e.operatorName='"+userName+"' and s.ClassID="+ClassID+" and e.status=1";
			Statement st = null;
			ResultSet rs=null;
			try{
				st = con.createStatement();
				rs=st.executeQuery(sql);
				if(rs.next()){
					bl=false;
				}
			}
			catch(Exception ex){
			}
			finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();					
				}catch(Exception e) {
				}
			}
		}
		
		return bl;
	}
	
	
	
	public static Object getHssfCellValue(HSSFCell hssfCell){
		Object obj=null;
		if(hssfCell!=null) {
			int tempType = hssfCell.getCellType();
			if(tempType == HSSFCell.CELL_TYPE_STRING) {
				obj = hssfCell.getStringCellValue();
			}else if(tempType == HSSFCell.CELL_TYPE_NUMERIC) {
				if(HSSFDateUtil.isCellDateFormatted(hssfCell)) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					obj = sdf.format(hssfCell.getDateCellValue());
				}else{
					obj = new Integer((int)hssfCell.getNumericCellValue());
				}
				
			
				
			}else{
				obj = hssfCell.getStringCellValue();
			}
			
		}
		return obj;
	}
	
	

	
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>¼��Ǽ��� �ϰ�ϲ�
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName  BL_MeldClass
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="������Ǽ�¼��List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����ѵǼ�¼��List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����List"
	 */
	public static int BL_MeldClass(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node)param.getParaObjectAt(0);
		//����δ�Ǽǵ�¼���List
		ArrayList list0 = new ArrayList();
		NodeList eList0 = param0.getChildNodes();
		for(int i=0;i<eList0.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList0.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			list0.add(i,inMap);
		}
	
		Node param1 = (Node)param.getParaObjectAt(1);
		//�����ѵǼǵ�¼���List
		ArrayList list1 = new ArrayList();
		NodeList eList1 = param1.getChildNodes();
		for(int i=0;i<eList1.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList1.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			list1.add(i,inMap);
		}
		
		
	//����ȥ���ϰ��List
		
	ArrayList newList = MeldClass(list0,list1);
    Node param2 = (Node)param.getParaObjectAt(2);
	NamedNodeMap map= (NamedNodeMap)param2.getAttributes();
	Node typeNode = map.getNamedItem("type");
	String type = typeNode.getNodeValue();
	Iterator it1 = newList.iterator();
	while(it1.hasNext()){
		Map map1 = (Map)it1.next();
		Set set =map1.keySet();
		Iterator it2 =set.iterator();
		Element entityElement = doc.createElement(type);
		while(it2.hasNext()){
			String name = (String)it2.next();
			Element fieldElement = doc.createElement(name);
			String fieldValue = (String)map1.get(name);
			XmlUtil.setNodeValue(fieldElement,fieldValue);
			entityElement.appendChild(fieldElement);
		}
		param2.appendChild(entityElement);
	}
	
		
		return 1;
	}
	
	
	/*
	 * ��¼��εǼ���ȥ���ϰ�
	 */
	
	public static ArrayList MeldClass(ArrayList list0,ArrayList list1){
		ArrayList newList = new ArrayList();
		Iterator it2 = list1.iterator();
		HashMap videoMap = new HashMap();  //����¼��ε�Map
		while(it2.hasNext()){
			HashMap map = (HashMap)it2.next();
			
			String PlanID = (String)map.get("PlanID");
			String PlanType = (String)map.get("PlanType");
			String key = PlanType +":"+PlanID;
			videoMap.put(key,map);	
			
		}
		
		

		Iterator it1 = list0.iterator();
		HashMap retMap = new HashMap();  //����ȥ���ظ������� ����retMap
		while(it1.hasNext()){
			HashMap map = (HashMap)it1.next();
			String RecordDate = (String)map.get("RecordTime");
			String RecordTime = (String)map.get("ClassTime");
			String ClassRoom =  (String)map.get("ClassRoom");
			String PlanType = (String)map.get("PlanType");
			String PlanID = (String)map.get("PlanID");
			String key = PlanType+RecordDate+RecordTime+ ClassRoom;
			
			String key2 = PlanType+":"+PlanID;

			HashMap oldMap= (HashMap)retMap.get(key);
			HashMap regMap = (HashMap)videoMap.get(key2);
			if(oldMap == null&&regMap==null){
				retMap.put(key,map);
			}
		}
		
		Iterator it3 = list0.iterator();
		while(it3.hasNext()){
			HashMap map = (HashMap)it3.next();
			String PlanType = (String)map.get("PlanType");
			String RecordDate = (String)map.get("RecordTime");
			String RecordTime = (String)map.get("ClassTime");
			String ClassRoom = (String)map.get("ClassRoom");

			String key = PlanType+RecordDate+RecordTime+ ClassRoom;
		    HashMap tempMap = (HashMap)retMap.get(key);

		    if(map==tempMap){
		    	newList.add(tempMap);
		    }
		    }
		return newList;
	}
	
	

	
	
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>�ϰ�ϲ�
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName  BL_StatisDistanceTotal
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="������Entity"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����ͳ�Ƶ�List"
	 */
	public static int BL_StatisDistanceTotal(Document doc, BizContext param)
		throws Exception {
		Node param1 = (Node)param.getParaObjectAt(1);
		//�õ�����List
		ArrayList distanceList = new ArrayList();
		NodeList eList1 = param1.getChildNodes();
		for(int i=0;i<eList1.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList1.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			distanceList.add(i,inMap);
		}
	
		
		
		
	//��������List
		
	ArrayList newDistanceList = statisDistanceTotal(distanceList);
    Node param0 = (Node)param.getParaObjectAt(0);
    String args[] = new String[4];
    args[0]="ZhongPlay";
    args[1]="ZhongRecord";
    args[2]="ShengPlay";
    args[3]="ShengRecord";
	for(int i =0 ;i<args.length;i++){
		Element fieldElement = doc.createElement(args[i]);
		String fieldValue = (String)newDistanceList.get(i);
		XmlUtil.setNodeValue(fieldElement,fieldValue);
		param0.appendChild(fieldElement);
	}
	return 1;
	}
	
	/*
	 * ͳ��Զ�̽���¼�����
	 */
	
	public static ArrayList statisDistanceTotal(ArrayList distanceList){
		ArrayList newDistanceList = new ArrayList();
		Iterator it2 = distanceList.iterator();
		int zhongPlay = 0 ;
		int zhongRecord = 0 ;
		int shengPlay = 0;
		int shengRecord = 0;
		HashMap retMap = new HashMap();  //����ȥ���ظ��������Map
		while(it2.hasNext()){
			HashMap map = (HashMap)it2.next();
			String channel = (String)map.get("Channel");
			int channeli = 0;
			if(channel == null || "".equals(channel)){
				continue;
			}else{
				channeli = Integer.parseInt(channel);
			}
			String isPlay = (String)map.get("IsPlay");
			int isPlayi = 0; 
			if(isPlay != null && !"".equals(isPlay)){
				isPlayi = Integer.parseInt(isPlay);
			}
			String isLive = (String)map.get("IsLive");
			int isLivei = 0; 
			if(isLive != null && !"".equals(isLive)){
				isLivei = Integer.parseInt(isLive);
			}
			String isRecord = (String)map.get("IsRecord");
			int isRecordi = 0; 
			if(isRecord != null && !"".equals(isRecord)){
				isRecordi = Integer.parseInt(isRecord);
			}

			
			
			if(channeli==1 || channeli ==2 ||channeli ==3){
				if(isPlayi ==1 || isLivei ==1){
					zhongPlay++;
				}
				if(isRecordi == 1){
					zhongRecord++;
				}
			}else if (channeli==11 || channeli ==12 ||channeli ==13||channeli == 14 ||channeli ==15){
				if(isPlayi ==1 || isLivei ==1){
					shengPlay++;
				}
				if(isRecordi == 1){
					shengRecord++;
				}
			
			}
		}
		newDistanceList.add(zhongPlay+"");
		newDistanceList.add(zhongRecord+"");
		newDistanceList.add(shengPlay+"");
		newDistanceList.add(shengRecord+"");
		return newDistanceList;
	}
	
	
	
	
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>�ϰ�ϲ�
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName  BL_StatisTask
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="��������List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����µ�����List"
	 */
	public static int BL_StatisTask(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node)param.getParaObjectAt(0);
		//�õ�����List
		ArrayList taskList = new ArrayList();
		NodeList eList0 = param0.getChildNodes();
		for(int i=0;i<eList0.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList0.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			taskList.add(i,inMap);
		}
	
		
		
		
	//��������List
		
	ArrayList newTaskList = addClass(taskList);
    Node param1 = (Node)param.getParaObjectAt(1);
	NamedNodeMap map= (NamedNodeMap)param1.getAttributes();
	Node typeNode = map.getNamedItem("type");
	String type = typeNode.getNodeValue();
	Iterator it3 = newTaskList.iterator();
	while(it3.hasNext()){
		Map map3 = (Map)it3.next();
		Set set =map3.keySet();
		Iterator it4 =set.iterator();
		Element entityElement = doc.createElement(type);
		while(it4.hasNext()){
			String name = (String)it4.next();
			Element fieldElement = doc.createElement(name);
			String fieldValue = (String)map3.get(name);
			XmlUtil.setNodeValue(fieldElement,fieldValue);
			entityElement.appendChild(fieldElement);
		}
		param1.appendChild(entityElement);
	}
	
		
		return 1;
	}
	
	
	/*
	 * �ϰ�ϲ�
	 */
	
	public static ArrayList addClass(ArrayList taskList){
		ArrayList newTaskList = new ArrayList();
		Iterator it2 = taskList.iterator();
		HashMap retMap = new HashMap();  //����ȥ���ظ��������Map
		while(it2.hasNext()){
			HashMap map = (HashMap)it2.next();
			String TaskDate = (String)map.get("TaskDate");
			String TaskTime = (String)map.get("TaskTime");
			String ClassRoom = (String)map.get("ClassRoom");
			String Task = (String)map.get("Task");
			if(Task.endsWith("��˷�")){
				Task = "��˷�";
			}
			String ClassName = (String)map.get("Class");
			String key = TaskDate+TaskTime+ ClassRoom+Task;
		//	System.out.println("key=="+key);
			HashMap oldNewMap= (HashMap)retMap.get(key);
			if(oldNewMap == null){
				oldNewMap = new HashMap();
				oldNewMap.put("Old",map);
				oldNewMap.put("New",map);
				retMap.put(key,oldNewMap);
				
			}else{
				HashMap newMap = (HashMap)oldNewMap.get("New");
				String newClassName = (String) newMap.get("Class");
				newClassName+="<br/>"+ClassName;
				newMap.put("Class",newClassName);
		//		System.out.println(newClassName);
				oldNewMap.put("New",newMap);
				retMap.put(key,oldNewMap);
			}

			
		}
		Iterator it1 = taskList.iterator();
		while(it1.hasNext()){
			HashMap map = (HashMap)it1.next();
			String TaskDate = (String)map.get("TaskDate");
			String TaskTime = (String)map.get("TaskTime");
			String ClassRoom = (String)map.get("ClassRoom");
			String Task = (String)map.get("Task");
			if(Task.endsWith("��˷�")){
				Task = "��˷�";
			}
			String key = TaskDate+TaskTime+ ClassRoom+Task;
		    HashMap tempMap = (HashMap)retMap.get(key);
		    HashMap oldMap = (HashMap)tempMap.get("Old");
		    HashMap newMap = (HashMap)tempMap.get("New");
		    if(map==oldMap){
		    	newTaskList.add(newMap);
		    }
		    }
		System.out.println(newTaskList.size());
		return newTaskList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//����������
	
	
	
	/**
	 * Description:���excel
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	public void export(PageContext pageContext) throws Exception {
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		HttpServletResponse res = (HttpServletResponse) pageContext.getResponse();
		String title = req.getParameter("title");//�õ�����ı���
		fccLog.info("*************title:" + title);

		
		Document xmlDom = getDomDate(req);//�õ�DOM
		
		//System.out.println();
		
		OutputStream pageOut = res.getOutputStream();//�õ�ҳ�������
		
		HSSFSheet sheet = wb.createSheet();//������

		wb.setSheetName(0,title,HSSFWorkbook.ENCODING_UTF_16);//�����ֱ���
		sheet.setDisplayGridlines(false);//����������

		//-------------------
		
		Node node=changTableNode(xmlDom,xmlDom.getElementsByTagName("table").item(0));
		
		
	 //  printNode(node);
		
		//------------------
		
		NodeList alltr = node.getChildNodes();
		fccLog.info("*************getLength:" + alltr.getLength());
		
		//maxColNum = getMaxcolNum(alltr);//������������
		//��������
		HSSFRow rowTitle = sheet.createRow((short)0);
		HSSFCell cellTitle = rowTitle.createCell((short) 0);
		cellTitle.setEncoding(HSSFCell.ENCODING_UTF_16);
		sheet.addMergedRegion(new Region(0,(short)0,1,(short)(maxColNum-1)));
		HSSFFont titleFont = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLUE.index);
		HSSFCellStyle titleStyle = createStyle(wb,titleFont,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		cellTitle.setCellStyle(titleStyle);
		cellTitle.setCellValue(title);
		
		//createHeader(wb,sheet,alltr.item(0));//������ͷ
		
		//createBody(wb,sheet,alltr);
		createBodyNew(wb,sheet,alltr);

		for(int kIndex=0;kIndex<maxColNum;kIndex++)
		{
			
			//System.out.println(kIndex+" : "+colLength[kIndex]);
			if(colLength[kIndex]<=30)
				sheet.setColumnWidth((short)kIndex,(short)((colLength[kIndex]+4)*292));//�趨ÿ�еĿ��
			else
				sheet.setColumnWidth((short)kIndex,(short)((34)*292));//�趨ÿ�еĿ��
		}
		String fileNameTM = new String(title.getBytes("GBK"),"8859_1");
		res.setHeader("Content-disposition","attachment; filename="+fileNameTM);
		res.setContentType("application/vnd.ms-excel;charset=gbk");
		
		wb.write(pageOut);
		pageOut.flush();
		
	
	}
	
	
	
	/**
	 * Description:�õ�DOM
	 * @param req
	 * @return
	 */
	public Document getDomDate(HttpServletRequest req) {
		Document document = null;
		try{
			String domresult = "";
			String xmlHeader = "<?xml version=\"1.0\" encoding=\"GBK\"?>";
			String xmlBody = req.getParameter("xmlfcc");
			fccLog.info("*************xmlfcc:" + xmlBody);
			domresult = xmlHeader + xmlBody;
			StringReader stringReader = new StringReader(domresult);
			InputSource inputSource = new InputSource(stringReader);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			document = db.parse(inputSource);
			fccLog.info("*************�������еõ�DOM���ɹ�*************");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return document;
	
	}
	
	
	/**
	 * Description:��������
	 * @param wb ������
	 * @param fontName ���������
	 * @param height ����߶�
	 * @param boldWeight ���Ӵ���ΪHSSFFont.BOLDWEIGHT_NORMAL���Ӵ���ΪHSSFFont.BOLDWEIGHT_BOLD
	 * @param color ������ɫ�� ����HSSFColor����ĳ�Աֵ,�����ɫ�� HSSFColor.BLACK.index,��ɫ��HSSFColor.WHITE.index
	 * @return
	 */
	HSSFFont createFont(HSSFWorkbook wb,String fontName,int height,int boldWeight,int color) {
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints( (short)height);
		font.setBoldweight((short)boldWeight);
		font.setColor((short)color);
		font.setFontName(fontName);
		return font;
	}
	
	
	/**
	 * Description:������ʽ
	 * @param wb ������
	 * @param font ����
	 * @param top �����ϲ�������С������HSSFCellStyle����ĳ�Աֵ,����HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_MEDIUM,HSSFCellStyle.BORDER_THICK
	 * @param left �������������С
	 * @param bottom �����²�������С
	 * @param right �����ұ�������С
	 * @param halign ˮƽ���뷽ʽ HSSFCellStyle.ALIGN_CENTER ���У�HSSFCellStyle.ALIGN_LEFT �����,HSSFCellStyle.ALIGN_RIGHT �Ҷ���
	 * @param valign ��ֱ���뷽ʽ HSSFCellStyle.VERTICAL_CENTER ��ֱ���У�HSSFCellStyle.VERTICAL_TOP ��������,HSSFCellStyle.VERTICAL_BOTTOM �ײ�����
	 * @param fore ǰ��ɫ  ����HSSFColor����ĳ�Աֵ���� HSSFColor.YELLOW.index,HSSFColor.BLUE.index
	 * @param back ����ɫ  ����HSSFColor����ĳ�Աֵ,�� HSSFColor.GREEN.index
	 * @param pattern ������䱳����ɫ��ʽ������ HSSFCellStyle.SOLID_FOREGROUND
	 * @return
	 */
	 HSSFCellStyle createStyle(HSSFWorkbook wb,HSSFFont font,int top,int left,int bottom,int right,int halign,int valign,int fore,int back,int pattern) {
	 	
	 	HSSFCellStyle style = wb.createCellStyle();
	 	
	 	style.setFont(font);
	 	style.setBorderTop((short)top);
	 	style.setBorderLeft((short)left);
	 	style.setBorderBottom((short)bottom);
	 	style.setBorderRight((short)right);
	 	style.setAlignment((short)halign);
	 	style.setVerticalAlignment((short)valign);
	 	style.setFillBackgroundColor( (short) back);
	 	style.setFillForegroundColor( (short) fore);
	 	style.setFillPattern((short)pattern);
	 	
	 	
	 	return style;
	 
	 }
	 
	 
	 /**
	  * Description:���õ��޸�Ŀ�
	  * @param sheet
	  * @param columnIndex
	  * @param width
	  */
	 public void setColumnWidth(HSSFSheet sheet,int columnIndex,int width){
	    
	 	sheet.setColumnWidth((short)columnIndex,(short) width);
	 }
	 
	 
	 /**
	  * Description:�õ�������������
	  * @param trs
	  * @return
	  */
	 public int getMaxcolNumOld(NodeList trs) {
	 	int val = 0;
	 	for(int i = 0; i < trs.getLength(); i++) {
	 		int length = trs.item(i).getChildNodes().getLength();//td����
	 		if(length >= val) val = length;
	 	
	 	}
	 	return val;
	 
	 }
	 
	 
	 public int getMaxcolNum(NodeList trs) {
	 	int val = 0;
	 	for(int i = 0; i < trs.getLength(); i++) {
	 		Node tr = trs.item(i);
	 		NodeList tds = tr.getChildNodes();
	 		int tdNum = 0;
	 		for(int t = 0; t < tds.getLength(); t++) {
	 			Node td = tds.item(t);
	 			if(isExistAttribute(td,"colspan")) {
		 			int colspan = Integer.parseInt(getAttributeValue(td,"colspan"));
		 			tdNum += colspan;
		 		}else{
		 			tdNum++;
		 		}
	 			
	 			
	 		}
	 		if(tdNum >= val) val = tdNum;
	 		
	 	}
	 	
	 	return val;
	 
	 }
	 
	 
	 /**
	  * Description:�ڵ��Ƿ���ĳ������
	  * @param node
	  * @param attributeName
	  * @return
	  */
	 public boolean isExistAttribute(Node node,String attributeName) {
	    boolean result = false;
	    if(node==null) return false;
	    try{

	      NamedNodeMap temps = node.getAttributes();
	      for(int i = 0; i < temps.getLength(); i++) {
	        String name = temps.item(i).getNodeName();
	        //fccLog.info("###��nodeName���ڵ������У�" + name);
	        if(attributeName!=null && name.equalsIgnoreCase(attributeName)) {
	          return true;
	      }

	    }


	    }catch(Exception e) {
	      e.printStackTrace();
	    }
	    return result;
	  }
	 
	 
	 
	 public String getAttributeValue(Node node ,String attributeName) {
	    String result = "";

	    try{
	      NamedNodeMap temps = node.getAttributes();
	    for(int i = 0; i < temps.getLength(); i++) {
	      String name = temps.item(i).getNodeName();
	      if(attributeName!=null && name.equalsIgnoreCase(attributeName)) {
	        Node aNode = temps.item(i);
	        String value = aNode.getFirstChild().getNodeValue();
	     //    fccLog.info("#####id��ֵΪ��" + value);
	        return value;
	      }


	    }

	    }catch(Exception e) {
	      e.printStackTrace();
	    }
	    return result;
	  }
	 
	 
	 
	 public void createHeader(HSSFWorkbook wb,HSSFSheet sheet,Node node) {
	 	
	 	HSSFRow row = sheet.createRow((short)2);
	 	NodeList list = node.getChildNodes();
	 	for(int i = 0; i < list.getLength(); i++) {
	 		Node tdNode = list.item(i);
	 		String tdValue = tdNode.getFirstChild().getNodeValue();
	 		int tdValueLength = 0;
	 		if(tdValue == null) tdValue = "";
	 		tdValueLength = tdValue.length();
	 		
	 		int colspan = 1;
	 		if(isExistAttribute(tdNode,"colspan")) {
	 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		}
	 		
	 		HSSFCell cell = row.createCell((short) i);
	 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		if(colspan > 1) {
	 			int merged = i + colspan -1;
	 			sheet.addMergedRegion(new Region(1,(short)i,1,(short)merged));
	 			i +=  colspan - 1;
	 		}
	 		
	 		HSSFFont font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLACK.index);
	 		HSSFCellStyle style = null;
	 		if(i == 0) {
	 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
	 		}else if(i == (list.getLength() -1)) {
	 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
	 		}else{
	 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
	 		}
	 		
	 		setColumnWidth(sheet,i,tdValueLength);
	 		cell.setCellStyle(style);
	 		cell.setCellValue(tdValue);
	 		
	 		
	 		
	 		
	 	
	 	}
	 
	 
	 
	 }
	 
	 
	 public void createBody(HSSFWorkbook wb,HSSFSheet sheet,NodeList alltr) {
	 	int startrow = 2;
	 	if(alltr.getLength() > 1) {
	 		for(int m = 1; m < alltr.getLength(); m++) {
	 			HSSFRow row = sheet.createRow((short)(startrow + m));
	 			NodeList list =alltr.item(m).getChildNodes();
	 			HSSFFont font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_NORMAL,HSSFColor.BLACK.index);
 		 			
	 			for(int i = 0; i < list.getLength(); i++) {
	 				
	 				Node tdNode = list.item(i);
	 				
	 		 		String tdValue = "";
	 		 		if(tdNode != null) {
	 		 			if(tdNode.getFirstChild()!=null)
	 		 				tdValue = tdNode.getFirstChild().getNodeValue();
	 		 		}
	 		 		
	 		 		int tdValueLength = 0;
	 		 		if(tdValue == null) tdValue = "";
	 		 		tdValueLength = tdValue.length() + 6;
	 		 		int colspan = 1;
	 		 		if(isExistAttribute(tdNode,"colspan")) {
	 		 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		 		}
	 		 		
	 		 		HSSFCell cell = row.createCell((short) i);
	 		 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		 		if(colspan > 1) {
	 		 			int merged = i + colspan -1;
	 		 			sheet.addMergedRegion(new Region(1,(short)i,1,(short)merged));
	 		 			i +=  colspan - 1;
	 		 		}
	 		 		
	 		 		
	 		 		HSSFCellStyle style = null;
	 		 		
	 		 		if(m!=(alltr.getLength() - 1)) {
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -1)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}else{
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -1)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}
	 		 		
	 		 		setColumnWidth(sheet,i,tdValueLength);
	 		 		cell.setCellStyle(style);
	 		 		cell.setCellValue(tdValue);
	 				
	 			}
	 			
	 			
	 		
	 		}
	 	
	 	
	 	}
	 
	 
	 
	 }
	 
	 
	 public void createBodyNew(HSSFWorkbook wb,HSSFSheet sheet,NodeList alltr) {
	 	int startrow = 2;
	 	if(alltr.getLength() > 1) {
	 		//ԭ�����ͷʱ m=1
	 		colLength = new int[maxColNum];
	 		for(int m = 0; m < alltr.getLength(); m++) {
	 			int rows=startrow + m;
	 			int cellpos = 0;
	 			Node trNode=alltr.item(m);
	 			HSSFRow row = sheet.createRow((short)(rows));
	 			NodeList list =trNode.getChildNodes();
	 			
	 			HSSFFont font = createFont(wb,"Arial",10,HSSFFont.BOLDWEIGHT_NORMAL,HSSFColor.BLACK.index);
 		 		if(isExistAttribute(trNode,"class")){
 		 			if(getAttributeValue(trNode,"class").equalsIgnoreCase("td_title"))//����Ǳ����� ������
 		 				font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLACK.index);
 		 		}
 		 		fccLog.info("*************list("+m+") ���� ��"+list.getLength()+"*************");
	 			for(int i = 0; i < list.getLength()-1; i++) {
	 				
	 				Node tdNode = list.item(i);
	 				
	 		 		String tdValue = "";
	 		 		if(tdNode != null) {
	 		 			if(tdNode.getFirstChild()!=null)
	 		 				tdValue = tdNode.getFirstChild().getNodeValue();
	 		 		}
	 		 		
	 		 		if (tdValue.indexOf("�༶")<0 && tdValue.indexOf("��")>=0) {
	 		 			String tmp = "";
	 		 		    for (int n=0;n<tdValue.length();n++) {
	 		 			   if ("��".equals(tdValue.substring(n,n+1))) tmp += tdValue.substring(n,n+1) + "��";
	 		 			   else tmp += tdValue.substring(n,n+1);
	 		 		    }
	 		 		    tdValue = tmp.substring(0,tmp.length()-1);
	 		 		}
	 		 		
	 		 		int tdValueLength = 0;
	 		 		if(tdValue == null) tdValue = "";
	 		 		tdValueLength = tdValue.getBytes().length;
	 		 		int colspan = 1;
	 		 		int rowspan = 1;
	 		 		if(isExistAttribute(tdNode,"colspan")) {
	 		 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		 			
	 		 		}
	 		 		else if(tdValueLength>colLength[i]){
	 		 			colLength[i] = tdValueLength;
	 		 		}
	 		 		if(isExistAttribute(tdNode,"rowspan")) {
	 		 			rowspan = Integer.parseInt(getAttributeValue(tdNode,"rowspan"));
	 		 		}
	 		 		
	 		 		
	 		 		
	 		 		HSSFCell cell = row.createCell((short) cellpos);
	 		 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		 		
	 		 		
	 		 		
	 		 		HSSFCellStyle style = null;
	 		 		
	 		 		if(m!=(alltr.getLength() - 1)) {
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -2)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}else{
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -2)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}
	 		 		style.setWrapText(true);
	 		 		//setColumnWidth(sheet,i,(length[i]+4)*250);
	 		 		cell.setCellStyle(style);
	 		 		cell.setCellValue(tdValue);
	 		 		
	 		 		
	 		 		if(colspan > 1) {
 		 				
 		 				sheet.addMergedRegion(new Region(rows,(short)cellpos,rows,(short)(cellpos+colspan -1)));
 		 				
	 		 		}
	 		 		
	 		 		if(rowspan >1) {
	 		 			
	 		 			int mergedy = rows + rowspan -1;
	 		 			sheet.addMergedRegion(new Region(rows,(short)cellpos,mergedy,(short)cellpos));
 		 			
	 		 		}
	 		 		
	 		 		cellpos++;
	 				
	 			}
	 			
	 			
	 		
	 		}
	 	
	 	
	 	}
	 
	 
	 
	 }
	 
	 
	 
	 
	/**
	 * @description ��Excel���뵽����
	 * @param excelFile excel�ļ�
	 * @param tableName ����
	 * @param keyName ������
	 */
	 public static void impExcelToTable(String excelFile,String tableName,String keyName,Connection con) {
	 	if(tableName == null) tableName = "StudentTest";
	 	if(keyName == null) keyName = "StudentID";
	 	System.out.println("������excelFile=" + excelFile);
	 	QueryRunner runner = new QueryRunner();
	 	int max = Webpriary.getPriaryTemp(con,tableName,keyName);
	 	
	 	
	 	try{
	 		File file = new File(excelFile);
	 		
	 		InputStream in = new FileInputStream(excelFile);
	 		System.out.println("-------file path" + file.getCanonicalPath());
	 		POIFSFileSystem fs = new POIFSFileSystem(in);
		 	HSSFWorkbook wb = new HSSFWorkbook(fs);
		    HSSFSheet sheet = wb.getSheetAt(0);
		    int tempcells = sheet.getRow(0).getPhysicalNumberOfCells();
		    System.out.println("-------tempcells" + tempcells);
		    int temprows = sheet.getPhysicalNumberOfRows();
		    System.out.println("-------temprows" + temprows);
		    
		    Object[] params = null;
		    con.setAutoCommit(false);
		    for(int i = 1; i < temprows; i++) {
		    	HSSFRow hssfRow = sheet.getRow(i);
		    	if(hssfRow!=null && !isNull(hssfRow)) {
		    		
			    	params = new Object[tempcells];
			    	//params[0] = new Integer(max);
			    	for(int j = 0; j < tempcells; j++) {
			    		HSSFCell hssfCell = hssfRow.getCell((short)j);
			    		if(hssfCell!=null) {
			    			int tempType = hssfCell.getCellType();
			    			if(tempType == HSSFCell.CELL_TYPE_STRING) {
			    				params[j] = hssfCell.getStringCellValue();
			    			}else if(tempType == HSSFCell.CELL_TYPE_NUMERIC) {
			    				
			    				if(HSSFDateUtil.isCellDateFormatted(hssfCell)) {
			    					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    					params[j] = sdf.format(hssfCell.getDateCellValue());
			    				}else{
			    					params[j] = new Integer((int)hssfCell.getNumericCellValue());
			    				}
			    				
			    			}else{
			    				params[j] = hssfCell.getStringCellValue();
			    			}
			    			
			    		}else{
			    			params[j] = null;
			    			
			    		}
			    	
			    	}
			    	
			    	
			    	
			    	java.util.List list = new ArrayList();
			    	list.add(new Integer(max));
			    	for(int t = 0; t < params.length; t++) {
			    		if(t == 1) continue;
			    		Object temp = params[t];
			    		list.add(temp);
			    	}
			    	Object[] trueparams = new Object[list.size()];
			    	
			    	trueparams = (Object[])list.toArray(trueparams);
			    	System.out.println("@@@@@@@@@@@@length array is:" + trueparams.length);
			    	
			    	String sql = "insert into " + tableName + "(StudentID,StudentNO,Sex,Birthdate,DegreeID,major,JoinPartyTime,StartWorkingTime,WorkingOrgan,Duty,dutylevel,OrganTel,HomeTel,MobileTel,Email,TeamID,Remark)";
			    	sql += " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			    	
			    	
			    	runner.update(con,sql,trueparams);
			    	max++;
		    	}
		    	
		    	
		    	
		    
		    }
		    
		    con.commit();
		    con.setAutoCommit(true);
		    
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 		
	 	}finally{
	 		try{
	 			if(con!=null) con.close();
	 		}catch(Exception e) {
	 			
	 		}
	 	
	 	}
	 	
	 
	 }
	 
	 
	 
	 public static void impCommonExcelToTable(String excelFile,String sql,String tableName,String keyName,Connection con) {
	 	if(tableName == null) tableName = "StudentTest";
	 	if(keyName == null) keyName = "StudentID";
	 	System.out.println("������excelFile=" + excelFile);
	 	QueryRunner runner = new QueryRunner();
	 	int max = Webpriary.getPriaryTemp(con,tableName,keyName);
	 	
	 	
	 	try{
	 		File file = new File(excelFile);
	 		
	 		InputStream in = new FileInputStream(excelFile);
	 		System.out.println("-------file path" + file.getCanonicalPath());
	 		POIFSFileSystem fs = new POIFSFileSystem(in);
		 	HSSFWorkbook wb = new HSSFWorkbook(fs);
		    HSSFSheet sheet = wb.getSheetAt(0);
		    int tempcells = sheet.getRow(0).getPhysicalNumberOfCells();
		    System.out.println("-------tempcells" + tempcells);
		    int temprows = sheet.getPhysicalNumberOfRows();
		    System.out.println("-------temprows" + temprows);
		    
		    Object[] params = null;
		    con.setAutoCommit(false);
		    for(int i = 1; i < temprows; i++) {
		    	HSSFRow hssfRow = sheet.getRow(i);
		    	if(hssfRow!=null && !isNull(hssfRow)) {
		    		
			    	params = new Object[tempcells];
			    	//params[0] = new Integer(max);
			    	for(int j = 0; j < tempcells; j++) {
			    		HSSFCell hssfCell = hssfRow.getCell((short)j);
			    		if(hssfCell!=null) {
			    			int tempType = hssfCell.getCellType();
			    			if(tempType == HSSFCell.CELL_TYPE_STRING) {
			    				params[j] = hssfCell.getStringCellValue();
			    			}else if(tempType == HSSFCell.CELL_TYPE_NUMERIC) {
			    				
			    				if(HSSFDateUtil.isCellDateFormatted(hssfCell)) {
			    					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    					params[j] = sdf.format(hssfCell.getDateCellValue());
			    				}else{
			    					params[j] = new Integer((int)hssfCell.getNumericCellValue());
			    				}
			    				
			    			}else{
			    				params[j] = hssfCell.getStringCellValue();
			    			}
			    			
			    		}else{
			    			params[j] = null;
			    			
			    		}
			    	
			    	}
			    	
			    	
			    	
			    	java.util.List list = new ArrayList();
			    	list.add(new Integer(max));
			    	for(int t = 0; t < params.length; t++) {
			    		if(t == 1) continue;
			    		Object temp = params[t];
			    		list.add(temp);
			    	}
			    	Object[] trueparams = new Object[list.size()];
			    	
			    	trueparams = (Object[])list.toArray(trueparams);
			    	System.out.println("@@@@@@@@@@@@length array is:" + trueparams.length);
			    	
//			    	sql = "insert into " + tableName + "(StudentID,StudentNO,Sex,Birthdate,DegreeID,major,JoinPartyTime,StartWorkingTime,WorkingOrgan,Duty,dutylevel,OrganTel,HomeTel,MobileTel,Email,TeamID,Remark)";
//			    	sql += " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			    	
			    	
			    	runner.update(con,sql,trueparams);
			    	max++;
		    	}
		    	
		    	
		    	
		    
		    }
		    
		    con.commit();
		    con.setAutoCommit(true);
		    
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 		
	 	}finally{
	 		try{
	 			if(con!=null) con.close();
	 		}catch(Exception e) {
	 			
	 		}
	 	
	 	}
	 	
	 
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
	

	
	//��Ȩtable ʹ���Ϊ�����
	public  Node changTableNode(Document doc,Node node) throws Exception{
		HashMap tempMap=new HashMap();
		NodeList nodeList=node.getChildNodes();
		maxColNum = getMaxcolNum(nodeList);//������������
		
		for(int m=0;m<nodeList.getLength();m++){
			Node trNode = nodeList.item(m);
			NodeList trList=trNode.getChildNodes();
			int n=0;
			int trLength=trList.getLength();
			for(int i=0;i<trLength;i++){
				Node tdNode = trList.item(i);
			 	int colspan = 1;
			 	int rowspan = 1;
			 	if(isExistAttribute(tdNode,"colspan")) {
			 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
			 	}
			 	if(isExistAttribute(tdNode,"rowspan")) {
			 			rowspan = Integer.parseInt(getAttributeValue(tdNode,"rowspan"));
			 	}
			 	Object tempStr=tempMap.get(String.valueOf(n));//���ǰ���Ƿ��� rowspan>1
			 	if(tempStr!=null){
			 		Node tempNode=tdNode.getNextSibling();
			 		Node newNode=doc.createElement("td");
		 			XmlUtil.setNodeValue(newNode,"");
		 			trNode.insertBefore(newNode,tdNode);
		 			int tempInt=Integer.parseInt(tempStr.toString())-1;
		 			if(tempInt<=1){
		 				tempMap.remove(String.valueOf(n));
		 			}
		 			else
		 				tempMap.put(String.valueOf(n),String.valueOf(tempInt));
		 			trLength++;
			 	}
			 		
			 		
			 	if(colspan>1){
			 		Node tempNode=tdNode.getNextSibling();
			 		for (int j=1;j<colspan;j++){
			 			Element newNode=doc.createElement("td");
			 			XmlUtil.setNodeValue(newNode,"");
			 			if(rowspan>1)
			 				newNode.setAttribute("rowspan",String.valueOf(rowspan));
			 				
			 			if(tempNode==null){
			 				trNode.appendChild(newNode);
			 			}
			 			else{
			 				trNode.insertBefore(newNode,tempNode);
			 			}
			 			trLength++;
			 		}
			 	}
			 	
			 	if(rowspan>1){
			 		tempMap.put(String.valueOf(n),String.valueOf(rowspan));
			 	}
			 		
			 		
				
				n++;
			}
			if(n<maxColNum){//��ȫ
				for(int k=n;k<maxColNum;k++){
					Object tempStr=tempMap.get(String.valueOf(k));//���ǰ���Ƿ��� rowspan>1
				 	if(tempStr!=null){
				 		
				 		Node newNode=doc.createElement("td");
			 			XmlUtil.setNodeValue(newNode,"");
			 			trNode.appendChild(newNode);
			 			int tempInt=Integer.parseInt(tempStr.toString())-1;
			 			if(tempInt<=1){
			 				tempMap.remove(String.valueOf(k));
			 			}
			 			else
			 				tempMap.put(String.valueOf(k),String.valueOf(tempInt));
				 	}
				}
			}
		}
		return node;
		
	}
	
	public void printNode(Node node){
		NodeList list=node.getChildNodes();
		for(int i=0;i<list.getLength();i++){
			Node node2=list.item(i);
			System.out.println();
			System.out.print("<"+node2.getNodeName()+">");
			System.out.print(XmlUtil.getNodeValue(node2));
			printNode(node2);
			System.out.print("</"+node2.getNodeName()+">");
		}
		
	}
	

}