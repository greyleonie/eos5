/*
 * �������� 2005-7-4
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.tool;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class MailCapacity {
	private String userAccount;//�û��ʺ�
	private int capacity;     //�ʼ�����
	private String capacityFlag;//������������
	private String limitFlag;//���Ʊ�־
	private String remark;//��ע
	
	public MailCapacity(String userAccount,int capacity,String capacityFlag,String limitFlag,String remark){
		this.userAccount = userAccount;
		this.capacity = capacity;
		this.capacityFlag = capacityFlag;
		this.limitFlag = limitFlag;
		this.remark = remark;
		
	}
	
	public MailCapacity(){}

	/**
	 * @return ���� capacity��
	 */
	public int getCapacity() {
		return capacity;
	}
	/**
	 * @param capacity Ҫ���õ� capacity��
	 */
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	/**
	 * @return ���� capacityFlag��
	 */
	public String getCapacityFlag() {
		return capacityFlag;
	}
	/**
	 * @param capacityFlag Ҫ���õ� capacityFlag��
	 */
	public void setCapacityFlag(String capacityFlag) {
		this.capacityFlag = capacityFlag;
	}
	/**
	 * @return ���� limitFlag��
	 */
	public String getLimitFlag() {
		return limitFlag;
	}
	/**
	 * @param limitFlag Ҫ���õ� limitFlag��
	 */
	public void setLimitFlag(String limitFlag) {
		this.limitFlag = limitFlag;
	}
	/**
	 * @return ���� remark��
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark Ҫ���õ� remark��
	 */
	public void setRemark(String remark) {
		this.remark = remark;
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
