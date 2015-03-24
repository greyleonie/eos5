package com.talent.web.form;

import org.apache.struts.action.ActionForm;

import com.talent.hibernate.ClassSubject;
import com.talent.hibernate.Student;

public class ScoreForm extends ActionForm{
	
	private Integer scoreId;
    private Student student;
    private ClassSubject classSubject;
    private String score;
    
	public ClassSubject getClassSubject() {
		return classSubject;
	}
	public void setClassSubject(ClassSubject classSubject) {
		this.classSubject = classSubject;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Integer getScoreId() {
		return scoreId;
	}
	public void setScoreId(Integer scoreId) {
		this.scoreId = scoreId;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
}
