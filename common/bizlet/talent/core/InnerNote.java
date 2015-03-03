/*
 * 创建日期 2006-2-21
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.util.Date;
import java.util.Calendar;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class InnerNote {
	private int msgId;
	private String msgTitle;
	private String content;
	private String msgType;
	private String sendAccount;
	private Date sendDate;
	private String isRead;
	private String msgUrl;
	
	
	
	/**
	 * @return 返回 content。
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content 要设置的 content。
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return 返回 isRead。
	 */
	public String getIsRead() {
		return isRead;
	}
	/**
	 * @param isRead 要设置的 isRead。
	 */
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	/**
	 * @return 返回 msgId。
	 */
	public int getMsgId() {
		return msgId;
	}
	/**
	 * @param msgId 要设置的 msgId。
	 */
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	/**
	 * @return 返回 msgTitle。
	 */
	public String getMsgTitle() {
		return msgTitle;
	}
	/**
	 * @param msgTitle 要设置的 msgTitle。
	 */
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	/**
	 * @return 返回 msgType。
	 */
	public String getMsgType() {
		return msgType;
	}
	/**
	 * @param msgType 要设置的 msgType。
	 */
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	/**
	 * @return 返回 msgUrl。
	 */
	public String getMsgUrl() {
		return msgUrl;
	}
	/**
	 * @param msgUrl 要设置的 msgUrl。
	 */
	public void setMsgUrl(String msgUrl) {
		this.msgUrl = msgUrl;
	}
	/**
	 * @return 返回 sendAccount。
	 */
	public String getSendAccount() {
		return sendAccount;
	}
	/**
	 * @param sendAccount 要设置的 sendAccount。
	 */
	public void setSendAccount(String sendAccount) {
		this.sendAccount = sendAccount;
	}
	/**
	 * @return 返回 sendDate。
	 */
	public Date getSendDate() {
		return sendDate;
	}
	/**
	 * @param sendDate 要设置的 sendDate。
	 */
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public InnerNote() {
		
	}
	
	public InnerNote(int msgId,String msgTitle,String content,
			String sendAccount,String msgUrl) {
		this.msgId = msgId;
		this.msgTitle = msgTitle;
		this.content = content;
		this.msgType = "2";
		this.sendAccount = sendAccount;
		this.sendDate = Calendar.getInstance().getTime();
		this.isRead = "0";
		this.msgUrl = msgUrl;
		
	}

}
