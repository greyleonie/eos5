/*
 * �������� 2007-7-31
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.util;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class ParkUserCard {
	public ParkUserCard(){
	}
	
	private int cardID;              //����
	private int cardType;            //������
    private String comeTime;          //ˢ��ʱ��
    private String leaveTime;         //����ʱ��
    private int recordID;            //��¼ID
    private int status;              //״̬
    
    private String userName;          //�û�����
    private String userUnits;         //�û���λ
    private int userID;            //�û�ID
    private String carNO;             //���ƺ�
    private int carType;              //����
    private String parkinfo;          //��ʾ��Ϣ
    private int userType;            //�û�����
    
    private int CountTime;        //ͣ���ϼ�ʱ��
    private float ParkRate;         //����
    private float Money;            //����
    private int PayStyle;           //���ѷ�ʽ
    private float ShouldMoney;      //Ӧ�շ���
    private float ArtualMoney;      //ʵ�շ���
    private String Remark;           //��ע
    
    private byte[] ComeCarPic;      //����ͼƬ
    private byte[] LeaveCarPic;     //����ͼƬ
    private int isComeCarPic;
    private int isLeaveCarPic;
    
	public int getCardID() {
		return cardID;
	}
	

	public void setCardID(int cardID) {
		this.cardID = cardID;
	}
	
	public int getCardType() {
		return cardType;
	}
	

	public void setCardType(int cardType) {
		this.cardType = cardType;
	}
	
	public String getComeTime() {
		return comeTime;
	}
	

	public void setComeTime(String comeTime) {
		this.comeTime = comeTime;
	}
		
	public String getLeaveTime() {
		return leaveTime;
	}
	

	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}
	
	public int getRecordID() {
		return recordID;
	}
	

	public void setRecordID(int recordID) {
		this.recordID = recordID;
	}
	
	public int getStatus() {
		return status;
	}
	

	public void setStatus(int status) {
		this.status = status;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
		
	public String getUserName() {
		return userName;
	}
	public void setUserUnits(String userUnits) {
		this.userUnits = userUnits;
	}
		
	public String getUserUnits() {
		return userUnits;
	}
	
	public void setUserID(int userID) {
		this.userID = userID;
	}
		
	public int getUserID() {
		return userID;
	}
	
	public void setCarNO(String carNO) {
		this.carNO = carNO;
	}
		
	public String getCarNO() {
		return carNO;
	}
	
	public void setCarType(int carType) {
		this.carType = carType;
	}
		
	public int getCarType() {
		return carType;
	}
	
	public void setParkinfo(String parkinfo) {
		this.parkinfo = parkinfo;
	}
		
	public String getParkinfo() {
		return parkinfo;
	}
	
	public void setUserType(int userType) {
		this.userType = userType;
	}
		
	public int getUserType() {
		return userType;
	}
	
	public void setCountTime(int CountTime) {
		this.CountTime = CountTime;
	}
		
	public int getCountTime() {
		return CountTime;
	}
	
	public void setParkRate(float ParkRate) {
		this.ParkRate = ParkRate;
	}
		
	public float getParkRate() {
		return ParkRate;
	}
	
	public void setMoney(float Money) {
		this.Money = Money;
	}
		
	public float getMoney() {
		return Money;
	}
	
	public void setPayStyle(int PayStyle) {
		this.PayStyle = PayStyle;
	}
		
	public int getPayStyle() {
		return PayStyle;
	}
	
	public void setShouldMoney(float ShouldMoney) {
		this.ShouldMoney = ShouldMoney;
	}
		
	public float getShouldMoney() {
		return ShouldMoney;
	}
	
	public void setArtualMoney(float ArtualMoney) {
		this.ArtualMoney = ArtualMoney;
	}
		
	public float getArtualMoney() {
		return ArtualMoney;
	}
	
	public void setRemark(String Remark) {
		this.Remark = Remark;
	}
		
	public String getRemark() {
		return Remark;
	}
	
	public void setComeCarPic(byte[] ComeCarPic) {
		this.ComeCarPic = ComeCarPic;
	}
		
	public byte[] getComeCarPic() {
		return ComeCarPic;
	}
	
	public void setLeaveCarPic(byte[] LeaveCarPic) {
		this.LeaveCarPic = LeaveCarPic;
	}
		
	public byte[] getLeaveCarPic() {
		return LeaveCarPic;
	}
	
	public void setIsComeCarPic(int isComeCarPic) {
		this.isComeCarPic = isComeCarPic;
	}
		
	public int getIsComeCarPic() {
		return isComeCarPic;
	}
	
	public void setIsLeaveCarPic(int isLeaveCarPic) {
		this.isLeaveCarPic = isLeaveCarPic;
	}
		
	public int getIsLeaveCarPic() {
		return isLeaveCarPic;
	}
}
