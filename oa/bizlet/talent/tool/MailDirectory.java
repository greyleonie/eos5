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
public class MailDirectory {
	private int id;//邮件夹标识
	private String userAccount;//用户帐号
	private String maildirName;//邮件夹名称
	private String flag;//邮件夹类型-->0是基本类型，1为自定义类型
	private String remark;//备注
	
	
	public MailDirectory(int id,String userAccount,String maildirName,String flag,String remark){
		this.id = id;
		this.userAccount = userAccount;
		this.maildirName = maildirName;
		this.flag = flag;
		this.remark = remark;
		
	}
	
	public MailDirectory(){}

	/**
	 * @return 返回 flag。
	 */
	public String getFlag() {
		return flag;
	}
	/**
	 * @param flag 要设置的 flag。
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	/**
	 * @return 返回 id。
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id 要设置的 id。
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return 返回 maildirName。
	 */
	public String getMaildirName() {
		return maildirName;
	}
	/**
	 * @param maildirName 要设置的 maildirName。
	 */
	public void setMaildirName(String maildirName) {
		this.maildirName = maildirName;
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
