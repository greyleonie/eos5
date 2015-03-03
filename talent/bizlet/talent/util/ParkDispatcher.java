/*
 * �������� 2007-7-31
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
//		String devCardIDStr = req.getParameter("devCardID");          //���ˢ��״̬��Ϣ
//		String conCode = req.getParameter("ConnectCode");              //���ں�
//		String deviceID = req.getParameter("deviceID");                //�豸��
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
	 * ����ͣ��ˢ������
	 * @param req
	 * @param resp
	 */
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) {
		String devCardIDStr = req.getParameter("devCardID");            //���ˢ��״̬��Ϣ
		String conCode = req.getParameter("ConnectCode");               //���ں�
		String deviceID = req.getParameter("deviceID");                 //�豸��
		
		String IsConSume = req.getParameter("IsConSume");             //�Ƿ񿨽���
		
		String ip = req.getRemoteAddr();
//		System.out.println("ip=============="+ip);
		String photoPath = "\\\\"+ip+"\\D$\\park.jpg";
//		System.out.println("photoPath---"+photoPath);
		
		Connection con = null;
		DBconnection db = new DBconnection();
		con = db.getEOSConnection();//ȡ��EOS�����е�����
		String state = "begin";
		try{
			if(devCardIDStr!=null){
				String url = "";
				int cardstatus = getCardStatusFromDev(devCardIDStr).intValue();          //��ÿ�״̬��167��ʾ��ˢ����168��ʾ��ˢ����169��ʾˢ�����ѷ���
				if(getCardStatusFromDev(devCardIDStr).intValue()==167){       //��ˢ������
					url = "/talent/page/park/noReadCard.jsp";       
					state = "noReadCard";
					if(IsConSume!=null&&IsConSume.equals("0")){                       
						url = "/talent/page/park/ReReadCardmsg.jsp";  
					}
					req.setAttribute("state",state);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
				    return;
				}else if(getCardStatusFromDev(devCardIDStr).intValue()==168){  //��ʾ��ˢ��
					int innerCardID = getInnerCardIDFromDev(devCardIDStr).intValue();      //ȡ���߼�����
					int cardID = getCardID(con,innerCardID);                                //ȡ��������
					Date curDate = Calendar.getInstance().getTime();                        //��ǰʱ��
					if(cardID!=0){
						//int deviceID = getDeviceIDFromDev(devCardIDStr).intValue();          //����
						if(isEnableCard(con,cardID)){                                              //У��������
							if(isChkReadCard(con)){                                                 //����Ƿ���ʱ����ˢ��,�޸Ĳ�ˢ����Ϣ
								int cardType = this.getCardTypeByCardID(con,cardID);
								int recordID = 0;
								if(cardType==1){                                                      //ѧԱ�����Բ�ˢ��
									recordID = updateChkReadCard(con,cardID,cardType);
									state = "chkReadCardok";                                          //��ˢ���ɹ�״̬
								}else {
									recordID = updateChkReadCardBack(con,cardID,cardType);
									state = "chkReadCardfail";                                         //ʧ�ܵĲ�ˢ��                      
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

							}else if(!isUserComeReadCard(con,cardID)&&!isReLeaveReadCard(con,cardID,curDate,5)){         //����ˢ��
								url = "/talent/page/park/CarComeIn.jsp";
								state = "come";
								int cardType = this.getCardTypeByCardID(con,cardID);                                     //ˢ���û�����
								addReadCardRecord(con,cardID,cardType,curDate);                                           //���ͣ����¼
								ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
								int RecordID = puc2.getRecordID();
								updatePicture(con,RecordID,"ComeCarPic",photoPath);                                       //���ץ��ͼƬ
								String lastCarNO = this.getLastCarNO(con,cardID);
								req.setAttribute("lastCarNO",lastCarNO);
							}else if(isReComeReadCard(con,cardID,2)){                                                     //�ظ�ˢ��,��������
								url = "/talent/page/park/CarComeIn.jsp";
								state = "reComeReadCard";
								
								ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
								int RecordID = puc2.getRecordID();
								updatePicture(con,RecordID,"ComeCarPic",photoPath);            //���ץ��ͼƬ
								
								String lastCarNO = this.getLastCarNO(con,cardID);
								req.setAttribute("lastCarNO",lastCarNO);
							}else if(isReLeaveReadCard(con,cardID,curDate,5)){                                              //�뿪ʱ�ظ�ˢ��,5������
								url = "/talent/page/park/CarLeave.jsp";
								state = "reLeaveReadCard";
							}else if(isUserLeaveReadCard(con,cardID)){                                                  //�����޸���Ϣ
								url = "/talent/page/park/CarLeave.jsp";
								state = "leave";
								int PayStyle = 0;
								int cardType = this.getCardTypeByCardID(con,cardID);            //ˢ���û�����
								float money = this.getParkMoney(con,cardID,curDate);                              //ͣ�����ѽ�� 
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
									
									if(IsConSume!=null&&IsConSume.equals("2")){              //����������Ҫ�ֽ���
										state = "consumefail";
										PayStyle = 2;
									}	
								}else if(cardType == 5 && money>0) PayStyle = 2;
								
								updateReadCardRecord(con,cardID,curDate,money,PayStyle);                //�����޸ļ�¼��Ϣ
									
								ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
								int RecordID = puc2.getRecordID();
								updatePicture(con,RecordID,"LeaveCarPic",photoPath);            //���ͼƬ
								
								
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
						}else{                            //��У�ڿ�
							state = "noparkCard";
							url = "/talent/page/park/noparkCard.jsp";
							req.setAttribute("state",state);
							RequestDispatcher dispatcher = req.getRequestDispatcher(url);
							dispatcher.forward(req,resp);
							return;
						}			
					}else{        //��У�ڿ�
						state = "noparkCard";
						url = "/talent/page/park/noparkCard.jsp";
						req.setAttribute("state",state);
						RequestDispatcher dispatcher = req.getRequestDispatcher(url);
						dispatcher.forward(req,resp);
						return;
					}
				}else if(getCardStatusFromDev(devCardIDStr).intValue()==169){     //��ʾˢ�����׳ɹ�
					int innerCardID = getInnerCardIDFromDev(devCardIDStr).intValue();      //ȡ���߼�����
					int cardID = getCardID(con,innerCardID);           //ȡ��������
					Date curDate = Calendar.getInstance().getTime();
						state = "consumesuccess";
						url = "/talent/page/park/CarLeave.jsp";
						
						float money = this.getParkMoney(con,cardID,curDate);       
						updateReadCardRecord2(con,cardID,curDate,money,1);                //�����޸ļ�¼��Ϣ
						
						
						ParkUserCard puc2 = this.getParkCardRecord(con,cardID);
						int RecordID = puc2.getRecordID();
						updatePicture(con,RecordID,"LeaveCarPic",photoPath);            //���ͼƬ
						
						float cardmoney = getCardMoneyFromDev(devCardIDStr).floatValue();        //�����
						int cardusenum = getCardUseNumFromDev(devCardIDStr).intValue();          //�����Ѵ���
						addBusinessLogs(con,puc2,cardmoney,cardusenum,ip);               //������Ѽ�¼

					ParkUserCard puc = this.getParkCardRecordByRecordID(con,RecordID);
					req.setAttribute("puc",puc);
					req.setAttribute("state",state);
					RequestDispatcher dispatcher = req.getRequestDispatcher(url);
					dispatcher.forward(req,resp);
					return;
				}
			}else{                         //û��ˢ������Ч�� 
				String operStatus = req.getParameter("operStatus");         //����״̬
				String photoStatus = req.getParameter("photoStatus");        //��Ƭ״̬
				
				if(operStatus!=null&&operStatus.equals("0")){        //����״̬Ϊ0 Ϊ ��ӳ��ƺ���
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
					
					if(IsChkReadStr!=null&&IsChkReadStr.equals("1")){            //��Ӳ�ˢ��״̬
						int IsChkRead = Integer.parseInt(IsChkReadStr);
						state = "chkCard";
						//updatePayMoney(con,RecordID,0,0,Remark);
						
						updateReReadCardStatus(con,RecordID,IsChkRead);
						
						//String url = "/talent/page/park/ChkReadCard.jsp";

					}else{                                                      //���ȷ��������Ϣ
						float ShouldMoney = Float.parseFloat(ShouldMoneyStr);
						float ArtualMoney = Float.parseFloat(ArtualMoneyStr);
						updatePayMoney(con,RecordID,ShouldMoney,ArtualMoney,Remark);
						

						addBusinessLogs(con,puc,0,0,ip);                           //������Ѽ�¼
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
				if(photoStatus!=null&&photoStatus.equals("0")){                      //��������ץ��ͼƬ
					String RecordIDStr = req.getParameter("RecordID2"); 
					
					int RecordID = Integer.parseInt(RecordIDStr);
					
					updatePicture(con,RecordID,"ComeCarPic",photoPath);            //���ͼƬ
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
				if(photoStatus!=null&&photoStatus.equals("1")){                          //��������ץ��ͼƬ
					String RecordIDStr = req.getParameter("RecordID2"); 
					
					int RecordID = Integer.parseInt(RecordIDStr);
					
					updatePicture(con,RecordID,"LeaveCarPic",photoPath);            //���ͼƬ
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
	 * ��ȡ������Ϣ
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
	 * ��ȡˢ������
	 * @param cardData
	 * @return
	 */
	public static Integer getDeviceIDFromDev(String cardData){
		return getCardMsgFromDev(cardData,0,2);
	}
	
	/**
	 * ��ȡˢ��״̬
	 * @param cardData
	 * @return
	 */
	public static Integer getCardStatusFromDev(String cardData){
		return getCardMsgFromDev(cardData,2,4);
	}	
	
	/**
	 * ��ȡ�߼�����
	 * @param cardData
	 * @return
	 */
	public static Integer getInnerCardIDFromDev(String cardData){
		return getCardMsgFromDev(cardData,4,12);
	}

	/**
	 * ��ȡ�����Ѵ���
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
	 * ��ȡ�������
	 * @param cardData
	 * @return
	 */
	public static Float getCardMoneyFromDev(String cardData){
		return new Float(getCardMsgFromDev(cardData,22,28).floatValue()/ 100F);
	}
	
	
	
	/**
	 * ȡ��������
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
	 * �ж��Ƿ���Ч��
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
	 * �����Ƿ����
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
	 * �Ƿ�������
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
	 * �û�ˢ������
	 * @param con
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public int getCardTypeByCardID(Connection con,int cardID) throws Exception {
		int cardType = -1;
		
		ParkUserCard puc = this.getUserByCardID(con,cardID);
		int userType = puc.getUserType();
		if(userType==0){       //�̹���
			
			cardType = 2;
		}else if(userType==1){    //ѧԱ��
			//�Ƿ���ЧѧԱ
			if(isEnableStudentCard(con,cardID))
				cardType = 1;            //��ЧѧԱ��
			else 
				cardType = 6;            //ѧԱ���������̿�ʹ��
		}else if(userType==2){                    //����
			String username = puc.getUserName();
			cardType = 6;                                  //�̿�
			if(username.indexOf("��ʱ��")>=0)  
			     cardType = 5;                  //��ʱ��
			if(isMonthCard(con,cardID))
				cardType = 4;       //�±���
		}else if(userType==4){          //ѧУ���ó���
			cardType = 3;
		}
		
		return cardType;
	}
	
	/**
	 * ͨ������ȡ���û���Ϣ
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
	 * �ж��Ƿ���ЧѧԱ��
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
	 * �Ƿ��±���
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
	 * ����û�ͣ��ˢ����¼
	 * @param con
	 * @param cardID
	 * @param cardType
	 * @param curDate
	 * @throws Exception
	 */
	public void addReadCardRecord(Connection con,int cardID,int cardType,Date curDate) throws Exception {
		int recordID = 0;        //ָ����¼ID
		String msql = "select max(RecordID) as maxRecordID from ParkReadCardRecord";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(msql);
		String comeTimeStr = null;
		if(rs.next()){
			recordID = rs.getInt("maxRecordID");
		}
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		
		String CarNO = "";             //���ƺ���
		if(cardType==3){                //���ó�����  //���ó���ӳ��ƺ���
			String carsql = "select ca.CarNO from CAR_CARINFO ca join Eosoperator eo on ca.CarID = eo.operatorID where operatorType = 4 and cardID=" + cardID;
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(carsql);
			if(rs2.next()){
				CarNO = rs2.getString("CarNO");
			}	
			if(rs2!=null) rs2.close();
			if(st2!=null) st2.close();
		}else if(cardType==4){          //�±���
			String carsql = "select CarNO from MonthCard where CardID = " + cardID;
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(carsql);
			if(rs2.next()){
				CarNO = rs2.getString("CarNO");
			}	
			if(rs2!=null) rs2.close();
			if(st2!=null) st2.close();
		}
		
		
		//���ͣ����¼
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
	 * �û�ͣ���������޸�ˢ����¼
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
	    int minutecount = getBetweenDateLength(comeTime,curDate);         //�ܼ�ʱ��(����)
	    int hourcount = minutecount/60;
	    if(minutecount>30) hourcount = 1;
	      
		float ParkRate = 0;
		if(money>0){

			float strCardPayRate1 = Float.parseFloat(getConfigureInfo(con,"TempCardOneHour"));            //ͣ��ʱ���������޼���Сʱ�䣨Сʱ��ÿСʱ�շѽ��
			ParkRate = strCardPayRate1;
		}
	
		String updateSql = "update ParkReadCardRecord set LeaveTime = '"+ dateStr +"',Status=0,countTime="+ minutecount +",ParkRate="+ ParkRate +",Money="+ money +",PayStyle="+ PayStyle +" where RecordID = "+ recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	
	/**
	 * �û�ͣ���������޸�ˢ����¼
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
	    int minutecount = getBetweenDateLength(comeTime,curDate);         //�ܼ�ʱ��(����)
	    int hourcount = minutecount/60;
	    if(minutecount>30) hourcount = 1;
	      
		float ParkRate = 0;
		if(money>0){

			float strCardPayRate1 = Float.parseFloat(getConfigureInfo(con,"TempCardOneHour"));            //ͣ��ʱ���������޼���Сʱ�䣨Сʱ��ÿСʱ�շѽ��
			ParkRate = strCardPayRate1;
		}
	
		String updateSql = "update ParkReadCardRecord set LeaveTime = '"+ dateStr +"',Status=0,countTime="+ minutecount +",ParkRate="+ ParkRate +",Money="+ money +",PayStyle="+ PayStyle +",ShouldMoney="+ money +",ArtualMoney="+ money +" where RecordID = "+ recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
	}
	/**
	 * ȡ��ͣ����¼��Ϣ
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
	 * �ж��Ƿ��ظ�ˢ��  ,����
	 * @param con
	 * @param cardID
	 * @param minute       ָ���ظ�ˢ��ʱ���(����)����Ч
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
	 * �ж��Ƿ��ظ�ˢ��   ����
	 * @param con
	 * @param cardID
	 * @param minute       ָ���ظ�ˢ��ʱ���(����)����Ч
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
	 * @description ��������ʱ�������ٷ���
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
	 * ȡ��ָ��������ӵ�ʱ��,ָ��ʱ��ǰ��ʱ��
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
	 * ��ͼƬ�����ݿ�
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
	 * ��ȡĬ�ϳ��ƺţ�ȡ�ϴγ��ƺ���
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
	 * ͣ�����ѽ��
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
	    
	    
		float money = 0;        //�շ�
		if(cardType==1||cardType==3||cardType==4)               //ѧԱ�����ó�,�±�����ȫ���շ�
			money=0;
		else if(cardType==2){           //�̹���,�ڹ���ʱ��β��շ�
			//int hours = this.getTeacherPayHour(con,comeTime,curDate);
			//money = getParkMoney(con,hours);
			money = getTeacherMoney(con,comeTime,curDate);
		}else if(cardType==5){          //��ʱ����Ҫ�շ�
			int hours = this.getTempCardPayHour(con,comeTime,curDate);
			money = this.getParkMoney(con,hours);
		}else if(cardType==6){          //�̿���Ҫ�շ�
			int hours = this.getTempCardPayHour(con,comeTime,curDate);
			money = this.getParkMoney(con,hours);
		}
		return money;
	}
	
	/**
	 * ��ʦ�շѽ�Ϊ������ʱ������Ч
	 * @param con
	 * @param beginTime
	 * @param endTime
	 * @return
	 * @throws Exception
	 */
	public float getTeacherMoney(Connection con,Date beginTime,Date endTime)  throws Exception{
		float money = 0;                  //��ʦ���
		int payhour = 0;                     //�̹��շ�ʱ���Сʱ��
//		String morBgeinTime = " 06:00:00";
//		String eveEndTime = " 23:59:00";	
		
		String morBgeinTime = getConfigureInfo(con,"TeacherParkFreeTimeStart");       //������ʼʱ��
		String eveEndTime = getConfigureInfo(con,"TeacherParkFreeTimeEnd");           //��������ʱ��
		SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date tempmorBgeinTime = sdf0.parse("2007-01-01 "+morBgeinTime);  
		Date tempeveEndTime = sdf0.parse("2007-01-01 "+eveEndTime);  
		int midHour = (int) ((tempeveEndTime.getTime() - tempmorBgeinTime.getTime()+1000)/(1000*60*60));
		
		//�жϿ�ʼʱ���Ƿ�������ʱ����
		//���ͣ��ʱ����ͣ��ʱ�䵱��6:00��23:59֮��,�뿪ʱ��Ҳ��ͣ��ʱ�䵱��6:00��23:59֮��,����
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String beginDate = sdf1.format(beginTime);
		String morTimeStr = beginDate + " "+ morBgeinTime;
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date morningbeginTime = sdf2.parse(morTimeStr);                       //��ʼʱ�������ʱ��

		Date eveningbeginTime = sdf2.parse(beginDate + " " + eveEndTime);             //��ʼʱ���������ֹʱ��
		
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
		String endDate = sdf3.format(endTime);
		String endTimeStr = endDate + " " + eveEndTime;
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date eveningendTime = sdf4.parse(endTimeStr);                    //����ʱ���������ֹʱ��   
		
		Date moringendTime = sdf4.parse(endDate +" " + morBgeinTime);             //����ʱ�������ʱ��
		
		int temphour = getDiffHour(con,beginTime,endTime);           //��Сʱ��
		int tempday = temphour/24;                                   //������
		int temphour2 = getDiffHour(con,beginTime,morningbeginTime);         //ͣ����������ʼʱ��ǰ��Сʱ��
		int temphour3 = getDiffHour(con,eveningbeginTime,endTime);           //ͣ������������ʱ�����Сʱ��
		
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
	 * ��ʱ�������̿��շ�ʱ���
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
	 * ������������ȡ������Ϣ
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
	 * ʱ��������Сʱ
	 * @param con
	 * @param beftime
	 * @param afttime
	 * @return
	 * @throws Exception
	 */
	private int getDiffHour(Connection con,Date beftime,Date afttime) throws Exception{
		int payhour = 0;
		int nopayMinute = 30;                //Ĭ��ʱ������       
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
	 * ͣ���շ�
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
		String strCardPayRate1 = getConfigureInfo(con,"TempCardOneHour");            //ͣ��ʱ���������޼���Сʱ�䣨Сʱ��ÿСʱ�շѽ��
		String strCardPayRate2 = getConfigureInfo(con,"TempCardTwelveHour");         //ͣ��ʱ���������޼����ʱ�䣨Сʱ���޼�	
		String strParkMinHour = getConfigureInfo(con,"ParkTopChargMinHour");     //ͣ��ʱ���������޼���Сʱ�䣨Сʱ��
		String strParkMaxHour = getConfigureInfo(con,"ParkTopChargMaxHour");     //ͣ��ʱ���������޼���Сʱ�䣨Сʱ��
		if(strCardPayRate1!=null) parkPayRate1 = Float.parseFloat(strCardPayRate1);
		if(strCardPayRate2!=null) parkPayRate2 = Float.parseFloat(strCardPayRate2);
		if(strParkMinHour!=null) parkMinHour = Integer.parseInt(strParkMinHour);
		if(strParkMaxHour!=null) parkMaxHour = Integer.parseInt(strParkMaxHour);
		
		int j = 0;                //���ٻ�����׼ʱ�����
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
	 * ��ӿ���
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
	 * �Ƿ�ˢ����ֻ����ʱ�����Բ�ˢ
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
	 * ����ʱ��������ˢ������
	 * @param con
	 * @param cardID             ��ˢ����
	 * @param cardType           ��ˢ������ 
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
		
		String updateSql = "update ParkReadCardRecord set Money = 0,PayStyle=0,ShouldMoney=0,ArtualMoney=0,Remark='��ˢ��',ChkReadCardID="+cardID+",ChkReadType="+ cardType+" where RecordID="+recordID;
		Statement pst = con.createStatement();
		pst.executeUpdate(updateSql);
		if(pst!=null) pst.close();
		pst = null;
		return recordID;
	}
	
	/**
	 * ����ʱ��������ˢ��ʧ�ܴ���������
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
	 * ȡ�ÿ���¼��Ϣ
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
	 * �޸Ĳ�ˢ��״̬
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
	 * �޸�ȷ�ϸ��ѽ��
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
	 * ������Ѽ�¼
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

