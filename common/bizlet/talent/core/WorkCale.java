/*
 * �������� 2006-6-7
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
 * TOOLS_WORKCALE
 */
public class WorkCale {
	private String restDate;
	private String type;

	/**
	 * @return ���� restDate��
	 */
	public String getRestDate() {
		return restDate;
	}
	/**
	 * @param restDate Ҫ���õ� restDate��
	 */
	public void setRestDate(String restDate) {
		this.restDate = restDate;
	}
	/**
	 * @return ���� type��
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type Ҫ���õ� type��
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	public WorkCale(String s1,String s2) {
		this.restDate = s1;
		this.type = s2;
	}
	
	
}
