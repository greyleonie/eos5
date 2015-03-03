/*
 * 创建日期 2007-4-29
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.util.ArrayList;


/**
 * @author tim
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
	   private int   timeRowSpan;//时间在页面占的rowspan,在教学服务汇总和后勤服务汇总用到，
	   private ArrayList services;//保存服务项目信息
	   private String remarks;
	   private String DeskArrange;
	   private String operatorname;
		
	   /**
		 * @return 返回 classRoomId。
		 */
		public int getClassRoomId() {
			return classRoomId;
		}
		/**
		 * @param classRoomId 要设置的 classRoomId。
		 */
		public void setClassRoomId(int classRoomId) {
			this.classRoomId = classRoomId;
		}
/**
 * @return 返回 attenders。
 */
public String getAttenders() {
	return attenders;
}
/**
 * @param attenders 要设置的 attenders。
 */
public void setAttenders(String attenders) {
	this.attenders = attenders;
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
 * @return 返回 classId。
 */
public int getClassId() {
	return classId;
}
/**
 * @param classId 要设置的 classId。
 */
public void setClassId(int classId) {
	this.classId = classId;
}
/**
 * @return 返回 classModelId。
 */
public int getClassModelId() {
	return classModelId;
}
/**
 * @param classModelId 要设置的 classModelId。
 */
public void setClassModelId(int classModelId) {
	this.classModelId = classModelId;
}
/**
 * @return 返回 classNoon。
 */
public int getClassNoon() {
	return classNoon;
}
/**
 * @param classNoon 要设置的 classNoon。
 */
public void setClassNoon(int classNoon) {
	this.classNoon = classNoon;
}
/**
 * @return 返回 classRoomId。
 */
public String getClassRoom() {
	return classRoom;
}
/**
 * @param classRoomId 要设置的 classRoomId。
 */
public void setClassRoom(String classRoom) {
	this.classRoom = classRoom;
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
 * @return 返回 compere。
 */
public String getCompere() {
	return compere;
}
/**
 * @param compere 要设置的 compere。
 */
public void setCompere(String compere) {
	this.compere = compere;
}
/**
 * @return 返回 conventioneers。
 */
public String getConventioneers() {
	return conventioneers;
}
/**
 * @param conventioneers 要设置的 conventioneers。
 */
public void setConventioneers(String conventioneers) {
	this.conventioneers = conventioneers;
}
/**
 * @return 返回 courseId。
 */
public int getCourseId() {
	return courseId;
}
/**
 * @param courseId 要设置的 courseId。
 */
public void setCourseId(int courseId) {
	this.courseId = courseId;
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
 * @return 返回 outSidePost。
 */
public String getOutSidePost() {
	return outSidePost;
}
/**
 * @param outSidePost 要设置的 outSidePost。
 */
public void setOutSidePost(String outSidePost) {
	this.outSidePost = outSidePost;
}
/**
 * @return 返回 outSider。
 */
public String getOutSider() {
	return outSider;
}
/**
 * @param outSider 要设置的 outSider。
 */
public void setOutSider(String outSider) {
	this.outSider = outSider;
}
/**
 * @return 返回 rowSpan。
 */
public int getRowSpan() {
	return rowSpan;
}
/**
 * @param rowSpan 要设置的 rowSpan。
 */
public void setRowSpan(int rowSpan) {
	this.rowSpan = rowSpan;
}
/**
 * @return 返回 specialId。
 */
public int getSpecialId() {
	return specialId;
}
/**
 * @param specialId 要设置的 specialId。
 */
public void setSpecialId(int specialId) {
	this.specialId = specialId;
}
/**
 * @return 返回 teachers。
 */
public String getTeachers() {
	return teachers;
}
/**
 * @param teachers 要设置的 teachers。
 */
public void setTeachers(String teachers) {
	this.teachers = teachers;
}
/**
 * @return 返回 teachingModelId。
 */
public int getTeachingModelId() {
	return teachingModelId;
}
/**
 * @param teachingModelId 要设置的 teachingModelId。
 */
public void setTeachingModelId(int teachingModelId) {
	this.teachingModelId = teachingModelId;
}
/**
 * @return 返回 tutors。
 */
public String getTutors() {
	return tutors;
}
/**
 * @param tutors 要设置的 tutors。
 */
public void setTutors(String tutors) {
	this.tutors = tutors;
}
/**
 * @return 返回 unitId。
 */
public int getUnitId() {
	return unitId;
}
/**
 * @param unitId 要设置的 unitId。
 */
public void setUnitId(int unitId) {
	this.unitId = unitId;
}

/**
 * @return 返回 week。
 */
public int getWeekIndex() {
	return weekIndex;
}
/**
 * @param week 要设置的 week。
 */
public void setWeekIndex(int weekIndex) {
	this.weekIndex = weekIndex;
}

/**
 * @return 返回 weekDate。
 */
public String getWeekDate() {
	return weekDate;
}
/**
 * @param weekDate 要设置的 weekDate。
 */
public void setWeekDate(String weekDate) {
	this.weekDate = weekDate;
}

/**
 * @return 返回 noonName。
 */
public String getNoonName() {
	return noonName;
}
/**
 * @param noonName 要设置的 noonName。
 */
public void setNoonName(String noonName) {
	this.noonName = noonName;
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
 * @return 返回 remarks。
 */
public String getRemarks() {
	return remarks;
}
/**
 * @param remarks 要设置的 remarks。
 */
public void setRemarks(String remarks) {
	this.remarks = remarks;
}  
   
   
/**
 * @return 返回 radioPhone。
 */
public int getRadioPhone() {
	return radioPhone;
}
/**
 * @param radioPhone 要设置的 radioPhone。
 */
public void setRadioPhone(int radioPhone) {
	this.radioPhone = radioPhone;
}
/**
 * @return 返回 wiredPhone。
 */
public int getWiredPhone() {
	return wiredPhone;
}
/**
 * @param wiredPhone 要设置的 wiredPhone。
 */
public void setWiredPhone(int wiredPhone) {
	this.wiredPhone = wiredPhone;
}
   private int radioPhone;
   private int wiredPhone;
/**
 * @return 返回 service。
 */

/**
 * @param service 要设置的 service。
 */

  
   
public Course(int rowSpan){
	this.rowSpan=rowSpan;	

}
   
public Course(){
	

}


/**
 * @return 返回 timeRowSpan。
 */
public int getTimeRowSpan() {
	return timeRowSpan;
}
/**
 * @param timeRowSpan 要设置的 timeRowSpan。
 */
public void setTimeRowSpan(int timeRowSpan) {
	this.timeRowSpan = timeRowSpan;
}
/**
 * @return 返回 services。
 */
public ArrayList getServices() {
	return services;
}
/**
 * @param services 要设置的 services。
 */
public void setServices(ArrayList services) {
	this.services = services;
}



	/**
	 * @return 返回 deskArrange。
	 */
	public String getDeskArrange() {
		return DeskArrange;
	}
	/**
	 * @param deskArrange 要设置的 deskArrange。
	 */
	public void setDeskArrange(String deskArrange) {
		DeskArrange = deskArrange;
	}
    /**
     * @return 返回 operatorname。
     */
    public String getOperatorname() {
        return operatorname;
    }
    /**
     * @param operatorname 要设置的 operatorname。
     */
    public void setOperatorname(String operatorname) {
        this.operatorname = operatorname;
    }
}

