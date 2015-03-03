/*
 * 创建日期 2007-1-15
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
	 * @return 返回 auxiliaryManagerID。
	 */
	public long getAuxiliaryManagerID() {
		return auxiliaryManagerID;
	}
	/**
	 * @param auxiliaryManagerID 要设置的 auxiliaryManagerID。
	 */
	public void setAuxiliaryManagerID(long auxiliaryManagerID) {
		this.auxiliaryManagerID = auxiliaryManagerID;
	}
	/**
	 * @return 返回 isWork。
	 */
	public int getIsWork() {
		return IsWork;
	}
	/**
	 * @param isWork 要设置的 isWork。
	 */
	public void setIsWork(int isWork) {
		IsWork = isWork;
	}
	/**
	 * @return 返回 managerID。
	 */
	public long getManagerID() {
		return managerID;
	}
	/**
	 * @param managerID 要设置的 managerID。
	 */
	public void setManagerID(long managerID) {
		this.managerID = managerID;
	}
	/**
	 * @return 返回 orgID。
	 */
	public int getOrgID() {
		return orgID;
	}
	/**
	 * @param orgID 要设置的 orgID。
	 */
	public void setOrgID(int orgID) {
		this.orgID = orgID;
	}
	/**
	 * @return 返回 orgName。
	 */
	public String getOrgName() {
		return orgName;
	}
	/**
	 * @param orgName 要设置的 orgName。
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	/**
	 * @return 返回 orgTypeID。
	 */
	public int getOrgTypeID() {
		return orgTypeID;
	}
	/**
	 * @param orgTypeID 要设置的 orgTypeID。
	 */
	public void setOrgTypeID(int orgTypeID) {
		this.orgTypeID = orgTypeID;
	}
	/**
	 * @return 返回 parentOrgID。
	 */
	public int getParentOrgID() {
		return parentOrgID;
	}
	/**
	 * @param parentOrgID 要设置的 parentOrgID。
	 */
	public void setParentOrgID(int parentOrgID) {
		this.parentOrgID = parentOrgID;
	}
	/**
	 * @return 返回 teaching。
	 */
	public int getTeaching() {
		return teaching;
	}
	/**
	 * @param teaching 要设置的 teaching。
	 */
	public void setTeaching(int teaching) {
		this.teaching = teaching;
	}
}
