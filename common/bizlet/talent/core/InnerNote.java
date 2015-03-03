/*
 * �������� 2006-2-21
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.util.Date;
import java.util.Calendar;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
	 * @return ���� content��
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content Ҫ���õ� content��
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return ���� isRead��
	 */
	public String getIsRead() {
		return isRead;
	}
	/**
	 * @param isRead Ҫ���õ� isRead��
	 */
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	/**
	 * @return ���� msgId��
	 */
	public int getMsgId() {
		return msgId;
	}
	/**
	 * @param msgId Ҫ���õ� msgId��
	 */
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	/**
	 * @return ���� msgTitle��
	 */
	public String getMsgTitle() {
		return msgTitle;
	}
	/**
	 * @param msgTitle Ҫ���õ� msgTitle��
	 */
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	/**
	 * @return ���� msgType��
	 */
	public String getMsgType() {
		return msgType;
	}
	/**
	 * @param msgType Ҫ���õ� msgType��
	 */
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	/**
	 * @return ���� msgUrl��
	 */
	public String getMsgUrl() {
		return msgUrl;
	}
	/**
	 * @param msgUrl Ҫ���õ� msgUrl��
	 */
	public void setMsgUrl(String msgUrl) {
		this.msgUrl = msgUrl;
	}
	/**
	 * @return ���� sendAccount��
	 */
	public String getSendAccount() {
		return sendAccount;
	}
	/**
	 * @param sendAccount Ҫ���õ� sendAccount��
	 */
	public void setSendAccount(String sendAccount) {
		this.sendAccount = sendAccount;
	}
	/**
	 * @return ���� sendDate��
	 */
	public Date getSendDate() {
		return sendDate;
	}
	/**
	 * @param sendDate Ҫ���õ� sendDate��
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
