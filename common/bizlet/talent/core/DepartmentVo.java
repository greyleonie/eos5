/*
 * �������� 2007-1-15
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
public class DepartmentVo {
	
	
	public DepartmentVo() {
		
	}
	
	public DepartmentVo(int orgID,String orgName,int orgTypeID) {
		this.orgID = orgID;
		this.orgName = orgName;
		this.orgTypeID = orgTypeID;
		
	}
	
	private int orgID;
	private String orgName;
	private int orgTypeID;
	private int parentOrgID;
	private long managerID;
	private long auxiliaryManagerID;
	private int teaching;
	private int IsWork;
	
	
	

	/**
	 * @return ���� auxiliaryManagerID��
	 */
	public long getAuxiliaryManagerID() {
		return auxiliaryManagerID;
	}
	/**
	 * @param auxiliaryManagerID Ҫ���õ� auxiliaryManagerID��
	 */
	public void setAuxiliaryManagerID(long auxiliaryManagerID) {
		this.auxiliaryManagerID = auxiliaryManagerID;
	}
	/**
	 * @return ���� isWork��
	 */
	public int getIsWork() {
		return IsWork;
	}
	/**
	 * @param isWork Ҫ���õ� isWork��
	 */
	public void setIsWork(int isWork) {
		IsWork = isWork;
	}
	/**
	 * @return ���� managerID��
	 */
	public long getManagerID() {
		return managerID;
	}
	/**
	 * @param managerID Ҫ���õ� managerID��
	 */
	public void setManagerID(long managerID) {
		this.managerID = managerID;
	}
	/**
	 * @return ���� orgID��
	 */
	public int getOrgID() {
		return orgID;
	}
	/**
	 * @param orgID Ҫ���õ� orgID��
	 */
	public void setOrgID(int orgID) {
		this.orgID = orgID;
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
	/**
	 * @return ���� orgTypeID��
	 */
	public int getOrgTypeID() {
		return orgTypeID;
	}
	/**
	 * @param orgTypeID Ҫ���õ� orgTypeID��
	 */
	public void setOrgTypeID(int orgTypeID) {
		this.orgTypeID = orgTypeID;
	}
	/**
	 * @return ���� parentOrgID��
	 */
	public int getParentOrgID() {
		return parentOrgID;
	}
	/**
	 * @param parentOrgID Ҫ���õ� parentOrgID��
	 */
	public void setParentOrgID(int parentOrgID) {
		this.parentOrgID = parentOrgID;
	}
	/**
	 * @return ���� teaching��
	 */
	public int getTeaching() {
		return teaching;
	}
	/**
	 * @param teaching Ҫ���õ� teaching��
	 */
	public void setTeaching(int teaching) {
		this.teaching = teaching;
	}
}
