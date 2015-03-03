/*
 * 创建日期 2007-1-25
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;
import java.util.*;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentUserData {
	public final static String USER_ROLE_TABLE = "EOSOPERATORROLE";//用户角色表
	public final static String USER_VIEW = "USERDETAIL_VIEW";//用户视图
	public final static String USER_MENU_TABLE = "SYSUSERMENU";//用户权限表
	public final static String ROLE_MENU_TABLE = "TALENTROLEMENU";//角色权限表
	
	private Log fccLog = LogFactory.getLog(TalentUserData.class);
	

	public static void main(String[] args) {
	}
	
	public void savaUserData(Connection con,HttpSession session,String tempId) throws Exception{
		int operatorId = Integer.parseInt(tempId);
		List tempRoleIds = getUserRole(con,operatorId);//当前用户所属的角色
		HashMap tempUserOperate = getUserOperate(con,operatorId);//当前用户模块操作数据
		HashMap tempRoleOperate = getRoleOperate(con,tempRoleIds);//当前角色模块操作数据
		Map allRightMap = new HashMap();//所有的权限代码
		allRightMap = getUserAllRight(tempUserOperate,tempRoleOperate);
		session.setAttribute("userPermissions",allRightMap);//SAVE所有的当前登录的权限
		
		
	}
	
	
	private List getUserRole(Connection con,int operatorId) {
		List roleIds = new ArrayList();
		Statement st = null;
		ResultSet rs = null;
		String sqlstr = "select * from " + TalentUserData.USER_ROLE_TABLE + " where OPERATORID=" + operatorId;
		fccLog.info("############### 查询用户所属角色表SQL：" + sqlstr);
		try{
			st = con.createStatement();
			rs = st.executeQuery(sqlstr);
			while(rs.next()) {
				String roleId = rs.getString("ROLEID");
				roleIds.add(roleId);
			}
			
		}catch(Exception e){
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
			}catch(Exception e){
				
			}
			
		}
		return roleIds;
	
	}
	
	private HashMap getUserOperate(Connection con,int operatorId) {
		HashMap userMap = new HashMap();
		Statement st = null;
		ResultSet rs = null;
		String sqlstr = "select * from " + TalentUserData.USER_MENU_TABLE + " where OPERATORID=" + operatorId;
		fccLog.info("###########用户操作SQL is:" + sqlstr);
		try{
			st = con.createStatement();
			rs = st.executeQuery(sqlstr);
			while(rs.next()) {
				String menuId = rs.getString("MENUID");
				String operateCode = rs.getString("RESOPIDCODE");
				userMap.put(menuId,operateCode);
			}
			
			
		}catch(Exception e) {
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
			}catch(Exception e){
				
			}
		}
		
		return userMap;
	
	}
	
	
	private HashMap getRoleOperate(Connection con,List roleIds) {
		HashMap roleMap = new HashMap();
		Statement st = null;
		ResultSet rs = null;
		String sqlstr = "";
		String roleId = "";
		try{
			st = con.createStatement();
			for(int i = 0; i < roleIds.size(); i++) {
				roleId = (String) roleIds.get(i);
				sqlstr = "select * from " + TalentUserData.ROLE_MENU_TABLE + " where ROLEID='" + roleId + "'";
				fccLog.info("###########角色操作SQL is:" + sqlstr);
				rs = st.executeQuery(sqlstr);
				while(rs.next()) {
					String menuId = rs.getString("MENUID");
					String operateCode = rs.getString("RESOPCODE");
					if(roleMap.get(menuId)!=null) {
						String oldCode = (String) roleMap.get(menuId);
						String lastCode = getMorePermission(oldCode,operateCode);
						roleMap.put(menuId,lastCode);
					}else{
						roleMap.put(menuId,operateCode);
					}
				
				}
				
			
			}
		}catch(Exception e){
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
			}catch(Exception e){
				
			}
		}
		return roleMap;
	}
	
	protected String getMorePermission(String oldcode,String newcode){
	      String lastcode=newcode;
	      ArrayList list=new ArrayList();
	      String[] oldArray=oldcode.split(",");
	      String[] newArray=newcode.split(",");
	      for(int i=0;i<newArray.length;i++){
	        list.add(newArray[i]);
	      }//for
	      for(int j=0;j<oldArray.length;j++){
	      if(list.indexOf(oldArray[j])<0) lastcode+=","+oldArray[j];
	      }

	    return lastcode;
	 }
	
	
	private HashMap getUserAllRight(HashMap userMap,HashMap roleMap){
		  HashMap allMap = new HashMap();
		  String tempid=null;
		  Set rolemoudleids = roleMap.keySet();
		  Iterator iterator = rolemoudleids.iterator();
		  while(iterator.hasNext()){
		    tempid = (String)iterator.next();
		    if(!userMap.containsKey(tempid)){
		      userMap.put(tempid,roleMap.get(tempid));
		    }else{
		      String userRight = (String)userMap.get(tempid);
		      String roleRight = (String)roleMap.get(tempid);
		      String newRight = getMorePermission(roleRight,userRight);
		      userMap.put(tempid,newRight);
		    }
		  }//while
		  allMap = userMap;
		  return allMap;
	}
}
