/*
 * �������� 2006-4-24
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
public class PersonToOrg {
	private String orgId;
	private String operatorId;
	

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
	
	public PersonToOrg(String orgId,String operatorId) {
		this.orgId = orgId;
		this.operatorId = operatorId;
	
	}
}
