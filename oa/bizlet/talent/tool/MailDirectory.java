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
public class MailDirectory {
	private int id;//�ʼ��б�ʶ
	private String userAccount;//�û��ʺ�
	private String maildirName;//�ʼ�������
	private String flag;//�ʼ�������-->0�ǻ������ͣ�1Ϊ�Զ�������
	private String remark;//��ע
	
	
	public MailDirectory(int id,String userAccount,String maildirName,String flag,String remark){
		this.id = id;
		this.userAccount = userAccount;
		this.maildirName = maildirName;
		this.flag = flag;
		this.remark = remark;
		
	}
	
	public MailDirectory(){}

	/**
	 * @return ���� flag��
	 */
	public String getFlag() {
		return flag;
	}
	/**
	 * @param flag Ҫ���õ� flag��
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	/**
	 * @return ���� id��
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id Ҫ���õ� id��
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return ���� maildirName��
	 */
	public String getMaildirName() {
		return maildirName;
	}
	/**
	 * @param maildirName Ҫ���õ� maildirName��
	 */
	public void setMaildirName(String maildirName) {
		this.maildirName = maildirName;
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
