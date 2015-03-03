package talent.util;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


import base.util.DBconnection;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-5-15
 * @class_displayName LoadEOSMenu
 */

public class EOSMenuMap {
	
	private Log log = LogFactory.getLog(EOSMenuMap.class);

	 public void loadMenu(ServletContext servletContext ) {
	 	log.info("--------开始加载EOS菜单----------");
	 	Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList EOSMenuList = new ArrayList();
		String sql = "select * from EOSMenu order by parentsID asc , displayOrder asc";
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				EOSMenu eosMenu = new EOSMenu();
				eosMenu.setMenuID(rs.getString("menuID"));
				eosMenu.setMenuName(rs.getString("menuName"));
				eosMenu.setMenuAction(rs.getString("menuAction"));
				eosMenu.setParentsID(rs.getString("parentsID"));
				EOSMenuList.add(eosMenu);
			}
		}
	 	catch(Exception e){
	 		e.printStackTrace();
	 	}
		finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
			}
			catch(Exception e){
				
			}
		}
	 	
	 	servletContext.setAttribute("EOSMenuList",EOSMenuList);
	 	log.info("--------加载EOS菜单成功----------");
	 }
	 
	 public List getEOSMenuListByParentsID(ServletContext servletContext , String parentsID){
	 	List list = new ArrayList();
	 	try{
	 		List menuList =  (List) servletContext.getAttribute("EOSMenuList");
	 		EOSMenu eosMenu = null;
	 		for(int i=0;i<menuList.size();i++){
	 			eosMenu = (EOSMenu) menuList.get(i);
	 			if(parentsID.equals(eosMenu.getParentsID()))
	 				list.add(eosMenu);
	 		}
	 	}
	 	catch (Exception e){
	 		e.printStackTrace();
	 	}
	 	
	 	return list;
	 }
}