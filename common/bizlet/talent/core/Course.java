/*
 * �������� 2007-4-29
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.util.ArrayList;


/**
 * @author tim
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class Course {

	   private int    classRoomId;
	   private int    courseId;
	   private int    unitId;
	   private int    specialId;
	   private int    classId;
	   private String className;
	   private String courseTitle;
	   private String classDate;
	   private String classTime;
	   private int    classNoon;
	   private String classRoom;
	   private String teachers;
	   private String tutors;
	   private String attenders;
	   private String outSider;
	   private String outSidePost;
	   private String compere;
	   private String conventioneers;
	   private int    teachingModelId;
	   private int    classModelId;   
	   private int    rowSpan;
	   private int    weekIndex;
	   private String weekDate;
	   private String noonName;
	   private int   timeRowSpan;//ʱ����ҳ��ռ��rowspan,�ڽ�ѧ������ܺͺ��ڷ�������õ���
	   private ArrayList services;//���������Ŀ��Ϣ
	   private String remarks;
	   private String DeskArrange;
	   private String operatorname;
		
	   /**
		 * @return ���� classRoomId��
		 */
		public int getClassRoomId() {
			return classRoomId;
		}
		/**
		 * @param classRoomId Ҫ���õ� classRoomId��
		 */
		public void setClassRoomId(int classRoomId) {
			this.classRoomId = classRoomId;
		}
/**
 * @return ���� attenders��
 */
public String getAttenders() {
	return attenders;
}
/**
 * @param attenders Ҫ���õ� attenders��
 */
public void setAttenders(String attenders) {
	this.attenders = attenders;
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
 * @return ���� classId��
 */
public int getClassId() {
	return classId;
}
/**
 * @param classId Ҫ���õ� classId��
 */
public void setClassId(int classId) {
	this.classId = classId;
}
/**
 * @return ���� classModelId��
 */
public int getClassModelId() {
	return classModelId;
}
/**
 * @param classModelId Ҫ���õ� classModelId��
 */
public void setClassModelId(int classModelId) {
	this.classModelId = classModelId;
}
/**
 * @return ���� classNoon��
 */
public int getClassNoon() {
	return classNoon;
}
/**
 * @param classNoon Ҫ���õ� classNoon��
 */
public void setClassNoon(int classNoon) {
	this.classNoon = classNoon;
}
/**
 * @return ���� classRoomId��
 */
public String getClassRoom() {
	return classRoom;
}
/**
 * @param classRoomId Ҫ���õ� classRoomId��
 */
public void setClassRoom(String classRoom) {
	this.classRoom = classRoom;
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
 * @return ���� compere��
 */
public String getCompere() {
	return compere;
}
/**
 * @param compere Ҫ���õ� compere��
 */
public void setCompere(String compere) {
	this.compere = compere;
}
/**
 * @return ���� conventioneers��
 */
public String getConventioneers() {
	return conventioneers;
}
/**
 * @param conventioneers Ҫ���õ� conventioneers��
 */
public void setConventioneers(String conventioneers) {
	this.conventioneers = conventioneers;
}
/**
 * @return ���� courseId��
 */
public int getCourseId() {
	return courseId;
}
/**
 * @param courseId Ҫ���õ� courseId��
 */
public void setCourseId(int courseId) {
	this.courseId = courseId;
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
 * @return ���� outSidePost��
 */
public String getOutSidePost() {
	return outSidePost;
}
/**
 * @param outSidePost Ҫ���õ� outSidePost��
 */
public void setOutSidePost(String outSidePost) {
	this.outSidePost = outSidePost;
}
/**
 * @return ���� outSider��
 */
public String getOutSider() {
	return outSider;
}
/**
 * @param outSider Ҫ���õ� outSider��
 */
public void setOutSider(String outSider) {
	this.outSider = outSider;
}
/**
 * @return ���� rowSpan��
 */
public int getRowSpan() {
	return rowSpan;
}
/**
 * @param rowSpan Ҫ���õ� rowSpan��
 */
public void setRowSpan(int rowSpan) {
	this.rowSpan = rowSpan;
}
/**
 * @return ���� specialId��
 */
public int getSpecialId() {
	return specialId;
}
/**
 * @param specialId Ҫ���õ� specialId��
 */
public void setSpecialId(int specialId) {
	this.specialId = specialId;
}
/**
 * @return ���� teachers��
 */
public String getTeachers() {
	return teachers;
}
/**
 * @param teachers Ҫ���õ� teachers��
 */
public void setTeachers(String teachers) {
	this.teachers = teachers;
}
/**
 * @return ���� teachingModelId��
 */
public int getTeachingModelId() {
	return teachingModelId;
}
/**
 * @param teachingModelId Ҫ���õ� teachingModelId��
 */
public void setTeachingModelId(int teachingModelId) {
	this.teachingModelId = teachingModelId;
}
/**
 * @return ���� tutors��
 */
public String getTutors() {
	return tutors;
}
/**
 * @param tutors Ҫ���õ� tutors��
 */
public void setTutors(String tutors) {
	this.tutors = tutors;
}
/**
 * @return ���� unitId��
 */
public int getUnitId() {
	return unitId;
}
/**
 * @param unitId Ҫ���õ� unitId��
 */
public void setUnitId(int unitId) {
	this.unitId = unitId;
}

/**
 * @return ���� week��
 */
public int getWeekIndex() {
	return weekIndex;
}
/**
 * @param week Ҫ���õ� week��
 */
public void setWeekIndex(int weekIndex) {
	this.weekIndex = weekIndex;
}

/**
 * @return ���� weekDate��
 */
public String getWeekDate() {
	return weekDate;
}
/**
 * @param weekDate Ҫ���õ� weekDate��
 */
public void setWeekDate(String weekDate) {
	this.weekDate = weekDate;
}

/**
 * @return ���� noonName��
 */
public String getNoonName() {
	return noonName;
}
/**
 * @param noonName Ҫ���õ� noonName��
 */
public void setNoonName(String noonName) {
	this.noonName = noonName;
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
 * @return ���� remarks��
 */
public String getRemarks() {
	return remarks;
}
/**
 * @param remarks Ҫ���õ� remarks��
 */
public void setRemarks(String remarks) {
	this.remarks = remarks;
}  
   
   
/**
 * @return ���� radioPhone��
 */
public int getRadioPhone() {
	return radioPhone;
}
/**
 * @param radioPhone Ҫ���õ� radioPhone��
 */
public void setRadioPhone(int radioPhone) {
	this.radioPhone = radioPhone;
}
/**
 * @return ���� wiredPhone��
 */
public int getWiredPhone() {
	return wiredPhone;
}
/**
 * @param wiredPhone Ҫ���õ� wiredPhone��
 */
public void setWiredPhone(int wiredPhone) {
	this.wiredPhone = wiredPhone;
}
   private int radioPhone;
   private int wiredPhone;
/**
 * @return ���� service��
 */

/**
 * @param service Ҫ���õ� service��
 */

  
   
public Course(int rowSpan){
	this.rowSpan=rowSpan;	

}
   
public Course(){
	

}


/**
 * @return ���� timeRowSpan��
 */
public int getTimeRowSpan() {
	return timeRowSpan;
}
/**
 * @param timeRowSpan Ҫ���õ� timeRowSpan��
 */
public void setTimeRowSpan(int timeRowSpan) {
	this.timeRowSpan = timeRowSpan;
}
/**
 * @return ���� services��
 */
public ArrayList getServices() {
	return services;
}
/**
 * @param services Ҫ���õ� services��
 */
public void setServices(ArrayList services) {
	this.services = services;
}



	/**
	 * @return ���� deskArrange��
	 */
	public String getDeskArrange() {
		return DeskArrange;
	}
	/**
	 * @param deskArrange Ҫ���õ� deskArrange��
	 */
	public void setDeskArrange(String deskArrange) {
		DeskArrange = deskArrange;
	}
    /**
     * @return ���� operatorname��
     */
    public String getOperatorname() {
        return operatorname;
    }
    /**
     * @param operatorname Ҫ���õ� operatorname��
     */
    public void setOperatorname(String operatorname) {
        this.operatorname = operatorname;
    }
}

