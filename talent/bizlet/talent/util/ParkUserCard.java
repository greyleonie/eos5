/*
 * 创建日期 2007-7-31
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ParkUserCard {
	public ParkUserCard(){
	}
	
	private int cardID;              //卡号
	private int cardType;            //卡类型
    private String comeTime;          //刷卡时间
    private String leaveTime;         //销卡时间
    private int recordID;            //记录ID
    private int status;              //状态
    
    private String userName;          //用户姓名
    private String userUnits;         //用户单位
    private int userID;            //用户ID
    private String carNO;             //车牌号
    private int carType;              //车型
    private String parkinfo;          //提示信息
    private int userType;            //用户类型
    
    private int CountTime;        //停车合计时间
    private float ParkRate;         //费率
    private float Money;            //费用
    private int PayStyle;           //付费方式
    private float ShouldMoney;      //应收费用
    private float ArtualMoney;      //实收费用
    private String Remark;           //备注
    
    private byte[] ComeCarPic;      //进门图片
    private byte[] LeaveCarPic;     //出门图片
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
