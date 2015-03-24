package com.talent.hibernate;

import java.util.Date;


/**
 * WorkArrangeReplay generated by MyEclipse - Hibernate Tools
 */

public class WorkArrangeReplay  implements java.io.Serializable {


    // Fields    

     private Integer replayId;
     private Integer arrangeId;
     private Integer userid;
     private String reply;
     private Date replyTime;


    // Constructors

    /** default constructor */
    public WorkArrangeReplay() {
    }

	/** minimal constructor */
    public WorkArrangeReplay(Integer replayId, Integer arrangeId) {
        this.replayId = replayId;
        this.arrangeId = arrangeId;
    }
    
    /** full constructor */
    public WorkArrangeReplay(Integer replayId, Integer arrangeId, Integer userid, String reply, Date replyTime) {
        this.replayId = replayId;
        this.arrangeId = arrangeId;
        this.userid = userid;
        this.reply = reply;
        this.replyTime = replyTime;
    }

   
    // Property accessors

    public Integer getReplayId() {
        return this.replayId;
    }
    
    public void setReplayId(Integer replayId) {
        this.replayId = replayId;
    }

    public Integer getArrangeId() {
        return this.arrangeId;
    }
    
    public void setArrangeId(Integer arrangeId) {
        this.arrangeId = arrangeId;
    }

    public Integer getUserid() {
        return this.userid;
    }
    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getReply() {
        return this.reply;
    }
    
    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getReplyTime() {
        return this.replyTime;
    }
    
    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }
   








}