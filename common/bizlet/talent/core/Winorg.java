/*
 * �������� 2006-6-8
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
public class Winorg {
	private int orgId;
	private String userId;
	
	public Winorg(){
		
	}
	
	public Winorg(int orgId,String userId){
		this.orgId = orgId;
		this.userId = userId;
	}

	/**
	 * @return ���� orgId��
	 */
	public int getOrgId() {
		return orgId;
	}
	/**
	 * @param orgId Ҫ���õ� orgId��
	 */
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	/**
	 * @return ���� userId��
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId Ҫ���õ� userId��
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
