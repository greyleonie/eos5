package com.talent.web.form;

import org.apache.struts.action.ActionForm;

import com.talent.common.Pagination;

public class WorkArrangeForm extends ActionForm{
private String teacherID;
private String arrangeID;
private String replyContent;
private Pagination pagination = new Pagination(0);//∑÷“≥∂‘œÛ
 
  public String getTeacherID() {
    return teacherID;
  }
  public void setTeacherID(String teacherID) {
	    this.teacherID = teacherID;
 }
  
  public String getArrangeID() {
	    return arrangeID;
	  }
	  public void setArrangeID(String arrangeID) {
		    this.arrangeID = arrangeID;
	}
	  
  public String getReplyContent() {
		    return replyContent;
		  }
  public void setReplyContent(String replyContent) {
			    this.replyContent = replyContent;
		}
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
