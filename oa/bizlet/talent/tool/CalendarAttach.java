package talent.tool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import java.util.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-10-8
 * @class_displayName CalendarAttach
 */

public class CalendarAttach {

	/**
	 * 添加时间段内的日程安排
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_InsertCalAttach
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="日程数据实体"
	 */
	public static int BL_InsertCalAttach(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
			
		String CALENDARstr = ((Element)param0).getElementsByTagName("CALENDAR").item(0).getFirstChild().getNodeValue();
		String TASKSUM = ((Element)param0).getElementsByTagName("TASKSUM").item(0).getFirstChild().getNodeValue();
		String endDatestr = ((Element)param0).getElementsByTagName("endDate").item(0).getFirstChild().getNodeValue();
		String TASKCONTENT = ((Element)param0).getElementsByTagName("TASKCONTENT").item(0).getFirstChild().getNodeValue();
		String ISREMIND = ((Element)param0).getElementsByTagName("ISREMIND").item(0).getFirstChild().getNodeValue();
		String AWOKETIME = ((Element)param0).getElementsByTagName("AWOKETIME").item(0).getFirstChild().getNodeValue();
		
		String USERID = ((Element)param0).getElementsByTagName("USERID").item(0).getFirstChild().getNodeValue();
		String IsOut = ((Element)param0).getElementsByTagName("IsOut").item(0).getFirstChild().getNodeValue();
		String beginTime = ((Element)param0).getElementsByTagName("beginTime").item(0).getFirstChild().getNodeValue();
		String endTime = ((Element)param0).getElementsByTagName("endTime").item(0).getFirstChild().getNodeValue();
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();

		int SchMaxID = getPriaryTemp(con,"Schedule","ScheduleID");       //
		//比较日期相隔的天数
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date CALENDAR = sdf.parse(CALENDARstr);
		Date endDate = sdf.parse(endDatestr);
		int day = (int)((endDate.getTime()-CALENDAR.getTime())/(1000*60*60*24));

		
		for(int i=0;i<=day;i++){
			String dates = sdf.format(new Date(CALENDAR.getTime() + i * 24 * 60 * 60 * 1000));
			String insertSql = "insert into Schedule(ScheduleID,CALENDAR,USERID,TASKSUM,TASKCONTENT,ISREMIND,AWOKETIME,IsOut,beginTime,endTime) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(insertSql);
			pst.setInt(1,SchMaxID+1+i);
			pst.setString(2,dates);
			pst.setString(3,USERID);
			pst.setString(4,TASKSUM);
			pst.setString(5,TASKCONTENT);
			pst.setString(6,ISREMIND);
			pst.setString(7,AWOKETIME);
			pst.setString(8,IsOut);
            pst.setString(9,beginTime);
            pst.setString(10,endTime);
			pst.executeUpdate();
		}
		if(con!=null) con.close();
		
		return 1;
	}
	
	public static int getPriaryTemp(Connection cn,String tableName,String marked) {
		int i = 0;
		String sqlstr = "select max(" + marked + ") as AA from " + tableName;

		Statement st = null;
		ResultSet rs = null;
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			if(rs.next()) {
				i = rs.getInt("AA");
			}
			
		}catch(Exception e) {
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
			}catch(Exception ex) {
				
			}
		}
		
		return i+1;
		
	}
}