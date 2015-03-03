package student.score;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

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

import base.util.ActiveDirectoryUtil;

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

public class StudentData {

	private final static int HSSF_int = 0;

	private final static int HSSF_String = 1;

	private final static int HSSF_Date = 2;

	/**
	 * 获得学员成绩
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getStudentScore
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name=""
	 *               desc="输入学员列表"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name=""
	 *               desc="输入班级科目列表"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name=""
	 *               desc="输入成绩列表"
	 */
	public static int BL_getStudentScore(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);

		NodeList studentList = param0.getChildNodes();
		NodeList subjectList = param1.getChildNodes();
		NodeList scoreList = param2.getChildNodes();

		for (int i = 0; i < studentList.getLength(); i++) {
			Element student = (Element) studentList.item(i);
			Element studentScore = doc.createElement("studentScore");
			student.appendChild(studentScore);
			for (int j = 0; j < subjectList.getLength(); j++) {
				Element subject = (Element) subjectList.item(j);
				Element newScore = StudentData.getScore(doc, student, subject,
						scoreList);
				//Element subjectElement = doc.createElement("eleName");
				//XmlUtil.setNodeValue(subjectElement,coreValue);
				studentScore.appendChild(newScore);
			}

		}

		return 1;
	}

	/**
	 * 将学员从IDS中删除
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getStudentScore
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入学员ID"
	 */
	public static int BL_delStu4IDS(Document doc, BizContext param)
			throws Exception {
		String param0 = (String) param.getParaObjectAt(0);
		int operatorID = 0;
		try {
			operatorID = Integer.parseInt(param0);
			if (operatorID > 0) {
				String sql = "select userID from eosoperator where operatorID=?";
				PersistenceBroker db = param.getDBBroker();
				Connection conn = db.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, operatorID);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					String userName = rs.getString("userID");
					ActiveDirectoryUtil adUtil = new ActiveDirectoryUtil();
					adUtil.deleteUser(userName, "EveryOne");
					adUtil.closeDirContext();
				} else {
					return 0;
				}
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			return 0;
		}
	}
	
	/**
	 * 将学员同步到IDS中
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getStudentScore
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入学员ID"
	 */
	public static int BL_syncStudent2IDS(Document doc, BizContext param)
	throws Exception {
		try{
			
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection ldapDBcon = DriverManager.getConnection("jdbc:sqlserver://192.168.0.202:1433;DatabaseName=TRSIDSLDAP", "sa", "1qaz2wsx3edc4rfv..");
			ldapDBcon.setAutoCommit(false);
			Statement ldapState = ldapDBcon.createStatement();
			
			PersistenceBroker db = param.getDBBroker();
			Connection dbcon = db.getConnection();
			dbcon.setAutoCommit(false);
			Statement state = dbcon.createStatement();
			
			// search students of the class
			String classID = (String) param.getParaObjectAt(0);
			String sqlstr = "select e.operatorID, e.userID, e.operatorName, s.MobileTel from Student s, EOSOperator e where s.StudentID=e.operatorID and ClassID=" + classID + " order by e.userID asc";
			ResultSet result = state.executeQuery(sqlstr);
			while(result.next()){
				String userID = result.getString(2);
				String userName = result.getString(3);
				String password = result.getString(4);
				if(password == null || password == "")
					password = "37665163";
				
				// check ids coapp
				String ldapSqlStr = "select COAPPID from IDSUSERMAPPING where USERNAME='" + userID + "'";
				ResultSet retLdap = ldapState.executeQuery(ldapSqlStr);
				if(retLdap.next())
				{
					// delete coapp
					String ldapDelStr = "delete from IDSUSERMAPPING where USERNAME='" + userID + "'";
					ldapState.executeUpdate(ldapDelStr);
					ldapDBcon.commit();
				}
				//*/
				
				// check AD user 
				ActiveDirectoryUtil ad = new ActiveDirectoryUtil();
				//Map userAttr = ad.isUserExist(userID, "学员");
				if(ad.isUserExist(userID, "学员"))
				{
					// delete the same user and update it
					ad.deleteUser(userID, "学员");
				}
				if(ad.isUserExist(userID, "EveryOne"))
				{
					// delete the same user and update it
					ad.deleteUser(userID, "EveryOne");
				}
				
				// registe user information to IDS
 				UserService service = ServicesFactory.getUserService();
				UserEntry userEntry = new UserEntry();
				userEntry.setUserName(userID);
				userEntry.setPassword(password);
				userEntry.setTrueName(userName);
				userEntry.setEmail("inc@gzswdx.gov.cn");
				userEntry.setNickName(userName);
				userEntry.setServices("VOD;Teaching;StudentPortal;TRSPortal");
				SimpleResponse response = service.regUser(userEntry);
				
				// update user group in AD 
				ad.updateUserAttributes(userID,	"EveryOne", "OU", "学员");
				ad.changeUserGroup(userID, "EveryOne", "学员");
				ad.closeDirContext();
				//*/
			}
			state.close();
			ldapState.close();
			return 1;
		}
		catch (Exception e) {
			return 0;
		}
	}

	public static Element getScore(Document doc, Element student,
			Element subject, NodeList scoreList) {
		String studentId = student.getElementsByTagName("StudentID").item(0)
				.getFirstChild().getNodeValue();
		String subjectID = subject.getElementsByTagName("SubjectID").item(0)
				.getFirstChild().getNodeValue();

		for (int i = 0; i < scoreList.getLength(); i++) {
			Element score = (Element) scoreList.item(i);
			String studentIdTemp = score.getElementsByTagName("StudentID")
					.item(0).getFirstChild().getNodeValue();
			String subjectIDTemp = score.getElementsByTagName("SubjectID")
					.item(0).getFirstChild().getNodeValue();
			if (studentIdTemp.equalsIgnoreCase(studentId)
					&& subjectIDTemp.equalsIgnoreCase(subjectID)) {
				return score;
			}

		}
		//如果对应成绩不存在，创建一个新的节点；
		Element newScore = doc.createElement("QueryScore");
		//子节点
		Element ClassID = doc.createElement("ClassID");
		Element Score = doc.createElement("Score");
		Element ScoreMethod = doc.createElement("ScoreMethod");
		Element StudentID = doc.createElement("StudentID");
		Element SubjectID = doc.createElement("SubjectID");

		XmlUtil.setNodeValue(ClassID, student.getElementsByTagName("ClassID")
				.item(0).getFirstChild().getNodeValue());
		XmlUtil.setNodeValue(Score, "");
		XmlUtil.setNodeValue(ScoreMethod, String.valueOf(TalentFunctions
				.getInt(TalentFunctions.getNodeValueByTagName(subject,
						"ScoreMethod"), 1)));
		XmlUtil.setNodeValue(StudentID, studentId);
		XmlUtil.setNodeValue(SubjectID, subjectID);

		newScore.appendChild(ClassID);
		newScore.appendChild(Score);
		newScore.appendChild(ScoreMethod);
		newScore.appendChild(StudentID);
		newScore.appendChild(SubjectID);
		return newScore;

	}

	/**
	 * 从excel批量导入学员信息
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_importStudent
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name=""
	 *               desc="抛出导入异常"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入ClassID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="文件路径"
	 * @bizlet_param passing="in_out" type="constant" value="/" name=""
	 *               desc="输入排序号位数"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="是否同步"
	 */
	public static int BL_importStudent(Document doc, BizContext param)
			throws Exception {
		Node exc = (Node) param.getParaObjectAt(0);
		String ClassID = (String) param.getParaObjectAt(1);
		String absolutePath = (String) param.getParaObjectAt(2);
		String countStr = TalentFunctions.getAvailStr(param.getParaObjectAt(3));
		String syn = (String) param.getParaObjectAt(4);
		int count = TalentFunctions.getInt(countStr, 4);

		String errStr = ""; //记录错误信息
		int row = 2;//定位行数
		int flag = 0;//错误标识定位
		File file = null;
		InputStream in = null;
		ByteArrayOutputStream byteOut = null;
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		QueryRunner runner = new QueryRunner();
		//		String password = TalentDigest.encrypt("37665163");//默认密码

		try {
			cn = db.getConnection();
			cn.setAutoCommit(false);
			st = cn.createStatement();
			//int tempInt = getMaxNumberInClass(ClassID, count, cn);//现班级最大学号顺序号
			int tempInt = 0;
			int operatorID = Webpriary.getPriaryTemp(cn, "EOSOperator",	"operatorID");//获取主键
			String prefix = getClassPrefix(ClassID, cn); //获取班级前缀
			HashMap dicMap = getDictionaryMap("('dx_folk','dx_education','dx_dutylevel','BNDICT_gender')", cn); //查询数据字典获取Map;
			HashMap teamMap = getTeamMap(ClassID, cn); //获取班组map
			flag = 1;

			int classTypeID = 1;
			String classCode = "";
			rs = st.executeQuery("select * from Class where ClassID = "	+ ClassID);
			if (rs.next()) {
				classTypeID = rs.getInt("ClassTypeID");
				classCode = rs.getString("ClassCode");
			}
			int userTypeID = classTypeID + 2;
			
			// clear student of the class
			Connection ldapDBcon = DriverManager.getConnection("jdbc:sqlserver://192.168.0.202:1433;DatabaseName=TRSIDSLDAP", "sa", "1qaz2wsx3edc4rfv..");
			ldapDBcon.setAutoCommit(false);
			Statement ldapState = ldapDBcon.createStatement();
			
			Statement stDel = cn.createStatement();
			String queryStudentSql = "select e.operatorID, e.userID from Student s, EOSOperator e where s.ClassID=" + ClassID + " and s.StudentID=e.operatorID order by e.userID asc";
			rs = st.executeQuery(queryStudentSql);
			while(rs.next())
			{
				int studentID = rs.getInt(1);
				String userID = rs.getString(2);
				
				String delUserSql = "delete from EOSOperator where operatorID=" + studentID;
				stDel.executeUpdate(delUserSql);
				
				// check ids coapp
				String ldapSqlStr = "select COAPPID from IDSUSERMAPPING where USERNAME='" + userID + "'";
				ResultSet retLdap = ldapState.executeQuery(ldapSqlStr);
				if(retLdap.next())
				{
					// delete coapp
					String ldapDelStr = "delete from IDSUSERMAPPING where USERNAME='" + userID + "'";
					ldapState.executeUpdate(ldapDelStr);
				}
				
				// check AD user 
				ActiveDirectoryUtil ad = new ActiveDirectoryUtil();
				//Map userAttr = ad.isUserExist(userID, "学员");
				if(ad.isUserExist(userID, "学员"))
				{
					// delete the same user and update it
					ad.deleteUser(userID, "学员");
				}
				if(ad.isUserExist(userID, "EveryOne"))
				{
					// delete the same user and update it
					ad.deleteUser(userID, "EveryOne");
				}
				
			}
			ldapState.close();
			ldapDBcon.commit();
			
			String delStudentSql = "delete from Student where ClassID=" + ClassID;
			st.executeUpdate(delStudentSql);
			

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
			int num = 0;
			for (int i = 1; i < temprows; i++) {
				System.out.println("------------------>" + row);
				try {
					HSSFRow hssfRow = sheet.getRow(i);
					if (hssfRow != null && !isNull(hssfRow)) {
						params = new Object[tempcells];
						for (int j = 0; j < tempcells; j++) { //从Excel中读出值
							HSSFCell hssfCell = hssfRow.getCell((short) j);
							if (j == 2 || j == 10 || j == 13)
								params[j] = getHssfCellValue(hssfCell,
										HSSF_Date);
							else
								params[j] = getHssfCellValue(hssfCell,
										HSSF_String);
							if (params[j] != null) {
								params[j] = params[j].toString().trim();
							}

						}

						//检验用户名
						String userName = TalentFunctions.getAvailStr(params[0]);
						/*
						if (!checkUserName(userName, ClassID, cn)) {
							errStr = "第" + row + "行姓名为空或该班级已存在该学生。";
							break;
						}
						//*/
						tempInt = tempInt + 1;
						String studentNO = prefix
								+ TalentFunctions
										.getStringDigit(tempInt, count);

						params[1] = dicMap.get("BNDICT_gender-" + params[1]); //性别
						params[3] = dicMap.get("dx_folk-" + params[3]); //民族
						params[5] = dicMap.get("dx_education-" + params[5]); //学历
						params[12] = dicMap.get("dx_dutylevel-" + params[12]); //职级
						params[23] = teamMap.get(params[23]); //班组ID
						//String carNumber = TalentFunctions.getAvailStr(params[24]);
						String email = TalentFunctions.getAvailStr(params[19]);
						String mobileTel = TalentFunctions
								.getAvailStr(params[20]);
						if (mobileTel.equals(null) || mobileTel == "") {
							mobileTel = "37665163";
						}
						String password = TalentDigest.encrypt(mobileTel);
						java.util.List list = new ArrayList();
						list.add(new Integer(operatorID));
						list.add(studentNO);
						list.add(ClassID);
						for (int t = 0; t < params.length; t++) {
							if (t == 0)
								continue;
							Object temp = null;
							if (params[t] != null
									&& (!params[t].toString().equals("")))
								temp = params[t];
							list.add(temp);
							System.out.println("temp" + t + "---->" + temp);
						}
						System.out.println("list.size()===>" + list.size());
						/*
						 * String ts="insert into student
						 * (studentID,ClassID,JoinPartyTime) values(?,?,?)";
						 * PreparedStatement st2=cn.prepareStatement(ts);
						 * st2.setString(1,String.valueOf(operatorID));
						 * st2.setString(2,"1"); st2.setString(3,"2006-12-12");
						 * st2.executeUpdate();
						 * System.out.println("===================");
						 */
						Object[] obj = new Object[list.size()];
						obj = (Object[]) list.toArray(obj);

						String studentNo = obj[1].toString();
						String userId = classCode + studentNo;

						String insertOperator = "insert into EOSOperator (operatorID,operatorName,userID,password,status,isLocal,operatorType,userTypeID)"
								+ "values("
								+ operatorID
								+ ",'"
								+ userName
								+ "','"
								+ userId
								+ "','"
								+ password
								+ "',1,'y',1,"
								+ userTypeID
								//+ ","
								//+ carNumber
								+ ")";
						String insertStudent = "insert into Student  (StudentID,StudentNO,ClassID,Sex,Birthdate,FolkID,NativePlace,DegreeID,Edulevel,Major,WorkingOrgan,JobTitle,StartWorkingTime,Duty,dutylevel,"
								+ "JoinPartyTime,PartyPost,SocietyPost,OrgAddr,OrgPostcode,OrganTel,Email,MobileTel,HomeTel,DiplomaNO,TeamID,Remark)"
								+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

						/*
						 * String insertStudent = "insert into Student
						 * (StudentID,StudentNO,ClassID,Sex,Birthdate,FolkID,NativePlace,DegreeID,Edulevel,Major,WorkingOrgan,JobTitle,StartWorkingTime,Duty,dutylevel," +
						 * "JoinPartyTime,PartyPost,SocietyPost,OrgAddr,OrgPostcode,OrganTel,Email,MobileTel,HomeTel,DiplomaNO,TeamID,Remark)" + "
						 * values("+obj[0]+","+obj[1]+","+obj[2]+","+obj[3]+","+obj[4]+","+obj[5]+","+obj[6]+","+obj[7]+","+obj[8]+"," +
						 * ""+obj[9]+","+obj[10]+","+obj[11]+","+obj[12]+","+obj[13]+","+obj[14]+","+obj[15]+","+obj[16]+","+obj[17]+"," +
						 * ""+obj[18]+","+obj[19]+","+obj[20]+","+obj[21]+","+obj[22]+","+obj[23]+","+obj[24]+","+obj[25]+","+obj[26]+")";
						 */
						st.executeUpdate(insertOperator);
						PreparedStatement st2 = cn
								.prepareStatement(insertStudent);
						for (int k = 0; k < obj.length; k++) {
							if (obj[k] == null) {
								st2.setString(k + 1, null);
							} else
								st2.setString(k + 1, obj[k].toString());
						}

						st2.executeUpdate();
						st2.close();

						/*
						if (syn.equals("1")) {
							UserService service = ServicesFactory
									.getUserService();
							UserEntry userEntry = new UserEntry();
							userEntry.setUserName(classCode + studentNo);
							userEntry.setPassword(mobileTel);
							userEntry.setTrueName(userName);
							userEntry.setEmail("inc@gzswdx.gov.cn");
							userEntry.setNickName(userName);
							userEntry.setServices(getProperty("teacher"));
							SimpleResponse response = service
									.regUser(userEntry);
							ActiveDirectoryUtil ad = new ActiveDirectoryUtil();
							ad.updateUserAttributes(classCode + studentNo,
									"EveryOne", "OU", "学员");
							ad.changeUserGroup(classCode + studentNo,
									"EveryOne", "学员");
							ad.closeDirContext();
						}
						//*/
						//				    	if(impFlag!=1){
						//				    	    throw new Exception();
						//				    	}
						//runner.update(cn,insertStudent,trueparams);
						operatorID = operatorID + 1;

					}

				} catch (Exception e) {
					e.printStackTrace();
					errStr = errStr + "第" + row + "行数据有误。";
					break;
				}
				row = row + 1;
				num = i;
			}
			String updateNumSql = "update class set factnum=isnull(factnum,'')+"
					+ num + " where classid=" + ClassID;
			PreparedStatement st3 = cn.prepareStatement(updateNumSql);
			st3.executeUpdate();
			st3.close();
			
			
			cn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (flag == 0)
				errStr = errStr + "数据连接失败或数据库数据有误，请联系管理员。";
			else
				errStr = errStr + "导入文件有误。";
		} finally {
			cn.setAutoCommit(true);
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
				if (cn != null)
					cn.close();
				if (byteOut != null)
					byteOut.close();
				if (in != null)
					in.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if (!errStr.equals("")) {
			XmlUtil.setNodeValue(exc, errStr);
			return 0;
		}
		return 1;
	}

	public static String getProperty(String type) {
		Properties cfgProps = new Properties();
		InputStream in = null;
		String property = "";
		try {
			in = new BufferedInputStream(new FileInputStream(
					"D:\\primeton\\eosserver\\config\\ldap4eos.properties"));
			cfgProps.load(in);
			if (type.equals("student"))
				property = cfgProps.getProperty("studentApp");
			else
				property = cfgProps.getProperty("teacherApp");
		} catch (FileNotFoundException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return property;
	}

	public static boolean isNull(HSSFRow hssfRow) {
		boolean hasNull = true;
		if (hssfRow == null)
			return true;
		for (int i = 0; i < hssfRow.getPhysicalNumberOfCells(); i++) {
			HSSFCell hssfCell = hssfRow.getCell((short) i);
			Object object = null;
			if (hssfCell != null) {
				int tempType = hssfCell.getCellType();
				if (tempType == HSSFCell.CELL_TYPE_STRING) {
					object = hssfCell.getStringCellValue();
				} else if (tempType == HSSFCell.CELL_TYPE_NUMERIC) {

					if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {

						object = hssfCell.getDateCellValue();
					} else {
						object = new Integer((int) hssfCell
								.getNumericCellValue());
					}

				} else {
					object = hssfCell.getStringCellValue();
				}

			}
			if (object != null && !object.equals(""))
				return false;
		}
		return hasNull;

	}

	//检验用户名
	public static boolean checkUserName(String userName, String ClassID,
			Connection con) {
		boolean bl = true;
		if (userName == null && userName.equals("")) {
			bl = false;
		} else {
			String sql = "select * from EOSOperator e ,Student s where e.operatorID=s.StudentID and e.operatorName='"
					+ userName
					+ "' and s.ClassID="
					+ ClassID
					+ " and e.status=1";
			Statement st = null;
			ResultSet rs = null;
			try {
				st = con.createStatement();
				rs = st.executeQuery(sql);
				if (rs.next()) {
					bl = false;
				}
			} catch (Exception ex) {
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (st != null)
						st.close();
				} catch (Exception e) {
				}
			}
		}

		return bl;
	}

	public static Object getHssfCellValue(HSSFCell hssfCell, int tempType) {
		Object obj = null;
		if (hssfCell != null) {
			try {
				if (tempType == HSSF_String) {
					obj = hssfCell.getStringCellValue();
				} else if (tempType == HSSF_Date) {
					try {
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyy-MM-dd");
						obj = sdf.format(hssfCell.getDateCellValue());
					} catch (Exception e) {
						String aa = hssfCell.getStringCellValue();
						if (aa != null && aa.indexOf("-") > 0
								&& aa.length() >= 6 && aa.length() <= 7)
							obj = aa + "-01";
					}
				} else if (tempType == HSSF_int) {
					obj = new Integer((int) hssfCell.getNumericCellValue());

				} else {
					obj = hssfCell.getStringCellValue();
				}
			} catch (Exception e) {
				tempType = hssfCell.getCellType();
				if (tempType == HSSFCell.CELL_TYPE_STRING) {
					obj = hssfCell.getStringCellValue();
				} else if (tempType == HSSFCell.CELL_TYPE_NUMERIC) {

					if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyy-MM-dd");
						obj = sdf.format(hssfCell.getDateCellValue());
					} else {
						obj = new Long((long) hssfCell.getNumericCellValue());

					}

				} else {
					obj = hssfCell.getStringCellValue();
				}
			}
		}
		return obj;
	}

	public static String getClassPrefix(String ClassID, Connection con) { //获取班级前缀
		String prefix = "";
		String sql = "select * from Class where ClassID=" + ClassID;
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				prefix = TalentFunctions.getAvailStr(rs.getObject("Prefix"));
			}
		} catch (Exception ex) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
			} catch (Exception e) {
			}
		}
		return prefix;
	}

	//查询数据字典获取Map;
	public static HashMap getDictionaryMap(String str, Connection con) {
		HashMap map = new HashMap();
		String sql = "select * from BNDICT_T_Dictionary where businTypeID in "
				+ str;
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String businID = rs.getString("businID");
				String businTypeID = rs.getString("businTypeID");
				String businName = rs.getString("businName");
				map.put(businTypeID + "-" + businName, businID);
			}
		} catch (Exception ex) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
			} catch (Exception e) {
			}
		}
		return map;
	}

	//获取班组Map;
	public static HashMap getTeamMap(String ClassID, Connection con) {
		HashMap map = new HashMap();
		String sql = "select * from Team where ClassId = " + ClassID;
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				int TeamID = rs.getInt("TeamID");
				String TeamName = rs.getString("TeamName");
				map.put(TeamName, String.valueOf(TeamID));
			}
		} catch (Exception ex) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
			} catch (Exception e) {
			}
		}
		return map;
	}

	/**
	 * 根据ClassID获得学号的排序号，返回StudentNumber节点
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getStudentNO
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name=""
	 *               desc="输出学号排序号"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入ClassID"
	 * @bizlet_param passing="in_out" type="constant" value="/" name=""
	 *               desc="输入排序号位数"
	 */
	public static int BL_getStudentNOSuffix(Document doc, BizContext param)
			throws Exception {
		Node StudentNumber = (Node) param.getParaObjectAt(0);
		String ClassID = (String) param.getParaObjectAt(1);
		String countStr = TalentFunctions.getAvailStr(param.getParaObjectAt(2));
		int count = TalentFunctions.getInt(countStr, 4);
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		try {
			cn = db.getConnection();
			String number = getNumber(ClassID, count, cn);
			XmlUtil.setNodeValue(StudentNumber, number);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (cn != null)
					cn.close();

			} catch (Exception e) {
				e.printStackTrace();

			}

		}

		return 1;
	}

	public static String getNumber(String ClassID, int count, Connection con) {
		String NumberStr = "";
		int tempInt = getMaxNumberInClass(ClassID, count, con);
		int number = number = tempInt + 1;
		NumberStr = TalentFunctions.getStringDigit(number, count);
		return NumberStr;
	}

	public static int getMaxNumberInClass(String ClassID, int count,
			Connection con) {
		String sql = "select Max(StudentNO) as Ms from Student where ClassID="
				+ ClassID;
		Statement st = null;
		ResultSet rs = null;
		String NumberStr = "";
		int tempInt = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			String perNumber = "";

			if (rs.next()) {
				perNumber = TalentFunctions.getAvailStr(rs.getObject(1));
			}
			if ((!perNumber.equals("")) && perNumber.length() >= count) {
				String tempStr = perNumber.substring(
						(perNumber.length() - count), perNumber.length());
				tempInt = TalentFunctions.getInt(tempStr, 0);

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (st != null)
					st.close();
			} catch (Exception e) {
				e.printStackTrace();

			}

		}
		return tempInt;
	}

	public static void main(String arg[]) throws Exception {

		Object o = new Integer("11");
		;

		System.out.println("---" + o.getClass());
	}
}

