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
public class DXCourse {

	private String courseTitle;//�γ̱���
	private int classID;//�༶ID
	private String className;//�༶��
	private int roomID;//����ID
	private String roomName;//������
	private String classDate;//�Ͽ�����
	private String classTime;//�Ͽ�ʱ��
	private int noon;//���
	private int isMerge;//�Ƿ�ϰ�
	private String teacherName;//�Ͽν�ʦ
	private int isKq;//�Ƿ���
	private int courseID;
	
	
	
	
	
	public DXCourse() {
		
	
	}
	
	
	
	
	
	
	
	
	
	/**
	 * @return ���� courseID��
	 */
	public int getCourseID() {
		return courseID;
	}
	/**
	 * @param courseID Ҫ���õ� courseID��
	 */
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	/**
	 * @return ���� classDate��
	 */
	public String getClassDate() {
		return classDate;
	}
	/**
	 * @param classDate Ҫ���õ� classDate��
	 */
	public void setClassDate(String classDate) {
		this.classDate = classDate;
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
	 * @return ���� classTime��
	 */
	public String getClassTime() {
		return classTime;
	}
	/**
	 * @param classTime Ҫ���õ� classTime��
	 */
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	/**
	 * @return ���� courseTitle��
	 */
	public String getCourseTitle() {
		return courseTitle;
	}
	/**
	 * @param courseTitle Ҫ���õ� courseTitle��
	 */
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	/**
	 * @return ���� isKq��
	 */
	public int getIsKq() {
		return isKq;
	}
	/**
	 * @param isKq Ҫ���õ� isKq��
	 */
	public void setIsKq(int isKq) {
		this.isKq = isKq;
	}
	/**
	 * @return ���� isMerge��
	 */
	public int getIsMerge() {
		return isMerge;
	}
	/**
	 * @param isMerge Ҫ���õ� isMerge��
	 */
	public void setIsMerge(int isMerge) {
		this.isMerge = isMerge;
	}
	/**
	 * @return ���� noon��
	 */
	public int getNoon() {
		return noon;
	}
	/**
	 * @param noon Ҫ���õ� noon��
	 */
	public void setNoon(int noon) {
		this.noon = noon;
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
	 * @return ���� teacherName��
	 */
	public String getTeacherName() {
		return teacherName;
	}
	/**
	 * @param teacherName Ҫ���õ� teacherName��
	 */
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
}
