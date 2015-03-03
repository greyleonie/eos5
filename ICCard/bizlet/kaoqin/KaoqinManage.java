package kaoqin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.w3c.dom.*;

import talent.core.TalentFunctions;

import base.util.DBconnection;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author 陈绍栋
 * @version 1.0
 * @date 2007-4-9
 * @class_displayName KaoqinManage
 */

public class KaoqinManage {

	/**
	 * 保存外出考勤
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_saveOutKaoqin
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入ClassID"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Kaoqin" name="" desc="输入考勤(Kaoqin)实体 "
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入缺勤学员list"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="操作人"
	 */
	public static int BL_saveOutKaoqin(Document doc, BizContext param)
		throws Exception {
		String ClassID = (String) param.getParaObjectAt(0);
		Element Kaoqin = (Element) param.getParaObjectAt(1);
		Node qxList = (Node) param.getParaObjectAt(2);
		String operator = (String) param.getParaObjectAt(3);
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs2= null;
		try{
			DBconnection db = new DBconnection();
			con = db.getEOSConnection();
			//con.setAutoCommit(false);
			st = con.createStatement();
			
			String StartTime = TalentFunctions.getNodeValueByTagName(Kaoqin,"StartTime");
			int StartWubie = TalentFunctions.getInt(TalentFunctions.getNodeValueByTagName(Kaoqin,"StartWubie"));
			String EndTime = TalentFunctions.getNodeValueByTagName(Kaoqin,"EndTime");
			int EndWubie = TalentFunctions.getInt(TalentFunctions.getNodeValueByTagName(Kaoqin,"EndWubie"));
			HashMap courseMap = getCourseMap(con,ClassID,StartTime,EndTime);
			List timeList = getTimeList(StartTime,StartWubie,EndTime,EndWubie,courseMap); //需要考勤的时间
			HashMap queqinMap = getQueqinMap(qxList); //把缺勤学员ID放到map里面
			
			String selSql = "select studentLaterLogsID from StudentlaterLogs where StudentID =? and datediff(dd,checkTime,?)=0 and wubie = ?";
			String insertSql="insert into StudentlaterLogs (StudentId,checkTime,state,wubie,singleTime,operator) values(?,?,?,?,0,?)";
			String updateSql="update StudentlaterLogs set checkTime = ? ,state =? ,CreatTime = getdate(),operator=? where StudentID =? and datediff(dd,checkTime,?)=0 and wubie = ? ";
			rs=st.executeQuery("select s.StudentID from Student s ,Eosoperator e where s.StudentID=e.operatorID and e.status=1 and s.ClassID="+ClassID);
			while(rs.next()){
				int studentID = rs.getInt(1);
				int state = 0; //考勤状态， 0 为正常
				if(queqinMap.get(String.valueOf(studentID))!=null)
					state = 2; //考勤状态， 2 为旷课
				for(int i=0;i<timeList.size();i++){
					String times[] = (String[]) timeList.get(i);
					String timeStr = times[0];
					int wubie = Integer.parseInt(times[1]);
					Date checkTime = null;
					if(wubie==0)
						checkTime = TalentFunctions.stringToDateTime(timeStr+" 08:45:00"); // 上午
					else
						checkTime = TalentFunctions.stringToDateTime(timeStr+" 14:30:00"); //下午
					PreparedStatement pst0 = con.prepareStatement(selSql);
					pst0.setInt(1,studentID);
					pst0.setString(2,timeStr);
					pst0.setInt(3,wubie);
					rs2 = pst0.executeQuery();
					if(rs2.next()){ //有则修改
						PreparedStatement pst = con.prepareStatement(updateSql);
						pst.setDate(1,new java.sql.Date(checkTime.getTime()));
						pst.setInt(2,state);
						pst.setString(3,operator);
						pst.setInt(4,studentID);
						pst.setString(5,timeStr);
						pst.setInt(6,wubie);
						pst.executeUpdate();
						pst.close();
					}
					else{  //无则新增
						PreparedStatement pst = con.prepareStatement(insertSql);
						pst.setInt(1,studentID);
						pst.setDate(2,new java.sql.Date(checkTime.getTime()));
						pst.setInt(3,state);
						pst.setInt(4,wubie);
						pst.setString(5,operator);
						pst.executeUpdate();
						pst.close();
					}
					pst0.close();
				}
				
			}
			
			
			//con.commit();
		}catch(Exception e) {
			e.printStackTrace();
			if(con!=null)
				con.rollback();
			return 0;
			
		}finally{
			try{
				if(rs2!=null) rs.close();
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
			}catch(Exception e) {
				
			}
		}
		return 1;
	}

	
	public static HashMap getQueqinMap(Node node){
		HashMap map = new HashMap();
		NodeList nodeList = node.getChildNodes();
		for(int i=0;i<nodeList.getLength();i++){
			Node newNode = nodeList.item(i);
			String value=XmlUtil.getNodeValue(newNode);
			map.put(value,value);
		}
		
		return map;
	}
	
	public static  List getTimeList(String startTime , int startWubie , String endTime , int endWubie ,HashMap courseMap){
		List list = new ArrayList();
		int diffdates = TalentFunctions.diffdatesExt(startTime,endTime);
		for(int i=0;i<=diffdates;i++){
			String newDate = TalentFunctions.addDays(startTime,i);
			for(int j=0;j<=1;j++){  //午别
				if(i==0&&j<startWubie)
					continue;
				if(i==diffdates&&j>endWubie)
					continue;
				if(courseMap.get(newDate+"_"+j)!=null){
					String times[] = new String[2];
					times[0] = newDate;
					times[1] = String.valueOf(j);
					list.add(times);
				}
			}
			
		}
		
		
		return list;
	}
	
	public static HashMap getCourseMap(Connection conn , String ClassID , String StartTime ,String EndTime  ){
		HashMap map = new HashMap();
		String sql = "select CourseID,ClassDate,ClassNoon from Course where convert(nvarchar(10),ClassDate,126) >=? and convert(nvarchar(10),ClassDate,126) <=? and ClassID =? and IsUseKQJ =1" ;
		try{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,StartTime);
			pst.setString(2,EndTime);
			pst.setString(3,ClassID);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				String classDate = rs.getString("ClassDate");
				if(classDate!=null&&classDate.length()>=10)
					classDate = classDate.substring(0,10);
				String key = classDate+"_"+rs.getString("ClassNoon");
				map.put(key,rs.getString("CourseID"));
			}
			if(rs!=null)	rs.close();
			if(pst!=null)	pst.close();
			
		}
		catch(Exception e){
			
		}
		return map;
	}
	
	public static void main(String arg[]){
		List list = getTimeList("2007-1-12",1,"2007-1-13",0,null);
		
		for(int i=0;i<list.size();i++){
			String times[] = (String[]) list.get(i);
			System.out.println(times[0]+" ____ "+times[1] );
		}
		
	}
}