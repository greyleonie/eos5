package talent.core;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;
import java.util.Collections;

import org.w3c.dom.*;
import org.apache.commons.logging.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;


/**
 * @author 冯长春
 * @version 1.0
 * @date 2007-1-12
 * @class_displayName ManAllInfo
 */

public class ManAllInfo {
	
	private static List userList = null;
	private static Log fccLog = LogFactory.getLog(ManAllInfo.class);
	private static List orgList = null;

	/**
	 * 得到有效教师信息
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getManList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输出教师列表"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="查询的SQL语句"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="其他参数"
	 */
	public static int BL_getManList(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		
		PersistenceBroker db = param.getDBBroker();
		
		if(userList == null || orgList == null) {
			orgList = allOrgList(db);
			userList = allUser(db,param1);
			
		}else {
			if(param2!=null && param2.equalsIgnoreCase("refresh")) {
				orgList = allOrgList(db);
				userList = allUser(db,param1);
				
			}
		
		}
		
		for(int i = 0; i < userList.size(); i++) {
			
			TeacherVo vo = (TeacherVo) userList.get(i);
			
			Element userEntity = doc.createElement("UserEntity");
			
			//create element
			Element tId = doc.createElement("operatorID");
			Element userId = doc.createElement("userID");
			Element userName = doc.createElement("operatorName");
			Element orgId = doc.createElement("orgId");
			Element firstChar = doc.createElement("firstChar");
			Element workType = doc.createElement("workType");
			Element position = doc.createElement("position");
			Element sex = doc.createElement("sex");
			Element orgType = doc.createElement("orgType");
			Element email = doc.createElement("email");
			Element isLeave = doc.createElement("isLeave");
			Element isDead = doc.createElement("isDead");
			Element isRetire = doc.createElement("isRetire");
			
			//set value
			XmlUtil.setNodeValue(tId,String.valueOf(vo.getTId()));
			XmlUtil.setNodeValue(userId,String.valueOf(vo.getUserId()));
			XmlUtil.setNodeValue(userName,String.valueOf(vo.getUserName()));
			XmlUtil.setNodeValue(orgId,String.valueOf(vo.getOrgId()));
			XmlUtil.setNodeValue(firstChar,String.valueOf(vo.getFirstChar()));
			XmlUtil.setNodeValue(workType,String.valueOf(vo.getWorkType()));
			XmlUtil.setNodeValue(position,String.valueOf(vo.getPosition()));
			XmlUtil.setNodeValue(sex,String.valueOf(vo.getSex()));
			XmlUtil.setNodeValue(orgType,String.valueOf(vo.getOrgType()));
			XmlUtil.setNodeValue(email,String.valueOf(vo.getOrgType()));
			XmlUtil.setNodeValue(isLeave,String.valueOf(vo.getIsLeave()));
			XmlUtil.setNodeValue(isDead,String.valueOf(vo.getIsDead()));
			XmlUtil.setNodeValue(isRetire,String.valueOf(vo.getIsRetire()));
			
			//append element
			
			userEntity.appendChild(tId);
			userEntity.appendChild(userId);
			userEntity.appendChild(userName);
			userEntity.appendChild(orgId);
			userEntity.appendChild(firstChar);
			userEntity.appendChild(workType);
			userEntity.appendChild(position);
			userEntity.appendChild(sex);
			userEntity.appendChild(orgType);
			userEntity.appendChild(isLeave);
			userEntity.appendChild(isDead);
			userEntity.appendChild(isRetire);
			
			//append to list for output
			param0.appendChild(userEntity);
			
			
			
		
		}

		return 1;
	}
	
	
	/**
	 * 得到有效教师信息(包括邮件)
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getManMailList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输出教师列表"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="查询的SQL语句"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="其他参数"
	 */
	public static int BL_getManMailList(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		
		PersistenceBroker db = param.getDBBroker();
		
		if(userList == null || orgList == null) {
			orgList = allOrgList(db);
			userList = allUserMail(db,param1);
			
		}else {
			if(param2!=null && param2.equalsIgnoreCase("refresh")) {
				orgList = allOrgList(db);
				userList = allUserMail(db,param1);
				
			}
		
		}
		
		for(int i = 0; i < userList.size(); i++) {
			
			TeacherVo vo = (TeacherVo) userList.get(i);
			
			Element userEntity = doc.createElement("UserEntity");
			
			//create element
			Element tId = doc.createElement("operatorID");
			Element userId = doc.createElement("userID");
			Element userName = doc.createElement("operatorName");
			Element orgId = doc.createElement("orgId");
			Element firstChar = doc.createElement("firstChar");
			Element workType = doc.createElement("workType");
			Element position = doc.createElement("position");
			Element sex = doc.createElement("sex");
			Element email = doc.createElement("email");
			Element orgType = doc.createElement("orgType");
//			Element isLeave = doc.createElement("isLeave");
//			Element isDead = doc.createElement("isDead");
//			Element isRetire = doc.createElement("isRetire");
			
			//set value
			XmlUtil.setNodeValue(tId,String.valueOf(vo.getTId()));
			XmlUtil.setNodeValue(userId,String.valueOf(vo.getUserId()));
			XmlUtil.setNodeValue(userName,String.valueOf(vo.getUserName()));
			XmlUtil.setNodeValue(orgId,String.valueOf(vo.getOrgId()));
			XmlUtil.setNodeValue(firstChar,String.valueOf(vo.getFirstChar()));
			XmlUtil.setNodeValue(workType,String.valueOf(vo.getWorkType()));
			XmlUtil.setNodeValue(position,String.valueOf(vo.getPosition()));
			XmlUtil.setNodeValue(sex,String.valueOf(vo.getSex()));
			XmlUtil.setNodeValue(email,String.valueOf(vo.getEmail()));
			XmlUtil.setNodeValue(orgType,String.valueOf(vo.getOrgType()));
			
//			XmlUtil.setNodeValue(isLeave,String.valueOf(vo.getIsLeave()));
//			XmlUtil.setNodeValue(isDead,String.valueOf(vo.getIsDead()));
//			XmlUtil.setNodeValue(isRetire,String.valueOf(vo.getIsRetire()));
			
			//append element
			
			userEntity.appendChild(tId);
			userEntity.appendChild(userId);
			userEntity.appendChild(userName);
			userEntity.appendChild(orgId);
			userEntity.appendChild(firstChar);
			userEntity.appendChild(workType);
			userEntity.appendChild(position);
			userEntity.appendChild(sex);
			userEntity.appendChild(email);
			userEntity.appendChild(orgType);			

//			userEntity.appendChild(isLeave);
//			userEntity.appendChild(isDead);
//			userEntity.appendChild(isRetire);
			
			//append to list for output
			param0.appendChild(userEntity);
			
			
			
		
		}

		return 1;
	}
	
	
	/**
	 * 
	 * description:
	 * @param db
	 * @param sql
	 * @return
	 */
	public static List allUser(PersistenceBroker db,String sql) {
		List list = new ArrayList();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				long tId = rs.getLong("operatorID");
				String userId = rs.getString("userID");
				String userName = rs.getString("operatorName");
				int orgId = rs.getInt("DepartmentID");
				String firstChar = rs.getString("Firstchar");
				int workType = rs.getInt("TeacherTypeID");
				int position = rs.getInt("persition");
				String sex = rs.getString("Sex");
				int orgType = getOrgType(con,orgId);
				int isLeave=rs.getInt("isLeave");
				int isDead=rs.getInt("isDead");
				int isRetire=rs.getInt("isRetire");
				
				TeacherVo vo = new TeacherVo(tId,userId,userName,orgId,firstChar,workType,position,sex,orgType,isLeave,isDead,isRetire);
				list.add(vo);
			
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}finally{
			try{
				
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
				rs = null;
				st = null;
				con = null;
				
			}catch(Exception ee) {
				ee.printStackTrace();
			}
		
		}
		
		//sort
		if(list.size() > 0) Collections.sort(list, new TalentSort());
		
		return list;
	
	}
	
	/**
	 * 
	 * description:
	 * @param db
	 * @param sql
	 * @return
	 */
	public static List allUserMail(PersistenceBroker db,String sql) {
		List list = new ArrayList();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				long tId = rs.getLong("operatorID");
				String userId = rs.getString("userID");
				String userName = rs.getString("operatorName");
				int orgId = rs.getInt("DepartmentID");
				String firstChar = rs.getString("Firstchar");
				int workType = rs.getInt("TeacherTypeID");
				int position = rs.getInt("persition");
				String sex = rs.getString("Sex");
				String email = rs.getString("Email");
				int orgType = getOrgType(con,orgId);
				
				TeacherVo vo = new TeacherVo(tId,userId,userName,orgId,firstChar,workType,position,sex,email,orgType);
				list.add(vo);
			
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}finally{
			try{
				
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
				rs = null;
				st = null;
				con = null;
				
			}catch(Exception ee) {
				ee.printStackTrace();
			}
		
		}
		
		//sort
		if(list.size() > 0) Collections.sort(list, new TalentSort());
		
		return list;
	
	}
	
	
	public static List allOrgList(PersistenceBroker db) {
		String sql = "select managerID,orgID,orgLevel,orgName,orgTypeID,parentOrgID,Teaching,IsWork,auxiliaryManagerID  from EOSORG_T_Organization";
		
		List list = new ArrayList();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int orgID = rs.getInt("orgID");
				String orgName = rs.getString("orgName");
				int orgTypeID = rs.getInt("orgTypeID");
				
				DepartmentVo vo = new DepartmentVo(orgID,orgName,orgTypeID);
				list.add(vo);
			
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}finally{
			try{
				
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
				rs = null;
				st = null;
				con = null;
				
			}catch(Exception ee) {
				ee.printStackTrace();
			}
		
		}
		
		
		
		return list;
	}
	
	
	
	public static int getOrgType(Connection conn,int orgId) {
		int type = 0;
		for(int i = 0; i < orgList.size(); i++) {
			DepartmentVo vo = (DepartmentVo) orgList.get(i);
			
			if(vo.getOrgID() == orgId) return vo.getOrgTypeID();
		
		}
		
		return 0;
	}

}

class TalentSort implements Comparator {
	
	public int compare(Object object, Object object1) {
		
		int i = 0;
		TeacherVo vo1 = (TeacherVo) object;
		TeacherVo vo2 = (TeacherVo) object1;
		
		if(vo1.getOrgType() == vo2.getOrgType()) {
			
			if(vo1.getWorkType() > vo2.getWorkType()){
				return 1;
			}else if(vo1.getWorkType() < vo2.getWorkType()) {
				return -1;
			}else{
				return 0;
			}
		}
		
		if(vo1.getOrgType()> vo2.getOrgType()) return 1;
		if(vo1.getOrgType() < vo2.getOrgType()) return -1;
		
		return i;
		
		
	}

}