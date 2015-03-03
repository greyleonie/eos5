/*
 * 创建日期 2007-3-27
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package fcc.oa.workflow;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class FlowData {

	public static void main(String[] args) {
	}
	
	
	public FlowData() {
		
	}
	
	public FlowData(String dataID,String elementKey,String elementValue,String processInstID,String archiveID,String activityDefID,String userID,String userName,String userDate,String workItemName) {
		this.dataID = dataID;
		this.elementKey = elementKey;
		this.elementValue = elementValue;
		this.processInstID = processInstID;
		this.archiveID = archiveID;
		this.activityDefID = activityDefID;
		this.userID = userID;
		this.userName = userName;
		this.userDate = userDate;
		this.workItemName=workItemName;
	}
	
	
	private String dataID;
	private String elementKey;
	private String elementValue;
	private String processInstID;
	private String archiveID;
	private String activityDefID;
	private String userID;
	private String userName;
	private String userDate;
	private String workItemName;
	/**
	 * @return 返回 activityDefID。
	 */
	public String getActivityDefID() {
		return activityDefID;
	}
	/**
	 * @param activityDefID 要设置的 activityDefID。
	 */
	public void setActivityDefID(String activityDefID) {
		this.activityDefID = activityDefID;
	}
	/**
	 * @return 返回 archiveID。
	 */
	public String getArchiveID() {
		return archiveID;
	}
	/**
	 * @param archiveID 要设置的 archiveID。
	 */
	public void setArchiveID(String archiveID) {
		this.archiveID = archiveID;
	}
	/**
	 * @return 返回 dataID。
	 */
	public String getDataID() {
		return dataID;
	}
	/**
	 * @param dataID 要设置的 dataID。
	 */
	public void setDataID(String dataID) {
		this.dataID = dataID;
	}
	/**
	 * @return 返回 elementKey。
	 */
	public String getElementKey() {
		return elementKey;
	}
	/**
	 * @param elementKey 要设置的 elementKey。
	 */
	public void setElementKey(String elementKey) {
		this.elementKey = elementKey;
	}
	/**
	 * @return 返回 elementValue。
	 */
	public String getElementValue() {
		return elementValue;
	}
	/**
	 * @param elementValue 要设置的 elementValue。
	 */
	public void setElementValue(String elementValue) {
		this.elementValue = elementValue;
	}
	/**
	 * @return 返回 processInstID。
	 */
	public String getProcessInstID() {
		return processInstID;
	}
	/**
	 * @param processInstID 要设置的 processInstID。
	 */
	public void setProcessInstID(String processInstID) {
		this.processInstID = processInstID;
	}
	/**
	 * @return 返回 userDate。
	 */
	public String getUserDate() {
		return userDate;
	}
	/**
	 * @param userDate 要设置的 userDate。
	 */
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	/**
	 * @return 返回 userID。
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID 要设置的 userID。
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return 返回 userName。
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName 要设置的 userName。
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return 返回 workItemName。
	 */
	public String getWorkItemName() {
		return workItemName;
	}
	/**
	 * @param workItemName 要设置的 workItemName。
	 */
	public void setWorkItemName(String workItemName) {
		this.workItemName = workItemName;
	}
	
}
