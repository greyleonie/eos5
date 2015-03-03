package ICCard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import talent.core.CardDataConvert;
import talent.core.Constants;
import talent.core.TalentFunctions;

import com.primeton.tp.common.crypto.EOSCipherTool;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author 陈绍栋
 * @version 1.0
 * @date 2007-3-9
 * @class_displayName CardManage
 */

public class CardManage {

	/**
	 * IC卡注册
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_AddCard
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入Card实体"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出注册失败个数"
	 */
	public static int BL_AddCard(Document doc, BizContext param)
		throws Exception {
		Element Card = (Element) param.getParaObjectAt(0);
		Node failNum = (Node) param.getParaObjectAt(1);
		String CardTypeID=TalentFunctions.getAvailStr(Card.getElementsByTagName("CardTypeID").item(0).getFirstChild().getNodeValue());
		String Cost=TalentFunctions.getAvailStr(Card.getElementsByTagName("Cost").item(0).getFirstChild().getNodeValue());
		String CardIDes=TalentFunctions.getAvailStr(Card.getElementsByTagName("CardIDes").item(0).getFirstChild().getNodeValue());
		String cardcount=TalentFunctions.getAvailStr(Card.getElementsByTagName("cardcount").item(0).getFirstChild().getNodeValue());
		String Remark=TalentFunctions.getAvailStr(Card.getElementsByTagName("Remark").item(0).getFirstChild().getNodeValue());
		String CardCoverNO=TalentFunctions.getAvailStr(Card.getElementsByTagName("CardCoverNO").item(0).getFirstChild().getNodeValue());
		
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		PreparedStatement st = null;
		int failCount=0;
		try{
			conn = db.getConnection();
			String sql="insert into Card (CardID,CardCoverNO,CardTypeID,StateID,Cost,Remark) values(?,?,?,?,?,?)";
			st = conn.prepareStatement(sql);
			st.setString(3,CardTypeID);
			st.setString(4,"1");
			st.setFloat(5,Float.parseFloat(Cost));
			st.setString(6,Remark);
			
			int start = 0, end = 0;

            //分析卡面编号的格式，是DX开头还是全数字
            String prefixStr = ""; //即将存入数据库的字符串前缀
            int sublen = 0;
            if (CardCoverNO.length()>0) {

                if (CardCoverNO.substring(0, 2).equals("DX")) {
                    sublen = CardCoverNO.length() - 2;
                    CardCoverNO = CardCoverNO.substring(2, CardCoverNO
                            .length());
                    prefixStr = "DX";
                } else if (CardCoverNO.length() > 5) {
                    sublen = 5;
                    prefixStr = CardCoverNO.substring(0, CardCoverNO
                            .length() - 5);
                    CardCoverNO = CardCoverNO.substring(CardCoverNO
                            .length() - 5, CardCoverNO.length());
                } else {
                    sublen = CardCoverNO.length();
                }
            }

            //从cardides中截取cardid并存入数据库中
            for (int count = 0; count < Integer.parseInt(cardcount); count++) {
                end = CardIDes.indexOf("\r\n", start);
                String CardID=CardIDes.substring(start, end);
                start = end + 2;
                String newCardCoverNO="";
                if (CardCoverNO.length()>0) {
                    //累加卡面编号

                    String temp = CardDataConvert.criterionString(new Integer(
                            Integer.parseInt(CardCoverNO) + count)
                            .toString(), sublen);
                    newCardCoverNO=prefixStr+ CardDataConvert.criterionString(new Integer(Integer.parseInt(CardCoverNO) + count).toString(), sublen);
                   
                    //加上前缀
                }
                try {
                    st.setString(1,CardID);
                    st.setString(2,newCardCoverNO);
                    st.executeUpdate();
                } catch (Exception ex) {
                    failCount++;
                }
            }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
				try{
					
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		com.primeton.tp.common.xml.XmlUtil.setNodeValue(failNum,String.valueOf(failCount));
		return 1;
	}

	/**
	 * 发卡
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_issueCard
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="fid/用户id"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入Card"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入SessionEntity"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输出list[@type='CARDDATALIST']"
	 */
	public static int BL_issueCard(Document doc, BizContext param) throws Exception{
		String fid = (String)param.getParaObjectAt(0); //用户ID
		Element Card = (Element)param.getParaObjectAt(1);
		Element SessionEntity = (Element)param.getParaObjectAt(2);
		Node CARDDATALIST = (Node)param.getParaObjectAt(3);
		String guestName = "宾客" ;
		if(param.getLength()>4)
		    guestName  = (String)param.getParaObjectAt(4); 
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs=null;
		
		try{
			conn = db.getConnection();
			conn.setAutoCommit(false);
			st=conn.createStatement();
			
			String CardID=TalentFunctions.getAvailStr(Card.getElementsByTagName("CardID").item(0).getFirstChild().getNodeValue());
			int InnerCardID=0;
			String Cost="";
			rs=st.executeQuery("select * from Card  where CardID="+CardID);
			if(rs.next()){
				InnerCardID=rs.getInt("InnerCardID");
				Cost=TalentFunctions.getAvailStr(rs.getString("Cost"));
			}
			if(Card.getElementsByTagName("Cost").getLength()>0){
				Cost=TalentFunctions.getAvailStr(Card.getElementsByTagName("Cost").item(0).getFirstChild().getNodeValue());
			}
			
			int UserTypeid=-1;
			int operatorType=-2;
			if(fid.equals("")){
				UserTypeid=6;
				operatorType=2;
				String userName="";
				String password="";
				if(Card.getElementsByTagName("UserName").getLength()>0){
					userName=TalentFunctions.getAvailStr(Card.getElementsByTagName("UserName").item(0).getFirstChild().getNodeValue());
				}
				if(Card.getElementsByTagName("password").getLength()>0){
					password=TalentFunctions.getAvailStr(Card.getElementsByTagName("password").item(0).getFirstChild().getNodeValue());
					EOSCipherTool eosclipher = new EOSCipherTool();
					password = eosclipher.encrypt(password);//加密页面
				}
				rs=st.executeQuery("select Max(operatorID)+1 from EosOperator ");
				if(rs.next()){
					fid=rs.getString(1);
				}
				String inSql=" insert into EosOperator (operatorID,operatorName,userID,password,status,isLocal,userTypeID,cardID,operatorType) values (?,?,?,?,1,'y',6,?,2)  ";
				PreparedStatement prs= conn.prepareStatement(inSql);//新增宾客用户
				prs.setString(1,fid);
				prs.setString(2,userName);
				prs.setString(3,guestName+fid);
				prs.setString(4,password);
				prs.setString(5,CardID);
				prs.executeUpdate();
				prs.close();
				
				String inGuestSql=" insert into Guest (GuestID,GuestTypeID) values (?,?)  ";
				PreparedStatement prsGuest= conn.prepareStatement(inGuestSql);//新增宾客
				prsGuest.setString(1,fid);
				prsGuest.setInt(2,3);
				prsGuest.close();
				
			}
			else{
				rs=st.executeQuery("select * from EOSOperator where operatorID="+fid);
				if(rs.next()){
					UserTypeid=rs.getInt("UserTypeid");
					operatorType=rs.getInt("operatorType");
				}
				String sql0="update EOSOperator set cardID="+CardID +" , status=1 where  operatorID="+fid;
				st.executeUpdate(sql0);  //更新用户表
				
				
			}
			//String CardLastSum= TalentFunctions.getAvailStr(Card.getElementsByTagName("CardLastSum").item(0).getFirstChild().getNodeValue());
			String CardLastSum= TalentFunctions.getNodeValueByTagNameExcludeNull(Card,"CardLastSum");
			
			if(CardLastSum.equals(""))
				CardLastSum="0";
			int CardUsingTimes=0;
			if(Card.getElementsByTagName("CardUsingTimes").getLength()>0)
				CardUsingTimes=TalentFunctions.getInt(Card.getElementsByTagName("CardUsingTimes").item(0).getFirstChild().getNodeValue(),0);//使用次数
			String sql1=" update Card set CardLastSum="+CardLastSum+" , CardUsingTimes="+CardUsingTimes+" , StateID=2 , Timeofissuecard=getdate() where CardID= "+CardID;
			st.executeUpdate(sql1);  //更新Card表
			
			
			String sql2="insert into businesslogs (businesslogsID,HappeningTime,businessTypeID,UserID,Businessmoney,Balance,Operatorip,Operatorname,Ischeckout,Enable,CardCost,Invoiced,Cardusingtimes ) (select Max(businesslogsID)+1,getdate(),?,?,?,?,?,?,?,?,?,?,0 from businesslogs)";
			String businessTypeID="1";
			String cardFirst2Byte = "0000"; // card前4个字节（0－3Byte）是使用次数和使用时间
			if(CardUsingTimes>0){
				cardFirst2Byte = CardDataConvert.setCardUsingTimesToCard(new Integer(CardUsingTimes));
				businessTypeID="4"; // 交易记录类型为转帐发卡
			}
			st.executeUpdate("update DestroyCard set Isreissue=1 where UserID="+fid);//更新DestroyCard表
			
			//String Cost=Card.getElementsByTagName("Cost").item(0).getFirstChild().getNodeValue();
			if(Card.getElementsByTagName("CardCost").getLength()>0){ //如果form中的工本费为空，则取出卡默认的工本费
				String CardCost=Card.getElementsByTagName("CardCost").item(0).getFirstChild().getNodeValue();
				if(CardCost!=null)
					Cost=CardCost;
			}
			
			PreparedStatement pre= conn.prepareStatement(sql2);
			pre.setString(1,businessTypeID);
			pre.setString(2,fid);
			pre.setString(3,CardLastSum);
			pre.setString(4,CardLastSum);
			pre.setString(5,SessionEntity.getElementsByTagName("remoteAddr").item(0).getFirstChild().getNodeValue());
			pre.setString(6,SessionEntity.getElementsByTagName("userID").item(0).getFirstChild().getNodeValue());
			pre.setString(7,"0");
			pre.setString(8,"1");
			pre.setString(9,Cost);
			pre.setString(10,"0");
			pre.executeUpdate();
			pre.close();
			
//			 保存user之后再获取其写入卡中的初始数据
			// 7区0、1块
			StringBuffer dataString = new StringBuffer();
			dataString.append(cardFirst2Byte); // 0－1Byte是使用次数
			dataString.append("0000"); // 2－3Byte是使用时间

			dataString.append(// 4－6Byte是卡内余额
					CardDataConvert
							.setSumToCard(CardID == null ? new Float(0)
									: Float.valueOf(CardLastSum)));

			dataString.append("000000000000000000");
			Element CARDDATA0=doc.createElement("CARDDATA");
			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
			CARDDATALIST.appendChild(CARDDATA0);
			
			Element CARDDATA1=doc.createElement("CARDDATA");
			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
			CARDDATALIST.appendChild(CARDDATA1);
			
			
			// 7区2块
			dataString = new StringBuffer();
			dataString.append(CardDataConvert.setInnerCardidToCard(new Integer(InnerCardID)));
			// 0－1Byte是卡号
			dataString.append(Constants.ORGAN_PASSWORD); // 2－3Byte是单位密码
			dataString.append(CardDataConvert.setUserTypeidToCard(new Integer(UserTypeid)));
			// 4Byte是卡类
			dataString.append("020000"); // 5-7Byte是标志和费率、空
			
			Calendar calendar=new GregorianCalendar();

			if (operatorType==1) {
				rs=st.executeQuery("select c.* from Class c , Student s where  s.classID=c.ClassID and s.StudentID="+fid);
				Date endtime=null;
				if(rs.next()){
					endtime=rs.getDate("endTime");
					calendar.setTime(endtime);
					calendar.add(Calendar.DATE,1);
					endtime=calendar.getTime();
				//	endtime=RelativeDate(endtime,1);   

				}
				// 8－10是打折截止日期，这里填入学员的毕业时间,日增加一天，令学员在毕业之后其卡当作绿卡使用
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(endtime.getYear() - 100), 2));
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(endtime.getMonth() + 1), 2));
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(endtime.getDate()), 2));
				dataString.append("0000000000");
			} else if (UserTypeid == 7) {
				Date currentTime = new Date();
				// 如果是7类卡（临工卡），则将截止日期定为当前时间的20年后
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(currentTime.getYear() - 80), 2));
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(currentTime.getMonth() + 1), 2));
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(currentTime.getDate()), 2));
		
				dataString.append("0000000000");
			} else {
				dataString.append("0000000000000000");
			}

			
			Element CARDDATA2=doc.createElement("CARDDATA");
			XmlUtil.setNodeValue(CARDDATA2,dataString.toString());
			CARDDATALIST.appendChild(CARDDATA2);
			
			
			
			//conn.rollback();
			conn.commit();
		}
		catch(Exception e){
			if(conn!=null) 
				conn.rollback();
			TalentFunctions.delChildNotesAll(CARDDATALIST);
			e.printStackTrace();
		}
		finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}
	/**
	 * 获取当前要下传权限的电子门锁记录
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getCurrentELockData
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入参数CardID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入参数RoomID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入参数EndTime"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出记录ElockData"
	 */
	public static int BL_getCurrentELockData(Document doc, BizContext param) throws Exception{
		int cardid = TalentFunctions.getInt((String)param.getParaObjectAt(0),0);
		int roomid = TalentFunctions.getInt((String)param.getParaObjectAt(1),0);
		Date endtime =TalentFunctions.stringToDate((String)param.getParaObjectAt(2));
		Node ElockData = (Node)param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		try{
			conn = db.getConnection();
			String data=getCurrentELockData(cardid,roomid,endtime,conn);
			XmlUtil.setNodeValue(ElockData,data);
		}
		finally{
			try{
				///if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return 1;
	}
	
	public static String getCurrentELockData(
			int cardid,
			int roomid,
			Date endtime,Connection conn) { //当前登记的物理卡号和房间号
			
			Statement st = null;
			
			StringBuffer elockData = new StringBuffer();

			try {
				st=conn.createStatement();
				ResultSet rsRoom=st.executeQuery("select * from Room where roomID="+roomid);
				if (!rsRoom.next()) {
					return null;
				}
				int buildingID=rsRoom.getInt("buildingID");
				int layerNO=rsRoom.getInt("layerNO");
				int readerID=rsRoom.getInt("readerID");
				int controlerID=rsRoom.getInt("controlerID");
				rsRoom.close();
				
				//提取总管卡权限
				String sqlRoomManager="select r.endTime,e.CardID from RoomManager r,Eosoperator e where r.RoomManagerID=e.operatorID and r.buildingid="+buildingID+" and (r.layerno="+layerNO+" or r.layerno<0) and e.status=1";
				ResultSet rsRoomManager=st.executeQuery(sqlRoomManager);
				while (rsRoomManager.next()) {
					int CardID_RoomManager=rsRoomManager.getInt("CardID");
					Date endTime_RoomManager=TalentFunctions.stringToDate(rsRoomManager.getString("endTime"));
					//System.out.println(endTime_RoomManager+" -------- "+endTime_RoomManager.getHours()+" -------- "+new Date());
					if (CardID_RoomManager!= 0 //如果Card或EndTime为空则进行下一次循环
						&& endTime_RoomManager != null) {
						elockData.append(
							CardDataConvert.setCardidToELock(new Integer(CardID_RoomManager)));
						elockData.append(
							CardDataConvert.setEndTimeToELock(
									endTime_RoomManager));
						elockData.append(
							CardDataConvert.criterionString(
								Integer.toHexString(readerID),2));
						//每个控制器一般都带有两个读头，为确保管理卡可以开所有门，必须在覆盖一个控制器数据的同时
						//把所有读头也写入
						elockData.append(
							CardDataConvert.setCardidToELock(new Integer(CardID_RoomManager)));
						elockData.append(
							CardDataConvert.setEndTimeToELock(endTime_RoomManager));
						elockData.append(
							CardDataConvert.criterionString(
								Integer.toHexString(
									4 - readerID),
								2));
						//读头号为1和3，所以用4减
					}
				}
				rsRoomManager.close();
				//

				//提取原有的开门权限
				String sqlHousingLogs="select h.endTime,h.userID,r.readerID,e.cardID from HousingLogs h ,Room r,Eosoperator e where h.RoomID=r.RoomID and h.userID=e.operatorID and r.controlerid="+controlerID+" and h.ischeckout=0 and h.enable=1 and h.endtime>getdate()";
				ResultSet rsHousingLogs=st.executeQuery(sqlHousingLogs);
				System.out.println(sqlHousingLogs);
				while (rsHousingLogs.next()) {
					int userID=rsHousingLogs.getInt("userID");
					int cardID_HousingLogs=rsHousingLogs.getInt("cardID");
					System.out.println("---------------------"+rsHousingLogs.getString("endTime"));
					Date endTime_HousingLogs=TalentFunctions.stringToDateTime(rsHousingLogs.getString("endTime"));
					int readerID_HousingLogs=rsHousingLogs.getInt("readerID");
					
					if (userID!=0 //如果User或EndTime为空则进行下一次循环
						&& endTime_HousingLogs != null
						&& cardID_HousingLogs != 0) {
						elockData.append(
							CardDataConvert.setCardidToELock(new Integer(cardID_HousingLogs)));
						elockData.append(
							CardDataConvert.setEndTimeToELock(endTime_HousingLogs));
						elockData.append(
							CardDataConvert.criterionString(Integer.toHexString(readerID_HousingLogs),2));
					System.out.println(elockData);
					}
				}
				rsHousingLogs.close();
				//

				//设置当前开门权限，如果cardid大于0，表示当前门锁有新增记录
				if (cardid > 0) {
					elockData.append(
						CardDataConvert.setCardidToELock(new Integer(cardid)));
					elockData.append(CardDataConvert.setEndTimeToELock(endtime));
					elockData.append(
						CardDataConvert.criterionString(
							Integer.toHexString(readerID),
							2));
				}
				//

				
				return elockData.toString();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			finally{
				try{
					
					if(st!=null) st.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			return null;
		}
	/**
	 * 保存充值信息
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_savedeposit
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Card" name="" desc="输入Card"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list[@type='CARDDATALIST']" name="" desc="输出写入卡中的数据CARDDATALIST"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="SessionEntity" name="" desc="输入SessionEntity"
	 **/
	public static int BL_savedeposit(Document doc, BizContext param) throws Exception{
		Element Card = (Element)param.getParaObjectAt(0);
		Node CARDDATALIST = (Node)param.getParaObjectAt(1);
		Element SessionEntity = (Element)param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs=null;
		
		try{
			conn = db.getConnection();
			conn.setAutoCommit(false);
			st=conn.createStatement();
			
//			计算新余额＝余额＋充卡金额
            float balance = -1;
            Float businessmoney = null;
            String backupdata = null; //用来存储旧卡编号
            int businessTypeID = 2; //默认为现金充值
            String CardLastSum=TalentFunctions.getNodeValueByTagName(Card,"CardLastSum");
            String depositsum=TalentFunctions.getNodeValueByTagName(Card,"depositsum");//充值金额
            String fromCardData0=TalentFunctions.getNodeValueByTagName(Card,"fromCardData0");
            String fromCardData1=TalentFunctions.getNodeValueByTagName(Card,"fromCardData1");
           
            if (CardLastSum != null && depositsum != null)
                if (Float.parseFloat(depositsum) > 0) { //充值金额表示充入金额
                    balance = Float.parseFloat(CardLastSum) + Float.parseFloat(depositsum);
                    businessmoney = Float.valueOf(depositsum);
                    String oldCardCoverNO=TalentFunctions.getNodeValueByTagName(Card,"oldCardCoverNO");
                    if (oldCardCoverNO!= null&&oldCardCoverNO.length()>0) { //旧卡编号不为空表示为磁卡转帐
                        backupdata = oldCardCoverNO;
                        businessTypeID = 8;
                    }
                } else { //否则为退款
                    balance = 0;
                    businessmoney = new Float(0 - Float.parseFloat(CardLastSum));
                    businessTypeID = 7; //交易类型为退款

                    //设置卡块内容
                    
                    if (fromCardData0 != null
                            && fromCardData0.length() > 0
                            && fromCardData1 != null
                            && fromCardData1.length() > 0) { //读取卡7区0、1块
                        if (CardDataConvert.getCardUsingTimesFromCard(fromCardData0).intValue() 
                        		>= CardDataConvert.getCardUsingTimesFromCard(fromCardData1).intValue()) {
                        	fromCardData1 = null;
                        } else {
                        	fromCardData0 = null;
                        }
                    }
                }
            //

            //设置写入卡中的数据
            
            StringBuffer dataString = new StringBuffer();
            int cardusingtimes = 0;
            //7区0、1块
            if (fromCardData0 != null
                    && fromCardData0.length() > 0) {
                cardusingtimes = CardDataConvert.getCardUsingTimesFromCard(
                		fromCardData0).intValue() + 1;
                if (cardusingtimes > 0xFFFF) {
                    //如果使用次数溢出，则要写两个块，原来的块清零，新数据的目标块次数为1
                    dataString.append("0000");
                    dataString.append(fromCardData0.substring(4));
                    dataString = new StringBuffer();
                    cardusingtimes = 1;
                } else {
                	dataString.append(""); //不覆盖0号块
                }
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---0号块
                
                dataString.append(CardDataConvert
                        .setCardUsingTimesToCard(new Integer(cardusingtimes)));
                dataString.append(fromCardData0.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(
                        balance)));
                dataString.append(fromCardData0.substring(14));
                Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA1); 
                //覆盖1号块
            }

            if (fromCardData1 != null
                    && fromCardData1.length() > 0) {
                dataString = new StringBuffer();
                cardusingtimes = CardDataConvert.getCardUsingTimesFromCard(
                		fromCardData1).intValue() + 1;
                String tempStr = null;

                if (cardusingtimes > 0xFFFF) {
                    //如果使用次数溢出，则要写两个块，原来的块清零，新数据的目标块次数为1
                    dataString.append("0000");
                    dataString.append(fromCardData1.substring(4));
                    tempStr = dataString.toString();
                    dataString = new StringBuffer();
                    cardusingtimes = 1;
                }

                dataString.append(CardDataConvert
                        .setCardUsingTimesToCard(new Integer(cardusingtimes)));
                dataString.append(fromCardData1.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(
                        balance)));
                dataString.append(fromCardData1.substring(14));
                
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---覆盖0号块
              
                if (tempStr == null)
                	tempStr="";//不覆盖1号块
                
                Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,tempStr);
    			CARDDATALIST.appendChild(CARDDATA1); //---1号块
            }

            String CardID= TalentFunctions.getNodeValueByTagName(Card,"CardID");
            String userID="-100";
            if (CardID != null) {
                
                rs=st.executeQuery("select operatorID from Eosoperator where cardID="+CardID);
                if(rs.next()){
                	userID=rs.getString(1);
                }
                
                //保存卡信息,将较大的使用次数保存到card中
                String updateCard="update Card set cardusingtimes ="+cardusingtimes+",Cardlastsum = "+balance+" where CardID="+CardID;
                st.executeUpdate(updateCard);
            }

            //保存充值记录
            String isInVoiced = TalentFunctions.getNodeValueByTagName(Card,"isInVoiced");
            String sql2="insert into businesslogs (businesslogsID,HappeningTime,businessTypeID,UserID,Businessmoney,Balance,Operatorip,Operatorname,Ischeckout,Enable,Cardusingtimes,Invoiced,backupdata ) (select Max(businesslogsID)+1,getdate(),?,?,?,?,?,?,?,?,?,?,? from businesslogs)";
            PreparedStatement pre= conn.prepareStatement(sql2);
            pre.setString(1,String.valueOf(businessTypeID));
			pre.setString(2,userID);
			pre.setString(3,String.valueOf(businessmoney));
			pre.setString(4,String.valueOf(balance));
			pre.setString(5,SessionEntity.getElementsByTagName("remoteAddr").item(0).getFirstChild().getNodeValue());
			pre.setString(6,SessionEntity.getElementsByTagName("userName").item(0).getFirstChild().getNodeValue());
			pre.setString(7,"0");
			pre.setString(8,"1");
			pre.setString(9,String.valueOf(cardusingtimes));
			if ("1".equals(isInVoiced)) pre.setString(10,"1"); else pre.setString(10,"0");
			pre.setString(11,backupdata);
			pre.executeUpdate();
			pre.close();
          
			Element CARDDATA2=doc.createElement("CARDDATA");
 			XmlUtil.setNodeValue(CARDDATA2,"");
 			CARDDATALIST.appendChild(CARDDATA2); //---不覆盖2号块
            
			
			
			//conn.rollback();
			conn.commit();
		}
		catch(Exception e){
			if(conn!=null) 
				conn.rollback();
			TalentFunctions.delChildNotesAll(CARDDATALIST);
			e.printStackTrace();
		}
		finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}
	/**
	 * 撤消充值
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_cancelDeposit
	 * @bizlet_param passing="in_out" type="EOSEntity" value="QueryBusinessLogs" name="" desc="输入QueryBusinessLogs"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Card" name="" desc="输入Card"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list[@type='CARDDATALIST']" name="" desc="输出写入卡中的数据CARDDATALIST"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="info" name="" desc="输出info"
	 **/
	public static int BL_cancelDeposit(Document doc, BizContext param) throws Exception{
		Element QueryBusinessLogs = (Element)param.getParaObjectAt(0);
		Element Card = (Element)param.getParaObjectAt(1);
		Node CARDDATALIST = (Node)param.getParaObjectAt(2);
		Node info = (Node)param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs=null;
		
		try{
			conn = db.getConnection();
			conn.setAutoCommit(false);
			st=conn.createStatement();
			
			String CardID=TalentFunctions.getNodeValueByTagName(QueryBusinessLogs,"CardID");
			if(CardID==null){
				return 0;
			}
			
			rs=st.executeQuery("select * from Card where CardID="+CardID);
			float CardLastSum=0;
			int CardUsingTimes=0;
			if(rs.next())
			{
				CardLastSum=rs.getFloat("CardLastSum");
				CardUsingTimes=rs.getInt("CardUsingTimes");
			}
			
			String fromCardData0=TalentFunctions.getNodeValueByTagName(Card,"fromCardData0");
            String fromCardData1=TalentFunctions.getNodeValueByTagName(Card,"fromCardData1");;
            String BusinessMoney=TalentFunctions.getNodeValueByTagName(QueryBusinessLogs,"BusinessMoney");//交易金额
            String BusinessLogsID=TalentFunctions.getNodeValueByTagName(QueryBusinessLogs,"BusinessLogsID");//交易金额
            
            int cardusingtimes0=CardDataConvert.getCardUsingTimesFromCard(fromCardData0).intValue(); //使用次数0
            int cardusingtimes1=CardDataConvert.getCardUsingTimesFromCard(fromCardData1).intValue(); //使用次数1
            StringBuffer dataString = new StringBuffer();
            float newLastSum;   //撤消后卡内余额
            int newUsingTimes;  //撤消后卡使用次数
            String errorStr="卡信息与数据库不一致，不能撤消！";
            if(cardusingtimes0>cardusingtimes1){ //如果0区使用次数大于1区，则修改0区数据，否则则修改1区 
            	
            	float sumFromCard=CardDataConvert.getSumFromCard(fromCardData0);//卡中原余额
            	
            	if(cardusingtimes0!=CardUsingTimes||sumFromCard!=CardLastSum){ //检验卡信息是否与数据库一致
            		XmlUtil.setNodeValue(info,errorStr);
            		return 0;
            	}
            	
            	
            	newUsingTimes=cardusingtimes0-1;   //使用次数减1
            	newLastSum=sumFromCard-Float.parseFloat(BusinessMoney);//卡中新余额=卡中原余额-交易金额
            	dataString.append(CardDataConvert.setCardUsingTimesToCard(new Integer(newUsingTimes)));
                dataString.append(fromCardData0.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));    
                dataString.append(fromCardData0.substring(14));
                System.out.println(dataString);
                
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---0号块
    			Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,"");
    			CARDDATALIST.appendChild(CARDDATA1); //---1号块
            	
            }
            else{
            	float sumFromCard=CardDataConvert.getSumFromCard(fromCardData1);//卡中原余额
            	
            	if(cardusingtimes1!=CardUsingTimes||sumFromCard!=CardLastSum){ //检验卡信息是否与数据库一致
            		XmlUtil.setNodeValue(info,errorStr);
            		return 0;
            	}
            	
            	newUsingTimes=cardusingtimes1-1;   //使用次数减1
            	newLastSum=sumFromCard-Float.parseFloat(BusinessMoney);//卡中新余额=卡中原余额-交易金额
            	dataString.append(CardDataConvert.setCardUsingTimesToCard(new Integer(newUsingTimes)));
                dataString.append(fromCardData1.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));    
                dataString.append(fromCardData1.substring(14));
                System.out.println(dataString);
                
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,"");
    			CARDDATALIST.appendChild(CARDDATA0); //---0号块
    			Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA1); //---1号块
            }
            Element CARDDATA2=doc.createElement("CARDDATA");
 			XmlUtil.setNodeValue(CARDDATA2,"");
 			CARDDATALIST.appendChild(CARDDATA2); //---不覆盖2号块
 			XmlUtil.setNodeValue(info,"撤消充值成功！");
 			
 			String updateCard="update Card set CardUsingTimes="+newUsingTimes+", CardLastSum="+newLastSum+" where CardID="+CardID;
			String updateBusinessLogs="update BusinessLogs set enable=0 where BusinessLogsID="+BusinessLogsID;
			st.executeUpdate(updateCard); //更新卡
			st.executeUpdate(updateBusinessLogs); //更新BusinessLogs
			//conn.rollback();
			conn.commit();
		}
		catch(Exception e){
			if(conn!=null) 
				conn.rollback();
			TalentFunctions.delChildNotesAll(CARDDATALIST);
			e.printStackTrace();
		}
		finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}
	
	
	/**
	 * 卡转帐（余额转出）
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_virement
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Card" name="" desc="输入Card"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list[@type='CARDDATALIST']" name="" desc="输出写入卡中的数据CARDDATALIST"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入转帐金额"
	 */
	public static int BL_virement(Document doc, BizContext param) throws Exception{
		Element Card = (Element)param.getParaObjectAt(0);
		Node CARDDATALIST = (Node)param.getParaObjectAt(1);
		float businessMoney=Float.parseFloat((String) param.getParaObjectAt(2));//转帐金额
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs=null;
		try{
			conn = db.getConnection();
			st=conn.createStatement();
			
			String fromCardData0=TalentFunctions.getNodeValueByTagName(Card,"fromCardData0"); //卡0区数据
            String fromCardData1=TalentFunctions.getNodeValueByTagName(Card,"fromCardData1"); //卡1区数据
            float CardLastSum=Float.parseFloat(TalentFunctions.getNodeValueByTagName(Card,"CardLastSum"));//数据库中余额
            int usingTime0=CardDataConvert.getCardUsingTimesFromCard(fromCardData0).intValue(); //卡0区使用次数
            int usingTime1=CardDataConvert.getCardUsingTimesFromCard(fromCardData1).intValue(); //卡1区使用次数
            float cardSum0 =CardDataConvert.getSumFromCard(fromCardData0);//卡0区余额
            float cardSum1 =CardDataConvert.getSumFromCard(fromCardData1);//卡1区余额
			
            int newUsingTime = 0;
            float newLastSum=0;
            StringBuffer dataString = new StringBuffer();
            if(usingTime0>usingTime1){
				newUsingTime = usingTime0+ 1;
				newLastSum = cardSum0+businessMoney;
                if (newUsingTime > 0xFFFF) {
                    //如果使用次数溢出，则要写两个块，原来的块清零，新数据的目标块次数为1
                    dataString.append("0000");
                    dataString.append(fromCardData0.substring(4));
                    dataString = new StringBuffer();
                    newUsingTime = 1;
                } else {
                	dataString.append(""); //不覆盖0号块
                }
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---0号块
                
                dataString.append(CardDataConvert
                        .setCardUsingTimesToCard(new Integer(newUsingTime)));
                dataString.append(fromCardData0.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));
                dataString.append(fromCardData0.substring(14));
                Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA1); 
                //覆盖1号块
			}
            else{
				newUsingTime = usingTime1+ 1;
				newLastSum = cardSum1+businessMoney;
				String tempStr = null;
				if (newUsingTime > 0xFFFF) {
                    //如果使用次数溢出，则要写两个块，原来的块清零，新数据的目标块次数为1
                    dataString.append("0000");
                    dataString.append(fromCardData0.substring(4));
                    tempStr = dataString.toString();
                    dataString = new StringBuffer();
                    newUsingTime = 1;
                } 
               
                
                dataString.append(CardDataConvert
                        .setCardUsingTimesToCard(new Integer(newUsingTime)));
                dataString.append(fromCardData1.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));
                dataString.append(fromCardData1.substring(14));
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); 
                //覆盖0号块
    			if (tempStr == null)
                	tempStr="";//不覆盖1号块
    			Element CARDDATA1=doc.createElement("CARDDATA");
     			XmlUtil.setNodeValue(CARDDATA1,tempStr);
     			CARDDATALIST.appendChild(CARDDATA1); //---1号块
            }
            Element CARDDATA2=doc.createElement("CARDDATA");
 			XmlUtil.setNodeValue(CARDDATA2,"");
 			CARDDATALIST.appendChild(CARDDATA2); //---2号块
            
 			Node CardUsingTimesNode= Card.getElementsByTagName("CardUsingTimes").item(0);
 			XmlUtil.setNodeValue(CardUsingTimesNode,String.valueOf(newUsingTime));
 			Node CardLastSumNode= Card.getElementsByTagName("CardLastSum").item(0);
 			XmlUtil.setNodeValue(CardLastSumNode,String.valueOf(newLastSum));
 			String CardID= TalentFunctions.getNodeValueByTagName(Card,"CardID");
            if (CardID != null) {
                
              
                
                //保存卡信息,将较大的使用次数保存到card中
                String updateCard="update Card set cardusingtimes ="+newUsingTime+",Cardlastsum = "+newLastSum+" where CardID="+CardID;
                st.executeUpdate(updateCard);
            }
			
		}
		catch(Exception e){
			TalentFunctions.delChildNotesAll(CARDDATALIST);
			e.printStackTrace();
			return 0;
		}
		finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(conn.getAutoCommit())
						if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		
		return 1;
	}
	
	public static void main(String arg[]){
		System.out.println(CardDataConvert.getDHM("D301"));
	}
}