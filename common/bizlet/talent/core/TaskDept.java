/*
 * �������� 2006-8-1
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TaskDept {
	private String orgId;
	private String operatorId;
	private String orgName;
	
	public TaskDept() {
		
	}
	
	public TaskDept(String orgId,String operatorId,String orgName) {
		this.orgId = orgId;
		this.operatorId = operatorId;
		this.orgName = orgName;
	
	}

	/**
	 * @return ���� operatorId��
	 */
	public String getOperatorId() {
		return operatorId;
	}
	/**
	 * @param operatorId Ҫ���õ� operatorId��
	 */
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
	/**
	 * @return ���� orgId��
	 */
	public String getOrgId() {
		return orgId;
	}
	/**
	 * @param orgId Ҫ���õ� orgId��
	 */
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	/**
	 * @return ���� orgName��
	 */
	public String getOrgName() {
		return orgName;
	}
	/**
	 * @param orgName Ҫ���õ� orgName��
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}
