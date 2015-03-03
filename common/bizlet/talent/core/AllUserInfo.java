package talent.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-2-1
 * @class_displayName AllUserInfo
 */

public class AllUserInfo {

	
	private static List userList = null;
	private static Log log = LogFactory.getLog(AllUserInfo.class);
	private static List orgList = null;
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_userList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="返回的用户"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="查询语句"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc=""
	 */
	public static int BL_userList(Document doc, BizContext param)
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
			Element MobileTel = doc.createElement("MobileTel");
			
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
			XmlUtil.setNodeValue(MobileTel,String.valueOf(vo.getMobileNo()));
			
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
			userEntity.appendChild(MobileTel);
			
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
				String mobileTel=rs.getString("MobileTel");
				int orgType = getOrgType(con,orgId);
		AllUserInfo.log.info("===========userName:"+userName+"=============mobile:"+mobileTel);
				TeacherVo vo = new TeacherVo(tId,userId,userName,orgId,firstChar,workType,position,sex,orgType,mobileTel);
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
		if(list.size() > 0) Collections.sort(list, new OrgSort());
		
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

class OrgSort implements Comparator {
	
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