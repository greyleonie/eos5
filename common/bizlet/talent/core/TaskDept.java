/*
 * 创建日期 2006-8-1
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
public class TaskDept {
	private String orgId;
	private String operatorId;
	private String orgName;
	
	public TaskDept() {
		
	}
	
	public TaskDept(String orgId,String operatorId,String orgName) {
		this.orgId = orgId;
		this.operatorId = operatorId;
		this.orgName = orgName;
	
	}

	/**
	 * @return 返回 operatorId。
	 */
	public String getOperatorId() {
		return operatorId;
	}
	/**
	 * @param operatorId 要设置的 operatorId。
	 */
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
	/**
	 * @return 返回 orgId。
	 */
	public String getOrgId() {
		return orgId;
	}
	/**
	 * @param orgId 要设置的 orgId。
	 */
	public void setOrgId(String orgId) {
		this.orgId = orgId;
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
}
