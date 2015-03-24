package com.talent.hibernate;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Course generated by MyEclipse - Hibernate Tools
 */

public class Course  implements java.io.Serializable {


    // Fields    

     private Integer courseId;
     private Integer unitId;
     private Integer specialId;
     private Integer classId;
     private String courseTitle;
     private Date classDate;
     private Date classTime;
     private String classNoon;
     private Integer classRoomId;
     private String scoringMethod;
     private Integer isOutClass;
     private Integer isMeldClass;
     private String teachers;
     private String tutors;
     private String attenders;
     private String outsider;
     private String outSideOrg;
     private String outSidePost;
     private String compere;
     private String conventioneers;
     private Integer teahchingModelId;
     private Integer classModelId;
     private Integer isUseKqj;
     private Integer isUseCourseWare;
     private Integer isUseNotebookPc;
     private Integer isTakeFeature;
     private Integer isUseCamera;
     private Integer isUseVideo;
     private Integer isUseMediaPlayer;
     private Integer radioPhones;
     private Integer wiredPhones;
     private Integer platformSeats;
     private Integer studentSeats;
     private Integer cups;
     private Integer isUseTea;
     private Integer isUseFlower;
     private String deskArrange;
     private String remarks;
     private String approval;
     private String opinion;
     private Integer isSendNotice;
     private Integer isAdopted;
     private Integer classHour;
     private long credit;
     private Integer teachingGroupId;
     private Set courseAdjusts = new HashSet(0);


    // Constructors

    /** default constructor */
    public Course() {
    }

    
    /** full constructor */
    public Course(Integer unitId, Integer specialId, Integer classId, String courseTitle, Date classDate, Date classTime, String classNoon, Integer classRoomId, String scoringMethod, Integer isOutClass, Integer isMeldClass, String teachers, String tutors, String attenders, String outsider, String outSideOrg, String outSidePost, String compere, String conventioneers, Integer teahchingModelId, Integer classModelId, Integer isUseKqj, Integer isUseCourseWare, Integer isUseNotebookPc, Integer isTakeFeature, Integer isUseCamera, Integer isUseVideo, Integer isUseMediaPlayer, Integer radioPhones, Integer wiredPhones, Integer platformSeats, Integer studentSeats, Integer cups, Integer isUseTea, Integer isUseFlower, String deskArrange, String remarks, String approval, String opinion, Integer isSendNotice, Integer isAdopted, Integer classHour, long credit, Integer teachingGroupId, Set courseAdjusts) {
        this.unitId = unitId;
        this.specialId = specialId;
        this.classId = classId;
        this.courseTitle = courseTitle;
        this.classDate = classDate;
        this.classTime = classTime;
        this.classNoon = classNoon;
        this.classRoomId = classRoomId;
        this.scoringMethod = scoringMethod;
        this.isOutClass = isOutClass;
        this.isMeldClass = isMeldClass;
        this.teachers = teachers;
        this.tutors = tutors;
        this.attenders = attenders;
        this.outsider = outsider;
        this.outSideOrg = outSideOrg;
        this.outSidePost = outSidePost;
        this.compere = compere;
        this.conventioneers = conventioneers;
        this.teahchingModelId = teahchingModelId;
        this.classModelId = classModelId;
        this.isUseKqj = isUseKqj;
        this.isUseCourseWare = isUseCourseWare;
        this.isUseNotebookPc = isUseNotebookPc;
        this.isTakeFeature = isTakeFeature;
        this.isUseCamera = isUseCamera;
        this.isUseVideo = isUseVideo;
        this.isUseMediaPlayer = isUseMediaPlayer;
        this.radioPhones = radioPhones;
        this.wiredPhones = wiredPhones;
        this.platformSeats = platformSeats;
        this.studentSeats = studentSeats;
        this.cups = cups;
        this.isUseTea = isUseTea;
        this.isUseFlower = isUseFlower;
        this.deskArrange = deskArrange;
        this.remarks = remarks;
        this.approval = approval;
        this.opinion = opinion;
        this.isSendNotice = isSendNotice;
        this.isAdopted = isAdopted;
        this.classHour = classHour;
        this.credit = credit;
        this.teachingGroupId = teachingGroupId;
        this.courseAdjusts = courseAdjusts;
    }

   
    // Property accessors

    public Integer getCourseId() {
        return this.courseId;
    }
    
    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getUnitId() {
        return this.unitId;
    }
    
    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    public Integer getSpecialId() {
        return this.specialId;
    }
    
    public void setSpecialId(Integer specialId) {
        this.specialId = specialId;
    }

    public Integer getClassId() {
        return this.classId;
    }
    
    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getCourseTitle() {
        return this.courseTitle;
    }
    
    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public Date getClassDate() {
        return this.classDate;
    }
    
    public void setClassDate(Date classDate) {
        this.classDate = classDate;
    }

    public Date getClassTime() {
        return this.classTime;
    }
    
    public void setClassTime(Date classTime) {
        this.classTime = classTime;
    }

    public String getClassNoon() {
        return this.classNoon;
    }
    
    public void setClassNoon(String classNoon) {
        this.classNoon = classNoon;
    }

    public Integer getClassRoomId() {
        return this.classRoomId;
    }
    
    public void setClassRoomId(Integer classRoomId) {
        this.classRoomId = classRoomId;
    }

    public String getScoringMethod() {
        return this.scoringMethod;
    }
    
    public void setScoringMethod(String scoringMethod) {
        this.scoringMethod = scoringMethod;
    }

    public Integer getIsOutClass() {
        return this.isOutClass;
    }
    
    public void setIsOutClass(Integer isOutClass) {
        this.isOutClass = isOutClass;
    }

    public Integer getIsMeldClass() {
        return this.isMeldClass;
    }
    
    public void setIsMeldClass(Integer isMeldClass) {
        this.isMeldClass = isMeldClass;
    }

    public String getTeachers() {
        return this.teachers;
    }
    
    public void setTeachers(String teachers) {
        this.teachers = teachers;
    }

    public String getTutors() {
        return this.tutors;
    }
    
    public void setTutors(String tutors) {
        this.tutors = tutors;
    }

    public String getAttenders() {
        return this.attenders;
    }
    
    public void setAttenders(String attenders) {
        this.attenders = attenders;
    }

    public String getOutsider() {
        return this.outsider;
    }
    
    public void setOutsider(String outsider) {
        this.outsider = outsider;
    }

    public String getOutSideOrg() {
        return this.outSideOrg;
    }
    
    public void setOutSideOrg(String outSideOrg) {
        this.outSideOrg = outSideOrg;
    }

    public String getOutSidePost() {
        return this.outSidePost;
    }
    
    public void setOutSidePost(String outSidePost) {
        this.outSidePost = outSidePost;
    }

    public String getCompere() {
        return this.compere;
    }
    
    public void setCompere(String compere) {
        this.compere = compere;
    }

    public String getConventioneers() {
        return this.conventioneers;
    }
    
    public void setConventioneers(String conventioneers) {
        this.conventioneers = conventioneers;
    }

    public Integer getTeahchingModelId() {
        return this.teahchingModelId;
    }
    
    public void setTeahchingModelId(Integer teahchingModelId) {
        this.teahchingModelId = teahchingModelId;
    }

    public Integer getClassModelId() {
        return this.classModelId;
    }
    
    public void setClassModelId(Integer classModelId) {
        this.classModelId = classModelId;
    }

    public Integer getIsUseKqj() {
        return this.isUseKqj;
    }
    
    public void setIsUseKqj(Integer isUseKqj) {
        this.isUseKqj = isUseKqj;
    }

    public Integer getIsUseCourseWare() {
        return this.isUseCourseWare;
    }
    
    public void setIsUseCourseWare(Integer isUseCourseWare) {
        this.isUseCourseWare = isUseCourseWare;
    }

    public Integer getIsUseNotebookPc() {
        return this.isUseNotebookPc;
    }
    
    public void setIsUseNotebookPc(Integer isUseNotebookPc) {
        this.isUseNotebookPc = isUseNotebookPc;
    }

    public Integer getIsTakeFeature() {
        return this.isTakeFeature;
    }
    
    public void setIsTakeFeature(Integer isTakeFeature) {
        this.isTakeFeature = isTakeFeature;
    }

    public Integer getIsUseCamera() {
        return this.isUseCamera;
    }
    
    public void setIsUseCamera(Integer isUseCamera) {
        this.isUseCamera = isUseCamera;
    }

    public Integer getIsUseVideo() {
        return this.isUseVideo;
    }
    
    public void setIsUseVideo(Integer isUseVideo) {
        this.isUseVideo = isUseVideo;
    }

    public Integer getIsUseMediaPlayer() {
        return this.isUseMediaPlayer;
    }
    
    public void setIsUseMediaPlayer(Integer isUseMediaPlayer) {
        this.isUseMediaPlayer = isUseMediaPlayer;
    }

    public Integer getRadioPhones() {
        return this.radioPhones;
    }
    
    public void setRadioPhones(Integer radioPhones) {
        this.radioPhones = radioPhones;
    }

    public Integer getWiredPhones() {
        return this.wiredPhones;
    }
    
    public void setWiredPhones(Integer wiredPhones) {
        this.wiredPhones = wiredPhones;
    }

    public Integer getPlatformSeats() {
        return this.platformSeats;
    }
    
    public void setPlatformSeats(Integer platformSeats) {
        this.platformSeats = platformSeats;
    }

    public Integer getStudentSeats() {
        return this.studentSeats;
    }
    
    public void setStudentSeats(Integer studentSeats) {
        this.studentSeats = studentSeats;
    }

    public Integer getCups() {
        return this.cups;
    }
    
    public void setCups(Integer cups) {
        this.cups = cups;
    }

    public Integer getIsUseTea() {
        return this.isUseTea;
    }
    
    public void setIsUseTea(Integer isUseTea) {
        this.isUseTea = isUseTea;
    }

    public Integer getIsUseFlower() {
        return this.isUseFlower;
    }
    
    public void setIsUseFlower(Integer isUseFlower) {
        this.isUseFlower = isUseFlower;
    }

    public String getDeskArrange() {
        return this.deskArrange;
    }
    
    public void setDeskArrange(String deskArrange) {
        this.deskArrange = deskArrange;
    }

    public String getRemarks() {
        return this.remarks;
    }
    
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getApproval() {
        return this.approval;
    }
    
    public void setApproval(String approval) {
        this.approval = approval;
    }

    public String getOpinion() {
        return this.opinion;
    }
    
    public void setOpinion(String opinion) {
        this.opinion = opinion;
    }

    public Integer getIsSendNotice() {
        return this.isSendNotice;
    }
    
    public void setIsSendNotice(Integer isSendNotice) {
        this.isSendNotice = isSendNotice;
    }

    public Integer getIsAdopted() {
        return this.isAdopted;
    }
    
    public void setIsAdopted(Integer isAdopted) {
        this.isAdopted = isAdopted;
    }

    public Integer getClassHour() {
        return this.classHour;
    }
    
    public void setClassHour(Integer classHour) {
        this.classHour = classHour;
    }

    public long getCredit() {
        return this.credit;
    }
    
    public void setCredit(long credit) {
        this.credit = credit;
    }

    public Integer getTeachingGroupId() {
        return this.teachingGroupId;
    }
    
    public void setTeachingGroupId(Integer teachingGroupId) {
        this.teachingGroupId = teachingGroupId;
    }

    public Set getCourseAdjusts() {
        return this.courseAdjusts;
    }
    
    public void setCourseAdjusts(Set courseAdjusts) {
        this.courseAdjusts = courseAdjusts;
    }
   








}