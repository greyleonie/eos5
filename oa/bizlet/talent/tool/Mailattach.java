/*
 * �������� 2005-9-17
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
public class Mailattach {
	/**
	 * @return ���� attachId��
	 */
	public int getAttachId() {
		return attachId;
	}
	/**
	 * @param attachId Ҫ���õ� attachId��
	 */
	public void setAttachId(int attachId) {
		this.attachId = attachId;
	}
	/**
	 * @return ���� attachName��
	 */
	public String getAttachName() {
		return attachName;
	}
	/**
	 * @param attachName Ҫ���õ� attachName��
	 */
	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	/**
	 * @return ���� filePath��
	 */
	public String getFilePath() {
		return filePath;
	}
	/**
	 * @param filePath Ҫ���õ� filePath��
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	/**
	 * @return ���� mailId��
	 */
	public int getMailId() {
		return mailId;
	}
	/**
	 * @param mailId Ҫ���õ� mailId��
	 */
	public void setMailId(int mailId) {
		this.mailId = mailId;
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
	private int attachId;
	private int mailId;
	private String attachName;
	private String filePath;
	private String remark;
	
	public Mailattach(){
		
	}
	
	public Mailattach(int attachId,int mailId,String attachName,String filePath,String remark){
		this.attachId = attachId;
		this.mailId = mailId;
		this.attachName = attachName;
		this.filePath = filePath;
		this.remark = remark;
	}
	
	public Mailattach(String attachName,String filePath,String remark){
		
		this.attachName = attachName;
		this.filePath = filePath;
		this.remark = remark;
	}
	
}
