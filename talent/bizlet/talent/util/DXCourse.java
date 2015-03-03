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
public class DXCourse {

	private String courseTitle;//课程标题
	private int classID;//班级ID
	private String className;//班级名
	private int roomID;//课室ID
	private String roomName;//课室名
	private String classDate;//上课日期
	private String classTime;//上课时间
	private int noon;//午别
	private int isMerge;//是否合班
	private String teacherName;//上课教师
	private int isKq;//是否考勤
	private int courseID;
	
	
	
	
	
	public DXCourse() {
		
	
	}
	
	
	
	
	
	
	
	
	
	/**
	 * @return 返回 courseID。
	 */
	public int getCourseID() {
		return courseID;
	}
	/**
	 * @param courseID 要设置的 courseID。
	 */
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	/**
	 * @return 返回 classDate。
	 */
	public String getClassDate() {
		return classDate;
	}
	/**
	 * @param classDate 要设置的 classDate。
	 */
	public void setClassDate(String classDate) {
		this.classDate = classDate;
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
	 * @return 返回 classTime。
	 */
	public String getClassTime() {
		return classTime;
	}
	/**
	 * @param classTime 要设置的 classTime。
	 */
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	/**
	 * @return 返回 courseTitle。
	 */
	public String getCourseTitle() {
		return courseTitle;
	}
	/**
	 * @param courseTitle 要设置的 courseTitle。
	 */
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	/**
	 * @return 返回 isKq。
	 */
	public int getIsKq() {
		return isKq;
	}
	/**
	 * @param isKq 要设置的 isKq。
	 */
	public void setIsKq(int isKq) {
		this.isKq = isKq;
	}
	/**
	 * @return 返回 isMerge。
	 */
	public int getIsMerge() {
		return isMerge;
	}
	/**
	 * @param isMerge 要设置的 isMerge。
	 */
	public void setIsMerge(int isMerge) {
		this.isMerge = isMerge;
	}
	/**
	 * @return 返回 noon。
	 */
	public int getNoon() {
		return noon;
	}
	/**
	 * @param noon 要设置的 noon。
	 */
	public void setNoon(int noon) {
		this.noon = noon;
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
	 * @return 返回 teacherName。
	 */
	public String getTeacherName() {
		return teacherName;
	}
	/**
	 * @param teacherName 要设置的 teacherName。
	 */
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
}
