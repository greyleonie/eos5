package talent.util;


import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-29
 * @class_displayName TalentExit
 */

public class TalentExit {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_logout
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="userID"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="remoteAddr"
	 */
	public static int BL_logout(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String userID = param0.getFirstChild().getNodeValue();
		String ip = param1.getFirstChild().getNodeValue();
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String curTime = sdf1.format(date);
		String cutDate = sdf2.format(date);
		long logID = -1;
		
		//select top 1 * from sys_log where convert(nvarchar(10),logindate,126)='2007-01-29' and userID='sysadmin' order by logID desc
		String sql = "select top 1 * from sys_log where convert(nvarchar(10),logindate,126)='" + curTime + "' and userID='" + userID + "' and IP='" + ip + "' order by logID desc";
		System.out.println("##############exit's query current user log sql:" + sql);
		
		try{
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				logID = rs.getLong("LOGID");
			}
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			
			
			String updateSql = "update sys_log set LOGOUTDATE=? where LOGID=" + logID;
			System.out.println("##############exit's update log sql:" + updateSql);
			PreparedStatement pst = con.prepareStatement(updateSql);
			pst.setString(1,cutDate);
			pst.executeUpdate();
			
			if(pst!=null) pst.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(con!=null) con.close();
				con = null;
				
			}catch(Exception ee) {
				
			}
		
		}
		
		

		return 1;
	}

}