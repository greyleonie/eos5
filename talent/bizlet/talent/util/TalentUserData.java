/*
 * �������� 2007-1-25
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentUserData {
	public final static String USER_ROLE_TABLE = "EOSOPERATORROLE";//�û���ɫ��
	public final static String USER_VIEW = "USERDETAIL_VIEW";//�û���ͼ
	public final static String USER_MENU_TABLE = "SYSUSERMENU";//�û�Ȩ�ޱ�
	public final static String ROLE_MENU_TABLE = "TALENTROLEMENU";//��ɫȨ�ޱ�
	
	private Log fccLog = LogFactory.getLog(TalentUserData.class);
	

	public static void main(String[] args) {
	}
	
	public void savaUserData(Connection con,HttpSession session,String tempId) throws Exception{
		int operatorId = Integer.parseInt(tempId);
		List tempRoleIds = getUserRole(con,operatorId);//��ǰ�û������Ľ�ɫ
		HashMap tempUserOperate = getUserOperate(con,operatorId);//��ǰ�û�ģ���������
		HashMap tempRoleOperate = getRoleOperate(con,tempRoleIds);//��ǰ��ɫģ���������
		Map allRightMap = new HashMap();//���е�Ȩ�޴���
		allRightMap = getUserAllRight(tempUserOperate,tempRoleOperate);
		session.setAttribute("userPermissions",allRightMap);//SAVE���еĵ�ǰ��¼��Ȩ��
		
		
	}
	
	
	private List getUserRole(Connection con,int operatorId) {
		List roleIds = new ArrayList();
		Statement st = null;
		ResultSet rs = null;
		String sqlstr = "select * from " + TalentUserData.USER_ROLE_TABLE + " where OPERATORID=" + operatorId;
		fccLog.info("############### ��ѯ�û�������ɫ��SQL��" + sqlstr);
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
		fccLog.info("###########�û�����SQL is:" + sqlstr);
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
				fccLog.info("###########��ɫ����SQL is:" + sqlstr);
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
