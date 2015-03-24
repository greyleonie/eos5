/**
 * 
 */
package com.talent.web.form;

import java.util.Date;
import java.util.List;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

import com.talent.common.Pagination;



/**
 * @title 
 * @description
 * @author 陈绍栋
 * @addtime 2007-2-28
 */

public class ThesisForm extends ActionForm {

	private Integer thesisId;
    private Integer studentId;
    private String thesisTitle;
    private String thesisContent;
    private Date commitTime;
    private String score;
    private Integer teacherId;
    private String teacherName;
    private Date gradeDate;
    private String remark;
    private String contentType;
    private Integer teachingGroupId;
    private String opinion;
    private Integer isGood;
    private String summary;
    private Integer iscooperate;
    private String cooperators;
    private Integer state;
    private Integer classId;
    private String studentName;//学生姓名
    private String studentNo; //学号
    private String className;
    private Pagination pagination = new Pagination(0);//分页对象
    private FormFile file1; //上传文件
	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Date getCommitTime() {
		return commitTime;
	}

	public void setCommitTime(Date commitTime) {
		this.commitTime = commitTime;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getCooperators() {
		return cooperators;
	}

	public void setCooperators(String cooperators) {
		this.cooperators = cooperators;
	}

	public Date getGradeDate() {
		return gradeDate;
	}

	public void setGradeDate(Date gradeDate) {
		this.gradeDate = gradeDate;
	}

	public Integer getIscooperate() {
		return iscooperate;
	}

	public void setIscooperate(Integer iscooperate) {
		this.iscooperate = iscooperate;
	}

	public Integer getIsGood() {
		return isGood;
	}

	public void setIsGood(Integer isGood) {
		this.isGood = isGood;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Integer getTeachingGroupId() {
		return teachingGroupId;
	}

	public void setTeachingGroupId(Integer teachingGroupId) {
		this.teachingGroupId = teachingGroupId;
	}

	public String getThesisContent() {
		return thesisContent;
	}

	public void setThesisContent(String thesisContent) {
		this.thesisContent = thesisContent;
	}

	public Integer getThesisId() {
		return thesisId;
	}

	public void setThesisId(Integer thesisId) {
		this.thesisId = thesisId;
	}

	public String getThesisTitle() {
		return thesisTitle;
	}

	public void setThesisTitle(String thesisTitle) {
		this.thesisTitle = thesisTitle;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public FormFile getFile1() {
		return file1;
	}

	public void setFile1(FormFile file1) {
		this.file1 = file1;
	}
}
