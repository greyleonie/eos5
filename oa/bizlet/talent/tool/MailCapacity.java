/*
 * 创建日期 2005-7-4
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.tool;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class MailCapacity {
	private String userAccount;//用户帐号
	private int capacity;     //邮件容量
	private String capacityFlag;//超出容量限制
	private String limitFlag;//限制标志
	private String remark;//备注
	
	public MailCapacity(String userAccount,int capacity,String capacityFlag,String limitFlag,String remark){
		this.userAccount = userAccount;
		this.capacity = capacity;
		this.capacityFlag = capacityFlag;
		this.limitFlag = limitFlag;
		this.remark = remark;
		
	}
	
	public MailCapacity(){}

	/**
	 * @return 返回 capacity。
	 */
	public int getCapacity() {
		return capacity;
	}
	/**
	 * @param capacity 要设置的 capacity。
	 */
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	/**
	 * @return 返回 capacityFlag。
	 */
	public String getCapacityFlag() {
		return capacityFlag;
	}
	/**
	 * @param capacityFlag 要设置的 capacityFlag。
	 */
	public void setCapacityFlag(String capacityFlag) {
		this.capacityFlag = capacityFlag;
	}
	/**
	 * @return 返回 limitFlag。
	 */
	public String getLimitFlag() {
		return limitFlag;
	}
	/**
	 * @param limitFlag 要设置的 limitFlag。
	 */
	public void setLimitFlag(String limitFlag) {
		this.limitFlag = limitFlag;
	}
	/**
	 * @return 返回 remark。
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark 要设置的 remark。
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * @return 返回 userAccount。
	 */
	public String getUserAccount() {
		return userAccount;
	}
	/**
	 * @param userAccount 要设置的 userAccount。
	 */
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
}
