/*
 * �������� 2007-2-2
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
public class TalentStudentUser {
	
	public TalentStudentUser() {
		
	}

	private long operatorID;
	private String userID;
	private String userName;
	private String cardID;
	private int classID = -1;
	private String className;
	private String workingOrg;//������λ
	private String duty;//ְ��
	private String beginTime;//����ʱ��
	private String endTime;//��ҵʱ��
	
	private int roomID = 0;//���ڿ��ң��Ͽο���ID
	private String roomName = "";//�Ͽο�������
	private String kqDate = "";//����ʱ��
	private String courseDate = "";//�Ͽ�ʱ��
	private int wubie = -100;//���
	private String kqState = "";//����״̬
	private int laterMinutes = 0;//�ٵ����ٷ��� 
	private String laterTotal = "0";//�ٵ��ۼ�
	private String absenceTotal = "0";//�����ۼ�
	private String leaveTotal = "0";//�����ۼ�
	private String kqInfo = "";//����������Ϣ
	
	private DXCourse course = null;//Ҫ���ڵĿγ�
	
	
	
	
	
	
	
	
	
	/**
	 * @return ���� absenceTotal��
	 */
	public String getAbsenceTotal() {
		return absenceTotal;
	}
	/**
	 * @param absenceTotal Ҫ���õ� absenceTotal��
	 */
	public void setAbsenceTotal(String absenceTotal) {
		this.absenceTotal = absenceTotal;
	}
	/**
	 * @return ���� leaveTotal��
	 */
	public String getLeaveTotal() {
		return leaveTotal;
	}
	/**
	 * @param leaveTotal Ҫ���õ� leaveTotal��
	 */
	public void setLeaveTotal(String leaveTotal) {
		this.leaveTotal = leaveTotal;
	}
	/**
	 * @return ���� course��
	 */
	public DXCourse getCourse() {
		return course;
	}
	/**
	 * @param course Ҫ���õ� course��
	 */
	public void setCourse(DXCourse course) {
		this.course = course;
	}
	/**
	 * @return ���� beginTime��
	 */
	public String getBeginTime() {
		return beginTime;
	}
	/**
	 * @param beginTime Ҫ���õ� beginTime��
	 */
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	/**
	 * @return ���� endTime��
	 */
	public String getEndTime() {
		return endTime;
	}
	/**
	 * @param endTime Ҫ���õ� endTime��
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	/**
	 * @return ���� cardID��
	 */
	public String getCardID() {
		return cardID;
	}
	/**
	 * @param cardID Ҫ���õ� cardID��
	 */
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}
	/**
	 * @return ���� classID��
	 */
	public int getClassID() {
		return classID;
	}
	/**
	 * @param classID Ҫ���õ� classID��
	 */
	public void setClassID(int classID) {
		this.classID = classID;
	}
	/**
	 * @return ���� className��
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * @param className Ҫ���õ� className��
	 */
	public void setClassName(String className) {
		this.className = className;
	}
	/**
	 * @return ���� courseDate��
	 */
	public String getCourseDate() {
		return courseDate;
	}
	/**
	 * @param courseDate Ҫ���õ� courseDate��
	 */
	public void setCourseDate(String courseDate) {
		this.courseDate = courseDate;
	}
	/**
	 * @return ���� duty��
	 */
	public String getDuty() {
		return duty;
	}
	/**
	 * @param duty Ҫ���õ� duty��
	 */
	public void setDuty(String duty) {
		this.duty = duty;
	}
	/**
	 * @return ���� kqDate��
	 */
	public String getKqDate() {
		return kqDate;
	}
	/**
	 * @param kqDate Ҫ���õ� kqDate��
	 */
	public void setKqDate(String kqDate) {
		this.kqDate = kqDate;
	}
	/**
	 * @return ���� kqInfo��
	 */
	public String getKqInfo() {
		return kqInfo;
	}
	/**
	 * @param kqInfo Ҫ���õ� kqInfo��
	 */
	public void setKqInfo(String kqInfo) {
		this.kqInfo = kqInfo;
	}
	/**
	 * @return ���� kqState��
	 */
	public String getKqState() {
		return kqState;
	}
	/**
	 * @param kqState Ҫ���õ� kqState��
	 */
	public void setKqState(String kqState) {
		this.kqState = kqState;
	}
	/**
	 * @return ���� laterMinutes��
	 */
	public int getLaterMinutes() {
		return laterMinutes;
	}
	/**
	 * @param laterMinutes Ҫ���õ� laterMinutes��
	 */
	public void setLaterMinutes(int laterMinutes) {
		this.laterMinutes = laterMinutes;
	}
	/**
	 * @return ���� laterTotal��
	 */
	public String getLaterTotal() {
		return laterTotal;
	}
	/**
	 * @param laterTotal Ҫ���õ� laterTotal��
	 */
	public void setLaterTotal(String laterTotal) {
		this.laterTotal = laterTotal;
	}
	/**
	 * @return ���� operatorID��
	 */
	public long getOperatorID() {
		return operatorID;
	}
	/**
	 * @param operatorID Ҫ���õ� operatorID��
	 */
	public void setOperatorID(long operatorID) {
		this.operatorID = operatorID;
	}
	/**
	 * @return ���� roomID��
	 */
	public int getRoomID() {
		return roomID;
	}
	/**
	 * @param roomID Ҫ���õ� roomID��
	 */
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	/**
	 * @return ���� roomName��
	 */
	public String getRoomName() {
		return roomName;
	}
	/**
	 * @param roomName Ҫ���õ� roomName��
	 */
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	/**
	 * @return ���� userID��
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID Ҫ���õ� userID��
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return ���� userName��
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName Ҫ���õ� userName��
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return ���� workingOrg��
	 */
	public String getWorkingOrg() {
		return workingOrg;
	}
	/**
	 * @param workingOrg Ҫ���õ� workingOrg��
	 */
	public void setWorkingOrg(String workingOrg) {
		this.workingOrg = workingOrg;
	}
	/**
	 * @return ���� wubie��
	 */
	public int getWubie() {
		return wubie;
	}
	/**
	 * @param wubie Ҫ���õ� wubie��
	 */
	public void setWubie(int wubie) {
		this.wubie = wubie;
	}
}
