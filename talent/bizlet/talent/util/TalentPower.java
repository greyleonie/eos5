package talent.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-6-23
 * @class_displayName talentPower
 */

public class TalentPower {
	public static final String SYSUSERMENU = "SYSUSERMENU";//用户资源表
	public static final String EOSROLEMENU = "TALENTROLEMENU";//角色资源表
	public static final String EOSMENU = "EOSMENU";        //资源表
	public static final String SYSRESOPERATION = "SYSRESOPERATION";//资源操作表
	

	
	
	/**
	 * 
	 * @author Administrator
	 * 
	 * TODO 要更改此生成的类型注释的模板，请转至
	 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
	 */
	
	public static List getSysUserModule(PersistenceBroker db,int userid) throws Exception{
		 List module = new ArrayList();//保存用户已有的操作模块;
		 String sqlstr = "select * from "+TalentPower.SYSUSERMENU+" where OPERATORID="+userid;
		 Connection con = null;
		 Statement st = null;
		 ResultSet rs = null;
		 try{
		 	con = db.getConnection();
		 	st = con.createStatement();
		 	rs = st.executeQuery(sqlstr);
		 	while(rs.next()){
		 		SysUserModule temp = new SysUserModule(rs.getString("MENUID"),rs.getString("RESOPIDCODE"));
		 		module.add(temp);
		 	}//while
		 }catch(Exception ex){
		 	ex.printStackTrace();
		 }finally{
		 	if(rs!=null) rs.close();
		 	if(st!=null) st.close();
		 	if(con!=null) con.close();
		 
		 }
		
	
		return module;
	}
	
	public static List getSysRoleModule(PersistenceBroker db,String roleid) throws Exception{
		List module = new ArrayList();
		String sqlstr = "select * from "+TalentPower.EOSROLEMENU+" where ROLEID='"+roleid+"'";
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
		 	con = db.getConnection();
		 	st = con.createStatement();
		 	rs = st.executeQuery(sqlstr);
		 	while(rs.next()){
		 		//SysUserModule temp = new SysUserModule(rs.getString("MENUID"),rs.getString("RESOPIDCODE"));
		 		SysRoleModule temp = new SysRoleModule(rs.getString("MENUID"),rs.getString("RESOPCODE"));
		 		module.add(temp);
		 	}//while
		 }catch(Exception ex){
		 	ex.printStackTrace();
		 }finally{
		 	if(rs!=null) rs.close();
		 	if(st!=null) st.close();
		 	if(con!=null) con.close();
		 
		 }
		return module;
	}
	
	
	
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_userDistribute
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="用户的操作ID"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="用户的资源集合list[@type='userresource']"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="用户的操作集合list[@type='useroperator']"
	 */
	public static int BL_userDistribute(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		String pvalue = param0.getFirstChild().getNodeValue();
		int userid = Integer.parseInt(pvalue);
		PersistenceBroker db = param.getDBBroker();
		List userall = TalentPower.getSysUserModule(db,userid);//用户的资源权限
		ArrayList userResource = new ArrayList();//用户拥有的资源模块
		ArrayList userOperate = new ArrayList();//用户拥有的操作
		for(int i=0;i<userall.size();i++){
			SysUserModule temp = (SysUserModule)userall.get(i);
			userResource.add(temp.getModuleId());
			userOperate.add(temp.getOperateId());
		}//for
		
		for(int i = 0; i < userResource.size(); i++) {
			String tempResource = (String) userResource.get(i);
			Element entity = doc.createElement("ENTITY");
			Element menuid = doc.createElement("MENUID");
			XmlUtil.setNodeValue(menuid,tempResource);
			entity.appendChild(menuid);
			param1.appendChild(entity);
			
		}
		
		for(int i = 0; i < userOperate.size(); i++) {
			String tempOperator = (String) userOperate.get(i);
			Element entity = doc.createElement("ENTITY");
			Element operatorid = doc.createElement("OPERATORID");
			XmlUtil.setNodeValue(operatorid,tempOperator);
			entity.appendChild(operatorid);
			param2.appendChild(entity);
		}
		
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
	 * @bizlet_displayName BL_roleDistribute
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="用户的操作ID"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="用户的资源集合list[@type='userresource']"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="用户的操作集合list[@type='useroperator']"
	 */
	public static int BL_roleDistribute(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		
		String roleid = param0.getFirstChild().getNodeValue();
		PersistenceBroker db = param.getDBBroker();
		List roleall = TalentPower.getSysRoleModule(db,roleid);//角色的资源权限
		ArrayList roleResource = new ArrayList();//角色拥有的资源模块
		ArrayList roleOperate = new ArrayList();//角色拥有的操作
		for(int i=0;i<roleall.size();i++){
			SysRoleModule temp = (SysRoleModule)roleall.get(i);
			roleResource.add(temp.getModuleId());
			roleOperate.add(temp.getOperateId());
		}//for
		
		for(int i = 0; i < roleResource.size(); i++) {
			String tempResource = (String) roleResource.get(i);
			Element entity = doc.createElement("ENTITY");
			Element menuid = doc.createElement("MENUID");
			XmlUtil.setNodeValue(menuid,tempResource);
			entity.appendChild(menuid);
			param1.appendChild(entity);
			
		}
		
		for(int i = 0; i < roleOperate.size(); i++) {
			String tempOperator = (String) roleOperate.get(i);
			Element entity = doc.createElement("ENTITY");
			Element operatorid = doc.createElement("OPERATORID");
			XmlUtil.setNodeValue(operatorid,tempOperator);
			entity.appendChild(operatorid);
			param2.appendChild(entity);
		}
		
		return 1;
	}
	
	
}













