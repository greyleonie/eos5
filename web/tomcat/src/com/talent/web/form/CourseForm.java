package com.talent.web.form;

import org.apache.struts.action.ActionForm;
import java.util.Date;

public class CourseForm extends ActionForm {

  // Fields

   private Integer courseId;
   private Integer unitId;
   private Integer specialId;
   private Integer classId;
   private String courseTitle;
   private String classDate;
   private String classTime;
   private String classNoon;
   private String classRoom;
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
   private int isUseKqj;
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
  public Integer getIsMeldClass() {
    return isMeldClass;
  }

  public Integer getIsUseVideo() {
    return isUseVideo;
  }

  public Integer getIsUseNotebookPc() {
    return isUseNotebookPc;
  }

  public Integer getClassHour() {
    return classHour;
  }

  public String getClassRoom() {
    return classRoom;
  }

  public Integer getTeachingGroupId() {
    return teachingGroupId;
  }

  public Integer getIsAdopted() {
    return isAdopted;
  }

  public String getTeachers() {
    return teachers;
  }

  public Integer getClassModelId() {
    return classModelId;
  }

  public String getDeskArrange() {
    return deskArrange;
  }

  public int getIsUseKqj() {
    return isUseKqj;
  }

  public Integer getIsSendNotice() {
    return isSendNotice;
  }

  public long getCredit() {
    return credit;
  }

  public String getAttenders() {
    return attenders;
  }

  public Integer getIsUseCourseWare() {
    return isUseCourseWare;
  }

  public String getCourseTitle() {
    return courseTitle;
  }

  public String getClassNoon() {
    return classNoon;
  }

  public Integer getPlatformSeats() {
    return platformSeats;
  }

  public Integer getRadioPhones() {
    return radioPhones;
  }

  public String getScoringMethod() {
    return scoringMethod;
  }

  public String getOpinion() {
    return opinion;
  }

  public Integer getUnitId() {
    return unitId;
  }

  public String getClassTime() {
    return classTime;
  }

  public Integer getTeahchingModelId() {
    return teahchingModelId;
  }

  public Integer getIsUseTea() {
    return isUseTea;
  }

  public String getRemarks() {
    return remarks;
  }

  public Integer getIsOutClass() {
    return isOutClass;
  }

  public String getOutSideOrg() {
    return outSideOrg;
  }

  public String getCompere() {
    return compere;
  }

  public Integer getIsUseCamera() {
    return isUseCamera;
  }

  public String getOutSidePost() {
    return outSidePost;
  }

  public Integer getCourseId() {
    return courseId;
  }

  public Integer getStudentSeats() {
    return studentSeats;
  }

  public Integer getIsUseMediaPlayer() {
    return isUseMediaPlayer;
  }

  public String getConventioneers() {
    return conventioneers;
  }

  public Integer getSpecialId() {
    return specialId;
  }

  public String getOutsider() {
    return outsider;
  }

  public Integer getIsTakeFeature() {
    return isTakeFeature;
  }

  public Integer getIsUseFlower() {
    return isUseFlower;
  }

  public String getApproval() {
    return approval;
  }

  public String getClassDate() {
    return classDate;
  }

  public Integer getCups() {
    return cups;
  }

  public Integer getClassId() {
    return classId;
  }

  public String getTutors() {
    return tutors;
  }

  public void setWiredPhones(Integer wiredPhones) {
    this.wiredPhones = wiredPhones;
  }

  public void setIsMeldClass(Integer isMeldClass) {
    this.isMeldClass = isMeldClass;
  }

  public void setIsUseVideo(Integer isUseVideo) {
    this.isUseVideo = isUseVideo;
  }

  public void setIsUseNotebookPc(Integer isUseNotebookPc) {
    this.isUseNotebookPc = isUseNotebookPc;
  }

  public void setClassHour(Integer classHour) {
    this.classHour = classHour;
  }

  public void setClassRoom(String classRoom) {
    this.classRoom = classRoom;
  }

  public void setTeachingGroupId(Integer teachingGroupId) {
    this.teachingGroupId = teachingGroupId;
  }

  public void setIsAdopted(Integer isAdopted) {
    this.isAdopted = isAdopted;
  }

  public void setTeachers(String teachers) {
    this.teachers = teachers;
  }

  public void setClassModelId(Integer classModelId) {
    this.classModelId = classModelId;
  }

  public void setDeskArrange(String deskArrange) {
    this.deskArrange = deskArrange;
  }

  public void setIsUseKqj(int isUseKqj) {
    this.isUseKqj = isUseKqj;
  }

  public void setIsSendNotice(Integer isSendNotice) {
    this.isSendNotice = isSendNotice;
  }

  public void setCredit(long credit) {
    this.credit = credit;
  }

  public void setAttenders(String attenders) {
    this.attenders = attenders;
  }

  public void setIsUseCourseWare(Integer isUseCourseWare) {
    this.isUseCourseWare = isUseCourseWare;
  }

  public void setCourseTitle(String courseTitle) {
    this.courseTitle = courseTitle;
  }

  public void setClassNoon(String classNoon) {
    this.classNoon = classNoon;
  }

  public void setPlatformSeats(Integer platformSeats) {
    this.platformSeats = platformSeats;
  }

  public void setRadioPhones(Integer radioPhones) {
    this.radioPhones = radioPhones;
  }

  public void setScoringMethod(String scoringMethod) {
    this.scoringMethod = scoringMethod;
  }

  public void setOpinion(String opinion) {
    this.opinion = opinion;
  }

  public void setUnitId(Integer unitId) {
    this.unitId = unitId;
  }

  public void setClassTime(String classTime) {
    this.classTime = classTime;
  }

  public void setTeahchingModelId(Integer teahchingModelId) {
    this.teahchingModelId = teahchingModelId;
  }

  public void setIsUseTea(Integer isUseTea) {
    this.isUseTea = isUseTea;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  public void setIsOutClass(Integer isOutClass) {
    this.isOutClass = isOutClass;
  }

  public void setOutSideOrg(String outSideOrg) {
    this.outSideOrg = outSideOrg;
  }

  public void setCompere(String compere) {
    this.compere = compere;
  }

  public void setIsUseCamera(Integer isUseCamera) {
    this.isUseCamera = isUseCamera;
  }

  public void setOutSidePost(String outSidePost) {
    this.outSidePost = outSidePost;
  }

  public void setCourseId(Integer courseId) {
    this.courseId = courseId;
  }

  public void setStudentSeats(Integer studentSeats) {
    this.studentSeats = studentSeats;
  }

  public void setIsUseMediaPlayer(Integer isUseMediaPlayer) {
    this.isUseMediaPlayer = isUseMediaPlayer;
  }

  public void setConventioneers(String conventioneers) {
    this.conventioneers = conventioneers;
  }

  public void setSpecialId(Integer specialId) {
    this.specialId = specialId;
  }

  public void setOutsider(String outsider) {
    this.outsider = outsider;
  }

  public void setIsTakeFeature(Integer isTakeFeature) {
    this.isTakeFeature = isTakeFeature;
  }

  public void setIsUseFlower(Integer isUseFlower) {
    this.isUseFlower = isUseFlower;
  }

  public void setApproval(String approval) {
    this.approval = approval;
  }

  public void setClassDate(String classDate) {
    this.classDate = classDate;
  }

  public void setCups(Integer cups) {
    this.cups = cups;
  }

  public void setClassId(Integer classId) {
    this.classId = classId;
  }

  public void setTutors(String tutors) {
    this.tutors = tutors;
  }

  public Integer getWiredPhones() {
    return wiredPhones;
  }

}
