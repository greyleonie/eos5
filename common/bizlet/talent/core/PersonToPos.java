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
public class PersonToPos {
	private String posId;
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
	 * @return ���� posId��
	 */
	public String getPosId() {
		return posId;
	}
	/**
	 * @param posId Ҫ���õ� posId��
	 */
	public void setPosId(String posId) {
		this.posId = posId;
	}
	
	public PersonToPos(String posId,String operatorId) {
		this.posId =posId;
		this.operatorId = operatorId;
	
	}
}
