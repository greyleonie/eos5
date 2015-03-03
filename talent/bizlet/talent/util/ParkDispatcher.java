/*
 * 创建日期 2007-7-31
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.*;

import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import base.util.DBconnection;
import talent.core.TalentFunctions;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ParkDispatcher extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    doPost(req, resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("--------start process--------");
//		String camerastate = req.getParameter("camerastate"); 
//		if(camerastate!=null&&camerastate.equals("0")){
//			doProcess2(req,resp);
//		}else{
			doProcess(req,resp);
//		}
		System.out.println("--------end process--------");
	}
	
	
	public void init() throws ServletException { 
		
	}
	
//	public void doProcess2(HttpServletRequest req, HttpServletResponse resp) {
//		String devCardIDStr = req.getParameter("devCardID");          //获得刷卡状态信息
//		String conCode = req.getParameter("ConnectCode");              //串口号
//		String deviceID = req.getParameter("deviceID");                //设备号
//		try{
//			String url = "/talent/page/park/cameraPhoto.jsp";
//			req.setAttribute("devCardID",devCardIDStr);
//			req.setAttribute("ConnectCode",conCode);
//			req.setAttribute("deviceID",deviceID);
//			RequestDispatcher dispatcher = req.getRequestDispatcher(url);
//			dispatcher.forward(req,resp);
//		    return;
//		}catch(Exception e) {
//			e.printStackTrace();
//			
//	    }
//	}

	/**
	 * 处理停车刷卡请求
	 * @param req
	 * @param resp
	 */
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) {
		String devCardIDStr = req.getParameter("devCardID");            //获得刷卡状态信息
		String conCode = req.getParameter("ConnectCode");               //串口号
		String deviceID = req.getParameter("deviceID");                 //设备号
		
		String IsConSume = req.getParameter("IsConSume");             //是否卡交易
		
		String ip = req.getRemoteAddr();
//		System.out.println("ip=============="+ip);
		String photoPath = "\\\\"+ip+"\\D$\\park.jpg";
//		System.out.println("photoPath---"+photoPath);
		
		Connection con = null;
		DBconnection db = new DBconnection();
		con = db.getEOSConnection();//取到EOS配置中的连接
		String state = "begin";
		try{
			if(devCardIDStr!=null){
				String url = "";
				int cardstatus = getCardStatusFromDev(devCardIDStr).intValue();          //获得卡状态，167表示无刷卡，168表示有刷卡，169表示刷卡消费返回
				if(getCardStatusFromDev(devCardIDStr).intValue()==167){       //无刷卡请求
					url = "/talent/page/park/noReadCard.jsp";       
					state = "noReadCard";
					if(IsConSume!=null&&IsConSume.equals("0")){                       
						url = "/talent/page/park/ReReadCardmsg.jsp";  
					}
					req.setAttribute("state",state);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
				    return;
				}else if(getCardStatusFromDev(devCardIDStr).intValue()==168){  //表示有刷卡
					int innerCardID = getInnerCardIDFromDev(devCardIDStr).intValue();      //取得逻辑卡号
					int cardID = getCardID(con,innerCardID);                                //取得物理卡号
					Date curDate = Calendar.getInstance().getTime();                        //当前时间
					if(cardID!=0){
						//int deviceID = getDeviceIDFromDev(devCardIDStr).intValue();          //机号
						if(isEnableCard(con,cardID)){                                              //校内正常卡
							if(isChkReadCard(con)){                                                 //如果是否临时卡补刷卡,修改补刷卡信息
								int cardType = this.getCardTypeByCardID(con,cardID);
								int recordID = 0;
								if(cardType==1){                                                      //学员卡可以补刷卡
									recordID = updateChkReadCard(con,cardID,cardType);
									state = "chkReadCardok";                                          //补刷卡成功状态
								}else {
									recordID = updateChkReadCardBack(con,cardID,cardType);
									state = "chkReadCardfail";                                         //失败的补刷卡                      
								}
								
								ParkUserCard puc = this.getParkCardRecordByRecordID(con,recordID);
								//url = "/talent/page/park/ChkReadCardDo.jsp";
								url = "/talent/page/park/CarLeave.jsp";
								
								req.setAttribute("puc",puc);
								req.setAttribute("state",state);
								req.setAttribute("userIP",ip);
								req.setAttribute("ConnectCode",conCode);
								req.setAttribute("deviceID",deviceID);
								RequestDispatcher dispatcher = req.getRequestDispatcher(url);
								dispatcher.forward(req,resp);
							    return;

							}else if(!isUserComeReadCard(con,cardID)&&!isReLeaveReadCard(con,cardID,curDate,5)){         //进门刷卡
								url = "/talent/page/park/CarComeIn.jsp";
								state = "come";
								int cardType = this.getCardTypeByCardID(con,cardID);                                     //刷卡用户类型
								addReadCardRecord(con,cardID,cardType,curDate);                                           //添加停车记录
								ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
								int RecordID = puc2.getRecordID();
								updatePicture(con,RecordID,"ComeCarPic",photoPath);                                       //添加抓拍图片
								String lastCarNO = this.getLastCarNO(con,cardID);
								req.setAttribute("lastCarNO",lastCarNO);
							}else if(isReComeReadCard(con,cardID,2)){                                                     //重复刷卡,两分钟内
								url = "/talent/page/park/CarComeIn.jsp";
								state = "reComeReadCard";
								
								ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
								int RecordID = puc2.getRecordID();
								updatePicture(con,RecordID,"ComeCarPic",photoPath);            //添加抓拍图片
								
								String lastCarNO = this.getLastCarNO(con,cardID);
								req.setAttribute("lastCarNO",lastCarNO);
							}else if(isReLeaveReadCard(con,cardID,curDate,5)){                                              //离开时重复刷卡,5分钟内
								url = "/talent/page/park/CarLeave.jsp";
								state = "reLeaveReadCard";
							}else if(isUserLeaveReadCard(con,cardID)){                                                  //出门修改信息
								url = "/talent/page/park/CarLeave.jsp";
								state = "leave";
								int PayStyle = 0;
								int cardType = this.getCardTypeByCardID(con,cardID);            //刷卡用户类型
								float money = this.getParkMoney(con,cardID,curDate);                              //停车消费金额 
								if(cardType ==2 || cardType == 6 ){
									if(IsConSume==null&&money>0){
										url = "/talent/page/park/CardConsume.jsp";
										req.setAttribute("moneystr",String.valueOf(money));
										req.setAttribute("ConnectCode",conCode);
										req.setAttribute("deviceID",deviceID);
										RequestDispatcher dispatcher = req.getRequestDispatcher(url);
										dispatcher.forward(req,resp);
									    return;
									}
									
									if(IsConSume!=null&&IsConSume.equals("2")){              //卡余额不够，需要现金交易
										state = "consumefail";
										PayStyle = 2;
									}	
								}else if(cardType == 5 && money>0) PayStyle = 2;
								
								updateReadCardRecord(con,cardID,curDate,money,PayStyle);                //出门修改记录信息
									
								ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
								int RecordID = puc2.getRecordID();
								updatePicture(con,RecordID,"LeaveCarPic",photoPath);            //添加图片
								
								
							}
							ParkUserCard puc = this.getParkCardRecord(con,cardID);
							req.setAttribute("puc",puc);
							req.setAttribute("state",state);
							req.setAttribute("userIP",ip);
							req.setAttribute("ConnectCode",conCode);
							req.setAttribute("deviceID",deviceID);
							RequestDispatcher dispatcher = req.getRequestDispatcher(url);
							dispatcher.forward(req,resp);
						    return;
						}else{                            //非校内卡
							state = "noparkCard";
							url = "/talent/page/park/noparkCard.jsp";
							req.setAttribute("state",state);
							RequestDispatcher dispatcher = req.getRequestDispatcher(url);
							dispatcher.forward(req,resp);
							return;
						}			
					}else{        //非校内卡
						state = "noparkCard";
						url = "/talent/page/park/noparkCard.jsp";
						req.setAttribute("state",state);
						RequestDispatcher dispatcher = req.getRequestDispatcher(url);
						dispatcher.forward(req,resp);
						return;
					}
				}else if(getCardStatusFromDev(devCardIDStr).intValue()==169){     //表示刷卡交易成功
					int innerCardID = getInnerCardIDFromDev(devCardIDStr).intValue();      //取得逻辑卡号
					int cardID = getCardID(con,innerCardID);           //取得物理卡号
					Date curDate = Calendar.getInstance().getTime();
						state = "consumesuccess";
						url = "/talent/page/park/CarLeave.jsp";
						
						float money = this.getParkMoney(con,cardID,curDate);       
						updateReadCardRecord2(con,cardID,curDate,money,1);                //出门修改记录信息
						
						
						ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
						int RecordID = puc2.getRecordID();
						updatePicture(con,RecordID,"LeaveCarPic",photoPath);            //添加图片
						
						float cardmoney = getCardMoneyFromDev(devCardIDStr).floatValue();        //卡余额
						int cardusenum = getCardUseNumFromDev(devCardIDStr).intValue();          //卡消费次数
						addBusinessLogs(con,puc2,cardmoney,cardusenum,ip);               //添加消费记录

					ParkUserCard puc = this.getParkCardRecordByRecordID(con,RecordID);
					req.setAttribute("puc",puc);
					req.setAttribute("state",state);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
					return;
				}
			}else{                         //没有刷卡或无效卡 
				String operStatus = req.getParameter("operStatus");         //操作状态
				String photoStatus = req.getParameter("photoStatus");        //照片状态
				
				if(operStatus!=null&&operStatus.equals("0")){        //操作状态为0 为 添加车牌号码
					String carNOStr = req.getParameter("CarNO");  
					carNOStr = TalentFunctions.iso2gb(carNOStr);
					String RecordIDStr = req.getParameter("RecordID"); 
					
					int RecordID = Integer.parseInt(RecordIDStr);
					
					updateCarNO(con,RecordID,carNOStr);
					String url = "/talent/page/park/CarComeIn.jsp";
					state = "comeoper";
					ParkUserCard puc = this.getParkCardRecordByRecordID(con,RecordID);
					req.setAttribute("puc",puc);
					req.setAttribute("state",state);
					req.setAttribute("userIP",ip);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
				    return;
				}
				if(operStatus!=null&&operStatus.equals("1")){                     
					String RecordIDStr = req.getParameter("RecordID");            
					String IsChkReadStr = req.getParameter("IsChkRead"); 
					String ShouldMoneyStr = req.getParameter("ShouldMoney"); 
					String ArtualMoneyStr = req.getParameter("ArtualMoney"); 
					String Remark = req.getParameter("Remark");
					
					int RecordID = Integer.parseInt(RecordIDStr);
					ParkUserCard puc = this.getParkCardRecordByRecordID(con,RecordID);
					
					if(IsChkReadStr!=null&&IsChkReadStr.equals("1")){            //添加补刷卡状态
						int IsChkRead = Integer.parseInt(IsChkReadStr);
						state = "chkCard";
						//updatePayMoney(con,RecordID,0,0,Remark);
						
						updateReReadCardStatus(con,RecordID,IsChkRead);
						
						//String url = "/talent/page/park/ChkReadCard.jsp";

					}else{                                                      //添加确认消费信息
						float ShouldMoney = Float.parseFloat(ShouldMoneyStr);
						float ArtualMoney = Float.parseFloat(ArtualMoneyStr);
						updatePayMoney(con,RecordID,ShouldMoney,ArtualMoney,Remark);
						

						addBusinessLogs(con,puc,0,0,ip);                           //添加消费记录
						state = "leaveoper";
					}
					
					String url = "/talent/page/park/CarLeave.jsp";
					
					req.setAttribute("puc",puc);
					req.setAttribute("state",state);
					req.setAttribute("userIP",ip);
					req.setAttribute("ConnectCode",conCode);
					req.setAttribute("deviceID",deviceID);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
				    return;

				}
				if(photoStatus!=null&&photoStatus.equals("0")){                      //进门重新抓拍图片
					String RecordIDStr = req.getParameter("RecordID2"); 
					
					int RecordID = Integer.parseInt(RecordIDStr);
					
					updatePicture(con,RecordID,"ComeCarPic",photoPath);            //添加图片
					String url = "/talent/page/park/CarComeIn.jsp";
					state = "comephoto";
					ParkUserCard puc = this.getParkCardRecordByRecordID(con,RecordID);
					req.setAttribute("puc",puc);
					req.setAttribute("state",state);
					req.setAttribute("userIP",ip);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
				    return;
				}
				if(photoStatus!=null&&photoStatus.equals("1")){                          //出门重新抓拍图片
					String RecordIDStr = req.getParameter("RecordID2"); 
					
					int RecordID = Integer.parseInt(RecordIDStr);
					
					updatePicture(con,RecordID,"LeaveCarPic",photoPath);            //添加图片
					ParkUserCard puc = this.getParkCardRecordByRecordID(con,RecordID);
					String url = "/talent/page/park/CarLeave.jsp";
					state = "leave";
					req.setAttribute("puc",puc);
					req.setAttribute("state",state);
					req.setAttribute("userIP",ip);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
				    return;
				}	
				
				String url = "/talent/page/park/noReadCard.jsp";       
				state = "noReadCard";
				req.setAttribute("state",state);
				RequestDispatcher dispatcher = req.getRequestDispatcher(url);
				dispatcher.forward(req,resp);
			    return;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
				
		}finally{
			try{
				if(con!=null) con.close();
				con = null;
					
			}catch(Exception e) {
					
			}
			
		}

	}
	
	
	/**
	 * 提取卡内信息
	 * @param cardData
	 * @param begin
	 * @param end
	 * @return
	 */
	public static Integer getCardMsgFromDev(String cardData,int begin,int end) {
		try {
			return Integer.decode("0x" + cardData.substring(begin, end));
		} catch (NumberFormatException ex) {
			ex.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 提取刷卡机号
	 * @param cardData
	 * @return
	 */
	public static Integer getDeviceIDFromDev(String cardData){
		return getCardMsgFromDev(cardData,0,2);
	}
	
	/**
	 * 提取刷卡状态
	 * @param cardData
	 * @return
	 */
	public static Integer getCardStatusFromDev(String cardData){
		return getCardMsgFromDev(cardData,2,4);
	}	
	
	/**
	 * 提取逻辑卡号
	 * @param cardData
	 * @return
	 */
	public static Integer getInnerCardIDFromDev(String cardData){
		return getCardMsgFromDev(cardData,4,12);
	}

	/**
	 * 提取卡消费次数
	 * @param cardData
	 * @return
	 */
	public static Integer getCardUseNumFromDev(String cardData){
		try {
			return Integer.decode("0x" + cardData.substring(28));
		} catch (NumberFormatException ex) {
			ex.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 提取卡内余额
	 * @param cardData
	 * @return
	 */
	public static Float getCardMoneyFromDev(String cardData){
		return new Float(getCardMsgFromDev(cardData,22,28).floatValue()/ 100F);
	}
	
	
	
	/**
	 * 取得物理卡号
	 * @param con
	 * @param innerCardID
	 * @return
	 * @throws Exception
	 */
	public int getCardID(Connection con,int innerCardID)throws Exception{
		int cardID = 0;
		String sql = "select CardID from Card where InnerCardID = " + innerCardID ;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()){
			cardID = rs.getInt("CardID");
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return cardID;
		
	}
	
	/**
	 * 判断是否有效卡
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public boolean isEnableCard(Connection con,int cardID) throws Exception{
		boolean result = false;
		String sql = "select operatorID from Eosoperator where cardID =" + cardID;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()) {
			result = true;
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return result;
	}
	
	/**
	 * 车辆是否进门
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public boolean isUserComeReadCard(Connection con,int cardID) throws Exception{
		boolean result = false;
		String sql = "select RecordID from ParkReadCardRecord where status = 1 and cardID = " + cardID + " and IsChkRead =0 order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()) {
			result = true;
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return result;
	}
	
	/**
	 * 是否车辆出门
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public boolean isUserLeaveReadCard(Connection con,int cardID) throws Exception{
		boolean result = false;
		String sql = "select RecordID from ParkReadCardRecord where status = 1 and cardID = " + cardID + " and IsChkRead =0 order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()) {
			result = true;
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return result;
	}
	
	/**
	 * 用户刷卡类型
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public int getCardTypeByCardID(Connection con,int cardID) throws Exception {
		int cardType = -1;
		
		ParkUserCard puc = this.getUserByCardID(con,cardID);
		int userType = puc.getUserType();
		if(userType==0){       //教工卡
			
			cardType = 2;
		}else if(userType==1){    //学员卡
			//是否有效学员
			if(isEnableStudentCard(con,cardID))
				cardType = 1;            //有效学员卡
			else 
				cardType = 6;            //学员卡过期作绿卡使用
		}else if(userType==2){                    //宾客
			String username = puc.getUserName();
			cardType = 6;                                  //绿卡
			if(username.indexOf("临时卡")>=0)  
			     cardType = 5;                  //临时卡
			if(isMonthCard(con,cardID))
				cardType = 4;       //月保卡
		}else if(userType==4){          //学校公用车卡
			cardType = 3;
		}
		
		return cardType;
	}
	
	/**
	 * 通过卡号取得用户信息
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public ParkUserCard getUserByCardID(Connection con,int cardID) throws Exception {
		ParkUserCard puc = new ParkUserCard();
		String sql = "select operatorID,operatorName,operatorType from Eosoperator where status=1 and cardID="+cardID;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()) {
			int userID = rs.getInt("operatorID");
			String userName = rs.getString("operatorName");
			int userType = rs.getInt("operatorType");
			puc.setUserID(userID);
			puc.setUserName(userName);
			puc.setUserType(userType);
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return puc;
	}
	
	/**
	 * 判断是否有效学员卡
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public boolean isEnableStudentCard(Connection con,int cardID) throws Exception{
		boolean status = false;
		
		String sql = "select e.operatorID from Eosoperator e join Student s on e.operatorID= s.StudentID where s.classID in (select classID from class where Enable=1) "+
                    " and operatorType=1 and status=1 and cardID= " + cardID;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()) {
			status = true;
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return status;
	}
	
	/**
	 * 是否月保卡
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	private boolean isMonthCard(Connection con,int cardID) throws Exception{
		String sql = "select CardID,UserID,CarNO from MonthCard where GETDATE() between StartTime and EndTime and Enable=1 and CardID="+cardID;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
	    if(rs.next()){
	    	return true;
	    }
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		return false;
	}
	
	/**
	 * 添加用户停车刷卡记录
	 * @param con
	 * @param cardID
	 * @param cardType
	 * @param curDate
	 * @throws Exception
	 */
	public void addReadCardRecord(Connection con,int cardID,int cardType,Date curDate) throws Exception {
		int recordID = 0;        //指定记录ID
		String msql = "select max(RecordID) as maxRecordID from ParkReadCardRecord";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(msql);
		String comeTimeStr = null;
		if(rs.next()){
			recordID = rs.getInt("maxRecordID");
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		String CarNO = "";             //车牌号码
		if(cardType==3){                //公用车类型  //公用车添加车牌号码
			String carsql = "select ca.CarNO from CAR_CARINFO ca join Eosoperator eo on ca.CarID = eo.operatorID where operatorType = 4 and cardID=" + cardID;
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(carsql);
			if(rs2.next()){
				CarNO = rs2.getString("CarNO");
			}	
			if(rs2!=null) rs2.close();
			if(st2!=null) st2.close();
		}else if(cardType==4){          //月保卡
			String carsql = "select CarNO from MonthCard where CardID = " + cardID;
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(carsql);
			if(rs2.next()){
				CarNO = rs2.getString("CarNO");
			}	
			if(rs2!=null) rs2.close();
			if(st2!=null) st2.close();
		}
		
		
		//添加停车记录
		String insertSql = "insert into ParkReadCardRecord(RecordID,UserID,CardID,CardType,CarNO,ComeTime,Status,IsChkRead) values(?,?,?,?,?,?,?,?)";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateStr = sdf.format(curDate);
		
		ParkUserCard puc = this.getUserByCardID(con,cardID);
		int userID = puc.getUserID();
		
		PreparedStatement pst = con.prepareStatement(insertSql);
		pst.setInt(1,recordID+1);
		pst.setInt(2,userID);
		pst.setInt(3,cardID);
		pst.setInt(4,cardType);
		pst.setString(5,CarNO);
		pst.setString(6,dateStr);
		pst.setInt(7,1);
		pst.setInt(8,0);
		pst.executeUpdate();
		
		if(pst!=null) pst.close();
		pst = null;
	}
	
	/**
	 * 用户停车销卡，修改刷卡记录
	 * @param con
	 * @param cardID
	 * @param curDate
	 * @throws Exception
	 */
	public void updateReadCardRecord(Connection con,int cardID,Date curDate,float money,int PayStyle) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateStr = sdf.format(curDate);
		
		int cardType = 0;
		int recordID = 0;
		String comeTimeStr = null;
		String sql = "select RecordID,ComeTime,CardType from ParkReadCardRecord where Status=1 and cardID="+cardID +" and IsChkRead=0 order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
	    if(rs.next()){
	    	recordID = rs.getInt("RecordID");
	    	comeTimeStr = rs.getString("ComeTime");
	    	cardType = rs.getInt("CardType");
	    }
		if(rs!=null) rs.close();
		if(st!=null) st.close();
	    
	    System.out.println("------------"+comeTimeStr);
	    Date comeTime = sdf.parse(comeTimeStr);
	    int minutecount = getBetweenDateLength(comeTime,curDate);         //总计时长(分钟)
	    int hourcount = minutecount/60;
	    if(minutecount>30) hourcount = 1;
	      
		float ParkRate = 0;
		if(money>0){

			float strCardPayRate1 = Float.parseFloat(getConfigureInfo(con,"TempCardOneHour"));            //停车时间段内最高限价最小时间（小时）每小时收费金额
			ParkRate = strCardPayRate1;
		}
	
		String updateSql = "update ParkReadCardRecord set LeaveTime = '"+ dateStr +"',Status=0,countTime="+ minutecount +",ParkRate="+ ParkRate +",Money="+ money +",PayStyle="+ PayStyle +" where RecordID = "+ recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	
	/**
	 * 用户停车销卡，修改刷卡记录
	 * @param con
	 * @param cardID
	 * @param curDate
	 * @throws Exception
	 */
	public void updateReadCardRecord2(Connection con,int cardID,Date curDate,float money,int PayStyle) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateStr = sdf.format(curDate);
		
		int cardType = 0;
		int recordID = 0;
		String comeTimeStr = null;
		String sql = "select RecordID,ComeTime,CardType from ParkReadCardRecord where Status=1 and cardID="+cardID +" and IsChkRead=0 order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
	    if(rs.next()){
	    	recordID = rs.getInt("RecordID");
	    	comeTimeStr = rs.getString("ComeTime");
	    	cardType = rs.getInt("CardType");
	    }
		if(rs!=null) rs.close();
		if(st!=null) st.close();
	    
	    System.out.println("------------"+comeTimeStr);
	    Date comeTime = sdf.parse(comeTimeStr);
	    int minutecount = getBetweenDateLength(comeTime,curDate);         //总计时长(分钟)
	    int hourcount = minutecount/60;
	    if(minutecount>30) hourcount = 1;
	      
		float ParkRate = 0;
		if(money>0){

			float strCardPayRate1 = Float.parseFloat(getConfigureInfo(con,"TempCardOneHour"));            //停车时间段内最高限价最小时间（小时）每小时收费金额
			ParkRate = strCardPayRate1;
		}
	
		String updateSql = "update ParkReadCardRecord set LeaveTime = '"+ dateStr +"',Status=0,countTime="+ minutecount +",ParkRate="+ ParkRate +",Money="+ money +",PayStyle="+ PayStyle +",ShouldMoney="+ money +",ArtualMoney="+ money +" where RecordID = "+ recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	/**
	 * 取得停车记录信息
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public ParkUserCard getParkCardRecord(Connection con,int cardID) throws Exception{
		ParkUserCard puc = null;
		
		String sql = "select top 1 RecordID,UserID,CardType,CarNO,ComeTime,LeaveTime,Status,CountTime,ParkRate,Money,PayStyle,ShouldMoney,ArtualMoney,Remark from ParkReadCardRecord where CardID = " + cardID + " order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String comeTimeStr = null;
		if(rs.next()){

			puc = new ParkUserCard();
			puc.setRecordID(rs.getInt("RecordID"));
			puc.setUserID(rs.getInt("UserID"));
			puc.setCardType(rs.getInt("CardType"));
			puc.setCarNO(rs.getString("CarNO"));
			puc.setComeTime(rs.getString("ComeTime"));
			puc.setLeaveTime(rs.getString("LeaveTime"));
			puc.setStatus(rs.getInt("Status"));
			puc.setCountTime(rs.getInt("CountTime"));
			puc.setParkRate(rs.getFloat("ParkRate"));
			puc.setMoney(rs.getFloat("Money"));
			puc.setPayStyle(rs.getInt("PayStyle"));
			puc.setShouldMoney(rs.getFloat("ShouldMoney"));
			puc.setArtualMoney(rs.getFloat("ArtualMoney"));
			puc.setRemark(rs.getString("Remark"));
			
			
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return puc;
	}
	
	/**
	 * 判断是否重复刷卡  ,进门
	 * @param con
	 * @param cardID
	 * @param minute       指定重复刷卡时间段(分钟)内有效
	 * @return
	 * @throws Exception
	 */
	public boolean isReComeReadCard(Connection con,int cardID,int minute) throws Exception{
		boolean result = false;
		String sql = "select RecordID,ComeTime from ParkReadCardRecord where status = 1 and cardID = " + cardID + " and IsChkRead =0 order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String comeTimeStr = null;
		if(rs.next()){
			comeTimeStr = rs.getString("ComeTime");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date comeTime = sdf2.parse(comeTimeStr);
			Date curDate = Calendar.getInstance().getTime();
			int diffMinute = getBetweenDateLength(comeTime,curDate);
			if(diffMinute<=minute){
				result = true;
			}
		}
		
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return result;
	}
	
	
	/**
	 * 判断是否重复刷卡   出门
	 * @param con
	 * @param cardID
	 * @param minute       指定重复刷卡时间段(分钟)内有效
	 * @return
	 * @throws Exception
	 */
	public boolean isReLeaveReadCard(Connection con,int cardID,Date curTime,int minute) throws Exception{
		boolean result = false;
		Date minLeaveTime = getMinDateByDiffMinute(curTime,minute);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String curTimeStr = sdf.format(curTime);
		String minLeaveTimeStr = sdf.format(minLeaveTime);
		
		String sql = "select RecordID from ParkReadCardRecord where status =0 and cardID = "+ cardID +" and LeaveTime between '"+ minLeaveTimeStr +"' and '"+ curTimeStr +"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String comeTimeStr = null;
		if(rs.next()){
			result = true;
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return result;
	}
	
	/**
	 * @description 计算两个时间相差多少分钟
	 * @param date1
	 * @param date2
	 * @return
	 */
	private int getBetweenDateLength(Date date1,Date date2) {
		int result = 0;
		if(date1.equals(date2)) return 0;
		
		if(date1.before(date2)) {
			int difMinutes = (int) ((date2.getTime() - date1.getTime())/(1000*60));
			return difMinutes;
			
		
		}
		if(date1.after(date2)) {
			int difMinutes = (int) ((date1.getTime() - date2.getTime())/(1000*60));
			return difMinutes;
			
		}
		
		return result;
	}
	
	/**
	 * 取得指定相隔分钟的时间,指定时间前的时间
	 * @param date1
	 * @param minute
	 * @return
	 */
	private Date getMinDateByDiffMinute(Date date1,int minute){
		long tempdate = date1.getTime()- minute *1000*60;
		Date date2 = new Date(tempdate);
		
		return date2;
	}
	
	/**
	 * 放图片到数据库
	 * @param con
	 * @param RecordID
	 * @param picField
	 * @param path
	 * @throws Exception
	 */
	public void updatePicture(Connection con,int RecordID,String picField,String path)throws Exception{
		byte[] file = getFileContent(path);
		String sql = "update ParkReadCardRecord set " + picField + "=? where RecordID=" + RecordID;
		PreparedStatement pst =  con.prepareStatement(sql);
		pst.setBytes(1,file);
		pst.executeUpdate();
	}
	
	public static byte[] getFileContent(String filePath) {
		File file = null;
		FileInputStream in = null;
		BufferedInputStream bin = null;
		ByteArrayOutputStream byteOut = null;
		byte[] b = null;
		try{
			file = new File(filePath);
			in = new FileInputStream(file);
			bin = new BufferedInputStream(in);
			byte[] r = new byte[2048];
			int i = 0;
			byteOut = new ByteArrayOutputStream();
			while((i = bin.read(r))!=-1) {
				byteOut.write(r,0,i);
			}
			b = byteOut.toByteArray();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(byteOut!=null) byteOut.close();
				if(bin!=null) bin.close();
				if(in!=null) in.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return b;
	
	}
	
	/**
	 * 获取默认车牌号，取上次车牌号码
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public String getLastCarNO(Connection con,int cardID)throws Exception{
		String lastCarNO = "";
		String sql = "select CarNO from ParkReadCardRecord where CardID = " + cardID + " and CarNO !='' order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String comeTimeStr = null;
		if(rs.next()){
			lastCarNO = rs.getString("CarNO");
		}
		return lastCarNO;
	
	}
	
	/**
	 * 停车消费金额
	 * @param con
	 * @param cardID
	 * @param curDate
	 * @return
	 * @throws Exception
	 */
	public float getParkMoney(Connection con,int cardID,Date curDate)throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		String dateStr = sdf.format(curDate);
		
		int cardType = 0;
		String comeTimeStr = null;
		String sql = "select ComeTime,CardType from ParkReadCardRecord where Status=1 and cardID="+cardID +"  and IsChkRead=0  order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
	    if(rs.next()){
	    	comeTimeStr = rs.getString("ComeTime");
	    	cardType = rs.getInt("CardType");
	    }
	    System.out.println("------------"+comeTimeStr);
	    Date comeTime = sdf.parse(comeTimeStr);
//	    int minutecount = getBetweenDateLength(comeTime,curDate);
	    
	    
		float money = 0;        //收费
		if(cardType==1||cardType==3||cardType==4)               //学员，公用车,月保卡完全不收费
			money=0;
		else if(cardType==2){           //教工卡,在工作时间段不收费
			//int hours = this.getTeacherPayHour(con,comeTime,curDate);
			//money = getParkMoney(con,hours);
			money = getTeacherMoney(con,comeTime,curDate);
		}else if(cardType==5){          //临时卡需要收费
			int hours = this.getTempCardPayHour(con,comeTime,curDate);
			money = this.getParkMoney(con,hours);
		}else if(cardType==6){          //绿卡需要收费
			int hours = this.getTempCardPayHour(con,comeTime,curDate);
			money = this.getParkMoney(con,hours);
		}
		return money;
	}
	
	/**
	 * 教师收费金额，为非正常时段内有效
	 * @param con
	 * @param beginTime
	 * @param endTime
	 * @return
	 * @throws Exception
	 */
	public float getTeacherMoney(Connection con,Date beginTime,Date endTime)  throws Exception{
		float money = 0;                  //教师金额
		int payhour = 0;                     //教工收费时间段小时数
//		String morBgeinTime = " 06:00:00";
//		String eveEndTime = " 23:59:00";	
		
		String morBgeinTime = getConfigureInfo(con,"TeacherParkFreeTimeStart");       //正常开始时间
		String eveEndTime = getConfigureInfo(con,"TeacherParkFreeTimeEnd");           //正常结束时间
		SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date tempmorBgeinTime = sdf0.parse("2007-01-01 "+morBgeinTime);  
		Date tempeveEndTime = sdf0.parse("2007-01-01 "+eveEndTime);  
		int midHour = (int) ((tempeveEndTime.getTime() - tempmorBgeinTime.getTime()+1000)/(1000*60*60));
		
		//判断开始时间是否在正常时间内
		//如果停车时间在停车时间当天6:00和23:59之内,离开时间也在停车时间当天6:00和23:59之内,正常
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String beginDate = sdf1.format(beginTime);
		String morTimeStr = beginDate + " "+ morBgeinTime;
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date morningbeginTime = sdf2.parse(morTimeStr);                       //开始时间的早上时间

		Date eveningbeginTime = sdf2.parse(beginDate + " " + eveEndTime);             //开始时间的晚上终止时间
		
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
		String endDate = sdf3.format(endTime);
		String endTimeStr = endDate + " " + eveEndTime;
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date eveningendTime = sdf4.parse(endTimeStr);                    //结束时间的晚上终止时间   
		
		Date moringendTime = sdf4.parse(endDate +" " + morBgeinTime);             //结束时间的早上时间
		
		int temphour = getDiffHour(con,beginTime,endTime);           //总小时数
		int tempday = temphour/24;                                   //总天数
		int temphour2 = getDiffHour(con,beginTime,morningbeginTime);         //停车在正常开始时间前总小时数
		int temphour3 = getDiffHour(con,eveningbeginTime,endTime);           //停车在正常结束时间后总小时数
		
		if(beginTime.before(morningbeginTime)){
			if(endTime.before(morningbeginTime)){
				payhour = temphour;
			}else if(endTime.after(morningbeginTime)&&endTime.before(eveningbeginTime)){
				payhour = temphour2;
			}else if(endTime.after(eveningbeginTime)&&endTime.before(moringendTime)){
				payhour = temphour - tempday * midHour ;
			}else{
				payhour = temphour2 - tempday * midHour ;
			}
		}else{
			if(endTime.after(morningbeginTime)&&endTime.before(eveningbeginTime)){
				payhour = 0;
			}else if(endTime.after(eveningbeginTime)&&endTime.before(moringendTime)){
				payhour = temphour3 - tempday * midHour ;
			}else{
				payhour = temphour - tempday * midHour ;
			}
		}
		
		money = getParkMoney(con,(payhour-(24-midHour)*tempday)) + getParkMoney(con,tempday*(24-midHour))*tempday;
		return money;
	}
	
	/**
	 * 临时卡或者绿卡收费时间段
	 * @param beginTime
	 * @param endTime
	 * @return
	 * @throws Exception
	 */
	private int getTempCardPayHour(Connection con,Date beginTime,Date endTime)  throws Exception{
		int payhour = 0;
		
		if(beginTime.before(endTime)){
			payhour = getDiffHour(con,beginTime,endTime);
		}
		
		return payhour;
	}
	
	/**
	 * 根据配置名获取配置信息
	 * @param configureName
	 * @return
	 * @throws Exception
	 */
	public String getConfigureInfo(Connection con,String configureName) throws Exception{
		String configureInfo = "";
		String sql = "select ConfigureInfo from Configure where ConfigureName = '"+ configureName +"'";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				configureInfo = rs.getString(1);
			}
			if(rs!=null) rs.close();
			if(st!=null) st.close();
		
		return configureInfo;
	}
	
	/**
	 * 时间段内相差小时
	 * @param con
	 * @param beftime
	 * @param afttime
	 * @return
	 * @throws Exception
	 */
	private int getDiffHour(Connection con,Date beftime,Date afttime) throws Exception{
		int payhour = 0;
		int nopayMinute = 30;                //默认时间段免费       
		String strnopayMinute = getConfigureInfo(con,"ParkNoChargMinute");
		if(strnopayMinute!=null)
			nopayMinute = Integer.parseInt(strnopayMinute);
		int diffMinute = (int) ((afttime.getTime() - beftime.getTime())/(1000*60));
		if(diffMinute <= nopayMinute) payhour = 0;
		else if(diffMinute > nopayMinute && diffMinute<60) payhour=1;
		else{
			payhour = diffMinute/60;
		}
		
		return payhour;
	}
	
	/**
	 * 停车收费
	 * @param con
	 * @param payhour
	 * @return
	 * @throws Exception
	 */
	public float getParkMoney(Connection con,int payhour) throws Exception{
		float money = 0;
		float parkPayRate1 = 0;
		float parkPayRate2 = 0;
		int parkMinHour = 0;
		int parkMaxHour = 0;
		String strCardPayRate1 = getConfigureInfo(con,"TempCardOneHour");            //停车时间段内最高限价最小时间（小时）每小时收费金额
		String strCardPayRate2 = getConfigureInfo(con,"TempCardTwelveHour");         //停车时间段内最高限价最大时间（小时）限价	
		String strParkMinHour = getConfigureInfo(con,"ParkTopChargMinHour");     //停车时间段内最高限价最小时间（小时）
		String strParkMaxHour = getConfigureInfo(con,"ParkTopChargMaxHour");     //停车时间段内最高限价最小时间（小时）
		if(strCardPayRate1!=null) parkPayRate1 = Float.parseFloat(strCardPayRate1);
		if(strCardPayRate2!=null) parkPayRate2 = Float.parseFloat(strCardPayRate2);
		if(strParkMinHour!=null) parkMinHour = Integer.parseInt(strParkMinHour);
		if(strParkMaxHour!=null) parkMaxHour = Integer.parseInt(strParkMaxHour);
		
		int j = 0;                //多少基本标准时间个数
		while(payhour>parkMaxHour){
			payhour = payhour - parkMaxHour;
			j++;
		}
		if(payhour>0 && payhour<=parkMinHour){
			money = parkPayRate1 * payhour + j*parkPayRate2;
		}else if(payhour>parkMinHour && payhour <= parkMaxHour){
			money = (j+1)*parkPayRate2 ;
		}
				
		return money;
	}
	
	
	/**
	 * 添加卡号
	 * @param con
	 * @param RecordID
	 * @param carNO
	 * @throws Exception
	 */
	public void updateCarNO(Connection con,int RecordID,String carNO) throws Exception{
		String updateSql = "update ParkReadCardRecord set CarNO ='" + carNO + "' where RecordID = " + RecordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	
	
	/**
	 * 是否补刷卡，只有临时卡可以补刷
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public boolean isChkReadCard(Connection con) throws Exception{
		boolean result = false;
		
		String sql = "select RecordID from ParkReadCardRecord where CardType = 5 and IsChkRead = 1 and ChkReadCardID is null order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String comeTimeStr = null;
		if(rs.next()){
			result = true;
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return result;
	}
	
	/**
	 * 对临时卡的作补刷卡处理
	 * @param con
	 * @param cardID             补刷卡号
	 * @param cardType           补刷卡类型 
	 * @throws Exception
	 */
	public int updateChkReadCard(Connection con,int cardID,int cardType) throws Exception{
		int recordID = 0;
		String sql = "select RecordID from ParkReadCardRecord where CardType = 5 and IsChkRead = 1 and ChkReadCardID is null order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
	    if(rs.next()){
	    	recordID = rs.getInt("RecordID");
	    }
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		String updateSql = "update ParkReadCardRecord set Money = 0,PayStyle=0,ShouldMoney=0,ArtualMoney=0,Remark='补刷卡',ChkReadCardID="+cardID+",ChkReadType="+ cardType+" where RecordID="+recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
		return recordID;
	}
	
	/**
	 * 对临时卡的作补刷卡失败处理，作返回
	 * @param con
	 * @param cardID
	 * @param cardType
	 * @return
	 * @throws Exception
	 */
	public int updateChkReadCardBack(Connection con,int cardID,int cardType) throws Exception{
		int recordID = 0;
		String sql = "select RecordID from ParkReadCardRecord where CardType = 5 and IsChkRead = 1 and ChkReadCardID is null order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
	    if(rs.next()){
	    	recordID = rs.getInt("RecordID");
	    }
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		String updateSql = "update ParkReadCardRecord set IsChkRead = 0 where RecordID="+recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
		return recordID;
	}
	/**
	 * 取得卡记录信息
	 * @param con
	 * @param RecordID
	 * @return
	 * @throws Exception
	 */
	private ParkUserCard getParkCardRecordByRecordID(Connection con,int RecordID)throws Exception{
		ParkUserCard puc = null;
		
		String sql = "select * from ParkReadCardRecord where RecordID = " + RecordID + " order by RecordID desc";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		String comeTimeStr = null;
		if(rs.next()){

			puc = new ParkUserCard();
			puc.setRecordID(rs.getInt("RecordID"));
			puc.setUserID(rs.getInt("UserID"));
			puc.setCardID(rs.getInt("CardID"));
			puc.setCardType(rs.getInt("CardType"));
			puc.setCarNO(rs.getString("CarNO"));
			puc.setComeTime(rs.getString("ComeTime"));
			puc.setLeaveTime(rs.getString("LeaveTime"));
			puc.setStatus(rs.getInt("Status"));
			puc.setCountTime(rs.getInt("CountTime"));
			puc.setParkRate(rs.getFloat("ParkRate"));
			puc.setMoney(rs.getFloat("Money"));
			puc.setPayStyle(rs.getInt("PayStyle"));
			puc.setShouldMoney(rs.getFloat("ShouldMoney"));
			puc.setArtualMoney(rs.getFloat("ArtualMoney"));
			puc.setRemark(rs.getString("Remark"));
	
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		return puc;
	}
	
	/**
	 * 修改补刷卡状态
	 * @param con
	 * @param RecordID
	 * @param IsChkRead
	 * @throws Exception
	 */
	public void updateReReadCardStatus(Connection con,int RecordID,int IsChkRead) throws Exception{
		String updateSql = "update ParkReadCardRecord set IsChkRead =" + IsChkRead + " where RecordID = " + RecordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	
	/**
	 * 修改确认付费金额
	 * @param con
	 * @param RecordID
	 * @param IsChkRead
	 * @throws Exception
	 */
	public void updatePayMoney(Connection con,int RecordID,float ShouldMoney,float ArtualMoney,String Remark) throws Exception{
		String updateSql = "update ParkReadCardRecord set ShouldMoney =" + ShouldMoney + ",ArtualMoney="+ArtualMoney+",Remark='"+ Remark +"' where RecordID = " + RecordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	
	
	/**
	 * 添加消费记录
	 * @param con
	 * @param puc
	 * @param cardmoney
	 * @param cardusenum
	 * @param ip
	 * @throws Exception
	 */

	public void addBusinessLogs(Connection con,ParkUserCard puc,float cardmoney,int cardusenum,String ip) throws Exception{
		int BusinessLogsID = 0;
		int BusinessTypeID = 0;
		float BusinessMoney = 0;
		String sql = "select max(BusinessLogsID) as MaxLogsID from BusinessLogs ";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
	    if(rs.next()){
	    	BusinessLogsID = rs.getInt("MaxLogsID");
	    }
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		int payStyle = puc.getPayStyle();
		
		if(payStyle==1){
			BusinessTypeID = 12;
			BusinessMoney = puc.getMoney();
		}
		else if(payStyle==2){
			BusinessTypeID = 11;
			BusinessMoney = puc.getArtualMoney();
		}
		
		String insertsql = "insert into BusinessLogs(BusinessLogsID,BusinessTypeID,HappeningTime,UserID,CardUsingTimes,BusinessMoney,Balance,OperatorIP,IsCheckOut,Invoiced,Enable) values(?,?,?,?,?,?,?,?,?,?,?)";
		int userID = puc.getUserID();
		
		PreparedStatement pst = con.prepareStatement(insertsql);
		pst.setInt(1,BusinessLogsID+1);
		pst.setInt(2,BusinessTypeID);
		pst.setString(3,puc.getLeaveTime());
		pst.setInt(4,puc.getUserID());
		pst.setInt(5,cardusenum);
		pst.setFloat(6,BusinessMoney);
		pst.setFloat(7,cardmoney);
		pst.setString(8,ip);
		pst.setInt(9,0);
		pst.setInt(10,0);
		pst.setInt(11,1);
		pst.executeUpdate();
		
		if(pst!=null) pst.close();
		pst = null;
	}
	
	public static void main(String[] args){
//		String dev = "02A900001A980007D001000007D00000";
//		float card = getCardMsgFromDev(dev,22,28).floatValue()/ 100F;
////		int card = getCardMsgFromDev(dev,2,4).intValue();
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>"+card);
	}
}

