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
 * @author ���ܶ�
 * @version 1.0
 * @date 2007-3-9
 * @class_displayName CardManage
 */

public class CardManage {

	/**
	 * IC��ע��
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_AddCard
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="����Cardʵ��"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="���ע��ʧ�ܸ���"
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

            //���������ŵĸ�ʽ����DX��ͷ����ȫ����
            String prefixStr = ""; //�����������ݿ���ַ���ǰ׺
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

            //��cardides�н�ȡcardid���������ݿ���
            for (int count = 0; count < Integer.parseInt(cardcount); count++) {
                end = CardIDes.indexOf("\r\n", start);
                String CardID=CardIDes.substring(start, end);
                start = end + 2;
                String newCardCoverNO="";
                if (CardCoverNO.length()>0) {
                    //�ۼӿ�����

                    String temp = CardDataConvert.criterionString(new Integer(
                            Integer.parseInt(CardCoverNO) + count)
                            .toString(), sublen);
                    newCardCoverNO=prefixStr+ CardDataConvert.criterionString(new Integer(Integer.parseInt(CardCoverNO) + count).toString(), sublen);
                   
                    //����ǰ׺
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
	 * ����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_issueCard
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="fid/�û�id"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="����Card"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="����SessionEntity"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="���list[@type='CARDDATALIST']"
	 */
	public static int BL_issueCard(Document doc, BizContext param) throws Exception{
		String fid = (String)param.getParaObjectAt(0); //�û�ID
		Element Card = (Element)param.getParaObjectAt(1);
		Element SessionEntity = (Element)param.getParaObjectAt(2);
		Node CARDDATALIST = (Node)param.getParaObjectAt(3);
		String guestName = "����" ;
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
					password = eosclipher.encrypt(password);//����ҳ��
				}
				rs=st.executeQuery("select Max(operatorID)+1 from EosOperator ");
				if(rs.next()){
					fid=rs.getString(1);
				}
				String inSql=" insert into EosOperator (operatorID,operatorName,userID,password,status,isLocal,userTypeID,cardID,operatorType) values (?,?,?,?,1,'y',6,?,2)  ";
				PreparedStatement prs= conn.prepareStatement(inSql);//���������û�
				prs.setString(1,fid);
				prs.setString(2,userName);
				prs.setString(3,guestName+fid);
				prs.setString(4,password);
				prs.setString(5,CardID);
				prs.executeUpdate();
				prs.close();
				
				String inGuestSql=" insert into Guest (GuestID,GuestTypeID) values (?,?)  ";
				PreparedStatement prsGuest= conn.prepareStatement(inGuestSql);//��������
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
				st.executeUpdate(sql0);  //�����û���
				
				
			}
			//String CardLastSum= TalentFunctions.getAvailStr(Card.getElementsByTagName("CardLastSum").item(0).getFirstChild().getNodeValue());
			String CardLastSum= TalentFunctions.getNodeValueByTagNameExcludeNull(Card,"CardLastSum");
			
			if(CardLastSum.equals(""))
				CardLastSum="0";
			int CardUsingTimes=0;
			if(Card.getElementsByTagName("CardUsingTimes").getLength()>0)
				CardUsingTimes=TalentFunctions.getInt(Card.getElementsByTagName("CardUsingTimes").item(0).getFirstChild().getNodeValue(),0);//ʹ�ô���
			String sql1=" update Card set CardLastSum="+CardLastSum+" , CardUsingTimes="+CardUsingTimes+" , StateID=2 , Timeofissuecard=getdate() where CardID= "+CardID;
			st.executeUpdate(sql1);  //����Card��
			
			
			String sql2="insert into businesslogs (businesslogsID,HappeningTime,businessTypeID,UserID,Businessmoney,Balance,Operatorip,Operatorname,Ischeckout,Enable,CardCost,Invoiced,Cardusingtimes ) (select Max(businesslogsID)+1,getdate(),?,?,?,?,?,?,?,?,?,?,0 from businesslogs)";
			String businessTypeID="1";
			String cardFirst2Byte = "0000"; // cardǰ4���ֽڣ�0��3Byte����ʹ�ô�����ʹ��ʱ��
			if(CardUsingTimes>0){
				cardFirst2Byte = CardDataConvert.setCardUsingTimesToCard(new Integer(CardUsingTimes));
				businessTypeID="4"; // ���׼�¼����Ϊת�ʷ���
			}
			st.executeUpdate("update DestroyCard set Isreissue=1 where UserID="+fid);//����DestroyCard��
			
			//String Cost=Card.getElementsByTagName("Cost").item(0).getFirstChild().getNodeValue();
			if(Card.getElementsByTagName("CardCost").getLength()>0){ //���form�еĹ�����Ϊ�գ���ȡ����Ĭ�ϵĹ�����
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
			
//			 ����user֮���ٻ�ȡ��д�뿨�еĳ�ʼ����
			// 7��0��1��
			StringBuffer dataString = new StringBuffer();
			dataString.append(cardFirst2Byte); // 0��1Byte��ʹ�ô���
			dataString.append("0000"); // 2��3Byte��ʹ��ʱ��

			dataString.append(// 4��6Byte�ǿ������
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
			
			
			// 7��2��
			dataString = new StringBuffer();
			dataString.append(CardDataConvert.setInnerCardidToCard(new Integer(InnerCardID)));
			// 0��1Byte�ǿ���
			dataString.append(Constants.ORGAN_PASSWORD); // 2��3Byte�ǵ�λ����
			dataString.append(CardDataConvert.setUserTypeidToCard(new Integer(UserTypeid)));
			// 4Byte�ǿ���
			dataString.append("020000"); // 5-7Byte�Ǳ�־�ͷ��ʡ���
			
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
				// 8��10�Ǵ��۽�ֹ���ڣ���������ѧԱ�ı�ҵʱ��,������һ�죬��ѧԱ�ڱ�ҵ֮���俨�����̿�ʹ��
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(endtime.getYear() - 100), 2));
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(endtime.getMonth() + 1), 2));
				dataString.append(CardDataConvert.criterionString(Integer
						.toString(endtime.getDate()), 2));
				dataString.append("0000000000");
			} else if (UserTypeid == 7) {
				Date currentTime = new Date();
				// �����7�࿨���ٹ��������򽫽�ֹ���ڶ�Ϊ��ǰʱ���20���
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
	 * ��ȡ��ǰҪ�´�Ȩ�޵ĵ���������¼
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getCurrentELockData
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�������CardID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�������RoomID"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�������EndTime"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�����¼ElockData"
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
			Date endtime,Connection conn) { //��ǰ�Ǽǵ������źͷ����
			
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
				
				//��ȡ�ܹܿ�Ȩ��
				String sqlRoomManager="select r.endTime,e.CardID from RoomManager r,Eosoperator e where r.RoomManagerID=e.operatorID and r.buildingid="+buildingID+" and (r.layerno="+layerNO+" or r.layerno<0) and e.status=1";
				ResultSet rsRoomManager=st.executeQuery(sqlRoomManager);
				while (rsRoomManager.next()) {
					int CardID_RoomManager=rsRoomManager.getInt("CardID");
					Date endTime_RoomManager=TalentFunctions.stringToDate(rsRoomManager.getString("endTime"));
					//System.out.println(endTime_RoomManager+" -------- "+endTime_RoomManager.getHours()+" -------- "+new Date());
					if (CardID_RoomManager!= 0 //���Card��EndTimeΪ���������һ��ѭ��
						&& endTime_RoomManager != null) {
						elockData.append(
							CardDataConvert.setCardidToELock(new Integer(CardID_RoomManager)));
						elockData.append(
							CardDataConvert.setEndTimeToELock(
									endTime_RoomManager));
						elockData.append(
							CardDataConvert.criterionString(
								Integer.toHexString(readerID),2));
						//ÿ��������һ�㶼����������ͷ��Ϊȷ���������Կ������ţ������ڸ���һ�����������ݵ�ͬʱ
						//�����ж�ͷҲд��
						elockData.append(
							CardDataConvert.setCardidToELock(new Integer(CardID_RoomManager)));
						elockData.append(
							CardDataConvert.setEndTimeToELock(endTime_RoomManager));
						elockData.append(
							CardDataConvert.criterionString(
								Integer.toHexString(
									4 - readerID),
								2));
						//��ͷ��Ϊ1��3��������4��
					}
				}
				rsRoomManager.close();
				//

				//��ȡԭ�еĿ���Ȩ��
				String sqlHousingLogs="select h.endTime,h.userID,r.readerID,e.cardID from HousingLogs h ,Room r,Eosoperator e where h.RoomID=r.RoomID and h.userID=e.operatorID and r.controlerid="+controlerID+" and h.ischeckout=0 and h.enable=1 and h.endtime>getdate()";
				ResultSet rsHousingLogs=st.executeQuery(sqlHousingLogs);
				System.out.println(sqlHousingLogs);
				while (rsHousingLogs.next()) {
					int userID=rsHousingLogs.getInt("userID");
					int cardID_HousingLogs=rsHousingLogs.getInt("cardID");
					System.out.println("---------------------"+rsHousingLogs.getString("endTime"));
					Date endTime_HousingLogs=TalentFunctions.stringToDateTime(rsHousingLogs.getString("endTime"));
					int readerID_HousingLogs=rsHousingLogs.getInt("readerID");
					
					if (userID!=0 //���User��EndTimeΪ���������һ��ѭ��
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

				//���õ�ǰ����Ȩ�ޣ����cardid����0����ʾ��ǰ������������¼
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
	 * �����ֵ��Ϣ
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_savedeposit
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Card" name="" desc="����Card"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list[@type='CARDDATALIST']" name="" desc="���д�뿨�е�����CARDDATALIST"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="SessionEntity" name="" desc="����SessionEntity"
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
			
//			�����������俨���
            float balance = -1;
            Float businessmoney = null;
            String backupdata = null; //�����洢�ɿ����
            int businessTypeID = 2; //Ĭ��Ϊ�ֽ��ֵ
            String CardLastSum=TalentFunctions.getNodeValueByTagName(Card,"CardLastSum");
            String depositsum=TalentFunctions.getNodeValueByTagName(Card,"depositsum");//��ֵ���
            String fromCardData0=TalentFunctions.getNodeValueByTagName(Card,"fromCardData0");
            String fromCardData1=TalentFunctions.getNodeValueByTagName(Card,"fromCardData1");
           
            if (CardLastSum != null && depositsum != null)
                if (Float.parseFloat(depositsum) > 0) { //��ֵ����ʾ������
                    balance = Float.parseFloat(CardLastSum) + Float.parseFloat(depositsum);
                    businessmoney = Float.valueOf(depositsum);
                    String oldCardCoverNO=TalentFunctions.getNodeValueByTagName(Card,"oldCardCoverNO");
                    if (oldCardCoverNO!= null&&oldCardCoverNO.length()>0) { //�ɿ���Ų�Ϊ�ձ�ʾΪ�ſ�ת��
                        backupdata = oldCardCoverNO;
                        businessTypeID = 8;
                    }
                } else { //����Ϊ�˿�
                    balance = 0;
                    businessmoney = new Float(0 - Float.parseFloat(CardLastSum));
                    businessTypeID = 7; //��������Ϊ�˿�

                    //���ÿ�������
                    
                    if (fromCardData0 != null
                            && fromCardData0.length() > 0
                            && fromCardData1 != null
                            && fromCardData1.length() > 0) { //��ȡ��7��0��1��
                        if (CardDataConvert.getCardUsingTimesFromCard(fromCardData0).intValue() 
                        		>= CardDataConvert.getCardUsingTimesFromCard(fromCardData1).intValue()) {
                        	fromCardData1 = null;
                        } else {
                        	fromCardData0 = null;
                        }
                    }
                }
            //

            //����д�뿨�е�����
            
            StringBuffer dataString = new StringBuffer();
            int cardusingtimes = 0;
            //7��0��1��
            if (fromCardData0 != null
                    && fromCardData0.length() > 0) {
                cardusingtimes = CardDataConvert.getCardUsingTimesFromCard(
                		fromCardData0).intValue() + 1;
                if (cardusingtimes > 0xFFFF) {
                    //���ʹ�ô����������Ҫд�����飬ԭ���Ŀ����㣬�����ݵ�Ŀ������Ϊ1
                    dataString.append("0000");
                    dataString.append(fromCardData0.substring(4));
                    dataString = new StringBuffer();
                    cardusingtimes = 1;
                } else {
                	dataString.append(""); //������0�ſ�
                }
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---0�ſ�
                
                dataString.append(CardDataConvert
                        .setCardUsingTimesToCard(new Integer(cardusingtimes)));
                dataString.append(fromCardData0.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(
                        balance)));
                dataString.append(fromCardData0.substring(14));
                Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA1); 
                //����1�ſ�
            }

            if (fromCardData1 != null
                    && fromCardData1.length() > 0) {
                dataString = new StringBuffer();
                cardusingtimes = CardDataConvert.getCardUsingTimesFromCard(
                		fromCardData1).intValue() + 1;
                String tempStr = null;

                if (cardusingtimes > 0xFFFF) {
                    //���ʹ�ô����������Ҫд�����飬ԭ���Ŀ����㣬�����ݵ�Ŀ������Ϊ1
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
    			CARDDATALIST.appendChild(CARDDATA0); //---����0�ſ�
              
                if (tempStr == null)
                	tempStr="";//������1�ſ�
                
                Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,tempStr);
    			CARDDATALIST.appendChild(CARDDATA1); //---1�ſ�
            }

            String CardID= TalentFunctions.getNodeValueByTagName(Card,"CardID");
            String userID="-100";
            if (CardID != null) {
                
                rs=st.executeQuery("select operatorID from Eosoperator where cardID="+CardID);
                if(rs.next()){
                	userID=rs.getString(1);
                }
                
                //���濨��Ϣ,���ϴ��ʹ�ô������浽card��
                String updateCard="update Card set cardusingtimes ="+cardusingtimes+",Cardlastsum = "+balance+" where CardID="+CardID;
                st.executeUpdate(updateCard);
            }

            //�����ֵ��¼
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
 			CARDDATALIST.appendChild(CARDDATA2); //---������2�ſ�
            
			
			
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
	 * ������ֵ
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_cancelDeposit
	 * @bizlet_param passing="in_out" type="EOSEntity" value="QueryBusinessLogs" name="" desc="����QueryBusinessLogs"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Card" name="" desc="����Card"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list[@type='CARDDATALIST']" name="" desc="���д�뿨�е�����CARDDATALIST"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="info" name="" desc="���info"
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
            String BusinessMoney=TalentFunctions.getNodeValueByTagName(QueryBusinessLogs,"BusinessMoney");//���׽��
            String BusinessLogsID=TalentFunctions.getNodeValueByTagName(QueryBusinessLogs,"BusinessLogsID");//���׽��
            
            int cardusingtimes0=CardDataConvert.getCardUsingTimesFromCard(fromCardData0).intValue(); //ʹ�ô���0
            int cardusingtimes1=CardDataConvert.getCardUsingTimesFromCard(fromCardData1).intValue(); //ʹ�ô���1
            StringBuffer dataString = new StringBuffer();
            float newLastSum;   //�����������
            int newUsingTimes;  //������ʹ�ô���
            String errorStr="����Ϣ�����ݿⲻһ�£����ܳ�����";
            if(cardusingtimes0>cardusingtimes1){ //���0��ʹ�ô�������1�������޸�0�����ݣ��������޸�1�� 
            	
            	float sumFromCard=CardDataConvert.getSumFromCard(fromCardData0);//����ԭ���
            	
            	if(cardusingtimes0!=CardUsingTimes||sumFromCard!=CardLastSum){ //���鿨��Ϣ�Ƿ������ݿ�һ��
            		XmlUtil.setNodeValue(info,errorStr);
            		return 0;
            	}
            	
            	
            	newUsingTimes=cardusingtimes0-1;   //ʹ�ô�����1
            	newLastSum=sumFromCard-Float.parseFloat(BusinessMoney);//���������=����ԭ���-���׽��
            	dataString.append(CardDataConvert.setCardUsingTimesToCard(new Integer(newUsingTimes)));
                dataString.append(fromCardData0.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));    
                dataString.append(fromCardData0.substring(14));
                System.out.println(dataString);
                
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---0�ſ�
    			Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,"");
    			CARDDATALIST.appendChild(CARDDATA1); //---1�ſ�
            	
            }
            else{
            	float sumFromCard=CardDataConvert.getSumFromCard(fromCardData1);//����ԭ���
            	
            	if(cardusingtimes1!=CardUsingTimes||sumFromCard!=CardLastSum){ //���鿨��Ϣ�Ƿ������ݿ�һ��
            		XmlUtil.setNodeValue(info,errorStr);
            		return 0;
            	}
            	
            	newUsingTimes=cardusingtimes1-1;   //ʹ�ô�����1
            	newLastSum=sumFromCard-Float.parseFloat(BusinessMoney);//���������=����ԭ���-���׽��
            	dataString.append(CardDataConvert.setCardUsingTimesToCard(new Integer(newUsingTimes)));
                dataString.append(fromCardData1.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));    
                dataString.append(fromCardData1.substring(14));
                System.out.println(dataString);
                
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,"");
    			CARDDATALIST.appendChild(CARDDATA0); //---0�ſ�
    			Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA1); //---1�ſ�
            }
            Element CARDDATA2=doc.createElement("CARDDATA");
 			XmlUtil.setNodeValue(CARDDATA2,"");
 			CARDDATALIST.appendChild(CARDDATA2); //---������2�ſ�
 			XmlUtil.setNodeValue(info,"������ֵ�ɹ���");
 			
 			String updateCard="update Card set CardUsingTimes="+newUsingTimes+", CardLastSum="+newLastSum+" where CardID="+CardID;
			String updateBusinessLogs="update BusinessLogs set enable=0 where BusinessLogsID="+BusinessLogsID;
			st.executeUpdate(updateCard); //���¿�
			st.executeUpdate(updateBusinessLogs); //����BusinessLogs
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
	 * ��ת�ʣ����ת����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_virement
	 * @bizlet_param passing="in_out" type="EOSEntity" value="Card" name="" desc="����Card"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list[@type='CARDDATALIST']" name="" desc="���д�뿨�е�����CARDDATALIST"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����ת�ʽ��"
	 */
	public static int BL_virement(Document doc, BizContext param) throws Exception{
		Element Card = (Element)param.getParaObjectAt(0);
		Node CARDDATALIST = (Node)param.getParaObjectAt(1);
		float businessMoney=Float.parseFloat((String) param.getParaObjectAt(2));//ת�ʽ��
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs=null;
		try{
			conn = db.getConnection();
			st=conn.createStatement();
			
			String fromCardData0=TalentFunctions.getNodeValueByTagName(Card,"fromCardData0"); //��0������
            String fromCardData1=TalentFunctions.getNodeValueByTagName(Card,"fromCardData1"); //��1������
            float CardLastSum=Float.parseFloat(TalentFunctions.getNodeValueByTagName(Card,"CardLastSum"));//���ݿ������
            int usingTime0=CardDataConvert.getCardUsingTimesFromCard(fromCardData0).intValue(); //��0��ʹ�ô���
            int usingTime1=CardDataConvert.getCardUsingTimesFromCard(fromCardData1).intValue(); //��1��ʹ�ô���
            float cardSum0 =CardDataConvert.getSumFromCard(fromCardData0);//��0�����
            float cardSum1 =CardDataConvert.getSumFromCard(fromCardData1);//��1�����
			
            int newUsingTime = 0;
            float newLastSum=0;
            StringBuffer dataString = new StringBuffer();
            if(usingTime0>usingTime1){
				newUsingTime = usingTime0+ 1;
				newLastSum = cardSum0+businessMoney;
                if (newUsingTime > 0xFFFF) {
                    //���ʹ�ô����������Ҫд�����飬ԭ���Ŀ����㣬�����ݵ�Ŀ������Ϊ1
                    dataString.append("0000");
                    dataString.append(fromCardData0.substring(4));
                    dataString = new StringBuffer();
                    newUsingTime = 1;
                } else {
                	dataString.append(""); //������0�ſ�
                }
                Element CARDDATA0=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA0,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA0); //---0�ſ�
                
                dataString.append(CardDataConvert
                        .setCardUsingTimesToCard(new Integer(newUsingTime)));
                dataString.append(fromCardData0.substring(4, 8));
                dataString.append(CardDataConvert.setSumToCard(new Float(newLastSum)));
                dataString.append(fromCardData0.substring(14));
                Element CARDDATA1=doc.createElement("CARDDATA");
    			XmlUtil.setNodeValue(CARDDATA1,dataString.toString());
    			CARDDATALIST.appendChild(CARDDATA1); 
                //����1�ſ�
			}
            else{
				newUsingTime = usingTime1+ 1;
				newLastSum = cardSum1+businessMoney;
				String tempStr = null;
				if (newUsingTime > 0xFFFF) {
                    //���ʹ�ô����������Ҫд�����飬ԭ���Ŀ����㣬�����ݵ�Ŀ������Ϊ1
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
                //����0�ſ�
    			if (tempStr == null)
                	tempStr="";//������1�ſ�
    			Element CARDDATA1=doc.createElement("CARDDATA");
     			XmlUtil.setNodeValue(CARDDATA1,tempStr);
     			CARDDATALIST.appendChild(CARDDATA1); //---1�ſ�
            }
            Element CARDDATA2=doc.createElement("CARDDATA");
 			XmlUtil.setNodeValue(CARDDATA2,"");
 			CARDDATALIST.appendChild(CARDDATA2); //---2�ſ�
            
 			Node CardUsingTimesNode= Card.getElementsByTagName("CardUsingTimes").item(0);
 			XmlUtil.setNodeValue(CardUsingTimesNode,String.valueOf(newUsingTime));
 			Node CardLastSumNode= Card.getElementsByTagName("CardLastSum").item(0);
 			XmlUtil.setNodeValue(CardLastSumNode,String.valueOf(newLastSum));
 			String CardID= TalentFunctions.getNodeValueByTagName(Card,"CardID");
            if (CardID != null) {
                
              
                
                //���濨��Ϣ,���ϴ��ʹ�ô������浽card��
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