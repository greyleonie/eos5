/*
 * �������� 2007-3-27
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package fcc.oa.workflow;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
	 * @return ���� activityDefID��
	 */
	public String getActivityDefID() {
		return activityDefID;
	}
	/**
	 * @param activityDefID Ҫ���õ� activityDefID��
	 */
	public void setActivityDefID(String activityDefID) {
		this.activityDefID = activityDefID;
	}
	/**
	 * @return ���� archiveID��
	 */
	public String getArchiveID() {
		return archiveID;
	}
	/**
	 * @param archiveID Ҫ���õ� archiveID��
	 */
	public void setArchiveID(String archiveID) {
		this.archiveID = archiveID;
	}
	/**
	 * @return ���� dataID��
	 */
	public String getDataID() {
		return dataID;
	}
	/**
	 * @param dataID Ҫ���õ� dataID��
	 */
	public void setDataID(String dataID) {
		this.dataID = dataID;
	}
	/**
	 * @return ���� elementKey��
	 */
	public String getElementKey() {
		return elementKey;
	}
	/**
	 * @param elementKey Ҫ���õ� elementKey��
	 */
	public void setElementKey(String elementKey) {
		this.elementKey = elementKey;
	}
	/**
	 * @return ���� elementValue��
	 */
	public String getElementValue() {
		return elementValue;
	}
	/**
	 * @param elementValue Ҫ���õ� elementValue��
	 */
	public void setElementValue(String elementValue) {
		this.elementValue = elementValue;
	}
	/**
	 * @return ���� processInstID��
	 */
	public String getProcessInstID() {
		return processInstID;
	}
	/**
	 * @param processInstID Ҫ���õ� processInstID��
	 */
	public void setProcessInstID(String processInstID) {
		this.processInstID = processInstID;
	}
	/**
	 * @return ���� userDate��
	 */
	public String getUserDate() {
		return userDate;
	}
	/**
	 * @param userDate Ҫ���õ� userDate��
	 */
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	/**
	 * @return ���� userID��
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID Ҫ���õ� userID��
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return ���� userName��
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName Ҫ���õ� userName��
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return ���� workItemName��
	 */
	public String getWorkItemName() {
		return workItemName;
	}
	/**
	 * @param workItemName Ҫ���õ� workItemName��
	 */
	public void setWorkItemName(String workItemName) {
		this.workItemName = workItemName;
	}
	
}
