/*
 * �������� 2007-1-11
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.io.Serializable;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TeacherVo implements Serializable {
	
	
	public TeacherVo() {
		
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,int orgType) {
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.orgType = orgType;
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,int orgType,int isLeave,int isDead,int isRetire) {
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.orgType = orgType;
		this.isDead=isDead;
		this.isLeave=isLeave;
		this.isRetire=isRetire;
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,int orgType,String mobileNo) {//�е绰�Ĺ��캯��
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.orgType = orgType;
		this.mobileNo=mobileNo;
		
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,String email,int orgType) {//���ʼ��Ĺ��캯��
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.email=email;
		this.orgType = orgType;
		
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,String email,int orgType,int isLeave,int isDead,int isRetire) {//���ʼ��Ĺ��캯��
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.email=email;
		this.orgType = orgType;
		this.isDead=isDead;
		this.isLeave=isLeave;
		this.isRetire=isRetire;
	}
	
	public String toString() {
		
		String result = "��ʦID��" + this.tId + "���ʺţ�" + this.userId + "����ʦ����" + this.userName + "������ID��" + this.orgId + "����������ĸ��" + this.firstChar + "\n" ;
		result += "����ʦ���ͣ�" + this.workType + "��ְλ��" + this.position + ",�Ա�:" + this.sex + ",��������:" + this.orgType + ",�ʼ���ַ��" + this.email;
		result+=",�Ƿ������ݣ�"+this.isRetire+",�Ƿ��ѵ��룺"+this.isLeave+",�Ƿ�������"+this.isDead;
		return result;
	}
	
	private long tId;//��ʦID
	private String userId;//�ʺ�
	private String userName;//��ʦ��
	private int orgId;//����ID
	private String firstChar;//��������ĸ
	private String mobileNo;//�绰����
	private String email;//�����ʼ�
	private int isLeave=0;
	private int isDead=0;
	private int isRetire=0;
	/**
	 * @return ���� isDead��
	 */
	public int getIsDead() {
		return isDead;
	}
	/**
	 * @param isDead Ҫ���õ� isDead��
	 */
	public void setIsDead(int isDead) {
		this.isDead = isDead;
	}
	/**
	 * @return ���� isLeave��
	 */
	public int getIsLeave() {
		return isLeave;
	}
	/**
	 * @param isLeave Ҫ���õ� isLeave��
	 */
	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}
	/**
	 * @return ���� isRetire��
	 */
	public int getIsRetire() {
		return isRetire;
	}
	/**
	 * @param isRetire Ҫ���õ� isRetire��
	 */
	public void setIsRetire(int isRetire) {
		this.isRetire = isRetire;
	}
	/**
	 * @return ���� email��
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email Ҫ���õ� email��
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return ���� firstChar��
	 */
	public String getFirstChar() {
		return firstChar;
	}
	/**
	 * @param firstChar Ҫ���õ� firstChar��
	 */
	public void setFirstChar(String firstChar) {
		this.firstChar = firstChar;
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
	 * @return ���� orgType��
	 */
	public int getOrgType() {
		return orgType;
	}
	/**
	 * @param orgType Ҫ���õ� orgType��
	 */
	public void setOrgType(int orgType) {
		this.orgType = orgType;
	}
	/**
	 * @return ���� position��
	 */
	public int getPosition() {
		return position;
	}
	/**
	 * @param position Ҫ���õ� position��
	 */
	public void setPosition(int position) {
		this.position = position;
	}
	/**
	 * @return ���� sex��
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex Ҫ���õ� sex��
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return ���� tId��
	 */
	public long getTId() {
		return tId;
	}
	/**
	 * @param id Ҫ���õ� tId��
	 */
	public void setTId(long id) {
		tId = id;
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
	 * @return ���� workType��
	 */
	public int getWorkType() {
		return workType;
	}
	/**
	 * @param workType Ҫ���õ� workType��
	 */
	public void setWorkType(int workType) {
		this.workType = workType;
	}
	private int workType;//��ʦ���ͣ���У������
	private int position;//ְλ
	private String sex;//�Ա�
	private int orgType;//��������
	
	
	

	
	/**
	 * @return ���� mobileNo��
	 */
	public String getMobileNo() {
		return mobileNo;
	}
	/**
	 * @param mobileNo Ҫ���õ� mobileNo��
	 */
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
}
