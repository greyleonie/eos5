/*
 * �������� 2007-11-1
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package tools.util;

/**
 * @author new
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class WorkFlowData {
	private String flowID;
	private String title;
	private String flowDate;
	private String participant;
	private String passParticipant;
	private String type;
	private String channelID;
	private String typeFlag;
	
	public void setFlowID(String flowID) {
		this.flowID = flowID;
	}
	
	public String getFlowID() {
		return flowID;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setFlowDate(String flowDate) {
		this.flowDate = flowDate;
	}
	
	public String getFlowDate() {
		return flowDate;
	}
	
	public void setParticipant(String participant) {
		this.participant = participant;
	}
	
	public String getParticipant() {
		return participant;
	}
	
	public void setPassParticipant(String passParticipant) {
		this.passParticipant = passParticipant;
	}
	
	public String getPassParticipant() {
		return passParticipant;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getType() {
		return type;
	}
	/**
	 * @return ���� channelID��
	 */
	public String getChannelID() {
		return channelID;
	}
	/**
	 * @param channelID Ҫ���õ� channelID��
	 */
	public void setChannelID(String channelID) {
		this.channelID = channelID;
	}
	/**
	 * @return ���� typeFlag��
	 */
	public String getTypeFlag() {
		return typeFlag;
	}
	/**
	 * @param typeFlag Ҫ���õ� typeFlag��
	 */
	public void setTypeFlag(String typeFlag) {
		this.typeFlag = typeFlag;
	}
}
