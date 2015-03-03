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
	 * @return ���� copySend��
	 */
	public String getCopySend() {
		return copySend;
	}
	/**
	 * @param copySend Ҫ���õ� copySend��
	 */
	public void setCopySend(String copySend) {
		this.copySend = copySend;
	}
	/**
	 * @return ���� denseSend��
	 */
	public String getDenseSend() {
		return denseSend;
	}
	/**
	 * @param denseSend Ҫ���õ� denseSend��
	 */
	public void setDenseSend(String denseSend) {
		this.denseSend = denseSend;
	}
	/**
	 * @return ���� mailDirId��
	 */
	public int getMailDirId() {
		return mailDirId;
	}
	/**
	 * @param mailDirId Ҫ���õ� mailDirId��
	 */
	public void setMailDirId(int mailDirId) {
		this.mailDirId = mailDirId;
	}
	/**
	 * @return ���� mailId��
	 */
	public int getMailId() {
		return mailId;
	}
	/**
	 * @param mailId Ҫ���õ� mailId��
	 */
	public void setMailId(int mailId) {
		this.mailId = mailId;
	}
	/**
	 * @return ���� mailSize��
	 */
	public int getMailSize() {
		return mailSize;
	}
	/**
	 * @param mailSize Ҫ���õ� mailSize��
	 */
	public void setMailSize(int mailSize) {
		this.mailSize = mailSize;
	}
	/**
	 * @return ���� mailType��
	 */
	public int getMailType() {
		return mailType;
	}
	/**
	 * @param mailType Ҫ���õ� mailType��
	 */
	public void setMailType(int mailType) {
		this.mailType = mailType;
	}
	/**
	 * @return ���� oldMailDirId��
	 */
	public String getOldMailDirId() {
		return oldMailDirId;
	}
	/**
	 * @param oldMailDirId Ҫ���õ� oldMailDirId��
	 */
	public void setOldMailDirId(String oldMailDirId) {
		this.oldMailDirId = oldMailDirId;
	}
	/**
	 * @return ���� postAddress��
	 */
	public String getPostAddress() {
		return postAddress;
	}
	/**
	 * @param postAddress Ҫ���õ� postAddress��
	 */
	public void setPostAddress(String postAddress) {
		this.postAddress = postAddress;
	}
	/**
	 * @return ���� postUserName��
	 */
	public String getPostUserName() {
		return postUserName;
	}
	/**
	 * @param postUserName Ҫ���õ� postUserName��
	 */
	public void setPostUserName(String postUserName) {
		this.postUserName = postUserName;
	}
	/**
	 * @return ���� priority��
	 */
	public String getPriority() {
		return priority;
	}
	/**
	 * @param priority Ҫ���õ� priority��
	 */
	public void setPriority(String priority) {
		this.priority = priority;
	}
	/**
	 * @return ���� readFlag��
	 */
	public String getReadFlag() {
		return readFlag;
	}
	/**
	 * @param readFlag Ҫ���õ� readFlag��
	 */
	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}
	/**
	 * @return ���� receiveAddress��
	 */
	public String getReceiveAddress() {
		return receiveAddress;
	}
	/**
	 * @param receiveAddress Ҫ���õ� receiveAddress��
	 */
	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	/**
	 * @return ���� reFlag��
	 */
	public String getReFlag() {
		return reFlag;
	}
	/**
	 * @param reFlag Ҫ���õ� reFlag��
	 */
	public void setReFlag(String reFlag) {
		this.reFlag = reFlag;
	}
	/**
	 * @return ���� sendDate��
	 */
	public String getSendDate() {
		return sendDate;
	}
	/**
	 * @param sendDate Ҫ���õ� sendDate��
	 */
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	/**
	 * @return ���� title��
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title Ҫ���õ� title��
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return ���� userAccount��
	 */
	public String getUserAccount() {
		return userAccount;
	}
	/**
	 * @param userAccount Ҫ���õ� userAccount��
	 */
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
}