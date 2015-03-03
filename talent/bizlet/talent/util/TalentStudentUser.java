/*
 * 创建日期 2007-2-2
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
public class TalentStudentUser {
	
	public TalentStudentUser() {
		
	}

	private long operatorID;
	private String userID;
	private String userName;
	private String cardID;
	private int classID = -1;
	private String className;
	private String workingOrg;//工作单位
	private String duty;//职务
	private String beginTime;//开班时间
	private String endTime;//毕业时间
	
	private int roomID = 0;//考勤课室，上课课室ID
	private String roomName = "";//上课课室名称
	private String kqDate = "";//考勤时间
	private String courseDate = "";//上课时间
	private int wubie = -100;//午别
	private String kqState = "";//考勤状态
	private int laterMinutes = 0;//迟到多少分钟 
	private String laterTotal = "0";//迟到累计
	private String absenceTotal = "0";//旷课累计
	private String leaveTotal = "0";//旷课累计
	private String kqInfo = "";//考勤其他信息
	
	private DXCourse course = null;//要考勤的课程
	
	
	
	
	
	
	
	
	
	/**
	 * @return 返回 absenceTotal。
	 */
	public String getAbsenceTotal() {
		return absenceTotal;
	}
	/**
	 * @param absenceTotal 要设置的 absenceTotal。
	 */
	public void setAbsenceTotal(String absenceTotal) {
		this.absenceTotal = absenceTotal;
	}
	/**
	 * @return 返回 leaveTotal。
	 */
	public String getLeaveTotal() {
		return leaveTotal;
	}
	/**
	 * @param leaveTotal 要设置的 leaveTotal。
	 */
	public void setLeaveTotal(String leaveTotal) {
		this.leaveTotal = leaveTotal;
	}
	/**
	 * @return 返回 course。
	 */
	public DXCourse getCourse() {
		return course;
	}
	/**
	 * @param course 要设置的 course。
	 */
	public void setCourse(DXCourse course) {
		this.course = course;
	}
	/**
	 * @return 返回 beginTime。
	 */
	public String getBeginTime() {
		return beginTime;
	}
	/**
	 * @param beginTime 要设置的 beginTime。
	 */
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	/**
	 * @return 返回 endTime。
	 */
	public String getEndTime() {
		return endTime;
	}
	/**
	 * @param endTime 要设置的 endTime。
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	/**
	 * @return 返回 cardID。
	 */
	public String getCardID() {
		return cardID;
	}
	/**
	 * @param cardID 要设置的 cardID。
	 */
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}
	/**
	 * @return 返回 classID。
	 */
	public int getClassID() {
		return classID;
	}
	/**
	 * @param classID 要设置的 classID。
	 */
	public void setClassID(int classID) {
		this.classID = classID;
	}
	/**
	 * @return 返回 className。
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * @param className 要设置的 className。
	 */
	public void setClassName(String className) {
		this.className = className;
	}
	/**
	 * @return 返回 courseDate。
	 */
	public String getCourseDate() {
		return courseDate;
	}
	/**
	 * @param courseDate 要设置的 courseDate。
	 */
	public void setCourseDate(String courseDate) {
		this.courseDate = courseDate;
	}
	/**
	 * @return 返回 duty。
	 */
	public String getDuty() {
		return duty;
	}
	/**
	 * @param duty 要设置的 duty。
	 */
	public void setDuty(String duty) {
		this.duty = duty;
	}
	/**
	 * @return 返回 kqDate。
	 */
	public String getKqDate() {
		return kqDate;
	}
	/**
	 * @param kqDate 要设置的 kqDate。
	 */
	public void setKqDate(String kqDate) {
		this.kqDate = kqDate;
	}
	/**
	 * @return 返回 kqInfo。
	 */
	public String getKqInfo() {
		return kqInfo;
	}
	/**
	 * @param kqInfo 要设置的 kqInfo。
	 */
	public void setKqInfo(String kqInfo) {
		this.kqInfo = kqInfo;
	}
	/**
	 * @return 返回 kqState。
	 */
	public String getKqState() {
		return kqState;
	}
	/**
	 * @param kqState 要设置的 kqState。
	 */
	public void setKqState(String kqState) {
		this.kqState = kqState;
	}
	/**
	 * @return 返回 laterMinutes。
	 */
	public int getLaterMinutes() {
		return laterMinutes;
	}
	/**
	 * @param laterMinutes 要设置的 laterMinutes。
	 */
	public void setLaterMinutes(int laterMinutes) {
		this.laterMinutes = laterMinutes;
	}
	/**
	 * @return 返回 laterTotal。
	 */
	public String getLaterTotal() {
		return laterTotal;
	}
	/**
	 * @param laterTotal 要设置的 laterTotal。
	 */
	public void setLaterTotal(String laterTotal) {
		this.laterTotal = laterTotal;
	}
	/**
	 * @return 返回 operatorID。
	 */
	public long getOperatorID() {
		return operatorID;
	}
	/**
	 * @param operatorID 要设置的 operatorID。
	 */
	public void setOperatorID(long operatorID) {
		this.operatorID = operatorID;
	}
	/**
	 * @return 返回 roomID。
	 */
	public int getRoomID() {
		return roomID;
	}
	/**
	 * @param roomID 要设置的 roomID。
	 */
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	/**
	 * @return 返回 roomName。
	 */
	public String getRoomName() {
		return roomName;
	}
	/**
	 * @param roomName 要设置的 roomName。
	 */
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	/**
	 * @return 返回 userID。
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID 要设置的 userID。
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return 返回 userName。
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName 要设置的 userName。
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return 返回 workingOrg。
	 */
	public String getWorkingOrg() {
		return workingOrg;
	}
	/**
	 * @param workingOrg 要设置的 workingOrg。
	 */
	public void setWorkingOrg(String workingOrg) {
		this.workingOrg = workingOrg;
	}
	/**
	 * @return 返回 wubie。
	 */
	public int getWubie() {
		return wubie;
	}
	/**
	 * @param wubie 要设置的 wubie。
	 */
	public void setWubie(int wubie) {
		this.wubie = wubie;
	}
}
