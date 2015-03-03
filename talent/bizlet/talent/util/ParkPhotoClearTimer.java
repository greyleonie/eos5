package talent.util;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.*;

import base.util.DBconnection;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-8-27
 * @class_displayName ParkPhotoClearTimer
 */

public class ParkPhotoClearTimer  extends TimerTask {
	private Log fccLog = LogFactory.getLog(TalentAware.class);
	public void run() {
		try{
			fccLog.info("----------------------------------------开始执行线程体run-------------------------------------");
			clearPhoto();


		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 将停车记录表的上个月的图片文件清空
	 *
	 */
	public void clearPhoto() throws Exception {
		
		Date currentTime = Calendar.getInstance().getTime();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		//String baseDate = sdf.format(currentTime);
		int curYear = currentTime.getYear() + 1900;
		int curMonth = currentTime.getMonth() + 1;
		int lastMonth = 0;
		if(curMonth==1) {
			lastMonth = 12;
			curYear = curYear -1;
		}else{
			lastMonth = curMonth-1;
		}
		String strmonth = String.valueOf(lastMonth);
		if(lastMonth<10){
			strmonth = "0" + strmonth;
		}
		String baseDate = String.valueOf(curYear) + "-" +strmonth;
		String updateSql = "update ParkReadCardRecord set ComeCarPic='',LeaveCarPic='' where convert(nvarchar(7),LeaveTime,126) ='" + baseDate + "'";
		Connection con = null;
		Statement pst = null;

		try{
			con = new DBconnection().getEOSConnection();
			pst = con.createStatement();
			pst.executeUpdate(updateSql);
			if(pst!=null) pst.close();
			pst = null;
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
		    if(con!=null) con.close();
		    con = null;
	   }
	}
	
	public static void main(String[] args){
		ParkPhotoClearTimer p = new ParkPhotoClearTimer();
		p.run();
	}
}