package com.talent.web.form;

import java.util.Date;

import org.apache.struts.action.ActionForm;

import com.talent.common.Pagination;

public class NewsForm extends ActionForm{
	 private Integer newsId;
     private String title;
     private String content;
     private String columns;
     private Integer publisher;
     private String publisherName;
     private String department;
     private Date publishDate;
     private String subhead;
     private Pagination pagination = new Pagination(0);//��ҳ
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public Integer getPublisher() {
		return publisher;
	}
	public void setPublisher(Integer publisher) {
		this.publisher = publisher;
	}
	public String getPublisherName() {
		return publisherName;
	}
	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}
	public String getSubhead() {
		return subhead;
	}
	public void setSubhead(String subhead) {
		this.subhead = subhead;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

}
