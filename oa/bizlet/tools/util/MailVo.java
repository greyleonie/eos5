package tools.util;
import java.sql.Connection;
import java.sql.Statement;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-11-1
 * @class_displayName DeskInfo
 */

public class MailVo {
	private int mailId;
	private String userAccount;
	private String postUserName;
	private String postAddress;
	private String receiveAddress;
	private String copySend;
	private String denseSend;
	private String sendDate;
	private String title;
	private int    mailDirId;
	private String reFlag;
	private String readFlag;
	private int  mailType;
	private String priority;
	private int mailSize;
	private String oldMailDirId;
	 
	 
	/**
	 * @return 返回 copySend。
	 */
	public String getCopySend() {
		return copySend;
	}
	/**
	 * @param copySend 要设置的 copySend。
	 */
	public void setCopySend(String copySend) {
		this.copySend = copySend;
	}
	/**
	 * @return 返回 denseSend。
	 */
	public String getDenseSend() {
		return denseSend;
	}
	/**
	 * @param denseSend 要设置的 denseSend。
	 */
	public void setDenseSend(String denseSend) {
		this.denseSend = denseSend;
	}
	/**
	 * @return 返回 mailDirId。
	 */
	public int getMailDirId() {
		return mailDirId;
	}
	/**
	 * @param mailDirId 要设置的 mailDirId。
	 */
	public void setMailDirId(int mailDirId) {
		this.mailDirId = mailDirId;
	}
	/**
	 * @return 返回 mailId。
	 */
	public int getMailId() {
		return mailId;
	}
	/**
	 * @param mailId 要设置的 mailId。
	 */
	public void setMailId(int mailId) {
		this.mailId = mailId;
	}
	/**
	 * @return 返回 mailSize。
	 */
	public int getMailSize() {
		return mailSize;
	}
	/**
	 * @param mailSize 要设置的 mailSize。
	 */
	public void setMailSize(int mailSize) {
		this.mailSize = mailSize;
	}
	/**
	 * @return 返回 mailType。
	 */
	public int getMailType() {
		return mailType;
	}
	/**
	 * @param mailType 要设置的 mailType。
	 */
	public void setMailType(int mailType) {
		this.mailType = mailType;
	}
	/**
	 * @return 返回 oldMailDirId。
	 */
	public String getOldMailDirId() {
		return oldMailDirId;
	}
	/**
	 * @param oldMailDirId 要设置的 oldMailDirId。
	 */
	public void setOldMailDirId(String oldMailDirId) {
		this.oldMailDirId = oldMailDirId;
	}
	/**
	 * @return 返回 postAddress。
	 */
	public String getPostAddress() {
		return postAddress;
	}
	/**
	 * @param postAddress 要设置的 postAddress。
	 */
	public void setPostAddress(String postAddress) {
		this.postAddress = postAddress;
	}
	/**
	 * @return 返回 postUserName。
	 */
	public String getPostUserName() {
		return postUserName;
	}
	/**
	 * @param postUserName 要设置的 postUserName。
	 */
	public void setPostUserName(String postUserName) {
		this.postUserName = postUserName;
	}
	/**
	 * @return 返回 priority。
	 */
	public String getPriority() {
		return priority;
	}
	/**
	 * @param priority 要设置的 priority。
	 */
	public void setPriority(String priority) {
		this.priority = priority;
	}
	/**
	 * @return 返回 readFlag。
	 */
	public String getReadFlag() {
		return readFlag;
	}
	/**
	 * @param readFlag 要设置的 readFlag。
	 */
	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}
	/**
	 * @return 返回 receiveAddress。
	 */
	public String getReceiveAddress() {
		return receiveAddress;
	}
	/**
	 * @param receiveAddress 要设置的 receiveAddress。
	 */
	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	/**
	 * @return 返回 reFlag。
	 */
	public String getReFlag() {
		return reFlag;
	}
	/**
	 * @param reFlag 要设置的 reFlag。
	 */
	public void setReFlag(String reFlag) {
		this.reFlag = reFlag;
	}
	/**
	 * @return 返回 sendDate。
	 */
	public String getSendDate() {
		return sendDate;
	}
	/**
	 * @param sendDate 要设置的 sendDate。
	 */
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	/**
	 * @return 返回 title。
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title 要设置的 title。
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return 返回 userAccount。
	 */
	public String getUserAccount() {
		return userAccount;
	}
	/**
	 * @param userAccount 要设置的 userAccount。
	 */
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
}