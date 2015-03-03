package talent.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-6-25
 * @class_displayName SavePower
 */

public class SavePower {
	public static final String SYSUSERMENU = "SYSUSERMENU";//用户资源表
	public static final String EOSROLEMENU = "TALENTROLEMENU";//角色资源表

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_saveuser
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="用户资源权限代码节点"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="用户标识节点"
	 */
	public static int BL_saveuser(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);//用户资源权限代码节点
		Node param1 = (Node)param.getParaObjectAt(1);//用户标识节点
		
		PersistenceBroker db = param.getDBBroker();
		String pvalue = param1.getFirstChild().getNodeValue();
		int usermark = Integer.parseInt(pvalue);
		NodeList moduleandcode = ((Element)param0).getElementsByTagName("moduAndOper");
		SavePower.deleteEntity(db,usermark);
		Set usermod = SavePower.getModule(moduleandcode);
		Map usercode = SavePower.getCode(moduleandcode,usermod);
		for(Iterator i=usermod.iterator();i.hasNext();){
			String menuid = (String)i.next();
			String code = (String)usercode.get(menuid);
			SavePower.addEntity(db,usermark,menuid,code);
		}//for
		
		return 1;
	}
	
	public static void deleteEntity(PersistenceBroker db,int usermark){
		Connection con = null;
		Statement st = null;
		String sqlstr = "delete from " + SavePower.SYSUSERMENU + " where OPERATORID=" + usermark;
		try{
			con = db.getConnection();
			st = con.createStatement();
			st.executeUpdate(sqlstr);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(st!=null) st.close();
				if(con!=null) con.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
			}
			
		}
		
	
	
	
	}
	
	public static void deleteRoleEntity(PersistenceBroker db,String rolemark){
		Connection con = null;
		Statement st = null;
		//String sqlstr = "delete from " + SavePower.EOSROLEMENU + " where ROLEID'=" + rolemark+"'";
		String sqlstr = "delete from " + SavePower.EOSROLEMENU + " where ROLEID = '" + rolemark+"'";
		try{
			con = db.getConnection();
			st = con.createStatement();
			st.executeUpdate(sqlstr);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(st!=null) st.close();
				if(con!=null) con.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
			}
			
		}
	
	
	
	}
	
	
	
	public static void addEntity(PersistenceBroker db,int usermark,String menuid,String operatecode){
		String sqlstr = "insert into " + SavePower.SYSUSERMENU + "(OPERATORID,MENUID,RESOPIDCODE) values (?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try{
			con = db.getConnection();
			con.setAutoCommit(false);
			pst = con.prepareStatement(sqlstr);
			pst.setInt(1,usermark);
			pst.setString(2,menuid);
			pst.setString(3,operatecode);
			pst.executeUpdate();
			con.commit();
			
		}catch(Exception ex){
			//con.rollback();
			ex.printStackTrace();
		}finally{
			try{
				if(pst!=null) pst.close();
				if(con!=null) con.close();
			}catch(Exception ep){
				ep.printStackTrace();
			}
		}
		
	}
	
	public static void addRoleEntity(PersistenceBroker db,String rolemark,String menuid,String operatecode){
		String sqlstr = "insert into " + SavePower.EOSROLEMENU + "(ROLEID,MENUID,RESOPCODE) values (?,?,?)";
		Connection con = null;
		PreparedStatement pst = null;
		try{
			con = db.getConnection();
			con.setAutoCommit(false);
			pst = con.prepareStatement(sqlstr);
			pst.setString(1,rolemark);
			pst.setString(2,menuid);
			pst.setString(3,operatecode);
			//System.out.println("insert into  "+SavePower.EOSROLEMENU + " values ('"+menuid+"','"+rolemark+"','"+operatecode+"')");
			pst.executeUpdate();
			con.commit();
			
		}catch(Exception ex){
			//con.rollback();
			ex.printStackTrace();
		}finally{
			try{
				if(pst!=null) pst.close();
				if(con!=null) con.close();
			}catch(Exception ep){
				ep.printStackTrace();
			}
		}
		
	}
	
	
	
	
	public static Set getModule(NodeList list) throws Exception{
		Set set = Collections.synchronizedSet(new HashSet());
		int size = list.getLength();
		for(int i=0;i<size;i++){
			Node temp = list.item(i).getFirstChild();
			String value = temp.getNodeValue();
			if(value.indexOf(",")!=-1){
				String[] mid = value.split(",");
				set.add(mid[0]);
			}
		}
		
		
		return set;
	}
	
	public static Map getCode(NodeList list,Set set) throws Exception{
		Map map = new HashMap();
		int size = list.getLength();
		for(Iterator i=set.iterator();i.hasNext();){
			String ID = (String)i.next();
			StringBuffer buffer = new StringBuffer();
			for(int j=0;j<size;j++){
				Node temp = list.item(j).getFirstChild();
				String value = temp.getNodeValue();
				String moPo1[] = value.split(",");
				if(moPo1.length>0){
			        if (ID.equalsIgnoreCase(moPo1[0])) {
			          if (moPo1[1] != null && !moPo1[1].equalsIgnoreCase(""))
			            buffer.append(moPo1[1] + ","); //保存一个模块对应的所有操作权限代码;
			        }
			     }//if
				
			}//for
			String Permission_Code = buffer.toString();
			String pcAll = Permission_Code.substring(0,Permission_Code.lastIndexOf(","));
			map.put(ID,pcAll);
		}//for
		return map;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_saverole
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="角色资源权限"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="角色标识节点"
	 */
	public static int BL_saverole(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);//角色资源权限
		Node param1 = (Node)param.getParaObjectAt(1);//角色标识节点
		
		PersistenceBroker db = param.getDBBroker();
		String pvalue = param1.getFirstChild().getNodeValue();
		String rolemark = pvalue;
		
		NodeList moduleandcode = ((Element)param0).getElementsByTagName("moduAndOper");
		
		SavePower.deleteRoleEntity(db,rolemark);//删除存在的权限
		
		Set rolemod = SavePower.getModule(moduleandcode);//得到选中的角色资源
		
		Map rolecode = SavePower.getCode(moduleandcode,rolemod);//得到选中的角色操作代码
		for(Iterator i=rolemod.iterator();i.hasNext();){
			String menuid = (String)i.next();
			String code = (String)rolecode.get(menuid);
			SavePower.addRoleEntity(db,rolemark,menuid,code);
		}//for
		
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
	 * @bizlet_displayName BL_saveresource
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int BL_saveresource(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		PersistenceBroker db = param.getDBBroker();
		NodeList moduleandcode = ((Element)param0).getElementsByTagName("moduAndOper");
		boolean execute = false;
		String condition = "";
		String sql = "update eosmenu set REMARK='1' where MENUID in";
		if(moduleandcode!=null && moduleandcode.getLength() > 0) {
			execute = true;
			for(int i = 0; i < moduleandcode.getLength(); i++) {
				condition += "'" + moduleandcode.item(i).getFirstChild().getNodeValue() + "',";
			}
			condition += "'talentfcclzymark','talentfccfzymark'";
		}
		sql += "(" + condition + ")";
		System.out.println("@[[[[[[[[[update sql=" + sql);
		String sql1 = "update EOSMENU set REMARK='0'";
		Connection con = null;
		Statement st = null;
		Statement st1 = null;
		if(execute) {
			try{
				con = db.getConnection();
				st1 = con.createStatement();
				st1.executeUpdate(sql1);
				if(st1!=null)st1 = null;
				
				st = con.createStatement();
				st.executeUpdate(sql);
				
			}catch(Exception e){
				e.printStackTrace();
			
			}finally{
				try{
					if(st!=null) st.close();
					if(con!=null) con.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			
		}
		
		return 1;
	}
}