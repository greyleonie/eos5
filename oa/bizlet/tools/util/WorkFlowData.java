/*
 * 创建日期 2007-11-1
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package tools.util;

/**
 * @author new
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
	 * @return 返回 channelID。
	 */
	public String getChannelID() {
		return channelID;
	}
	/**
	 * @param channelID 要设置的 channelID。
	 */
	public void setChannelID(String channelID) {
		this.channelID = channelID;
	}
	/**
	 * @return 返回 typeFlag。
	 */
	public String getTypeFlag() {
		return typeFlag;
	}
	/**
	 * @param typeFlag 要设置的 typeFlag。
	 */
	public void setTypeFlag(String typeFlag) {
		this.typeFlag = typeFlag;
	}
}
