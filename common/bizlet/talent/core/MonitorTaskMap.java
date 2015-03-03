package talent.core;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.*;

import com.primeton.eos.wf.persistence.converter.DateConverter;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-3-26
 * @class_displayName MonitorTaskMap
 */

public class MonitorTaskMap {
	private static Log log = LogFactory.getLog(MonitorTaskMap.class);

	/**
	 * 在Web中保存监视器任务
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName saveInstantTaskInWeb
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入posid"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入taskTypeid"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入操作者ip"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入操作者姓名"
	 */
	public static int saveInstantTaskInWeb(Document doc, BizContext param)
		throws Exception {
		String posid = (String) param.getParaObjectAt(0);
		String taskTypeid = (String) param.getParaObjectAt(1);
		String ip = (String) param.getParaObjectAt(2);
		String name = (String) param.getParaObjectAt(3);
		
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		PreparedStatement st = null;
		try{
			conn = db.getConnection();
			String sql="insert into MonitorTask (MonitorTaskID,Deviceid,Devicetypeid,Executetime,Finished,Instant,Retrytimes,Result,Createdtime,Tasktypeid,Operatorip,Operatorname)" +
					" (select Max(MonitorTaskID)+1,?,1,getdate(),0,1,0,-1,getdate(),?,?,? from MonitorTask)";
			st=conn.prepareStatement(sql);
			st.setString(1,posid);
			st.setString(2,taskTypeid);
			st.setString(3,ip);
			st.setString(4,name);
			st.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
			log.error(e);
			return 0;
		}
		finally{
				try{
					
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}

	/**
	 * 检查并生成系统任务，系统任务核心方法
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_checkOutSystemTask
	 */
	public static int BL_checkOutSystemTask(Document doc, BizContext param) throws Exception{
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		try{
			conn = db.getConnection();
			checkOutSystemTask(conn);
		}
		finally{
				try{
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		return 1;
	}
	
    /**
     * 检查并生成系统任务，系统任务核心方法
     *  
     */
    public static void checkOutSystemTask(Connection conn) {
    	Statement st=null;
    	PreparedStatement pst=null;
    	try {
            st = conn.createStatement();
            String checkCollectStr = "select * from MonitorTask m where m.tasktypeid=1 and instant=0 and finished=0";
            String checkConfigPOSStr = "select * from MonitorTask m where m.tasktypeid=4 and instant=0 and finished=0";
            String checkClearDataStr = "select * from MonitorTask m where m.tasktypeid=5 and instant=0 and finished=0";

            Calendar calendar;
            Date executetime;
            
            int MonitorTaskID=0 ;
            ResultSet rs=st.executeQuery("select Max(MonitorTaskID) from  MonitorTask  ");
            if(rs.next())
            	MonitorTaskID=rs.getInt(1);
            rs.close();
            
            
            //判断有没有已经存在的系统采集任务
            ResultSet rsCollect=st.executeQuery(checkCollectStr);
           
            if (!rsCollect.next()) {
                
               
                /** 获取最近执行时间 */
                executetime = Calendar.getInstance().getTime();

                int interval = TalentFunctions.getInt(getConfigureInfo(st,"TaskIntervalMinutes"),0);
                Date startTime = DateConvert.StringToDate2(DateConvert.fotmatDate2(executetime)
                        		+ " " + getConfigureInfo(st,"TaskStartTimePerDay"));
                Date endTime = DateConvert.StringToDate2(DateConvert.fotmatDate2(executetime)
                        		+ " " + getConfigureInfo(st,"TaskEndTimePerDay"));

                if (executetime.before(startTime)) {
                    executetime = startTime; //直接取开始时间
                } else if (executetime.after(endTime)) {
                    calendar = new GregorianCalendar();
                    calendar.setTime(startTime);
                    calendar.add(Calendar.DATE, 1); //开始时间加1
                    executetime = calendar.getTime();
                } else {
                    calendar = new GregorianCalendar();
                    calendar.setTime(startTime);
                    while (calendar.getTime().before(executetime)) {
                        calendar.add(Calendar.MINUTE, interval);
                    }
                    if (calendar.getTime().after(endTime))
                        executetime = endTime;
                    else
                        executetime = calendar.getTime();
                }
                /***/
                MonitorTaskID++;
                String sql="insert into MonitorTask (MonitorTaskID,Deviceid,Devicetypeid,Executetime,Finished,Instant,Retrytimes,Result,Tasktypeid,Operatorip,Operatorname) " +
                		"values (?,?,?,?,?,?,?,?,?,?,?)";
                pst=conn.prepareStatement(sql);
                pst.setInt(1,MonitorTaskID);
                pst.setInt(2,0);			//Deviceid  0表示所有有效的收费机
                pst.setInt(3,1); 			//Devicetypeid 1表示POS
                pst.setDate(4, new java.sql.Date(executetime.getTime())); //Executetime
                pst.setInt(5,0); 			//Finished
                pst.setInt(6,0); 			//Instant  系统任务
                pst.setInt(7,0); 			//Retrytimes
                pst.setInt(8,-1); 			//Result
                pst.setInt(9,1); 			//Tasktypeid 1表示采集数据
                pst.setString(10,"127.0.0.1"); 	//Operatorip
                pst.setString(11,"监控器");   	//Operatorname
                pst.executeUpdate();
                
               
            }
            rsCollect.close();
            
            //判断有没有已经存在的系统节假日下传任务
            if (false) {
            	ResultSet rsConfigPOS=st.executeQuery(checkConfigPOSStr);
                if (!rsConfigPOS.next()) {
                    /** 获取最近执行时间 */
                    executetime = Calendar.getInstance().getTime();
                    Date startTime = DateConvert.StringToDate2(DateConvert.fotmatDate2(executetime)
                            + " " + getConfigureInfo(st,"StartTimeOfConfigPOSInHoliday"));

                    calendar = new GregorianCalendar();
                    calendar.setTime(startTime);
                    while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY
                            || calendar.getTime().before(executetime)) { //该时间必须晚于当前时间
                        calendar.add(Calendar.DATE, 1); //获取最近的星期六日期
                    }
                    executetime = calendar.getTime();

                    for (int i = 0; i < 2; i++) {
                    	int tasktypeid;
                    	Date executetimeExt;
                        if (i == 0) {
                        	executetimeExt = executetime;
                            tasktypeid=4; //4表示节假日下传数据
                        } else {
                            Date endTime = DateConvert.StringToDate2(DateConvert.fotmatDate2(executetime)
                                            + " " + getConfigureInfo(st,"EndTimeOfConfigPOSInHoliday"));
                            calendar = new GregorianCalendar();
                            calendar.setTime(endTime);
                            calendar.add(Calendar.DATE, 1); //结束时间比开始时间晚一天
                            executetimeExt=calendar.getTime();
                            tasktypeid = 3; //3表示普通下传数据
                        }
                        MonitorTaskID++;
                        String sql="insert into MonitorTask (MonitorTaskID,Deviceid,Devicetypeid,Executetime,Finished,Instant,Retrytimes,Result,Tasktypeid,Operatorip,Operatorname) " +
                        		"values (?,?,?,?,?,?,?,?,?,?,?)";
                        pst=conn.prepareStatement(sql);
                        pst.setInt(1,MonitorTaskID);
                        pst.setInt(2,0);			//Deviceid  0表示所有有效的收费机
                        pst.setInt(3,1); 			//Devicetypeid 1表示POS
                        pst.setDate(4, new java.sql.Date(executetimeExt.getTime())); //Executetime
                        pst.setInt(5,0); 			//Finished
                        pst.setInt(6,0); 			//Instant  系统任务
                        pst.setInt(7,0); 			//Retrytimes
                        pst.setInt(8,-1); 			//Result
                        pst.setInt(9,tasktypeid); 			//Tasktypeid 
                        pst.setString(10,"127.0.0.1"); 	//Operatorip
                        pst.setString(11,"监控器");   	//Operatorname
                        pst.executeUpdate();
                        
                    }
                }
            }

            //判断有没有已经存在的系统清除数据任务
            ResultSet rsClearData=st.executeQuery(checkClearDataStr);
            if (!rsClearData.next()) {
                
                /** 获取最近执行时间 */
                executetime = Calendar.getInstance().getTime();
                Date clearDataTime = DateConvert.StringToDate2(DateConvert.fotmatDate2(executetime)
                        + " " + getConfigureInfo(st,"ClearDataTimePerDay"));
                if (executetime.before(clearDataTime)) {
                    executetime = clearDataTime; //直接取当天清除数据时间
                } else {
                    calendar = new GregorianCalendar();
                    calendar.setTime(clearDataTime);
                    calendar.add(Calendar.DATE, 1);
                    executetime = calendar.getTime();
                }
                /***/
                MonitorTaskID++;
                String sql="insert into MonitorTask (MonitorTaskID,Deviceid,Devicetypeid,Executetime,Finished,Instant,Retrytimes,Result,Tasktypeid,Operatorip,Operatorname) " +
                		"values (?,?,?,?,?,?,?,?,?,?,?)";
                pst=conn.prepareStatement(sql);
                pst.setInt(1,MonitorTaskID);
                pst.setInt(2,0);			//Deviceid  0表示所有有效的收费机
                pst.setInt(3,1); 			//Devicetypeid 1表示POS
                pst.setTimestamp(4, new Timestamp(executetime.getTime())); //Executetime
                pst.setInt(5,0); 			//Finished
                pst.setInt(6,0); 			//Instant  系统任务
                pst.setInt(7,0); 			//Retrytimes
                pst.setInt(8,-1); 			//Result
                pst.setInt(9,5); 			//Tasktypeid 5表示清除数据
                pst.setString(10,"127.0.0.1"); 	//Operatorip
                pst.setString(11,"监控器");   	//Operatorname
                pst.executeUpdate();
            }
            rsClearData.close();

        } catch (Exception ex) {
            log.error(ex);
        } finally {
        	try{
				if(st!=null) st.close();
				if(pst!=null) pst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
        }
    }

    public static String getConfigureInfo(Statement st,String ConfigureName){
    	String result=null;
    	try{
    		String sql="select * from Configure where ConfigureName='"+ConfigureName+"'";
    		ResultSet rs=st.executeQuery(sql);
    		if(rs.next())
    			result=rs.getString("ConfigureInfo");
    		rs.close();
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	return result;
    }
    
}