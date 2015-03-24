package com.talent.web.form;

import org.apache.struts.action.ActionForm;

import com.talent.common.Pagination;

public class CourseAdjustForm extends ActionForm{
private String classId;
private String startTime;
private String endTime;
private Pagination pagination = new Pagination(0);//∑÷“≥∂‘œÛ
 
  public String getClassId() {
    return classId;
  }
  public void setClassId(String classId) {
	    this.classId = classId;
}
  public String getStartTime() {
    return startTime;
  }
  public void setStartTime(String startTime) {
    this.startTime = startTime;
  }

  public String getEndTime() {
	    return endTime;
	  }
	  public void setEndTime(String endTime) {
	    this.endTime = endTime;
	  }

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
